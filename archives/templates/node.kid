<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:py="http://purl.org/kid/ns#"
    py:extends="'master.kid'">
<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" py:replace="''"/>
<title>The Market</title>
</head>
<body>
  <div class="main_content">
    <div style="float:right; width: 12em; padding: 5px; border-left: 1px solid #aaa">
      <span py:replace="character.name">Random Character</span>
      has <i><span py:replace="character.points">N</span>/<span py:replace="character.marketstat">M</span></i>
      Market points and <span py:replace="character.wealth">one
      million</span> deben remaining.<br/>
      It is day <span py:replace="today">N</span>.<p/>
      You are haggling with <b><span py:replace="node.name">node</span>.</b>
      <!--at hex (<span py:replace="node.hex">XXYY</span>).--><br/>

      <a href="/">Return to Bazaar</a><br/>
      <a href="/points">Modify Points</a><br/>
      <a href="/notifications">Check Log</a><span py:replace="XML(notif)">Notify error</span><br/>
      <a href="/transfer">Transfer Money</a><br/>
      <a href="/map">View Map</a><br/>

      <form action="password" method="POST">
	<input type="text" name="thepass" value="Say Password" size="10" onFocus="this.value=''" onUnFocus="if (this.value == '') this.value='Say Something';"/>
<!--	<input type="submit" name="submit" value="SAY"/>-->
      </form>
      <span py:replace="XML(wstring)"></span><br/>
	    <span py:replace="XML(watched)">none.</span>
      
<!--      <div class="html_body" py:replace="XML(shortcuts)">Shortcuts go here.</div> -->
    </div>
  </div>
  <h2><span py:replace="node.name">foo</span>,&nbsp;&nbsp;<span py:replace="node.quickdesc">stuff</span></h2>
  <div class="html_body" py:replace="XML(text)">Page text goes here.</div>
  <div class="main_content">

      <span py:replace="XML(neighborwad)">Foo.</span>

      <span py:replace="XML(itemwad)">Foo.</span>
 
      <span py:replace="XML(rumorwad)">Foo.</span>


  </div>
<!--  <div class="html_body" py:replace="XML(cardcatalogs)"></div> -->
  <div id="floatclear" />
  
</body>
</html>

