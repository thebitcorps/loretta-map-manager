//= require jquery
//= require twitter/bootstrap
//= require_directory .

// -------------------- Basic Map ------------------------------- /
var map = L.map('map').setView([21.906, -102.33], 18);

L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpandmbXliNDBjZWd2M2x6bDk3c2ZtOTkifQ._QA7i5Mpkd_m30IGElHziw', {
	maxZoom: 20,
	minZoom: 1,
	id: 'mapbox.streets'
}).addTo(map);

// --------------- Requires for terrains status ----------------------- /


function style(feature) {
	return {
		weight: 1.5,
		opacity: (feature.properties.active ? (feature.properties.status == 'available' ? 1 : 0.5) : 0.0),
		color: (feature.properties.status == 'available' ? '#4dff4d' : '#808080'),
		dashArray: '2',
		fillOpacity: (feature.properties.active ? (feature.properties.status == 'available' ? 1 : 0.2) : 0.0),
		fillColor: (feature.properties.status == 'available' ? "#fafafa" : '#fafafa')
	};
}

$.ajax(
{
	type: "GET",
	dataType: 'json',
	url: "/lots.json",
	async: true,
	contentType: "application/json; charset=utf-8",
	success: function (msg)
	{
		for (index = 0; index < msg.length; ++index)
		{
			terrainsData.features[parseInt(msg[index].id) - 1].properties = msg[index];
		}
		geojson = L.geoJson(terrainsData, { style: style, onEachFeature: onEachFeature}).addTo(map);
	}
});

			// -------------------- Shapes Intraction ---------------------------- //

var currentIndex;

function highlightFeature(e)
{
	var layer = e.target;

	layer.setStyle({
		weight: 4,
		color: (layer.feature.properties.status == 'available' ? '#4dff4d' : '#808080'),
		dashArray: '',
		fillColor: (layer.feature.properties.status == 'available' ? '#4dff4d' : '#fafafa')
	});

	if (!L.Browser.ie && !L.Browser.opera)
		layer.bringToFront();
}

function resetHighlight(e)
{
	geojson.resetStyle(e.target);
}

function zoomToFeature(e)
{
	if(!e.target.feature.properties.active) return;
	$('#mymodal').modal('show');
	currentIndex = terrainsData.features.indexOf(e.target.feature);
	setTimeout(function() {onClickLot(currentIndex)}, 150);
	$( "#block" ).text(e.target.feature.properties.block);
	$( "#number" ).text(e.target.feature.properties.number);
	$( "#area" ).text(e.target.feature.properties.square_meters + "m" + String.fromCharCode(178));
	$( "#avi" ).text(e.target.feature.properties.status == 'available' ? 'Disponible' : 'No Disponible');
}


function onClickLot(number)
{
	var lot = lots[number];
	var side = sides[number];
	var numbers = sidesNumbers[number];

	var maxX = 0, maxY = 0;

	lot.forEach(function(entry)
	{
		if(Math.abs(entry[0]) > maxX) maxX = Math.abs(entry[0]);
		if(Math.abs(entry[1]) > maxY) maxY = Math.abs(entry[1]);
	});

	var canvas = document.getElementById("view");
	var div = document.getElementById("modal-div");
	var ctx = canvas.getContext("2d");

	div.style.height = div.offsetWidth * 0.75 + "px";

	var width = div.clientWidth;
	var height = div.clientHeight - 5;

	var fixed;

	if(width > height)
	{
		if(maxX > maxY)
		{
			if(maxY * width > height)
				fixed = height / maxY * 0.4;
			else
				fixed = width * 0.4;
		}
		else
		{
			if(maxX * height > width)
				fixed = width / maxX * 0.4;
			else
				fixed = height * 0.4;
		}
	}
	else
	{
		if(maxY > maxX)
		{
			if(maxX * height > width)
				fixed = width / maxX * 0.4;
			else
				fixed = height * 0.4;
		}
		else
		{
			if(maxY * width > height)
				fixed = height / maxY * 0.4;
			else
				fixed = width * 0.4;
		}
	}

	canvas.width = width;
	canvas.height = height;

	ctx.fillStyle = "#ccff66";
	ctx.lineWidth=1;
	ctx.beginPath();
	lot.forEach(function(entry)
	{
		ctx.lineTo(entry[0] * fixed + width / 2, -entry[1] * fixed + height / 2);
	});
	ctx.closePath();
	ctx.fill();

	ctx.fillStyle = "#303030";
	ctx.font = "bold 16px Courier";
	ctx.textAlign = "center";
	for (i = 0; i < numbers.length; i++)
	{
		ctx.fillText(numbers[i] + "m", side[i][0] * fixed + width / 2, -side[i][1] * fixed + height / 2);
	}
	//ctx.fillText(terrainsData.features[number].properties.square_meters + "m" + String.fromCharCode(178), width / 2, height / 2);


}


function onEachFeature(feature, layer)
{
	layer.on({
		mouseover: highlightFeature,
		mouseout: resetHighlight,
		click: zoomToFeature
	});
}

// -------------------- Initial stuff ------------------------------- //

var logoCoordX = -102.3297, logoCoordY = 21.90705;
var offset = 0.00037;

L.imageOverlay( "http://www.loretta.mx/images/logo-l.png", [[logoCoordY + offset, logoCoordX - offset], [logoCoordY - offset, logoCoordX + offset]]).addTo(map);
L.multiPolygon(baseStreet, {weight: 1, color: '#333333', dashArray: '1', fillColor: '#333333', fillOpacity: 0.1}).addTo(map);

map.fitBounds([[logoCoordY, logoCoordX - offset], [logoCoordY - 0.002, logoCoordX + offset]]);