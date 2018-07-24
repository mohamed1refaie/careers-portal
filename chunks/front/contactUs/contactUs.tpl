[[+head]] [[+header]]

<section class="contactContent">

    <div class="container">
        <div class="row">
            <input type="hidden" id="firstAddress" value="[[+firstAddress]]">
            <input type="hidden" id="firstMail" value="[[+firstMail]]">
            <input type="hidden" id="firstPhone" value="[[+firstPhone]]">
            <input type="hidden" id="secondAddress" value="[[+secondAddress]]">
            <input type="hidden" id="secondMail" value="[[+secondMail]]">
            <input type="hidden" id="secondPhone" value="[[+secondPhone]]">
            <div class="card contactContainer z-depth-3 col s12">
                <div class="col s12">
                    <ul class="tabs">
                        <li class="tab col s12 m6"><a href="" id="cairoBranch" class="cat cairoBranch">[[+cairoBranch]]</a></li>
                        <li class="tab col s12 m6"><a href="#" id="secondBranch" class="cat menofeyaBranch">[[+quesnaBranch]]</a></li>

                    </ul>
                </div>
                <div class="col s12 m6 mt30">
                    <div class="z-depth-2" id="contactMap">

                    </div>
                </div>
                <div class="col s12 m6 mt30 contactInfo">
                    <h2>[[+contact]]</h2>
                    <p><span><i class="material-icons">mail</i></span>
                        <div class="contactBranchesText" id="branch_mail"> info@egyptfoodsgroup.com </div>
                    </p>
                    <p><span><i class="material-icons">phone</i></span>
                        <div class="contactBranchesText" id="branch_phone"> 01234567890</div>
                    </p>
                    <p><span><i class="material-icons">place</i></span>
                        <div class="contactBranchesText" id="branch_address">
                            Arkan Business Park, Building 6, 2nd Floor, Sheikh Zayed City - Giza, Egypt</div>
                    </p>
                </div>

                <div class="col s12 contactForm mt30">
                    <div class="col s12 center nopadding">

                        <h1>[[+contact_us]]</h1>
                        <p>[[+contactus_text]]</p>
                    </div>
                    <form class="col s12" id="contact">
                        <input type="hidden" name="operation" value="add">
                        <div class="input-field col s12 m6">
                            <input id="first_name" type="text" name="name" class="validate">
                            <label for="first_name">[[+first_name]]</label>
                        </div>
                        <div class="input-field col s12 m6">
                            <input id="last_name" type="text" class="validate">
                            <label for="last_name">[[+last_name]]</label>
                        </div>
                        <div class="input-field col s12 m6">
                            <input id="email" type="email" name="email" class="validate">
                            <label for="email">[[+email]]</label>
                        </div>
                        <div class="input-field col s12 m6">
                            <input id="mobile" type="text" id="phone" name="phone" class="validate">
                            <label for="mobile">[[+mobile]]</label>
                        </div>
                        <div class="input-field col s12">
                            <textarea id="textarea1" name="message" class="materialize-textarea"></textarea>
                            <label for="textarea1">[[+message]]</label>
                        </div>
                        <div class="col s12">
                            <a class="btn blue-btn waves-effect light-waves right" id="btnAdd">[[+submit]]</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>


[[+extraScript]] [[+footer]]

<script type="text/javascript">
    $(document).ready(function() {

        $("#loadingCont").hide();

    });
</script>


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

        var map = new google.maps.Map(document.getElementById('contactMap'), {
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