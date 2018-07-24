[[+head]] [[+header]]

<section class="newsDetails">
    <div class="container">
        <div class="row">
            <div class="col s12">
                <div class="card careerDetails col s12 z-depth-3">

                    <div class="careerTitle col s12 nopadding">
                        <h4>[[+career_name]]</h4>
                        <p>[[+department_name]]</p>
                        <span><i class="material-icons">place</i> [[+government_name]], [[+egypt]]</span>
                        <span><i class="material-icons">access_time</i> [[+career_type]]</span>
                    </div>

                    <div class="careerBody col s12 nopadding">
                        <h5>[[+job_description]]</h5>
                        <p>[[+description]]</p>

                        <h5>[[+required_skills]]</h5>

                        <!-- <ul class="requiredSkills">
                                <li>Donec rutrum congue leo eget malesuada.</li>
                                <li>Cras ultricies ligula sed magna dictum porta.</li>
                                <li>Donec rutrum congue leo eget malesuada.</li>
                                <li>Vivamus suscipit tortor eget felis porttitor volutpat.</li>
                            </ul> -->
                        [[+skills]]

                        <h5></h5>
                        <a href="mailto:info@egyptfoodsgroup.com" class="btn blue-btn mt10">[[+submit_form]]</a>
                    </div>

                    <div class="col s12">
                        <!--<a href="mailto:someone@yoursite.com" class="btn blue-btn mt10">[[+submit_form]]</a>-->

                    </div>
                </div>
            </div>

        </div>
    </div>

</section>

<script>
    $(window).load(function() {

        var loaderFull = $('#loadingCont');
        loaderFull.addClass('animated fadeOut').one(animationEnd, function() {
            loaderFull.removeClass('animated fadeOut');

            loaderFull.addClass('hide');

        });

    });
</script>


[[+extraScript]] [[+footer]]