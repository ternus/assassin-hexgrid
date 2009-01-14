import turbogears
from turbogears import controllers, expose, flash
from model import *
from turbogears import identity, redirect
from cherrypy import request, response
from docutils.core import publish_parts
import re
from sqlobject import SQLObjectNotFound
import gridmaps, os
from datetime import *
import hashlib

from archives import json
# import logging
# log = logging.getLogger("archives.controllers")

# othernodes = some way to detect other nodes
# perhaps regexping for the string "Exalted Foo Node"
othernodes = re.compile(r"\b(Exalted(?!.*Exalted).+Node)", re.I)
rmatch = re.compile(r"^(..)..$")
cmatch = re.compile(r"^..(..)$")
pointstype = "Market"


gridMap = gridmaps.grid()
gridMap.setType('hex')
gridMap.setGrid(.6)
gridMap.setDrawAll(False)

class Neighbors():
    north = False;
    northeast = False;
    northwest = False;
    south = False;
    southeast = False;
    southwest = False;


class Root(controllers.RootController):
    @expose(template="archives.templates.node")
    # @identity.require(identity.in_group("admin"))
    @identity.require(identity.not_anonymous())
    def index(self, hex=startNode, referrer=None):
        print "Visit hex: " + str(hex)

        root = str(turbogears.url('/'))
        hexjump = 0
        # First, find the page.
        try:
            node = Node.byHex(hex)
        except SQLObjectNotFound:
            try:
                node = Node.byName(hex)
                hexjump = 1
            except SQLObjectNotFound:
                raise turbogears.redirect("notfound", title = hex)

        print "Found merchant: " + node.name

        # Grab our character.
        char = Character.byName(turbogears.identity.current.user.character)

        # Next, make sure that the character has the Inspiration to go to this page.
        if (not node.isStart()): #everyone can tag the start page
