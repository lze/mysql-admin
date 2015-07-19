function init()
{
  loadPage('xml/action.xml','xsl/action.xsl','tab');
  loadPage('xml/action.xml','xsl/menu.xsl','menu');
  loadHistory();
  translate();
}
function alert(txt)
{
  visible('popup');
  setText('popupContent','<div align="center">'+txt+'<br/><input  type="submit" id="confirmButton" value="Ok"/></div>');
  var node = $("confirmButton");
  node.addEventListener('click', function (evt){
    hide('popup');
  });
}
window.onerror = logError;
function logError(message, file, line)
{
  console.log("Message: "+message+"file: "+file+"line: "+line);
}
function confirm2(txt,sub,arg,arg2,arg3)
{
  visible('popup');
  var sleep = true;
  setText('popupContent','<b>'+txt+'</b><div align="right" style="padding:0.4em;"><input type="submit" name="cancelButton" id="cancelButton" value="Cancel"/>&#160;<input  type="submit" id="confirmButton" value="Ok"/></div>');
  var node = $("confirmButton");
  node.addEventListener ('click',function (evt){
    hide('popup');
    sub(arg,arg2,arg3);
  });
  var node2 = $("cancelButton");
  node2.addEventListener ('click',function (evt){
    hide('popup');
    evt.stopPropagation();
  });
}

function checkForm(form)
{
  var selectElement = form.querySelectorAll('input');
  var ret = true;
  for (i = 0; i < form.length; i++) {
    if(selectElement[i]){
    var value = selectElement[i].value;
    var regexp = selectElement[i].dataset.regexp;
    if(regexp){
      if(eval('value.match('+regexp+')')){
	  selectElement[i].style.borderColor ='green';
	  selectElement[i].title = selectElement[i].dataset.right;
      }else{
	  selectElement[i].style.borderColor ='red';
	  selectElement[i].title = selectElement[i].dataset.error;
	  ret = false;
      }
     }
    }
  }
  return ret;
}
function setCurrentTab(id,title)
{
  var body   = document.getElementsByTagName('body')[0];
  var nodes   = body.getElementsByTagName("td");
  for(var i=0,j=nodes.length; i<j; i++){
      if(nodes[i].className =='headerItemHover' ){
	nodes[i].className = 'headerItem';
	nodes[i].firstChild.className ='menuLink';
      }
  }
  var entry = $(id);
  var entryDynamic = $('dynamicTab');
  if(entry){
    entry.className            = 'headerItemHover';
    entryDynamic.style.display = 'none';
    entryDynamic.className     = 'headerItem';
    var body      = document.getElementsByTagName('body')[0];
    var nodes   = body.getElementsByTagName("td");
    for(var i=0,j=nodes.length; i<j; i++){
	if(nodes[i].className =='headerItemHover' ){
	  nodes[i].className = 'headerItem';
	  nodes[i].firstChild.className ='menuLink';
	}
    }
    var entry = $(id);
    var entryDynamic = $('dynamicTab');
    if(entry){
      entry.className ='headerItemHover'
      entryDynamic.style.display ='none';
      entryDynamic.className = 'headerItem';
      if(entry.firstChild)
	entry.firstChild.className ='dynamicLink';
    }else if(title){
      entryDynamic.style.display ='';
      entryDynamic.className     = 'headerItemHover'
      entryDynamic.innerHTML     = '<a class="dynamicLink">'+translate(title)+'</a>';
    }
    if(entry.firstChild)
      entry.firstChild.className = 'dynamicLink';
  }else if(title){
    entryDynamic.style.display   = '';
    entryDynamic.className       = 'headerItemHover'
    entryDynamic.innerHTML       = '<a class="dynamicLink">'+translate(title)+'</a>';
  }
}
var menuAktive = false;
function menu(){
      if(!menuAktive){
	$('menu').classList.remove('closed');
	visible('menuContent');
	menuAktive = true;
      }
      var node = $("closeMenu");
      node.addEventListener ('click', function (evt){
	if(menuAktive){
	  hide('menuContent');
	  $('menu').classList.add('closed');
	  menuAktive = false;
	}
	evt.stopPropagation();
      }
      );
}
function closeMenu()
{
  hide('menuContent');
  $('menu').classList.add('closed');
  menuAktive = false;
}
function showTab(id)
{
  $(id).classList.remove('closed');
  if($(id).firstChild)
    $(id).firstChild.style.display ='';
  var elements = document.getElementsByClassName('cnt');
  for(var i = 0; i < elements.length;i++){
    if(elements[i].id != id && elements[i].style.display ==''){
      if(elements[i].firstChild)
	    elements[i].firstChild.style.display ='none';
      elements[i].classList.add('closed');
    }
  }
}

