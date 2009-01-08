from datetime import datetime
from turbogears.database import PackageHub
from sqlobject import *
from turbogears import identity
from random import random, sample, shuffle
from datetime import *


hub = PackageHub("archives")
__connection__ = hub

startNode = 314
maxNodeAge = 2
rumorCost = 1

costDuration = timedelta(1)

# def today():
#     if len(list(Interaction.select(Interaction.q.id == 1))):
#         return Interaction.get(1).day
#     else:
#         inter = Interaction(day=0,character="DAY",node=0000,item="none")
#         return Interaction.get(1).day


class Dir:
    north, northeast,southeast,south,southwest,northwest = range(6)
    dirs = ("north", "northeast", "southeast", "south", "southwest","northwest") 
    dirCaps = ("North", "Northeast", "Southeast", "South", "Southwest","Northwest") 
    dabbrs = ("N", "NE", "SE", "S", "SW", "NW")

class Node(SQLObject):
    name = StringCol(alternateID=True,unique=True,notNone=True)
    hex = IntCol(alternateID=True,unique=True,notNone=True)
    text = UnicodeCol()
    oneword = StringCol()
    quickdesc = StringCol()
    password = StringCol()
    passtext = UnicodeCol()
    forsale = RelatedJoin("Item")
    users = RelatedJoin("Character", intermediateTable="node_users")
    watchers = RelatedJoin("Character", addRemoveName="Watcher", joinColumn = "node", otherColumn = "character", intermediateTable="watchtable")
    info = RelatedJoin("Info")
    rumorsatonce = IntCol()
    rumorsperday = IntCol()
    
    def rumorsSoldToday(self):
        return len(list(Interaction.select(AND(Interaction.q.day == today(), 
                                               Interaction.q.node == self.hex,
                                               Interaction.q.item.startswith("_rumor")))))

    def rumorsToday(self):
        return self.rumorsSoldToday() + len(self.info)

    def popRumors(self):
        print "Popping rumors for "+self.name
        counter = 0
        for rumor in self.info:
            if (random() < rumor.probability / 2):
                self.removeInfo(rumor)
        if len(self.getAllNeighbors()):
            nb = self.getAllNeighbors()
            shuffle(nb)
            for node in nb:
                ni = node.info
                shuffle(ni)
                for nearrumor in ni:
                    while(len(self.info) < self.rumorsatonce):
                        if (random() < nearrumor.probability and nearrumor.visible and nearrumor.valid):
                            self.addInfo(nearrumor)
                            print "Added rumor " + nearrumor.subject

        while (len(self.info) < self.rumorsatonce and counter < 20): # Max 20 passes
            if self.rumorsToday() >= self.rumorsperday: # That's enough rumors for now, lads
                return
            allrumors = list(Info.select(AND(Info.q.probability > 0,
                                        Info.q.visible == True,
                                        Info.q.valid == True)))
            shuffle(allrumors)
            for rumor in allrumors:
                print "Checking " + rumor.subject
                if (random() < rumor.probability):
                    self.addInfo(rumor)
                    print "Added rumor " + rumor.subject

                    if self.rumorsToday() >= self.rumorsperday: 
                        return
            print "Incrementing counter"
            counter += 1
            

    def isStart(self):
        return self.hex == startNode

    def neighbor(self, dir):
        try:
            if dir == Dir.north:
                return Node.byHex(self.hex - 2)
            elif dir == Dir.northeast:
                return Node.byHex(self.hex + 99 if self.hex % 2 else self.hex - 1)
            elif dir == Dir.southeast:
                return Node.byHex(self.hex + 101 if self.hex % 2 else self.hex + 1)
            elif dir == Dir.south:
                return Node.byHex(self.hex + 2)
            elif dir == Dir.southwest:
                return Node.byHex(self.hex + 1 if self.hex % 2 else self.hex - 99)
            elif dir == Dir.northwest:
                return Node.byHex(self.hex - 1 if self.hex % 2 else self.hex - 101)
        except SQLObjectNotFound:
            return None

    def getAllNeighbors(self):
        neighbors = []
        for dir in range(6):
            if (self.neighbor(dir)):
                neighbors += [self.neighbor(dir)]
        return neighbors

    def getAllInRange(self, range):
        x = set()
        #base case
        x.update(self.getAllNeighbors())
        range -= 1
        while (range > 0):
            y = set()
            for opernode in x:
                y.update(opernode.getAllNeighbors())
            x.update(y)
            range -= 1
        return x

    def getAllWatchedNodes(self, range):
        return set(filter(lambda x: len(x.watchers) > 0, self.getAllInRange(range)))

    def rangeTo(self, node):
        """ Performs a naive BFS.  
        This is incredibly lame, I know. """
        range = 0
        if self == node:
            return 0
        while not node in self.getAllInRange(range):
            range += 1
        return range
        

    def notifyWatchers(self, who, what):
        """ There are three pieces of information. """
        info = ("who", "what", "where")
        two = None
        three = None
        one = set([self]) # Watchers on the node get three pieces of info.
        two = self.getAllWatchedNodes(1) #watchers one step away get two of the three.
        three = self.getAllWatchedNodes(2) #watchers two steps away get one of the three.
        
        nstring = "Your agent at " + self.name + "(" + str(self.hex) + ") tells you:<p>"
        notified = [who] #don't notify someone of what they're doing
        for char in self.watchers:
            if char in notified:
                continue
            char.notify(nstring + who.name + " " + what + " " + self.name + ".</p>")
            notified += [char]
        if two:
            for node in two:
                for char in node.watchers:
                    if char in notified:
                        continue
                    nstring = "Your agent at " + node.name + "(" + str(node.hex) + ") tells you:<br/>"
                    got = sample(info, 2)
                    if "who" in got:
                        nstring += who.name + " "
                    else:
                        nstring += "Someone "
                    if "what" in got:
                        nstring += what + " "
                    else:
                        nstring += "did something near "
                    if "where" in got:
                        nstring += self.name + "."
                    else:
                        nstring += "someone."
                    char.notify(nstring)
                    notified += [char]
        if three:
            for node in three:
                for char in node.watchers:
                    if char in notified:
                        continue
                    nstring = "Your agent at " + node.name + "(" + str(node.hex) + ") tells you:<br/>"
                    got = sample(info, 1)
                    if "who" in got:
                        nstring += who.name + " "
                    else:
                        nstring += "Someone "
                    if "what" in got:
                        nstring += what + " "
                    else:
                        nstring += "did something near "
                    if "where" in got:
                        nstring += self.name + "."
                    else:
                        nstring += "someone."
                    char.notify(nstring)
                    notified += [char]


    