#            if (Root.wardedp(self, title) == "warded"):
#                 flash("You haven't satisfied the requirements to go to that page!")
#                 raise turbogears.redirect('/')
            if not char.hasHex(hex):
                if (hexjump == 1):
                    flash("You haven't visited that page normally yet!")
                    raise turbogears.redirect('/')
                if (char.points > 0):
                    
                    flash(Node.byHex(char.currentNode).name + " introduces you to " + node.name + ".")
                    char.points -= 1
                    char.addNode(node)
                    interaction = Interaction(character=char.name,
                                              node = node.hex,
                                              day = today(),
                                              item = "none")
                    char.notify(Node.byHex(char.currentNode).name + " introduced you to " + node.name + ", " + node.quickdesc + ".")
                    node.notifyWatchers(char, "was introduced to") 
                else:
                    flash("You need more Market points to arrange that introduction!")
                    raise turbogears.redirect('/')

        char.currentNode = node.hex

        html_text = publish_parts(node.text, writer_name="html")['html_body']
        #html_text = othernodes.sub(r'<a href="%s\1">\1</a>' % root, html_text, 99)

        neighbors = Neighbors()
        row = (node.hex % 100) / 100
        col = node.hex - (row * 100)

        print "Row is " + str(row)
        print "Column is " + str(col)

        neighbors.north = Root.neighborstat(self, Dir.north, root)
        neighbors.northeast = Root.neighborstat(self, Dir.northeast , root)
        neighbors.southeast = Root.neighborstat(self, Dir.southeast, root)
        neighbors.south = Root.neighborstat(self, Dir.south, root)
        neighbors.southwest = Root.neighborstat(self, Dir.southwest, root)
        neighbors.northwest = Root.neighborstat(self, Dir.northwest, root)


        neighborwad = ""
        if (neighbors.north):
            neighborwad = neighborwad + "<li> North: " + neighbors.north + "</li>"
        if (neighbors.northeast):
            neighborwad = neighborwad + "<li> Northeast: " + neighbors.northeast + "</li>"
        if (neighbors.southeast):
            neighborwad = neighborwad + "<li> Southeast: " + neighbors.southeast + "</li>"
        if (neighbors.south):
            neighborwad = neighborwad + "<li> South: " + neighbors.south + "</li>"
        if (neighbors.southwest):
            neighborwad = neighborwad + "<li> Southwest: " + neighbors.southwest + "</li>"
        if (neighbors.northwest):
            neighborwad = neighborwad + "<li> Northwest: " + neighbors.northwest + "</li>"
        if (neighborwad != ""):
            neighborwad = "<p>I know these people:</p><ul>" + neighborwad + "</ul>"

        buystrings = [". %d deben is the lowest I can go!",
                      ", a steal at only %d deben!",
                      ". %d deben, cheap at twice the price!",
                      ". %d deben is cutting my own throat!",
                      ". For you, only %d deben!",
                      ", today only %d deben!",
                      ". %d deben, special offer!",
                      ", just %d deben!",
                      ". Couldn't let it go for less than %d deben!",
                      ". %d deben, best price you'll see today!",
                      ". Less than %d deben would just be ridiculous!",
                      " could be yours for %d deben!",
                      ", selling fast at %d deben!",
                      ".  The Pharaoh himself couldn't get less than %d deben!",
                      ". Priced to move at %d deben!",
                      ". %d deben, buy it or lose it!"]

        itemwad = ""
        for item in node.forsale:
            itemwad += "<li>" + item.name
            itemwad += buystrings[int(hashlib.md5(item.name).hexdigest()[0], 16)] % item.realcost() # don't worry about it
            if item.realcost() <= char.wealth:
                # : " + str(item.realcost()) + " deben
                itemwad += " [<a href=\'/buy/"+str(node.hex)+"/"+str(item.id)+"'>BUY</a>]"
            else:
                # : " + str(item.realcost()) + " deben
                itemwad += " [too expensive]"
            itemwad += "</li>"
        if itemwad != "":
            itemwad = "<p>I have these items for sale:</p><ul>" + itemwad + "</ul>"

        notif = ""
        newnot = self.newnotifyp()
        if (newnot):
            notif = "<div style=\"color:red\">[" + str(newnot) + " NEW]</div>"
        else:
            notif = ""

        rumorwad = ""
        for rumor in node.info:
            if rumor.valid and rumor.visible:
                rumorwad += "<li>" + rumor.subject
                if rumor.cost <= char.wealth:
                    rumorwad += " [<a href=\'/rumor/"+str(node.hex)+"/"+str(rumor.id)+"'>BUY</a>: " + str(rumor.cost) + " deben]"
                else:
                    rumorwad += " [too expensive]"
            rumorwad += "</li>"
        if rumorwad != "":
            rumorwad = "<p>I have heard rumors about these subjects:</p><ul>" + rumorwad + "</ul>"
        


        if node in char.watching:
            wstring = "<a href='/setwatch/"+str(node.hex)+"/un'>Unset Agent</a>"
        else:
            if len(char.watching) < char.marketstat: 
                wstring = "<a href='/setwatch/"+str(node.hex)+"'>Set Agent</a> (" + str(char.marketstat - len(char.watching)) + " left)"
            elif len(char.watching) >= char.marketstat:
                wstring = "[No agents left]"
            else:
                wstring = ""
        if wstring: wstring += "<br/>Watching:"
            

        watched = ""
        
        for wnode in char.watching:
            watched += "<a href='/"+str(wnode.hex)+"'>"+wnode.name+"</a><br/>"


#         try:
#             debug1 = Root.wardedp(self, title)
#         except IndexError:
#             debug1 = "foo"
#         try:
#             debug2 = node.lockWards[1].key
#         except IndexError:
#             debug2 = "bar"

#         cardcatalogs = ""
#         if (Root.cardcatalogp(self, title) == "approved"):
#             cardcatalogs = "You can grant other people access to this node. To do so, click <a href=\"" + root + "librarian?title=" + title + "\">here.</a>"
#             if (Root.shortcutp(self, char.name, title) == "does not exist"):
#                 shortcut = Shortcut(name=char.name, title=title)                

