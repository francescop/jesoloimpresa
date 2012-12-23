 /* Questo script di Google è stato implementato ed adattato a nuove specifiche da Francesco Gerratana, puoi liberamente utilizzarlo non
 a fine di lucro, ti chiedo solo di mettere il nome dell'autore ed il sito www.nextechnics.com. Il sito non ha scopi commerciali.
 NOTA BENE DEVI USARE LA TUA API KEY DI GOOGLE, LA OTTIENI REGISTRANDOTI SUL SITO http://code.google.com/ 
 ***************************************************************************************************************************************
 This script Google has been implemented and adapted to new specifications by Francesco Gerratana, you can not freely use
 on a profit basis, we ask only to the author's name and the site www.nextechnics.com. The site has no commercial purposes.
 NOTE YOU MUST USE YOUR API KEY TO GOOGLE THE OTTIENI REGISTRANDOTI ON SITE http://code.google.com/*/
 var map;
    var gdir;
    var geocoder = null;
    var addressMarker;

    function initialize() {
      if (GBrowserIsCompatible()) {      
        map = new GMap2(document.getElementById("map"));
        gdir = new GDirections(map, document.getElementById("directions"));
        GEvent.addListener(gdir, "addoverlay", onGDirectionsLoad);
        GEvent.addListener(gdir, "error", handleErrors);
		//Inizio Implementazione mia dei controlli.
		map.addControl(new GScaleControl());
		map.enableScrollWheelZoom();
		map.enableDoubleClickZoom();		
		map.setCenter(new GLatLng(45.501446, 12.632699), 12);
		
		map.setMapType(G_NORMAL_MAP);;
        
		map.addControl(new GSmallMapControl());
        map.addControl(new GMapTypeControl());
        //fine implementazione.
		//setDirections("Verona", "Jesolo", "it_ITA"); //indirizzo IN e OUT
      }
    }
    
    function setDirections(fromAddress, toAddress, locale) {
      gdir.load("from: " + fromAddress + " to: " + toAddress + "", "it_ITA");
    }

    function handleErrors(){
   if (gdir.getStatus().code == G_GEO_UNKNOWN_ADDRESS)
     alert("La posizione geografica potrebbe non essere trovata per uno degli indirizzi specificati. Ciò può essere dovuto al fatto che l'indirizzo è relativamente nuovo, o può non essere corretto. Errore n* " + gdir.getStatus().code);
   else if (gdir.getStatus().code == G_GEO_SERVER_ERROR)
     alert("Un geocodifica in direzioni o richiesta non ha potuto essere trattata con successo, ma l'esatto motivo per il fallimento non è noto. Errore n* " + gdir.getStatus().code);
   else if (gdir.getStatus().code == G_GEO_MISSING_QUERY)
     alert("HTTP parametro q è stato mancante o non ha avuto alcun valore. Per richieste di geocode, questo significa che un vuoto indirizzo è stato specificato come input. Per le indicazioni richieste, il che significa che non è stato specificato di query in ingresso. Errore n* " + gdir.getStatus().code);
   else if (gdir.getStatus().code == G_GEO_BAD_KEY)
     alert("Il dato chiave non è valido o non corrisponde al dominio per il quale è stato dato. Errore n* " + gdir.getStatus().code);
   else if (gdir.getStatus().code == G_GEO_BAD_REQUEST)
     alert("Una direzione richiesta non ha potuto essere analizzata con successo. Errore n* " + gdir.getStatus().code);
   else alert("Si è verificato un errore.");
    }

  function onGDirectionsLoad(){ 
   var poly = gdir.getPolyline();
   if (poly.getVertexCount() > 10000) {  //cambia il vaolore del numero dei vertici
     alert("Questo itinerario ha troppi vertici");
     return;
   }
   var baseUrl = "http://maps.google.com/staticmap?";

   var params = [];
   params.push("center=" + map.getCenter().lat().toFixed(6) + "," + map.getCenter().lng().toFixed(6));

   var markersArray = [];
   markersArray.push(poly.getVertex(0).toUrlValue(5) + ",reda");
   markersArray.push(poly.getVertex(poly.getVertexCount()-1).toUrlValue(5) + ",greenb");
  
   params.push("markers=" + markersArray.join("|"));

   var polyParams = "rgba:0x0000FF80,weight:50|";
   var polyLatLngs = [];
   for (var j = 0; j < poly.getVertexCount(); j++) {
     polyLatLngs.push(poly.getVertex(j).lat().toFixed(5) + "," + poly.getVertex(j).lng().toFixed(5));
   }
   // genera uno screenshot della mappa e lo mostra a video.
   // params.push("path=" + polyParams + polyLatLngs.join("|"));
   // params.push("zoom=" + map.getZoom());
   // params.push("size=500x630");
   // var img = document.createElement("img");
   // img.src = baseUrl + params.join("&") + "&key=ABQIAAAARgj-H_Puy6zHmnhtW10zdhS7AeBILSJeQEEYAXY5Oi6_3FVORBQaHlTnzkY2dKVbxq5dnqWGzREVCQ";
   // document.getElementById("staticMapIMG").innerHTML = "";
   // document.getElementById("staticMapIMG").appendChild(img);
   // document.getElementById("staticMapURL").innerHTML = baseUrl + params.join("&") + "&key=YOUR_KEY_HERE";
}

