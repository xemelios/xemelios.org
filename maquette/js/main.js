var MENU_DATA_URL = "site/menu.xml";
var MENU_DISPLAY_URL = "site/xsl/menu.xsl";

function loadXMLDoc(dname)
{
    var cacheDisable = Math.random(1000);
    
    var xhttp = null;
    if (window.XMLHttpRequest)
    {
        xhttp = new XMLHttpRequest();
    } else
    {
        xhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xhttp.open("GET", dname + "?nocache=" + Math.random(), false);
    xhttp.send(null);
    return xhttp.responseXML;
}

function Xajax(url)
{
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function ()
    {
        if (this.readyState == 4)
        {
            var element = document.getElementById("main-content");
            if (this.status != 404 && this.status != 403){
                element.innerHTML = "";
                element.innerHTML = '<iframe src="' + url + '" frameborder="0" scrolling="auto"/>';
            } else {
                element.innerHTML = "";
                element.innerHTML = "<center><i>Non disponible</i></center>";
            }
        }
    };
    xhr.open("GET", url + "?nocache=" + Math.random(), true);
    xhr.send(null);
}

function transform(srcXml, srcXsl)
{
    var xml = loadXMLDoc(srcXml);
    var xsl = loadXMLDoc(srcXsl);
    // code for IE
    if (window.ActiveXObject){
        var ex = xml.transformNode(xsl);
        return ex;
    } else if (document.implementation && document.implementation.createDocument){
        // code for Mozilla, Firefox, Opera, etc.
        var xsltProcessor = new XSLTProcessor();
        xsltProcessor.importStylesheet(xsl);
        return xsltProcessor.transformToFragment(xml, document);
    }
}

function loadData(){
    // menu
    var menu = transform(MENU_DATA_URL, MENU_DISPLAY_URL);
    if (window.ActiveXObject){
        document.getElementById("menu").innerHTML = menu;
    } else {
        document.getElementById("menu").appendChild(menu);
    }
}

function displayContent(url){
    var xml = loadXMLDoc(url);
    if (window.ActiveXObject)
    {
        document.getElementById("main-content").innerHTML = xml;
    } else
    {
        var xsltProcessor = new XSLTProcessor();
        xsltProcessor.importStylesheet(null);
        var resultDocument = xsltProcessor.transformToFragment(xml, document);
        var element = document.getElementById("main-content");
        while (element.childCount > 0)
        {
            element.removeChild(0);
        }
        element.appendChild(resultDocument);
    }
}

function displayContentByXsl(srcXml, srcXsl)
{
    var page = transform(srcXml, srcXsl);
    if (window.ActiveXObject){
        document.getElementById("main-content").innerHTML = page;
    } else {
        var element = document.getElementById("main-content");
        element.innerHTML = "";
        element.appendChild(page);
    }
}

function hideShowMenu(menuId){
    var element = document.getElementById(menuId);
    
    var isSousSousMenu=(element.parentNode.getAttribute("class")!=null?element.parentNode.getAttribute("class").search('level-menu-2')>-1:false);
    var isSousSousSousMenu=(element.parentNode.getAttribute("class")!=null?element.parentNode.getAttribute("class").search('level-menu-3')>-1:false);

    var menuIdToKeepBlock = null;
    if(isSousSousMenu || isSousSousSousMenu){
        menuIdToKeepBlock=element.parentNode.parentNode.parentNode.getAttribute("id");
    }

    var lis = document.getElementById('menu').getElementsByTagName("li");
    for(var i=0;i<lis.length;i++){
        var li=lis[i];
        if(li.getAttribute("class")!=null && (li.getAttribute("class").search('level-menu-1') || li.getAttribute("class").search('level-menu-2')) > 0 && menuIdToKeepBlock==null){
            var uls = li.getElementsByTagName("ul");
            for(var j=0;j<lis.length;j++){
                var ul=uls[j];
                if(ul!=null){
                    ul.style.display = 'none';
                    ul.parentNode.style.paddingBottom = '12px';
                }
            }
        }
    }
    /* SHOW MENU */
    if (element.style.display == 'block'){
        element.style.display = 'none';
        element.parentNode.style.paddingBottom = '12px';
    } else {
        element.style.display = 'block';
        element.parentNode.style.paddingBottom = '0';
    }
    //derouleMenu(element.parentNode);
}

function derouleMenu(element){
        if (element.getElementsByTagName('span')[0].className=='close'){
            element.getElementsByTagName('span')[0].className='open';
        } else {
            element.getElementsByTagName('span')[0].className='close';
        }
        
}

function display(id){
    var element = document.getElementById(id);
    if (element.style.display == 'block'){
        element.style.display = 'none';
    } else {
        element.style.display = 'block';
    }
}

function hideShowActu(actuId){
    var element = document.getElementById(actuId);
    if (element.style.display == 'block')
    {
        element.style.display = 'none';
    } else
    {
        element.style.display = 'block';
    }
}