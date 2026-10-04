let map, infoWindow, t;
let marker = "";
var markersArray = [];
let temp = { lat: 1, lng: 1 };
function initMap() {
  map = new google.maps.Map(document.getElementById("map"), {
    center: { lat: 34.965558, lng: 38.406331 },
    zoom: 7.3,
  });
  infoWindow = new google.maps.InfoWindow();
  const locationButton = document.createElement("span");
  locationButton.classList.add("locationBtn");
  locationButton.textContent = "My Current Location";
  locationButton.classList.add("custom-map-control-button");
  map.controls[google.maps.ControlPosition.TOP_CENTER].push(locationButton);
  map.addListener("click", (e) => {
    clearOverlays();
    marker = placeMarkerAndPanTo(e.latLng, map);
    markersArray.push(marker);
  });

  function clearOverlays() {
    for (var i = 0; i < markersArray.length; i++) {
      markersArray[i].setMap(null);
    }
    markersArray.length = 0;
  }

  function placeMarkerAndPanTo(latLng, map) {
    console.log(latLng.lat());
    console.log(latLng.lng());
    temp = latLng;
    t = new google.maps.Marker({
      position: latLng,
      map: map,
    });
    map.panTo(latLng);
    return t;
  }

  locationButton.addEventListener("click", () => {
    // Try HTML5 geolocation.
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(
        (position) => {
          const pos = {
            lat: position.coords.latitude,
            lng: position.coords.longitude,
          };
          infoWindow.setPosition(pos);
          infoWindow.setContent("My Location");
          infoWindow.open(map);
          map.setCenter(pos);
        },
        () => {
          handleLocationError(true, infoWindow, map.getCenter());
        }
      );
    } else {
      // Browser doesn't support Geolocation
      handleLocationError(false, infoWindow, map.getCenter());
    }
  });
}

function handleLocationError(browserHasGeolocation, infoWindow, pos) {
  infoWindow.setPosition(pos);
  infoWindow.setContent(
    browserHasGeolocation
      ? "Error: The Geolocation service failed."
      : "Error: Your browser doesn't support geolocation."
  );
  infoWindow.open(map);
}

window.initMap = initMap;

let form = document.querySelector("form");
let message_error = document.getElementById("message_error");
let countMistake = 0;
form.addEventListener("submit", (e) => {
  if (countMistake >= 0) {
    if(temp.lat === 1)
    e.preventDefault()
    CheckInputs();
  }
});
function CheckInputs() {
  if (temp.lat === 1) {
    CheckMessageError(message_error, "Please Select Your Location", "visible");
  } else {
    CheckMessageSuccess(message_error, "hidden");
  }
}

function CheckMessageError(element, message, status) {
  // document.getElementById("test").preventDefault();
  countMistake++;
  element.innerText = message;
  element.style.visibility = status;
}

function CheckMessageSuccess(element, status) {
  countMistake = -1;
  element.innerText = "";
  element.style.visibility = status;
}

onload = () => {
  vanish();
};

// Loader Start

let vanish = () => {
  document.querySelector(".loader-container").classList.add("fade-out");
};
// Loader End
// --------------------