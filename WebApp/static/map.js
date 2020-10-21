// create map
function initMap() {
  const directionsRenderer = new google.maps.DirectionsRenderer();
  const directionsService = new google.maps.DirectionsService();
  const map = new google.maps.Map(document.getElementById("map"), {
    zoom: 15,
     center: new google.maps.LatLng(40.7128, -74.0060)
  });
  directionsRenderer.setMap(map);
  calculateAndDisplayRoute(directionsService, directionsRenderer);
    calculateAndDisplayRoute(directionsService, directionsRenderer);
}
