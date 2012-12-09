from turbogears.scheduler import add_weekday_task
from archives.model import autotick
from turbogears.database import PackageHub

hub = PackageHub("archives") 
#con = connectionForURI(hub.uri)
__connection__ = hub

def schedule():
    add_weekday_task(action=autotick, weekdays=(1,4,5,6,7), timeonday=(06,00))
    add_weekday_task(action=autotick, weekdays=(3,7), timeonday=(18,00))
