<input type="hidden" id="currPage" name="currPage" value="1" />
<!-- Fixed Action Button Start -->

<div class="row">
    <div class="large-12 columns">
        <h1 class="main-title">
            About
        </h1>
        <p class="subtitle-text">
            Manage About Page.
        </p>


        <div id="contentContainer">
            <!-- To be filled out by an AJAX call -->
            <!-- Add Modal Structure -->
            <div id="addModal" class="modal bottom-sheet" style="max-height: 80%;">
                <div class="modal-content">
                    <h4>
                        About
                    </h4>
                    <div class="row">
                        <form id="addGLI" class="col s12">
                            <input type="hidden" name="operation" value="add" />
                            <div class="col s12 mb30">
                                <ul class="tabs">
                                    <li class="tab col s3"><a href="#TabEN">English Data</a></li>
                                    <li class="tab col s3"><a class="active" href="#TabAR">Arabic Data</a></li>
                                </ul>
                            </div>
                            <div id="TabEN" class="col s12">

                                <div class="row">
                                    <div class="input-field col s12">
                                        <textarea name="history_content_en" class="materialize-textarea"></textarea>
                                        <label for="dir-history_content_en">English History Content</label>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="input-field col s12">
                                        <textarea name="mission_content_en" class="materialize-textarea"></textarea>
                                        <label for="dir-mission_content_en">English Mission Content</label>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="input-field col s12">
                                        <textarea name="quality_content_en" class="materialize-textarea"></textarea>
                                        <label for="dir-quality_content_en">English Quality Content</label>
                                    </div>
                                </div>

                            </div>

                            <div id="TabAR" class="col s12">

                                <div class="row">
                                    <div class="input-field col s12">
                                        <textarea name="history_content_ar" class="materialize-textarea"></textarea>
                                        <label for="dir-history_content_ar">Arabic History Content</label>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="input-field col s12">
                                        <textarea name="mission_content_ar" class="materialize-textarea"></textarea>
                                        <label for="dir-mission_content_ar">Arabic Mission Content</label>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="input-field col s12">
                                        <textarea name="quality_content_ar" class="materialize-textarea"></textarea>
                                        <label for="dir-quality_content_ar">Arabic Quality Content</label>
                                    </div>
                                </div>

                            </div>

                            <div class="file-field input-field col s12">
                                <div class="btn blue darken-2">
                                    <span>
                    History Image
                  </span>
                                    <input name="history_picture" type="file">
                                </div>
                                <div class="file-path-wrapper">
                                    <input class="file-path" type="text">
                                </div>
                            </div>

                            <div class="file-field input-field col s12">
                                <div class="btn blue darken-2">
                                    <span>
                    Mission Image
                  </span>
                                    <input name="mission_picture" type="file">
                                </div>
                                <div class="file-path-wrapper">
                                    <input class="file-path" type="text">
                                </div>
                            </div>

                            <div class="file-field input-field col s12">
                                <div class="btn blue darken-2">
                                    <span>
                    Quality Image
                  </span>
                                    <input name="quality_picture" type="file">
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