<section class="contactSection">
    <div class="col s12 branchesTabs" style="padding: 0 !important">
        <ul class="tabs">
            <li class="tab col s12 m6"><a href="#" class="cat cairoBranch">[[+cairoBranch]]</a></li>
            <li class="tab col s12 m6"><a href="#" class="cat menofeyaBranch">[[+quesnaBranch]]</a></li>

        </ul>
    </div>
    <div id="map"></div>
    <div class="contactForm">
        <div class="row">
            <div class="col s12 center">

                <h1>[[+contact_us]]</h1>
                <p>[[+contactus_text]]</p>
            </div>
            <form class="col s12" id="contact">
                <input type="hidden" name="operation" value="add">
                <div class="input-field col s6">
                    <input id="first_name" type="text" name="name" class="validate">
                    <label for="first_name">[[+first_name]]</label>
                </div>
                <div class="input-field col s6">
                    <input id="last_name" type="text" class="validate">
                    <label for="last_name">[[+last_name]]</label>
                </div>
                <div class="input-field col s6">
                    <input id="email" type="email" name="email" class="validate">
                    <label for="email">[[+email]]</label>
                </div>
                <div class="input-field col s6">
                    <input id="mobile" type="text" id="phone" name="phone" class="validate">
                    <label for="mobile">[[+mobile]]</label>
                </div>
                <div class="input-field col s12">
                    <textarea id="textarea1" name="message" class="materialize-textarea"></textarea>
                    <label for="textarea1">[[+message]]</label>
                </div>
                <div class="col s12">
                    <a href="#" class="btn blue-btn waves-effect light-waves right" id="btnAdd">[[+submit]]</a>
                </div>
            </form>
        </div>
    </div>
</section>


<script>
    function initMap() {
        var oldMarker;

        //Cairo Branch
        var firstBranch = {
            lat: 30.0205775,
            lng: 31.0030377
        };

        //Menoufia branch
        var secondBranch = {
            lat: 30.544773,
            lng: 31.182365
        };

        var map = new google.maps.Map(document.getElementById('map'), {
            zoom: 16,
            center: firstBranch,
            scrollwheel: false,
            styles: [{
                "featureType": "landscape.man_made",
                "elementType": "geometry",
                "stylers": [{
                    "color": "#f7f1df"
                }]
            }, {
                "featureType": "landscape.natural",
                "elementType": "geometry",
                "stylers": [{
                    "color": "#d0e3b4"
                }]
            }, {
                "featureType": "landscape.natural.terrain",
                "elementType": "geometry",
                "stylers": [{
                    "visibility": "on"
                }]
            }, {
                "featureType": "poi",
                "elementType": "labels",
                "stylers": [{
                    "visibility": "on"
                }]
            }, {
                "featureType": "poi.business",
                "elementType": "all",
                "stylers": [{
                    "visibility": "on"
                }]
            }, {
                "featureType": "poi.medical",
                "elementType": "geometry",
                "stylers": [{
                    "color": "#fbd3da"
                }]
            }, {
                "featureType": "poi.park",
                "elementType": "geometry",
                "stylers": [{
                    "color": "#bde6ab"
                }]
            }, {
                "featureType": "road",
                "elementType": "geometry.stroke",
                "stylers": [{
                    "visibility": "on"
                }]
            }, {
                "featureType": "road",
                "elementType": "labels",
                "stylers": [{
                    "visibility": "on"
                }]
            }, {
                "featureType": "road.highway",
                "elementType": "geometry.fill",
                "stylers": [{
                    "color": "#ffe15f"
                }]
            }, {
                "featureType": "road.highway",
                "elementType": "geometry.stroke",
                "stylers": [{
                    "color": "#efd151"
                }]
            }, {
                "featureType": "road.arterial",
                "elementType": "geometry.fill",
                "stylers": [{
                    "color": "#ffffff"
                }]
            }, {
                "featureType": "road.local",
                "elementType": "geometry.fill",
                "stylers": [{
                    "color": "black"
                }]
            }, {
                "featureType": "transit.station.airport",
                "elementType": "geometry.fill",
                "stylers": [{
                    "color": "#cfb2db"
                }]
            }, {
                "featureType": "water",
                "elementType": "geometry",
                "stylers": [{
                    "color": "#a2daf2"
                }]
            }]
        });

        // google.maps.event.addListener(map, 'click', function(event) {
        //     placeMarker(secondBranch);
        //     console.log(secondBranch);
        // });

        $('.menofeyaBranch').click(function() {
            placeMarker(secondBranch);

        });

        $('.cairoBranch').click(function() {
            placeMarker(firstBranch);

        });

        function placeMarker(location) {

            marker = new google.maps.Marker({
                position: location,
                map: map,
                animation: google.maps.Animation.DROP,

            });

            if (oldMarker != undefined) {
                oldMarker.setMap(null);
            }
            oldMarker = marker;
            map.setCenter(location);

        }

        var marker = new google.maps.Marker({
            position: firstBranch,
            map: map
        });
    }
</script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDKpLC1vaYYZPJj69ZyfZDVFoMo5ogShu4&callback=initMap">
</script>