class Character(SQLObject):
    name = StringCol(alternateID=True,unique=True,notNone=True)
    #charname = StringCol(alternateID=True,unique=True,notNone=True)
    currentNode = IntCol(default=startNode)
    points = IntCol()
    wealth = IntCol()
    incomestat = IntCol()
    marketstat = IntCol()
    nodes = RelatedJoin("Node", intermediateTable="node_users")
    watching = RelatedJoin("Node", addRemoveName="WatchedNode", joinColumn = "character", otherColumn = "node", intermediateTable="watchtable")
    
    def hasHex(self, hex):
        return ((Node.byHex(hex) in self.nodes) or Node.byHex(hex).isStart())

    def hasNode(self, node):
        return ((node in self.nodes) or node.isStart())

    def canSeeHex(self, node):
        return (hasNode(node))

    def notify(self, text):
        return Notification(charname=self.name, text=text, visible=True, new=True)


class Interaction(SQLObject):
#     class sqlmeta:
#         table ='interactions'
#         idName ='id'
    character = StringCol()
    day = IntCol()
    date = DateTimeCol(default=DateTimeCol.now)
    node = IntCol()
    item = StringCol()



class Notification(SQLObject):
    charname = StringCol()
    text = StringCol()
    visible = BoolCol(default=True)
    date = DateTimeCol(default=DateTimeCol.now)
    new = BoolCol(default=True)

