[[+head]] [[+header]]

<section class="newsDetails">
    <div class="container">
        <div class="row">
            <div class="col s12">
                <div class="card careerDetails col s12 z-depth-3">

                    <div class="careerTitle col s12 nopadding">
                        <h4>[[+title]]</h4>
                        <span><i class="material-icons">place</i>Egypt</span>
                        <span><i class="material-icons">access_time</i>Full Time</span>
                    </div>

                    <div class="careerBody col s12 nopadding">
                        <h5>Required Experience</h5>
                        <p>[[+experience]]</p>

                        <h5>Job Requirments</h5>

                        <!-- <ul class="requiredSkills">
                                <li>Donec rutrum congue leo eget malesuada.</li>
                                <li>Cras ultricies ligula sed magna dictum porta.</li>
                                <li>Donec rutrum congue leo eget malesuada.</li>
                                <li>Vivamus suscipit tortor eget felis porttitor volutpat.</li>
                            </ul> -->
                        [[+breif]]
                        
                    <div class="col s12 contactForm mt30">
                        <form class="col s12" id="contact">
                            <input type="hidden" name="operation" value="addApplication">
                            <input type="hidden" name="id" value="[[+id]]">
                            <div class="input-field col s12 m6">
                                <input id="name" name="name" type="text" class="validate">
                                <label for="name">Your Full Name</label>
                            </div>
                            <div class="input-field col s12 m6">
                                <input id="university" type="text" name="university" class="validate">
                                <label for="university">University</label>
                            </div>
                            <div class="input-field col s12 m6">
                                <span>Date Of Birth</span>
                                <input id="birthdate" type="date" name="birthdate" class="validate">
                            </div>
                            <div class="input-field col s12 m6">
                                <input id="email" type="text" name="email" class="validate">
                                <label for="email">Email</label>
                            </div>
                            <div class="input-field col s12 m6">
                                <input id="cv" type="text" name="cv" class="validate">
                                <label for="cv">Cv/resume Link</label>
                            </div>
                            <div class="input-field col s12 m6">
                                <span>Notes/Why should we hire you?</span>
                                <textarea rows="8" cols="100" id="notes" type="text" name="notes"></textarea>
                            </div>
                            
                            <div class="col s12">
                                <a class="btn blue-btn waves-effect light-waves right" id="btnAdd">Submit Application</a>
                            </div>
                        </form>
                </div>

                        <h5></h5>
                    </div>

                    <div class="col s12">
                        <!--<a href="mailto:someone@yoursite.com" class="btn blue-btn mt10">[[+submit_form]]</a>-->

                    </div>
                </div>
            </div>

        </div>
    </div>

</section>

<script type="text/javascript">
    $(document).ready(function() {

        $("#loadingCont").hide();

    });
</script>

[[+extraScript]] [[+footer]]