var dbc = {lat: 37.7846334, lng: -122.3996024};

function initMap() {
  var map = new google.maps.Map(document.getElementById('map'), {
    center: dbc,
    zoom: 6
  });

  var infoWindow = new google.maps.InfoWindow({map: map});

  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var pos = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };

      var content = '<a>Example Text</a>'
      infoWindow.setPosition(pos);
      infoWindow.setContent(content);
      map.setCenter(pos);
    });
  };
};