class Item(SQLObject):
#     class sqlmeta:
#         table ='items'
#         idName ='id'
    name = StringCol(alternateID=True,unique=True,notNone=True)
    itemcardno = IntCol(default=999)
    cost = IntCol(default=1)
    avail = IntCol(default=20)
    number = IntCol(default=0)
    soldby = RelatedJoin("Node")

    def realcost(self):
        sel = Interaction.select(AND(Interaction.q.item == self.name))
        purchases = 0
        for inter in sel:
            if datetime.now() - inter.date < costDuration:
                purchases += 1
        return int(self.cost * (1 + ((purchases * 1.0) / self.avail)))

class Info(SQLObject):
#     class sqlmeta:
#         table ='info'
#         idName ='info'
    text = UnicodeCol()
    probability = FloatCol()
    valid = BoolCol(default=True)
    visible = BoolCol(default=True)
    cost = IntCol()
    subject = StringCol()
    node = RelatedJoin("Node")

# identity models.
class Visit(SQLObject):
    """
    A visit to your site
    """
    class sqlmeta:
        table = 'visit'

    visit_key = StringCol(length=40, alternateID=True,
                          alternateMethodName='by_visit_key')
    created = DateTimeCol(default=datetime.now)
    expiry = DateTimeCol()

    def lookup_visit(cls, visit_key):
        try:
            return cls.by_visit_key(visit_key)
        except SQLObjectNotFound:
            return None
    lookup_visit = classmethod(lookup_visit)


class VisitIdentity(SQLObject):
    """
    A Visit that is link to a User object
    """
    visit_key = StringCol(length=40, alternateID=True,
                          alternateMethodName='by_visit_key')
    user_id = IntCol()


class Group(SQLObject):
    """
    An ultra-simple group definition.
    """
    # names like "Group", "Order" and "User" are reserved words in SQL
    # so we set the name to something safe for SQL
    class sqlmeta:
        table = 'tg_group'

    group_name = UnicodeCol(length=16, alternateID=True,
                            alternateMethodName='by_group_name')
    display_name = UnicodeCol(length=255)
    created = DateTimeCol(default=datetime.now)

    # collection of all users belonging to this group
    users = RelatedJoin('User', intermediateTable='user_group',
                        joinColumn='group_id', otherColumn='user_id')

    # collection of all permissions for this group
    permissions = RelatedJoin('Permission', joinColumn='group_id',
                              intermediateTable='group_permission',
                              otherColumn='permission_id')



class User(SQLObject):
    """
    Reasonably basic User definition.
    Probably would want additional attributes.
    """
    # names like "Group", "Order" and "User" are reserved words in SQL
    # so we set the name to something safe for SQL
    class sqlmeta:
        table = 'tg_user'

    user_name = UnicodeCol(length=16, alternateID=True,
                           alternateMethodName='by_user_name')
    email_address = UnicodeCol(length=255, alternateID=True,
                               alternateMethodName='by_email_address')
    display_name = UnicodeCol(length=255)
    password = UnicodeCol(length=40)
    created = DateTimeCol(default=datetime.now)

    # groups this user belongs to
    groups = RelatedJoin('Group', intermediateTable='user_group',
                         joinColumn='user_id', otherColumn='group_id')

    # this maps to character name
    character = UnicodeCol(length=100)

    def _get_permissions(self):
        perms = set()
        for g in self.groups:
            perms = perms | set(g.permissions)
        return perms

    def _set_password(self, cleartext_password):
        "Runs cleartext_password through the hash algorithm before saving."
        password_hash = identity.encrypt_password(cleartext_password)
        self._SO_set_password(password_hash)

    def set_password_raw(self, password):
        "Saves the password as-is to the database."
        self._SO_set_password(password)


class Permission(SQLObject):
    """
    A relationship that determines what each Group can do
    """
    permission_name = UnicodeCol(length=16, alternateID=True,
                                 alternateMethodName='by_permission_name')
    description = UnicodeCol(length=255)

    groups = RelatedJoin('Group',
                         intermediateTable='group_permission',
                         joinColumn='permission_id',
                         otherColumn='group_id')


