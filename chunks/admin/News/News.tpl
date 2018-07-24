<input type="hidden" id="currPage" name="currPage" value="1" />
<input type="hidden" id="status" name="status" value="[[+status]]" />
<!-- Fixed Action Button Start -->
<div class="fixed-action-btn" style="bottom: 45px; right: 24px;" id="addAlertBtnCnt">
  <a class="btn-floating btn-large amber darken-4">
  <i class="large material-icons">add</i>
  </a>
  <ul>
    <li>
      <a class="btn-floating btn-large blue tooltipped modal-trigger popupforms" data-position="left" data-delay="50" data-tooltip="Add News"  id="addNews">
      <i class="material-icons">announcement</i>
      </a>
    </li>
  </ul>
</div>
<div class="row">
  <div class="large-12 columns">
    <h1 class="main-title">
       News
    </h1>
    <p class="subtitle-text">
      Manage News Items.
    </p>

    <p id="status">
      <input type="checkbox" class="filled-in" id="page_status"/>
      <label for="page_status">Show News</label>
    </p>

    <div id="contentContainer">
      <!-- To be filled out by an AJAX call -->
    </div>

  </div>
  <div class="row mt20">
      <div class="small-4 small-centered columns center">
        <a href="#" id="loadMore" style="display:none;" class="btn blue-grey darken-2 waves-effect waves-light">load More</a>
      </div>
    </div>
</div>
<!-- Add News Modal Structure -->
<div id="addNewsModal" class="modal bottom-sheet" style="max-height: 80%;">
  <div class="modal-content">
    <h4>
      Add News
    </h4>
    <div class="row">
      <form id="addGLI" class="col s12">
        <input type="hidden" name="operation" value="add" />
        <div id="addTabs" class="col s12 mb30">
            <ul class="tabs">
                <li class="tab col s3"><a  href="#TabEN">English Data</a></li>
                <li class="tab col s3"><a class="active" href="#TabAR">Arabic Data</a></li>
            </ul>
        </div>
        <div id="TabEN" class="col s12">
          <div class="row">
            <div class="input-field col s12">
              <input name="name_en" type="text" class="validate">
              <label for="dir-name_en">
                 English Title
              </label>
            </div>
          </div>

          <div class="row">
            <div class="input-field col s12">
              <input name="intro_en" type="text" class="validate">
              <label for="dir-intro_en">
                 English Intro
              </label>
            </div>
          </div>

          <div class="row">
            <div class="input-field col s12">
              <textarea name="description_en" class="materialize-textarea"></textarea>
              <label for="dir-description_en">English Description</label>
            </div>
          </div>
        </div>

        <div id="TabAR" class="col s12">
          <div class="row">
            <div class="input-field col s12">
              <input name="name_ar" type="text" class="validate initeditor">
              <label for="dir-name_ar">
                 Arabic Title
              </label>
            </div>
          </div>

          <div class="row">
            <div class="input-field col s12">
              <input name="intro_ar" type="text" class="validate">
              <label for="dir-intro_ar">
                 Arabic Intro
              </label>
            </div>
          </div>

          <div class="row">
            <div class="input-field col s12">
              <textarea name="description_ar" class="materialize-textarea"></textarea>
              <label for="dir-description_ar">Arabic Description</label>
            </div>
          </div>
        </div>
        
        <p>
          <input type="checkbox" class="filled-in" id="isFeatured" />
          <label for="isFeatured">is Featured</label>
        </p> 

        <div class="row">
          <div class="input-field col s12">
            <input type="date" class="datepicker" name="publish_date">
            <label for="dir-publish_date">
               Publish Date
            </label>
          </div>
        </div>
        <div class="file-field input-field col s12">
          <div class="btn blue darken-2">
            <span>
              Image
            </span>
            <input name="picture" type="file" class="validate">
          </div>
          <div class="file-path-wrapper">
            <input class="file-path" type="text">
          </div>
        </div>

      </form>
    </div>
  </div>
  <div class="modal-footer">
    <a href="#" class="waves-effect waves-light btn blue darken-2" id="btnNewsAdd">Save</a>
  </div>
</div>
<!-- Add News End -->


<a data-activates="editNewsModal" class="popupforms waves-effect waves-light btn modal-trigger" href="#" id="openEditBtn" style="display:none;">Modal</a>
<!-- Edit News Modal Structure -->
<div id="editNewsModal" class="modal bottom-sheet" style="max-height: 80%;">
  <div class="modal-content">
    <h4>
      Edit News
    </h4>
    <div class="row">
      <form id="editGLI" class="col s12">
        <input type="hidden" name="operation" value="edit" />
        <input type="hidden" id="itemID" name="itemID" value="" />
        <div class="col s12 mb30">
            <ul id="editTabs" class="tabs">
                <li class="tab col s3"><a  href="#EditTabEN">English Data</a></li>
                <li class="tab col s3"><a class="active" href="#EditTabAr">Arabic Data</a></li>
            </ul>
        </div>
        <div id="EditTabEN" class="col s12">
          <div class="row">
            <div class="input-field col s12">
              <input id="edit_name_en" name="edit_name_en" type="text" class="validate">
              <label for="dir-edit_name_en">
                 English Name
              </label>
            </div>
          </div>

          <div class="row">
            <div class="input-field col s12">
              <input id="edit_intro_en" name="edit_intro_en" type="text" class="validate">
              <label for="dir-edit_intro_en">
                 English Intro
              </label>
            </div>
          </div>

          <div class="row">
          <div class="input-field col s12">
            <textarea name="edit_description_en" class="materialize-textarea" id="edit_description_en"></textarea>
            <label for="dir-edit_description_en">English Description</label>
          </div>
        </div>
        
        </div>


        

        <div id="EditTabAr" class="col s12">
          <div class="row">
            <div class="input-field col s12">
              <input id="edit_name_ar" name="edit_name_ar" type="text" class="validate">
              <label for="dir-edit_name_ar">
                 Arabic Name
              </label>
            </div>
          </div>

          <div class="row">
            <div class="input-field col s12">
              <input id="edit_intro_ar" name="edit_intro_ar" type="text" class="validate">
              <label for="dir-edit_intro_ar">
                 Arabic Intro
              </label>
            </div>
          </div>

          <div class="row">
            <div class="input-field col s12">
              <textarea name="edit_description_ar" class="materialize-textarea" id="edit_description_ar"></textarea>
              <label for="dir-edit_description_ar">Arabic Description</label>
            </div>
          </div>

        </div>

        <p>
          <input type="checkbox" class="filled-in" id="editIsFeatured" />
          <label for="editIsFeatured">is Featured</label>
        </p> 

        <div class="row">
          <div class="input-field col s12">
            <input type="date" class="datepicker" name="edit_publish_date" id="edit_publish_date">
            <label for="dir-edit_publish_date">
               Publish Date
            </label>
          </div>
        </div>
        <div class="file-field input-field col s12">
          <div class="btn blue darken-2">
            <span>
              Image
            </span>
            <input name="picture" type="file">
          </div>
          <div class="file-path-wrapper">
            <input class="file-path" type="text">
          </div>
        </div>
      </form>
    </div>
  </div>
  <div class="modal-footer">
    <a href="#" class="waves-effect waves-light btn blue darken-2" id="btnNewsEdit">Save</a>
  </div>
</div>
<!-- Edit News End -->