#        shortcuts = Root.shortcuts(self)

        

        return dict(text=html_text, 
                    node=node, 
                    character=char, 
                    root=root, 
                    neighbors = neighbors, 
                    debug1 = None, 
                    debug2 = None, 
                    shortcuts = None, 
                    cardcatalogs = None, 
                    neighborwad = neighborwad, 
                    itemwad=itemwad, 
                    wstring = wstring,
                    notif  = notif, 
                    watched = watched,
                    rumorwad=rumorwad,
                    today=today())

    @expose(template="archives.templates.login")
    def login(self, forward_url=None, previous_url=None, *args, **kw):

        if not identity.current.anonymous \
            and identity.was_login_attempted() \
            and not identity.get_identity_errors():
            raise redirect(forward_url)

        forward_url=None
        previous_url= request.path

        if identity.was_login_attempted():
            msg=_("The credentials you supplied were not correct or "
                   "did not grant access to this resource.")
        elif identity.get_identity_errors():
            msg=_("You must provide your credentials before accessing "
                   "this resource.")
        else:
            msg=_("Please log in.")
            forward_url= request.headers.get("Referer", "/")
            
        response.status=403
        return dict(message=msg, previous_url=previous_url, logging_in=True,
                    original_parameters=request.params,
                    forward_url=forward_url)

    def ch(self):
        return Character.byName(turbogears.identity.current.user.character)

    @expose()
    def notfound(self, title):
        flash("The merchant %s was not found." % title)
        raise turbogears.redirect("/")

#    @expose()
    def neighborstat(self, dir, root):
        foo = ""
        try:
            
            node = Node.byHex(self.ch().currentNode).neighbor(dir)
            if not node:
                return None
            n = " " + node.quickdesc #" Seller of " + Node.byHex(hex).quickdesc
            l = "<a href=\"" + root + str(node.hex) + "/" + "\">"
            if ((not Character.byName(turbogears.identity.current.user.character).hasNode(node)) and (node.hex != startNode)):

                n = node.name + ", " + n + ". <small>[Locked" 
                if Character.byName(turbogears.identity.current.user.character).points > 0:
                    n += " - " + l + "Spend 1 Market to introduce me</a>"
                n += "]</small>"    
                
            else:
                n = l + node.name + "</a>, " + node.quickdesc + "."
# 	    result = Ward.select(Ward.q.node == Node.byHex(hex).id)
#             for item in result:
#                     n += "<ul> <li>  Requires: " + item.key + "</li> </ul>"
        except SQLObjectNotFound:
            return None
        return n;

#    @identity.require(identity.not_anonymous())
#     def wardedp(self, hex):
#         baz = 0
#         foo = Node.byHex(hex)
#         result = Ward.select(Ward.q.node == foo.id)
#         for item in result:
#             if (Root.visitedp(self, item.key) == "not visited"):
#                 baz = 1
#         if (baz == 1):
#             return "warded"
#         else:
#             return "not warded"
        
#    @expose()
#    @identity.require(identity.not_anonymous())
#    def visitedp(self, hex):
#        baz = 0
#         result = Browsing.select(Browsing.q.hex == hex)
#         for item in result:
#             if (turbogears.identity.current.user.character == item.character):
#                 baz = 2        
#         if (baz == 2):
#        char = Character.byName(turbogears.identity.current.user.character)

#     def cardcatalogp(self, title):
#         char = Character.byName(turbogears.identity.current.user.character)
# 	print str(char) + " " + title
#         baz = 0
#         result = CardCatalog.select(CardCatalog.q.title == title)
#         for item in result:
#             if (turbogears.identity.current.user.character == item.name):
#                 baz = 2
#         if (baz == 2):
# 	    print "approved"
#             return "approved"
#         else:
#             print "not approved"
#             return "not approved"