function loadPage(inXml,inXsl,outId,tabId,title)
{
  xml = loadXMLDoc(inXml);
  xsl = loadXMLDoc(inXsl);	
	  
  if (window.ActiveXObject || xhttp.responseType == "msxml-document"){
    ex = xml.transformNode(xsl);
    $(outId).innerHTML = ex;
  }else if (document.implementation && document.implementation.createDocument){
    xsltProcessor = new XSLTProcessor();
    xsltProcessor.importStylesheet(xsl);
    resultDocument = xsltProcessor.transformToFragment(xml, document);
    node = $(outId);
    setText(outId,'');
    if(node.childNodes[0])
      node.removeChild(node.childNodes[0]);
    if(node)
      node.appendChild(resultDocument);
  }
  if(tabId && title)
      setCurrentTab(tabId,title);

  disableOutputEscaping('content');

}
function markInput(bool)
{
  var body  = document.getElementsByTagName("body")[0];
  var node = body.getElementsByTagName("input");
  for(var i=0,j=node.length; i<j; i++)
  if(node[i].className == 'markBox') 
    node[i].checked = bool;
  visible (bool ? 'umarkAll' : 'markAll' );
  hide (bool ? 'markAll' : 'umarkAll' );
}
function markTables(bool)
{
  var body  = document.getElementsByTagName("body")[0];
  var node = body.getElementsByTagName("option");
  for(var i=0,j=node.length; i<j; i++)
  if(node[i].className == 'table') 
    node[i].selected = bool;
  visible (bool ? 'umarkAll2' : 'markAll2' );
  hide (bool ? 'markAll2' : 'umarkAll2' );
}
var nCurrentShown;
function DisplayTable(id)
{
  hide( nCurrentShown);
  visible(id);
  nCurrentShown = id;
}
var aCurrentShown = new Array();
function DisplayTables(i,id)
{
    hide( aCurrentShown[i] );
    aCurrentShown[i] = id;
    visible(id);
}
function setIndexType(type)
{
    if(type == 'FOREIGN KEY')
      hideForeign( false );
    else
      hideForeign( true );
}
function hideForeign(bHide)
{
    var body  = document.getElementsByTagName("body")[0];
    var node = body.getElementsByTagName("td");
    for(var i=0,j=node.length; i<j; i++){
      var a =  node[i].classList ;
	for(var k=0,l=node.length; k<l; k++){
	  if(a[k] == 'foreign')
	    node[i].style.display  =  bHide ? 'none' :'';
	}
    }
}
function DisplayKeyWords(b)
{
  if(b){
    $('akeywods').className = 'currentLink';
    $('afieldNames').className = 'link';
    hide('divTables');
    hide( nCurrentShown);
    visible('selKeyword');
    $('selKeyword').focus();
  }else{
    $('akeywods').className = 'link';
    $('afieldNames').className = 'currentLink';
    hide('selKeyword');
    visible('divTables');
    $('divTables').focus();
  }
}
function setText(id,string)
{
  var element = $(id);
  if(element)
    element.innerHTML = string;
  else
    window.status = id+string;
}
function getText(id)
{
  var element = $(id);
    if(element)
      return element.innerHTML;
}
function hide(id)
{
  if($(id))
      $(id).style.display = "none";
}
function visible(id)
{
       if($(id))
	  $(id).style.display = "";
}
function intputMask(id ,regexp)
{
  var rxObj = regexp;
  rxObj.exec($(id).value);
  $(id).value = RegExp.$1;
}
var cAction ='ShowTables';
function setAction(n)
{
       cAction = n;
}
var tmpTxt;
var tmpID;
function showPopup(id,hideCloseButton)
{
    visible('popup');
    if(hideCloseButton)
      hide('closeButton');
    else
      visible('closeButton');
    tmpTxt = getText(id);
    tmpID = id;
    setText(id,'');
    setText('popupTitle',translate(id));
    setText('popupContent',tmpTxt);
    evalId(id);
}
function closePopup()
{
    setText(tmpID,tmpTxt);	
    hide('popup');
    $('popupContent1').style.left='25%';
    $('popupContent1').style.width='50%';
}
var currentId, currentTxt;
var act ='save';
function submitForm(node,tabId,tabTitle,bHistory,method,uri)
{
    bHistory = typeof bHistory !== 'undefined' ? bHistory : true;
    method   = typeof method   !== 'undefined' ? method   : 'POST';
    var url  = typeof uri      !== 'undefined' ? uri      : "perl/mysql.pl?";
    if(checkForm(node)){
      var formData = new FormData();
      for(var i =0; i < node.elements.length;i++){
	if(node.elements[i].type == 'checkbox' || node.elements[i].type == 'radio'){
		if(node.elements[i].checked){
		  if(method == 'POST')
		    formData.append(node.elements[i].name,node.elements[i].value);
		  else
		    url += node.elements[i].name+"="+encodeURIComponent(node.elements[i].value)+"&";
		}
	}else if(node.elements[i].name == 'submit'){
	    if(method == 'POST')
	      formData.append(node.elements[i].name,act);
	    else
	      url += node.elements[i].name+"="+encodeURIComponent(act)+"&";
	}else if(node.elements[i].type == 'file'){       
	      var file = node.elements[i];
	      if(method == 'POST')
		formData.append(file.name, file.files[0]);
	}else if(node.elements[i].type == 'select-multiple'){
	    for (var j=0, len=node.elements[i].options.length; j<len; j++) {
	      var  opt = node.elements[i].options[j];
	      if ( opt.selected ){
		  if(method == 'POST')
		    formData.append(node.elements[i].name,node.elements[i].options[j].value);
		  else
		    url += node.elements[i].name +"="+ encodeURIComponent(node.elements[i].options[j].value)+"&";
	      }
	    }
	}else{
	  if(method == 'POST')
	    formData.append(node.elements[i].name,node.elements[i].value);
	  else
	    url += node.elements[i].name+"="+encodeURIComponent(node.elements[i].value)+"&"; 
	}
      }
//    formData.append("MAX_FILE_SIZE","100000");
      requestURI(url,tabId,tabTitle,bHistory,formData,method);
  }
}
var http_request = false;
var oldpage;
//requestURI('perl/mysql.pl?action=loadSidebar',action,action,false,false,'GET',false)
function requestURI(url,id,txt,bHistory,formData,method,bWaid)
{
      closePopup();
      if(txt)
	window.document.title = txt;
      bHistory = typeof bHistory !== 'undefined' ? bHistory : true;
      method   = typeof method   !== 'undefined' ? method   : 'GET';
      if(bHistory && method == 'GET')
	history.pushState(null, '','?'+url);
      if( bWaid )
      {
	var waid = getText('animationContainer');
	oldpage = '';
	oldpage = getText('content');
	var w = '<div class="waid" >'+waid+'</div>';
	setText('content',w);
      }
      http_request = false;

      if (window.XMLHttpRequest) { //Firefox
	  http_request = new XMLHttpRequest();
	  if (http_request.overrideMimeType)
	      http_request.overrideMimeType('text/xml');
      } else if (window.ActiveXObject) { //IE
	  try {
	      http_request = new ActiveXObject("Msxml2.XMLHTTP");
	  } catch (e) {
	      try {
		  http_request = new ActiveXObject("Microsoft.XMLHTTP");
	      } catch (e) {}
	  }
      }
      if($(id))
	setCurrentTab(id,txt);			
      else if(txt)
	setCurrentTab('dynamicLink',txt);	
      http_request.onreadystatechange = setContent;
      if(method != 'POST'){
	http_request.open('GET', url, true);
	http_request.send(null);
      }else{
	http_request.open('POST', url, true);
	http_request.setRequestHeader("Content-Type", "multipart/form-data");
	http_request.send(formData);
      }
}

