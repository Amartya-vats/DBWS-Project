<?php
    include("./header.php");
?>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<script src="http://cdn.leafletjs.com/leaflet/v0.7.7/leaflet.js"></script>
<link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet/v0.7.7/leaflet.css" />
    <div id="map"></div>
    <script>
        // to change the coords to the ip coords using json parse I guess
        $.get("http://ipinfo.io", function(response) {
            var long = response.loc.substring(8,14);
            var lat = response.loc.substring(0,7);
            var coords = {lon: long, lat: lat};
            console.log(coords);
            var map = L.map('map').setView(coords, 5);
            map.options.minZoom = 2;
            map.options.maxZoom = 17;

            L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                maxNativeZoom: 18,
                attribution: '&copy; <a href="https://openstreetmap.org/copyright">OpenStreetMap contributors</a>',
            }).addTo(map);

            function showZoomLevel() {
                document.getElementById('zoom').innerHTML = map.getZoom();
            }
            // we have to the ip insted of the test pin
            L.marker(coords).bindPopup(response.ip).addTo(map);
        }, "jsonp")
    </script>
<?php
    include("footer.php");
?>