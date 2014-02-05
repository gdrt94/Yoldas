<%-- 
    Document   : newjsp
    Created on : 04.01.2014, 15:21:12
    Author     : Gudrat
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="includes/header.jsp" %>

    <style>
    /*  html {
        height: 100%;
        padding-left: 50px
      }
      */
      #map-canvas {
        height: 100%;
      }
      /*
      body {
        height: 100%;
        margin: 0px;
        padding: 0px  
      }*/
      .controls {
        margin-top: 16px;
        border: 1px solid transparent;
        border-radius: 2px 0 0 2px;
        box-sizing: border-box;
        -moz-box-sizing: border-box;
        height: 32px;
        outline: none;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
      }
      
      .controlsInput {
        margin-top: 16px;
        border: 1px solid transparent;
        border-radius: 2px 0 0 2px;
        box-sizing: border-box;
        -moz-box-sizing: border-box;
        height: 32px;
        outline: none;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
      }

      #pac-input, #pac-input2, #pac-input3, #pac-input4, #pac-input5, #pac-input6, #pac-input7 {
        background-color: #fff;
        padding: 0 11px 0 13px;
        width: 400px;
        font-family: Arial;
        font-size: 15px;
        font-weight: 300;
        text-overflow: ellipsis;
      }

      #pac-input:focus, #pac-input2:focus, #pac-input3:focus, #pac-input4:focus, #pac-input5:focus, #pac-input6:focus, #pac-input7:focus {
        border-color: #4d90fe;
        margin-left: -1px;
        padding-left: 14px;  /* Regular padding-left + 1. */
        width: 401px;
      }

      .pac-container {
        font-family: Arial;
      }

      #type-selector {
        color: #fff;
        background-color: #4d90fe;
        padding: 5px 11px 0px 11px;
      }

      #type-selector label {
        font-family: Arial;
        font-size: 13px;
        font-weight: 300;
      }
      .styled-button-10 {
	background:#51a351;
	padding:8px 13px;
	color:#fff;
	font-family:'Helvetica Neue',sans-serif;
	font-size:17px;
	border-radius:4px;
	-moz-border-radius:4px;
	-webkit-border-radius:4px;
	border:1px solid #51a351
      }
      .styled-button-10:active {
        background: #489248;
        cursor: pointer;
      }
      .styled-button-10:hover {
        cursor: pointer;          
      }
    </style>
    <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>

   <script>
var map = null;
var marker = [];
var autocomplete = [];
var inputs = [];
var types = [];
var lats = [];
var lngs = [];
var autocompleteOptions = {
 componentRestrictions: {country: "az"}
};

$(document).ready(function(){
    var count = 2;
    $("#addInputField").click(function(){
        count++;
        $("#inputlar").append("<input id='pac-input" + count + "' class='controlsInput' type='text' placeholder='Yolüstü dayanacaq' /> <br />");
        var newInput = [];
        var newEl = document.getElementById('pac-input' + count);
        newInput[count-1] = newEl;
        //newInput.push(newEl);
        setupAutocomplete(autocomplete, newInput, count-1);
        if (count === 7) {
            $("#addInputField").remove();
        }
    });
    $("#form").submit(function() {
        $("#lats").val(lats);
        $("#lngs").val(lngs);
        return true; // return false to cancel form action
    });
});

