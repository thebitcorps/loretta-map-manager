// -------------------- Basic Map ------------------------------- /
var map = L.map('map').setView([21.906, -102.33], 18);

L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpandmbXliNDBjZWd2M2x6bDk3c2ZtOTkifQ._QA7i5Mpkd_m30IGElHziw', {
	maxZoom: 20,
	minZoom: 1,
	id: 'mapbox.streets'
}).addTo(map);
