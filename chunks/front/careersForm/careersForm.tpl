[[+head]] [[+header]]

<section class="newsDetails">
    <div class="container">
        <div class="row">
            <div class="col s12">
                <div class="card careersFormDetails col s12 z-depth-3">

                    <h4 class="center">[[+apply]]</h4>
                    <p class="center subtitle">[[+fill_form]]</p>

                    <div class="col s12 careersForm">
                        <form id="careersForm">
                            <input type="hidden" name="operation" value="apply">
                            <div class="input-field col s6">
                                <i class="material-icons prefix">account_circle</i>
                                <input id="firstName" name="first_name" type="text" class="validate">
                                <label for="firstName">[[+first_name]]</label>
                            </div>

                            <div class="input-field col s6">
                                <i class="material-icons prefix">account_circle</i>
                                <input id="lastName" name="last_name" type="text" class="validate">
                                <label for="lastName">[[+last_name]]</label>
                            </div>

                            <div class="input-field col s6">
                                <i class="material-icons prefix">account_circle</i>
                                <input id="email" name="email" type="email" class="validate">
                                <label for="email">[[+email]]</label>
                            </div>

                            <div class="input-field col s6">
                                <i class="material-icons prefix">account_circle</i>
                                <input id="phoneNumber" name="phoneNumber" type="tel" class="validate">
                                <label for="phoneNumber">[[+phone]]</label>
                            </div>

                            <div class="input-field col s6">
                                <i class="material-icons prefix">account_circle</i>
                                <input id="department" name="department" type="text" class="validate">
                                <label for="department">[[+department]]</label>
                            </div>

                            <div class="file-field input-field col s6">
                                <div class="btn blue-btn">
                                    <span>[[+upload_cv]]</span>
                                    <input type="file" name="cv">
                                </div>
                                <div class="file-path-wrapper">
                                    <input class="file-path validate" type="text">
                                </div>
                            </div>

                            <div class="input-field col s12">
                                <textarea id="textarea1" name="message" class="materialize-textarea" data-length="120"></textarea>
                                <label for="textarea1">[[+message]]</label>
                            </div>

                            <div class="col s12 mt20">
                                <a href="#" class="btn blue-btn right" id="btnAdd">[[+submit]]</a>
                            </div>
                        </form>

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