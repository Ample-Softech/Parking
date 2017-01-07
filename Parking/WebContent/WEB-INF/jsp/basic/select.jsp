<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Street View side-by-side</title>
    <jsp:include page="/link.jsp"></jsp:include>
    <style>
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #map, #pano {
        float: left;
        height: 100%;
        width: 45%;
      }
    </style>
  </head>
  <body>
    <div id="map"></div>
    <div id="pano"></div>
    <script>

      function initialize() {
        var fenway = {lat: 42.345573, lng: -71.098326};
        var map = new google.maps.Map(document.getElementById('map'), {
          center: fenway,
          zoom: 14
        });
        var panorama = new google.maps.StreetViewPanorama(
            document.getElementById('pano'), {
              position: fenway,
              pov: {
                heading: 34,
                pitch: 10
              }
            });
        map.setStreetView(panorama);
      }
    </script>
  </body>
</html>