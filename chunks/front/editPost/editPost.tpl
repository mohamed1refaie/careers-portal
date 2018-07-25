[[+head]] [[+header]]

<section class="contactContent">

    <div class="container">
        <div class="row">

            <div class="card contactContainer z-depth-3 col s12">

                <div class="col s12 contactForm mt30">
                    <form class="col s12" id="contact">
                        <input type="hidden" name="operation" value="editPost">
                        <input type="hidden" name="id" value="[[+id]]">
                        <div class="input-field col s12 m6">
                            <input id="title" name="title" type="text" class="validate" value="[[+title]]">
                            <label for="title">Job Title</label>
                        </div>
                        <div class="input-field col s12 m6">
                            <input id="experience" type="text" name="experience" class="validate" value="[[+experience]]">
                            <label for="experience">Required Experience Level</label>
                        </div>
                        <div class="input-field col s12 m6">
                            <textarea rows="8" cols="100" id="breif" type="text" name="breif" class="validate" >[[+breif]]</textarea>
                            <label for="breif">Job breif/requirements</label>
                        </div>
                        <div class="input-field col s12 m6">
                            <span>Start Date</span>
                            <input id="start_date" type="date" name="start_date" class="validate" value=[[+start_date]]>
                            <label for="start_date"></label>
                        </div>
                        <div class="input-field col s12 m6">
                            <span>End Date</span>
                            <input id="end_date" type="date" name="end_date" class="validate" value=[[+end_date]]>
                            <label for="end_date"></label>
                        </div>
                        <div class="col s12">
                            <a class="btn blue-btn waves-effect light-waves right" id="btnAdd">Edit</a>
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


