[[+head]] [[+header]]

<section class="contactContent">

    <div class="container">
        <div class="row">

            <div class="card contactContainer z-depth-3 col s12">

                <div class="col s12 contactForm mt30">
                    <form class="col s12" id="contact">
                        <input type="hidden" name="operation" value="add">
                        <div class="input-field col s12 m6">
                            <input id="name" type="text" name="name" class="validate">
                            <label for="name">Name</label>
                        </div>
                        <div class="input-field col s12 m6">
                            <input id="user_name" name="user_name" type="text" class="validate">
                            <label for="user_name">User Name</label>
                        </div>
                        <div class="input-field col s12 m6">
                            <input id="email" type="email" name="email" class="validate">
                            <label for="email">Email</label>
                        </div>
                        <div class="input-field col s12 m6">
                            <input id="password" type="password" name="password" class="validate">
                            <label for="password">Password</label>
                        </div>
                        <div class="input-field col s12">
                            <input id="password2" name="password2" type="password" class="validate"></input>
                            <label for="password2">Password again</label>
                        </div>
                        <input id="role" name="role" type="hidden" value="user">
                        <div class="col s12">
                            <a class="btn blue-btn waves-effect light-waves right" id="btnAdd">Submit</a>
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