function loadXMLDoc(filename)
{
    if (window.ActiveXObject){
	    xhttp = new ActiveXObject("Msxml2.XMLHTTP");
    }else{
	    xhttp = new XMLHttpRequest();
    }
    xhttp.open("GET", filename, false);
    xhttp.overrideMimeType("text/xml");
    try {
      xhttp.responseType = "msxml-document"
      
    } catch(err) {
      alert(err);
    }
    xhttp.send(null);
    return xhttp.responseXML;
}

function setContent()
{
    if (http_request.readyState == 4) {
	if (http_request.status == 200) {
	  response      = http_request.responseXML;
	  for(var i = 0; i < response.getElementsByTagName('output').length; i++){
	    var outID = response.getElementsByTagName('output')[i].getAttribute('id')
	    var txt  = response.getElementsByTagName('output')[i].textContent;
	    if (navigator.userAgent.indexOf("Firefox")!=-1)
		txt = txt.replace("<![CDATA[", "").replace("]]>", "");
	    setText(outID,txt);
	    evalId(outID);
	  }
	}
	else
	{
	    if(oldpage.length > 0){
		setText('content',oldpage);
		setCurrentTab(currentId, currentTxt);
	    }else{
	      alert(http_request.status + " " +http_request.responseText);
	      confirm2(http_request.responseText,errorMessage)
	    }
	      
	}
      var closeButton = $("closeButton");
      if((!document.cookie.match('sid') || document.cookie.match('sid=123'))  && window.location.search.match('mysql.pl')  )
      {
	showPopup('login',true);
	evalId('popupContent');
      }
      else
      {
	closeButton.addEventListener ('click',closePopup);
      }
      hide('toolbarcontent2');
      hide('toolbarcontent');
      if($('toolbar'))
	$('toolbar').classList.add('closed');
      if($('toolbar2'))
	$('toolbar2').classList.add('closed');
    }
}

