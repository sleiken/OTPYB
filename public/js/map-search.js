var dbc = {lat: 37.7846334, lng: -122.3996024};
var hostnameRegexp = new RegExp('^https?://.+?/');

function initMap() {
  map = new google.maps.Map($("#map")[0], {
    zoom: 12,
    center: dbc,
    mapTypeControl: true,
    panControl: false,
    zoomControl: false,
    streetViewControl: false
  });

  autocomplete = new google.maps.places.Autocomplete(
      /** @type {!HTMLInputElement} */ (
      $("#search")[0]), {
        types: ['(cities)']
      });
  places = new google.maps.places.PlacesService(map);

  autocomplete.addListener('place_changed', onPlaceChanged);
};

// When the user selects a city, get the place details for the city and
// zoom the map in on the city.
function onPlaceChanged() {
  var place = autocomplete.getPlace();
  if (place.geometry) {
    map.panTo(place.geometry.location);
    map.setZoom(12);
  } else {
    document.getElementById('search').placeholder = 'SEARCH';
  }
};