#     def shortcuts(self):
#         retval = "<a href=\"" + turbogears.url("/") + "\">Start Page</a><br/>"
#         result = Shortcut.select(Shortcut.q.name == turbogears.identity.current.user.character)
#         for item in result:
#             retval = retval + "<a href=\"" + turbogears.url("/%s" % item.title) + "\">" + item.title + "</a><br/>"
#         return retval
                                              
  

    def newnotifyp(self):
        char = Character.byName(turbogears.identity.current.user.character)
        sel = Notification.select(AND(Notification.q.charname == char.name, Notification.q.visible == True, Notification.q.new == True))
        return len(list(sel))


#     def shortcutp(self, name, title):
#         baz = 0
#         result = Shortcut.select(Shortcut.q.title == title)
#         for item in result:
#             if (name == item.name):
#                 # baz = 2 means we have a shortcut for this node
#                 baz = 2
#         if (baz == 2):
#             return "exists"
#         else:
#             return "does not exist"

#    def shortcutp(self, name, title):
#        baz = 0
#        qux = 1
#        while (baz == 0):
#            try:
#                n = Shortcut.get(qux).name
#                if (Shortcut.get(qux).title == title):
#                    if (name == n):
#                        # baz = 2 means we have a shortcut for this node
#                        baz = 2
#                qux = qux + 1
#            except SQLObjectNotFound:
#                # baz = 1 means we don't have a shortcut for this node
#                baz = 1
#        
#        if (baz == 2):
#            return "exists"
#        else:
#            return "does not exist"

#     @expose(template="archives.templates.librarian")
#     @identity.require(identity.not_anonymous())
#     def librarian(self, title):
#         return dict(title=title)
    
#     @expose()
#     @identity.require(identity.not_anonymous())
#     def shortcut(self, targetname, targetnode, submit):

#         char = Character.byName(turbogears.identity.current.user.character)        
#         try:
#             targetchar = Character.byName(targetname)
#         except SQLObjectNotFound:
#             flash("We couldn't find the character %s!" % targetname)
#             raise turbogears.redirect("/librarian?title=%s" % targetnode)
        
#         try:
#             node = Node.byName(targetnode)
#         except SQLObjectNotFound:
#             flash("We couldn't find the node %s! How did you get this message?" % targetnode)
#             raise turbogears.redirect("/")

#         if (Root.cardcatalogp(self, targetnode) != "approved"):
#             flash("You don't have access to grant other people access to %s!" % targetnode)
#             raise turbogears.redirect("/")

#         if (Root.shortcutp(self, targetname, targetnode) == "exists"):
#             n = targetname + " already has access to " + targetnode + "!"
#             flash(n)
#             raise turbogears.redirect("/")

#         # OK, now we can make the damned shortcut
# #        if (char.inspiration > 0):
# #        char.inspiration = char.inspiration - 1
#         shortcut = Shortcut(name=targetname, title=targetnode)
#         #else:
#         #    n = "You need more inspiration to grant " + char + " access to " + targetnode + "!"
#         #    flash(n)
#         #    raise turbogears.redirect('/')
        
#         flash("Access granted!")
#         raise turbogears.redirect("/")

    @expose()
    def logout(self):
        identity.current.logout()
        raise redirect("/")

    @expose()
    def default(self, title):
        return self.index(title)

    @expose(template="archives.templates.points")
    @identity.require(identity.not_anonymous())
    def points(self):
        char = Character.byName(turbogears.identity.current.user.character)
        return dict(char=char)


    @expose()
    @identity.require(identity.not_anonymous())
    def spendcommit(self, market, money, reason, submit=None):
        char = Character.byName(turbogears.identity.current.user.character)
        char.points += int(market)
        char.wealth += int(money)
        inter = Interaction(character=char.name, day=today(), node=999, item="ADD_"+market+"_"+money+"_"+reason)
        char.notify("You changed your market points by " + market + " and your money by " + money + " for reason:<br/>" + reason)
        turbogears.flash("Done.")
        raise turbogears.redirect("/")



    @expose(template="archives.templates.tick")
