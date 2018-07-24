[[+head]] [[+header]]

<section class="contactContent">

    <div class="container">
        <div class="row">

            <div class="card contactContainer z-depth-3 col s12">

                <div class="col s12 contactForm mt30">
                    <form class="col s12" id="contact">
                        <input type="hidden" name="operation" value="add">
                        <div class="input-field col s12 m6">
                            <input id="user_name" name="user_name" type="text" class="validate">
                            <label for="user_name">User Name</label>
                        </div>
                        <div class="input-field col s12 m6">
                            <input id="password" type="password" name="password" class="validate">
                            <label for="password">Password</label>
                        </div>
                        <div class="col s12">
                            <a class="btn blue-btn waves-effect light-waves right" id="btnAdd">Login</a>
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