function errorMessage(text){
   location.href = "install.html";
}

function evalId(id)
{
    var content  = $(id);
    if(content){
      var node = content.getElementsByTagName("script");
      for(var i=0,j=node.length; i<j; i++){
	if(node[i] && node[i].childNodes[0])
	  eval(node[i].childNodes[0].nodeValue);
      }
    }
}

window.onpopstate =loadHistory;
function loadHistory()
{
    var rxObj =  new RegExp(/action=([^&]+)/);
    rxObj.exec(window.location.search);
    var action = RegExp.$1;
    var rxObj2 =  new RegExp(/(\?[^\?]+$)/);
    rxObj2.exec(window.location.search);
    var uri = RegExp.$1;
    var url = window.location.search;
    if(uri && action){
	requestURI('perl/mysql.pl'+uri,action,action,false);
    }else
      requestURI('perl/mysql.pl?action=showDatabases','ShowDatabases','Datenbanken');
    return true;
}

function translate(string)
{
	var lng = navigator.language.indexOf("de") > -1 ? 'de':'en';
	if(typeof Lang != 'undefined')
	{
	  var l = new Lang(); 
	  if(string){
	    var ret = eval('l.'+lng+string.toLowerCase());
	    return ret ? ret : string;
	  }
	  else
	  {
	    traversTranslate('tab1',lng,l);
	    traversTranslate('tabwidget',lng,l);
	  }
	}
	else
	{
	  return string;
	}
}

function traversTranslate(id,lng,l)
{
    if($(id)){
    var node = $(id).getElementsByTagName("a");
	for(var i=0,j=node.length; i<j; i++){
	    if(node[i] && node[i].childNodes[0]){
		  var ret =  eval('l.'+lng+node[i].childNodes[0].nodeValue.toLowerCase());
		  if(ret)
		    node[i].childNodes[0].nodeValue  = ret;
	    }
	}
    }
}
function disableOutputEscaping(id)
{
  if (navigator.userAgent.indexOf("Firefox")!=-1)
      $(id).innerHTML = $(id).textContent;
}
function $(id)
{
    return document.getElementById(id);
}

