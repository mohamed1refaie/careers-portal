<input type="hidden" id="currPage" name="currPage" value="1" />
<!-- Fixed Action Button Start -->

<div class="row">
    <div class="large-12 columns">
        <h1 class="main-title">
            Exports
        </h1>
        <p class="subtitle-text">
            Manage Exports Page.
        </p>


        <div id="contentContainer">
            <!-- To be filled out by an AJAX call -->
            <!-- Add Modal Structure -->
            <div id="addModal" class="modal bottom-sheet" style="max-height: 80%;">
                <div class="modal-content">
                    <h4>
                        Exports
                    </h4>
                    <div class="row">
                        <form id="addGLI" class="col s12">
                            <input type="hidden" name="operation" value="addExport" />
                            <div class="col s12 mb30">
                                <ul class="tabs">
                                    <li class="tab col s3"><a href="#TabEN">English Data</a></li>
                                    <li class="tab col s3"><a class="active" href="#TabAR">Arabic Data</a></li>
                                </ul>
                            </div>
                            <div id="TabEN" class="col s12">

                                <div class="row">
                                  <div class="input-field col s12">
                                    <input name="title_en" id="title_en" type="text" class="validate">
                                    <label for="dir-title_en">
                                       English Title
                                    </label>
                                  </div>
                                </div>

                                <div class="row">
                                    <div class="input-field col s12">
                                        <textarea name="description_en" id="description_en" class="materialize-textarea"></textarea>
                                        <label for="dir-description_en">English Description</label>
                                    </div>
                                </div>

                            </div>

                            <div id="TabAR" class="col s12">

                                <div class="row">
                                  <div class="input-field col s12">
                                    <input name="title_ar" id="title_ar" type="text" class="validate">
                                    <label for="dir-title_ar">
                                       Arabic Title
                                    </label>
                                  </div>
                                </div>

                                <div class="row">
                                    <div class="input-field col s12">
                                        <textarea name="description_ar" id="description_ar" class="materialize-textarea"></textarea>
                                        <label for="dir-description_ar">Arabic Description</label>
                                    </div>
                                </div>

                            </div>

                            <div class="file-field input-field col s12">
                                <div class="btn blue darken-2">
                                    <span>
                                      Main Image
                                    </span>
                                    <input name="main_picture" type="file">
                                </div>
                                <div class="file-path-wrapper">
                                    <input class="file-path" type="text">
                                </div>
                            </div>

                            <div class="file-field input-field col s12">
                                <div class="btn blue darken-2">
                                    <span>
                                      first Image
                                    </span>
                                    <input name="first_picture" type="file">
                                </div>
                                <div class="file-path-wrapper">
                                    <input class="file-path" type="text">
                                </div>
                            </div>

                            <div class="file-field input-field col s12">
                                <div class="btn blue darken-2">
                                    <span>
                                      Second Image
                                    </span>
                                    <input name="second_picture" type="file">
                                </div>
                                <div class="file-path-wrapper">
                                    <input class="file-path" type="text">
                                </div>
                            </div>

                            <div class="file-field input-field col s12">
                                <div class="btn blue darken-2">
                                    <span>
                                      Upload Exports PDF 
                                    </span>
                                    <input name="third_picture" type="file">
                                </div>
                                <div class="file-path-wrapper">
                                    <input class="file-path" type="text">
                                </div>
                            </div>

                        </form>
                    </div>
                </div>
                <div class="modal-footer">
                    <a href="#" class="waves-effect waves-light btn blue darken-2" id="btnAdd">Save</a>
                    <a href="index.php" class="waves-effect waves-light btn blue darken-2 mr20">Back to Dashboard</a>

                </div>
            </div>
            <!-- Add End -->

        </div>

    </div>

</div>