function setupAutocomplete(autocomplete,inputs,i) {

        autocomplete[i] = new google.maps.places.Autocomplete(inputs[i], autocompleteOptions);
        autocomplete[i].bindTo('bounds', map);

        google.maps.event.addListener(autocomplete[i], 'place_changed', function() {
          var infowindow = new google.maps.InfoWindow();
          if (marker[i] && marker[i].setMap) {
             marker[i].setMap(null);
             marker[i] = null;
          }
          marker[i] = new google.maps.Marker({
                map: map
          });  
          infowindow.close();
          marker[i].setVisible(false);
          var place = autocomplete[i].getPlace();
          if (!place.geometry) {
            return;
          }

          // If the place has a geometry, then present it on a map.
          if (place.geometry.viewport) {
            map.fitBounds(place.geometry.viewport);
          } else {
            map.setCenter(place.geometry.location);
            map.setZoom(17);  // Why 17? Because it looks good.
          }
          var loc = place.geometry.location;
          lats[i] = loc.lat();
          lngs[i] = loc.lng();
         // marker[i].setIcon(/** @type {google.maps.Icon} */({
         /*   url: place.icon,
            size: new google.maps.Size(71, 71),
            origin: new google.maps.Point(0, 0),
            anchor: new google.maps.Point(17, 34),
            scaledSize: new google.maps.Size(35, 35)
          }));*/
          marker[i].setPosition(loc);
          marker[i].setVisible(true);

          var address = '';
          if (place.address_components) {
            address = [
              (place.address_components[0] && place.address_components[0].short_name || ''),
              (place.address_components[1] && place.address_components[1].short_name || ''),
              (place.address_components[2] && place.address_components[2].short_name || '')
            ].join(' ');
          }

          infowindow.setContent('<div><strong>' + place.name + '</strong><br>' + address);
          infowindow.open(map, marker[i]);
        });
    }
    function initialize() {
      var mapOptions = {
        center: new google.maps.LatLng(40.4700, 50.0000),
        zoom: 10,
        zoomControl:true,
        zoomControlOptions: {
          style:google.maps.ZoomControlStyle.SMALL
        },
        mapTypeControl:true,
        mapTypeControlOptions: {
          style:google.maps.MapTypeControlStyle.DROPDOWN_MENU 
        }
      };
      map = new google.maps.Map(document.getElementById('map-canvas'),
        mapOptions);
      types = document.getElementById('type-selector');
      map.controls[google.maps.ControlPosition.TOP_LEFT].push(types);


      inputs = document.getElementsByClassName("controlsInput");
      for(var i = 0; i < inputs.length; i++) {  
       setupAutocomplete(autocomplete,inputs,i);
      }
      // Sets a listener on a radio button to change the filter type on Places
      // Autocomplete.
      function setupClickListener(id, types) {
        var radioButton = document.getElementById(id);
        google.maps.event.addDomListener(radioButton, 'click', function() {
          for (var i=0 ; i<autocomplete.length; i++) {
            autocomplete[i].setTypes(types);
          }
        });
      }

      setupClickListener('changetype-all', []);
      setupClickListener('changetype-establishment', ['establishment']);
      setupClickListener('changetype-geocode', ['geocode']);
    }

    google.maps.event.addDomListener(window, 'load', initialize);

</script>
  </head>
  <%@include file="includes/header2.jsp" %>

        <div class="menu">
        <ul>
          <li><a href="<c:url value='main.jsp' />"><span>Şəxsi kabinetim</span></a></li>
          <li><a href="<c:url value='sur.jsp' />" class="active"><span>Marşrut təklif et</span></a></li>
          <li><a href="<c:url value='min.jsp' />"><span>Marşrut axtar</span></a></li>
          <li><a href="<c:url value='logout' />"><span>Çıxış</span></a></li>
        </ul>
      </div>
  
  <%@include file="includes/header3.jsp" %>
  <div class="body">       
 <div class="FBG">
    <div class="FBG_resize">
        <div class="blok">
            <table>
                <tr>
                    <td>
                        <div>
                            <div id="inputlar">
                            <input id="pac-input" class="controlsInput" type="text" placeholder="Marşrutunuzu haradan başlayırsınız" /> <br />
                            <input id="pac-input2" class="controlsInput" type="text" placeholder="Haraya gedirsiniz"> <br />
                            </div>  <br />
                            <input id="addInputField" type="button" value="Yolüstü dayanacaq əlavə et" class="styled-button-10"/>
                            <form id="form" action="core" method="post">
                                <input type="hidden" id="lats" name="lats" />
                                <input type="hidden" id="lngs" name="lngs" />
                                <input type="submit" class="styled-button-10" value="Yarat">
                            </form>
                            
                            <div hidden="hidden" id="type-selector" class="controls">
                              <input type="radio" name="type" id="changetype-all" checked="checked">
                              <label for="changetype-all">All</label>

                              <input type="radio" name="type" id="changetype-establishment">
                              <label for="changetype-establishment">Establishments</label>

                              <input type="radio" name="type" id="changetype-geocode">
                              <label for="changetype-geocode">Geocodes</label>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div id="map-canvas" style="width:540px;height:380px;"></div>
                    </td>
                </tr>
            </table>
        </div>  
    </div>
 </div>
  </div>
    
<%@include file="includes/footer.jsp" %>