var autocomplete = new Array("select","from","where","insert","set","update");
var clickA;
var oldDate;
var oldTime;

function breakOut()
{
  clickA = clickA ?false:true;
  if(clickA)
  {
    oldDate = new Date();
    oldTime = oldDate.getTime();
    return false;
  }
  else
  {
    var date = new Date();
    var time = date.getTime();
    return (time - oldTime > 1000) ? false : true;
  }
}

function Autocomplete(evt)
{
  if(breakOut())
      return;
  if (evt.which == 8 ||evt.which == 16||  evt.which === 37 || evt.which === 38 ||evt.which === 39 || evt.which === 39 || evt.which === 40  )
    return;
    var offset = 3;
    while($("sqlEdit").selectionStart-offset >= 0 && offset < 10){//todo port to IE
	  var  match = ''
	  if( $("sqlEdit").value.substr($("sqlEdit").selectionStart-offset-1, 1) ==' ' ||$("sqlEdit").value.substr($("sqlEdit").selectionStart-offset-1, 1).search(new RegExp("\\b")) == -1|| $("sqlEdit").selectionStart-offset == 0){
	      match = $("sqlEdit").value.substr($("sqlEdit").selectionStart-offset, offset);
	  }
	  var i = 0;
	  var j = autocomplete.length;
	  while( i < autocomplete.length){
		if(match == autocomplete[i].substr(0,offset)){
		  var selectionStart = $("sqlEdit").selectionStart;
		  var before = $("sqlEdit").value.substr(0,selectionStart-offset);
		  var behind = $("sqlEdit").value.substr(selectionStart,$("sqlEdit").value.length);
		  $("sqlEdit").value = before+autocomplete[i]+behind;
		  $("sqlEdit").selectionStart = selectionStart;
		  $("sqlEdit").selectionEnd   = selectionStart+autocomplete[i].length-offset;
		  break;
		}
		i++;
	}
	offset++;
      }
}

function selKeyword(id)
{
  for(var i= 0; i<  $(id).options.length;i++ )
      autocomplete.push( $(id).options[i].value);
}
var uno = true;
function showSQLEditor()
{
  $('popupContent1').style.left='5%';
  $('popupContent1').style.width='90%';
  showPopup('SqlEditor');
  $("sqlEdit").addEventListener ('keyup', Autocomplete);
  if(uno){
    selKeyword('selKeyword');
    selKeyword('tablelist');
    for(var i= 0; i<  $('tablelist').options.length;i++ )
	selKeyword($('tablelist').options[i].value);
  }
  uno = false;
}

function ShowNewRow()
{
  $('popupContent1').style.left='2%';
  $('popupContent1').style.width='96%';
  showPopup('ShowNewRow');
}

function insertAtCursorPosition(txt)
{
       var textarea  = document.getElementById('sqlEdit');
       if(typeof document.selection != 'undefined'){
              range = document.selection.createRange();
              var txt = range.text;
	      range.text = txt;
	      range.moveStart('character', txt.length );
              range.select();
       }else if(textarea.selectionStart &&(textarea.selectionEnd == textarea.selectionStart)){//insert at gecko
              var ia = textarea.selectionStart;
              var a = textarea.value.substring(0,ia);
              var b = textarea.value.substring(ia,textarea.value.length);
              textarea.value = a+txt+b;
       }else{
             textarea.value += txt;	
       }
}

var timer;
function toolbarOver(){
    timer = setTimeout(function start(){showToolbar('toolbar');showToolbar('toolbar2');},300)
}

function toolbarOut(){
   clearTimeout(timer);
}

function closeToolbar(){
    hideToolbar('toolbar2');
    hideToolbar('toolbar');
}

