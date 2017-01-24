var myDoc = app.activeDocument;
PageBreaking(myDoc);
alert("Page Break Inserted");
 
function PageBreaking(elm){
    for (var i = 0; i < elm.xmlElements.length; i++){
        try{
            XMLelementName=elm.xmlElements[i].markupTag.name.toString();
            elm.xmlElements[i].select();
            if(XMLelementName=="Pagebreak"){
                elm.xmlElements[i].contents = SpecialCharacters.frameBreak;
            }
        }catch(e){}
        PageBreaking(elm.xmlElements[i]);
    }
}