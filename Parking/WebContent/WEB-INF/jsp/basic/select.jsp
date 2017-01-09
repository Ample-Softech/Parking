<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
      
     	#pano {
        float: left;
        height: 100%;
        width: 36%;
      } 
            
      #map{
        float: left;
        height: 100%;
        width: 64%;
      }
      
    </style>
  </head>
  <body>
  
    <div id="map"></div>
     <div id="pano"></div>
 
    <script>        
      function initialize() {
        var fenway = {lat: ${latitude}, lng: ${longitude}};
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
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCy0y-BGBgl6fjl1zDhcBpgHHo6ZR6PXvY&callback=initialize"></script>
  </body>
</html>