#    @identity.require(identity.in_group("admin"))
    def tick(self):
        date = str(Interaction.get(1).date)
        char = Character.byName(turbogears.identity.current.user.character)
        return dict(char=char,date=date)
    
    @expose()
    @identity.require(identity.in_group("admin"))
    def advancetime(self, submit):
        day = today()
        chars = Character.select(Character.q.marketstat >= 1)
        for char in chars:
            char.notify("The sun sets.  You gain " + str(char.marketstat) + " Market Points and " + str(char.incomestat) + " Wealth.")
            char.points += char.marketstat
            char.wealth += char.incomestat
            for node in char.nodes:
                inters = Interaction.select(AND(Interaction.q.node == node.hex, Interaction.q.character == char.name), orderBy=DESC(Interaction.q.day))
                mostRecent = list(inters)[0].day
                if (today() >= mostRecent + maxNodeAge):
                    char.notify(node.name + " expired due to inactivity!")
                    char.removeNode(node)
                    print "Removed node " + node.name + " from char " + char.name
                    if node in char.watching:
                        char.removeWatchedNode(node)
                        char.notify("You are no longer watching " + node.name + ".")
                    
                    

        for node in Node.select(Node.q.rumorsperday > 0):
            node.popRumors()
                                
        Interaction.get(1).day += 1
        Interaction.get(1).date = datetime.now()
        print chars
        return dict(chars=chars)
                                              

    @expose(template="archives.templates.map")
    @identity.require(identity.not_anonymous())
    def map(self):
        char = Character.byName(turbogears.identity.current.user.character)
        thenode = Node.byHex(char.currentNode)
        nodes = {startNode: {"name": Node.byHex(startNode).name, "desc": Node.byHex(startNode).oneword}}
        for entry in char.nodes: #Browsing.select(Browsing.q.character == char.name):
            nodes[entry.hex] = {"name": Node.byHex(entry.hex).name, "desc": Node.byHex(entry.hex).oneword}
        gridMap.setNodes(nodes)
        gridMap.setName(char.name)
        gridMap.setDrawDesc(0)
        gridMap.setDrawNumbers(0)
        gridMap.save("archive/static/images/map" + char.name + ".svg")
        os.spawnlp(os.P_WAIT, "convert", "", "archive/static/images/map"+char.name+".svg", "archive/static/images/map"+char.name+".png")
        map = "<img src='static/images/map"+char.name+".png' />"
        goback = "<a href='/"+str(thenode.hex)+"'>Go back to " + thenode.name + ".</a>"
        return dict(map=map, goback=goback)
        

    @expose(template="archives.templates.map")
    @identity.require(identity.not_anonymous())
    def allmap(self):
        char = Character.byName(turbogears.identity.current.user.character)
        nodes = {}#{startNode: Node.byHex(startNode).name}
        for entry in Node.select(Node.q.name != ""): #Browsing.select(Browsing.q.character == char.name):
            nodes[entry.hex] = {"name":Node.byHex(entry.hex).name, "desc": Node.byHex(entry.hex).oneword}
        gridMap.setNodes(nodes)
        gridMap.setName(char.name)
        gridMap.setDrawDesc(1)
        gridMap.setDrawNumbers(1)
        gridMap.save("archive/static/images/map" + char.name + ".svg")
        os.spawnlp(os.P_WAIT, "convert", "", "archive/static/images/map"+char.name+".svg", "archive/static/images/map"+char.name+".png")
        map = "<img src='static/images/map"+char.name+".png' />"
        return dict(map=map, backstr="/"+str(char.currentNode))
        

                                          
    @expose(template="archives.templates.notifications")
    @identity.require(identity.not_anonymous())
    def notifications(self):
        char = Character.byName(turbogears.identity.current.user.character)
        nots = Notification.select(Notification.q.charname == char.name, orderBy=DESC(Notification.q.id))
        notwad = ""
        for notf in nots:
            if (notf.visible):
                notwad += "<li>" + str(notf.date) + " - "           
                if (notf.new):
                    notwad += " <span style=\"color:red\">[NEW]</span> "
                    notf.new = False
                
                notwad += notf.text + "</li>"
        return dict(notifications=notwad)


    @expose(template="archives.templates.buy")
    @identity.require(identity.not_anonymous())
    def buy(self, thehex, itemid):
        char = Character.byName(turbogears.identity.current.user.character)
        if not char.hasHex(thehex):
            flash("You don't know anyone selling that item!")
            raise turbogears.redirect("/" + char.currentNode)
        theitem = Item.get(itemid)
        thecost = theitem.realcost()
        if (thecost > char.wealth):
            flash("You need " +str(thecost - char.wealth) + " more deben to buy that item!")
            raise turbogears.redirect("/" + char.currentNode)
        thenode = Node.byHex(thehex)
        inter = Interaction(character=char.name, day=today(), node=thenode.hex, item=theitem.name)
        char.notify("You bought " + theitem.name + " from " + thenode.name + " for " + str(thecost) + ".")
        thenode.notifyWatchers(char, "bought " + theitem.name + " from")
        char.wealth -= thecost
        goback = "<a href='/"+thehex+"'>Go back to " + thenode.name + ".</a>"
        return dict(item=theitem, cost=thecost, goback=goback)

    @expose(template="archives.templates.buyrumor")
    @identity.require(identity.not_anonymous())
    def rumor(self, thehex, rumorid):
        char = Character.byName(turbogears.identity.current.user.character)
        if not char.hasHex(thehex):
            flash("You don't know anyone selling that item!")
            raise turbogears.redirect("/" + str(char.currentNode))
        therumor = Info.get(int(rumorid))
        if (therumor.cost > char.wealth):
            flash("You need " +str(therumor.cost - char.wealth) + " more deben to buy that rumor!")
            raise turbogears.redirect("/" + str(char.currentNode))
        thenode = Node.byHex(thehex)
        
        
        inter = Interaction(character=char.name, day=today(), node=thenode.hex, item="_rumor"+therumor.subject+"_"+str(therumor.id))
        char.notify(thenode.name + " told you a rumor about " + therumor.subject + " for " + str(therumor.cost) + " deben:<br/>" + therumor.text)
        thenode.notifyWatchers(char, "heard a rumor about " + therumor.subject + " from")
        char.wealth -= therumor.cost
        if therumor in thenode.info:
            thenode.removeInfo(therumor)
        if thenode in therumor.node:
            therumor.removeNode(thenode)
        thenode.popRumors()
        
        goback = "<a href='/"+thehex+"'>Go back to " + node.name + ".</a>"
        return dict(node=thenode, rumor=therumor, goback=goback)


    @expose(template="archives.templates.password")
    @identity.require(identity.not_anonymous())
    def password(self, thepass, submit=None):
        char = Character.byName(turbogears.identity.current.user.character)
        thenode = Node.byHex(char.currentNode)
        found = False
        
        if thenode.deaduntil > today():
            flash("There's nobody there to talk to!")
            raise turbogears.redirect("/"+str(thenode.hex))
        
        for secret in thenode.secrets:
            if secret.password == thepass:
                found = True
                thenode.notifyWatchers(char, "whispered something to")
                if secret.moneycost != 0 or secret.othercost != "":
                    raise turbogears.redirect("/req/"+str(secret.id))
                else: 
                    pwstring = thenode.name + " says: <blockquote>" + secret.passtext + "</blockquote>"
                    char.notify(thenode.name + " told you a secret:<br/>"+secret.passtext)
                    thenode.notifyWatchers(char, " heard a secret from ")
        
        if (not found): 
            pwstring = thenode.name + " gives you a funny look."
        goback = "<a href='/"+str(thenode.hex)+"'>Go back to " + thenode.name + ".</a>"
        return dict(pwstring=pwstring, goback=goback)

    @expose(template="archives.templates.password")
    @identity.require(identity.not_anonymous())
    def reveal(self, id, submit=None):
        char = Character.byName(turbogears.identity.current.user.character)
        thenode = Node.byHex(char.currentNode)
        thesecret = Secret.get(id)
        pwstring = thenode.name + "looks around furtively, then says:<blockquote>" + thesecret.passtext + "</blockquote>"
        char.notify(thenode.name + " told you a secret:<br/>"+thesecret.passtext)
        thenode.notifyWatchers(char, " heard a secret from ")
        goback = "<a href='/"+str(thenode.hex)+"'>Go back to " + thenode.name + ".</a>"
        return dict(pwstring=pwstring, goback=goback)

    @expose(template="archives.templates.req")
    @identity.require(identity.not_anonymous())
    def req(self, secretid):
        char = Character.byName(turbogears.identity.current.user.character)
        thenode = Node.byHex(char.currentNode)
        thesecret = Secret.get(secretid)
        pwstring = thenode.name + " says, \"I know what you're talking about, but...<br/>"
        if (thesecret.moneycost > 0):
            if (char.wealth < thesecret.moneycost):
                pwstring += "<p>I'll need some compensation for my trouble.  Pay me " + str(thesecret.moneycost) + " debens. [<i>You can't afford it.</i>]</p>"  
            else:
                pwstring += "<p>I'll need some compensation for my trouble. <a href='/secretpay/"+str(secretid)+"'>Pay me " + str(thesecret.moneycost) + " debens</a>.</p>"  
        if (thesecret.othercost != ""):
            pwstring += "<p>I'll "
            if (thesecret.moneycost > 0):
                pwstring += "also "
            pwstring += "need you to do the following: <blockquote>" + str(thesecret.othercost) + "</blockquote></p>"
        pwstring += "<p>Once you have "
        if (thesecret.moneycost > 0):
            pwstring += "paid me"
            if (thesecret.othercost):
                pwstring += " and "
        if (thesecret.othercost):
            pwstring += "done what I asked"
        pwstring += ", <a href='/reveal/"+str(secretid) + "'>click here</a>.\"</p>"
        print pwstring
        goback = "<a href='/"+str(thenode.hex)+"'>Go back to " + thenode.name + ".</a>"
        return dict(pwstring=pwstring, goback=goback)

    @expose()
    @identity.require(identity.not_anonymous())
    def secretpay(self, secretid):
        char = Character.byName(turbogears.identity.current.user.character)
        thenode = Node.byHex(char.currentNode)
        thesecret = Secret.get(secretid)
        char.wealth -= thesecret.moneycost
        thenode.notifyWatchers(char, "slipped some money to")
        nstr = "You paid " + thenode.name + " " + str(thesecret.moneycost) + " to learn a secret."
        char.notify(nstr)
        flash(nstr)
        raise(turbogears.redirect("/req/"+str(secretid)))

    @expose(template="archives.templates.transfer")
    @identity.require(identity.not_anonymous())
    def transfer(self):
        charlist = "<SELECT NAME=\"target\"><option value=''>Select Character...</option>"
        for char in Character.select(NOT(Character.q.name.startswith("admin"))):
            if char != self.ch():
                charlist += "<OPTION VALUE=\"" + char.name + "\">"+char.name+"</OPTION>"
        charlist += "</SELECT>"
        return dict(char=Character.byName(turbogears.identity.current.user.character),charlist=charlist)

    @expose()
    @identity.require(identity.not_anonymous())
    def transfercommit(self, amount, target, submit):
        if not target:
            flash("You need to select a character!")
            raise turbogears.redirect("/transfer")
        if (int(amount) < 0):
            try:
                
                inters = Interaction.selectBy(character=self.ch().name, node=888)

                if (len(list(inters))) == 0:
                    flash("Nice try.  Don't do that again.  -- the GMs")
                elif (len(list(inters)) == 1):
                    flash("I told you not to do it again.")
                elif (len(list(inters)) == 2):
                    flash("How many times do I have to tell you?")
                elif (len(list(inters)) == 3): 
                    flash("You really are an asshole, you know that?")
                elif (len(list(inters)) == 4): 
                    flash("What would " + target + " say if I told them you were trying to take their money?")
                elif (len(list(inters)) == 5): 
                    flash("I should tell them, I really should.")
                elif (len(list(inters)) == 6): 
                    flash("Don't worry, I won't.")
                elif (len(list(inters)) == 7): 
                    flash("It'll be our little secret.")
                elif (len(list(inters)) == 8): 
                    flash("Oh, and just so you know, we know too. -- the GMs")
                else:
                    flash("You should know by now that you can't do that.")

                inter = Interaction(character=self.ch().name, day=today(), node=888, item="STEAL " + target)
            except:
                inter = Interaction(character=self.ch().name, day=today(), node=888, item="STEAL " + target)
                flash("Nice try.  Don't do that again.  -- the GMs")
            
            raise turbogears.redirect("/transfer")

        if (int(amount) == 0):
            flash("You need to enter a nonzero amount.")
            raise turbogears.redirect("/transfer")

        if (int(amount) > self.ch().wealth):
            flash("You don't have enough money!")
            raise turbogears.redirect("/transfer")

        try:
            thetarget = Character.byName(target)
 
        except:
            flash("Invalid recipient.")
            raise turbogears.redirect("/transfer")

        self.ch().wealth -= int(amount)
        thetarget.wealth += int(amount)
        thetarget.notify(self.ch().name + " transferred " + amount + " deben to you.")
        self.ch().notify("You transferred " + amount + " deben to " + thetarget.name + ".")
        flash("Transfer succeeded!")
        raise turbogears.redirect("/")

    @expose()
    @identity.require(identity.not_anonymous())
    def setwatch(self,thenode,un=None):
        char = self.ch()

        try:
            node = Node.byHex(thenode)
        except SQLObjectNotFound:
            flash("Node not found!")
            raise turbogears.redirect("/"+str(char.currentNode))
        
        if not char.hasNode(node):
            flash("You can't set an agent at a node that you haven't unlocked.")
            raise turbogears.redirect("/"+str(char.currentNode))
        
        if not un:
            if node in char.watching:
                flash("You're already watching this node!")
                raise turbogears.redirect("/"+str(char.currentNode))
            
            if (len(char.watching) >= char.marketstat):
                flash("You have no agents left! Try removing some first.")
                raise turbogears.redirect("/"+str(char.currentNode))

            if len(list(Interaction.select(AND(Interaction.q.character == char.name,
                                               Interaction.q.day == today(),
                                               Interaction.q.item.startswith("AGENT"))))) > 0:
                flash("You must wait until tomorrow to assign another agent.")
                raise turbogears.redirect("/"+str(char.currentNode))
                                                   

            inter = Interaction(character=char.name, day=today(), node=777, item="AGENT")
                
            char.addWatchedNode(node)
            flash("Agent set.")
            char.notify("You set an agent at " + node.name + ".")
            node.notifyWatchers(char, "set an agent at")
        else:
            if not node in char.watching:
                flash("You don't have an agent at this node!")
                raise turbogears.redirect("/"+str(char.currentNode))

            char.removeWatchedNode(node)
            flash("Agent removed.")
            char.notify("You removed an agent at " + node.name + ".")
            
        raise turbogears.redirect("/"+str(char.currentNode))

    @expose()
    @identity.require(identity.not_anonymous())
    def resetchar(self):
        char = self.ch()

        char.currentNode = startNode
        for node in char.nodes:
            char.removeNode(node)
        for node in char.watching:
            char.removeWatchedNode(node)
        for inter in Interaction.selectBy(character=char.name):
            inter.destroySelf()
        for notif in Notification.selectBy(charname=char.name):
            notif.destroySelf()
        char.points = char.marketstat
        char.wealth = char.incomestat

        flash("Character reset!")
        raise turbogears.redirect("/")