function showToolbar(id){
  var entry = $(id);
  if(entry && entry.firstChild){
  entry.classList.remove('closed');
  if(entry.firstChild)
	  entry.firstChild.style.display ='';
  }
  var node = $('toolbarTable');
  if(node){
    node.addEventListener ('mouseleave', function (evt) {
    closeToolbar();
    });
  }
}
function hideToolbar(id){
  var entry = $(id);
  if(entry && entry.firstChild){
      entry.classList.add('closed');
        if(entry.firstChild)
		entry.firstChild.style.display ='none';
  }
  clearTimeout(timer);
}
var nCurrentRow = 0;
function enter(event){
  var keyCode = event.keyCode ? event.keyCode :event.charCode ? event.charCode :event.which;
  if (keyCode == 13) 
  return true;
  else
  return false;
}
function setAll(){
       var body  = document.getElementsByTagName("body")[0];
       var node = body.getElementsByTagName("option");
       for(var i=0,j=node.length; i<j; i++)
       if(node[i].className == 'set') 
	 node[i].selected = true;
}
function editSet(input,select){
  $(input).value = select.options[select.options.selectedIndex].value;
  nCurrentRow = select.options.selectedIndex;
}
function setEnter(input,select)
{
  if(!$(select).options[nCurrentRow] ){
    addEntry(select,input.id);
  }
  $(select).options[nCurrentRow].value = input.value;
  $(select).options[nCurrentRow].text = input.value;
}
function deleteEntry (idSelect)
{
  $(idSelect).options[$(idSelect).options.selectedIndex] = null;
}
function clearSelect (idSelect)
{
     $(idSelect).innerHTML ='';
     nCurrentRow = 0;
}
function addEntry(idSelect,idEdit) {
  newEntry = new Option('', '', false, true);
  var n = $(idSelect).length;
  $(idSelect).options[n] = newEntry;
  $(idSelect).options[n].className ='set';
}
function displayTree(id){
  var e = document.getElementById(id);
  if(!e)return;
  var display = e.style.display;
  if(display == "none"){
	e.style.display = "";
  }else if(display == ""){
	e.style.display = "none";
  }
}
// object.x - .y =  getElementPosition(id);
function getElementPosition(id)
{
  var node = document.getElementById(id);
  var offsetLeft = 0;
  var offsetTop  = 0;
  while (node){
    offsetLeft += node.offsetLeft;
    offsetTop += node.offsetTop;
    node = node.offsetParent;
  }
  var position = new Object();
  position.x = offsetLeft;
  position.y = offsetTop;
  return position;
}
function move(id,x,y)
{
  Element = document.getElementById(id);
  Element.style.position = "absolute";
  Element.style.left = x + "px";
  Element.style.top  = y + "px";
}
var openMenu;
function showMenu(linkId,menuId)
{
  if(menuId != openMenu) hide(openMenu);
  openMenu = menuId;
  var oLink = document.getElementById(linkId);
  var oMenu = document.getElementById(menuId);
  var o = getElementPosition(linkId);
  var ao = getWindowSize();
  var c = (( o.x +  oLink.offsetWidth  )- oMenu.offsetWidth );
  c = c > 0 ? c : o.x-1;
  move(menuId,ao.x > o.x+ oMenu.offsetWidth ?  o.x-1  : c+1  ,o.y+oLink.offsetHeight );
  displayTree(menuId);
}
function getWindowSize()
{
  var nWidth = 0, nHeight = 0;
  var o = new Object;
  if( typeof( window.innerWidth ) == 'number' ) {//Gecko
	o.x = window.innerWidth;
	o.y =  window.innerHeight;
	return o;
  } else if( document.documentElement &&  document.documentElement.clientWidth && document.documentElement.clientHeight  ) {//Ie
	o.x = document.documentElement.clientWidth;
	o.y = document.documentElement.clientHeight;
	return o;
  }
  o.x = 0;
  o.y = 0;
  return o;
}
function ChangeToolTip(sId,sDataTyp){
 document.getElementById(sId).title = translate(sDataTyp);
}

var pnPageY = 0;
function scrollToTop()
{
  pnPageY =  window.pageYOffset;
  var node = document.getElementById('topUp');
  window.setTimeout(pageUp,1);
}
function pageUp()
{
  pnPageY-=250;
  window.scrollTo(0,pnPageY);
  if(pnPageY > 0)
  window.setTimeout(pageUp,1);
}