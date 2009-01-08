from datetime import datetime
from turbogears.database import PackageHub
from sqlobject import *
from turbogears import identity

hub = PackageHub("archives")
__connection__ = hub

class Node(SQLObject):
    class sqlmeta:
        table ='nodes'
        idName ='hex'
    password = StringCol(unique=True)
    passtext = UnicodeCol()
    text = UnicodeCol()
    hex = IntCol(alternateID=True,unique=True,notNone=True)
    forsale = MultipleJoin("Item",joinColumn='itemid_id')
    title = StringCol(alternateID=True,unique=True,notNone=True)


class Character(SQLObject):
    class sqlmeta:
        table ='characters'
        idName ='name'
    points = IntCol()
    nodes = RelatedJoin("Node")
    charname = StringCol(alternateID=True,unique=True,notNone=True)
    name = IntCol(alternateID=True,unique=True,notNone=True)


class Interaction(SQLObject):
    class sqlmeta:
        table ='interactions'
        idName ='id'
    character = SingleJoin("Character",joinColumn='name_id')
    datetime = DateTimeCol()
    node = SingleJoin("Node",joinColumn='hex_id')
    interactionid = IntCol(alternateID=True,unique=True,notNone=True)


class Item(SQLObject):
    class sqlmeta:
        table ='items'
        idName ='id'
    name = StringCol(alternateID=True,unique=True,notNone=True)
    cost = IntCol(default=1)
    node = RelatedJoin("Node")
    itemid = ForeignKey("Node")


class Info(SQLObject):
    class sqlmeta:
        table ='info'
        idName ='info'
    text = UnicodeCol()
    probability = FloatCol()
    valid = BoolCol()
    subject = StringCol()
    node = RelatedJoin("Node")



