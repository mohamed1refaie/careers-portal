<!-- Fixed Action Button Start -->
<div class="fixed-action-btn" style="bottom: 45px; right: 24px;" id="addAlertBtnCnt">
  <a class="btn-floating btn-large amber darken-4 [[+addFlag]]">
  <i class="large material-icons">add</i>
  </a>
  <ul>
    <li>
      <a class="btn-floating btn-large blue tooltipped modal-trigger popupforms" data-position="left" data-delay="50" data-tooltip="Add Images"  id="addItem">
      <i class="material-icons">announcement</i>
      </a>
    </li>
  </ul>
</div>
<input type="hidden" id="storyID" value="[[+storyID]]">
<div class="row">
  <div class="large-12 columns">
    <h1 class="main-title">
       [[+storyName]] Images
    </h1>
    <p class="subtitle-text">
      Manage [[+storyName]] Images.
    </p>


    <div id="contentContainer">
      <!-- To be filled out by an AJAX call -->
    </div>
 <!--    <div class="row mt20">
      <div class="small-4 small-centered columns center">
        <a href="#" id="loadMore" style="display:none;" class="btn blue-grey darken-2 waves-effect waves-light">load More</a>
      </div>
    </div> -->
  </div>
</div>
<!-- Add Image Modal Structure -->
<div id="addImageModal" class="modal bottom-sheet" style="max-height: 80%;">
  <div class="modal-content">
    <h4>
      Add Images
    </h4>
    <div class="row">
      <form id="addGL" class="col s12">
        <input type="hidden" name="operation" value="addImages" />
        <div class="row">
          
          <div class="file-field input-field col s12">
            <div class="btn blue darken-2">
              <span>
                Images
              </span>
              <input name="pictures[]" type="file" class="validate" multiple>
            </div>
            <div class="file-path-wrapper">
              <input class="file-path" type="text" placeholder="Upload one or more files">
            </div>
          </div>
        </div>
      </form>
    </div>
  </div>
  <div class="modal-footer">
    <a href="#" class="waves-effect waves-light btn blue darken-2" id="btnAdd">Save</a>
  </div>
</div>
<!-- Add Image End -->

<a data-activates="editImageModal" class="popupforms waves-effect waves-light btn modal-trigger" href="#" id="openEditBtn" style="display:none;">Modal</a>
<!-- Edit ItemModal Structure -->
<div id="editImageModal" class="modal bottom-sheet" style="max-height: 80%;">
  <div class="modal-content">
    <h4>
      Edit Story Image
    </h4>
    <div class="row">
      <form id="editGL" class="col s12">
        <input type="hidden" name="operation" value="editStoryImage" />
        <input type="hidden" id="itemID" name="currImageID" value="" />
        <div class="row">
          <div class="input-field col s12">
            <input id="editNumber" name="number" type="text" class="validate">
            <label for="editNumber">
               Number
            </label>
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
        </div>
      </form>
    </div>
  </div>
  <div class="modal-footer">
    <a href="#" class="waves-effect waves-light btn blue darken-2" id="btnEditImage">Save</a>
  </div>
</div>
<!-- Edit Item End -->