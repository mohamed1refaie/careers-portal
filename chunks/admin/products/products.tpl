<input type="hidden" id="currPage" name="currPage" value="1" />
<!-- Fixed Action Button Start -->
<div class="fixed-action-btn" style="bottom: 45px; right: 24px;" id="addAlertBtnCnt">
  <a class="btn-floating btn-large amber darken-4 [[+addFlag]]">
  <i class="large material-icons">add</i>
  </a>
  <ul>
    <li>
      <a class="btn-floating btn-large blue tooltipped modal-trigger popupforms" data-position="left" data-delay="50" data-tooltip="Add New Product"  id="addItem">
      <i class="material-icons">announcement</i>
      </a>
    </li>
  </ul>
</div>
<!-- Fixed Action Button End -->
<div class="row">
  <div class="large-12 columns">
    <h1 class="main-title">
       Products
    </h1>
    <p class="subtitle-text">
      Manage Products on your website.
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
<!-- Add Product Modal Structure -->
<div id="addModal" class="modal bottom-sheet" style="max-height: 80%;">
  <div class="modal-content">
    <h4>
      Add New Product
    </h4>
      <div class="row">
        <form id="addGL" class="col s12">

          <input type="hidden" name="operation" value="add" />
          <div class="col s12 mb30">
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
                   English Name
                </label>
              </div>

              <div class="input-field col s12">
                <input name="description_en" type="text" class="validate">
                <label for="dir-description_en">
                   English Description
                </label>
              </div>
            </div>
          </div>

          <div id="TabAR" class="col s12">
            <div class="row">
              <div class="input-field col s12">
                <input name="name_ar" type="text" class="validate">
                <label for="dir-name_ar">
                   Arabic Name
                </label>
              </div>

              <div class="input-field col s12">
                <input name="description_ar" type="text" class="validate">
                <label for="dir-description_ar">
                   Arabic Description
                </label>
              </div>
            </div>
          </div>

          <div class="input-field col s12" class="validate">
            <input name="sort" type="number">
            <label for="dir-sort">
               Priority Number
            </label>
          </div>

          <div class="file-field input-field col s12">
            <div class="btn blue darken-2">
              <span>
                Main Image
              </span>
              <input name="picture" type="file" class="validate">
            </div>
            <div class="file-path-wrapper">
              <input class="file-path" type="text">
            </div>
          </div>

          <div class="file-field input-field col s12">
            <div class="btn blue darken-2">
              <span>
                Logo Image
              </span>
              <input name="logo_picture" type="file" class="validate">
            </div>
            <div class="file-path-wrapper">
              <input class="file-path" type="text">
            </div>
          </div>

          <div class="input-field col s12">
            <select id="categoryID">
              <option value="0" disabled selected>Choose Category</option>
              [[+categoriesTPL]]
            </select>
            <label>Product Category</label>
          </div>

          <div class="input-field col s12">
            <select id="videoID">
              <option value="" disabled selected>Choose Video</option>
              [[+videosTPL]]
            </select>
            <label>Product Video</label>
          </div>

          <div class="input-field col s12">
            <select id="flavourIDs" multiple>
              <option value="0" disabled selected>Choose Flavour</option>
              [[+flavoursTPL]]
            </select>
            <label>Product Flavour</label>
          </div>

          <div class="file-field input-field col s12">
            <div class="btn blue darken-2">
              <span>
                Product Images
              </span>
              <input name="pictures[]" type="file" class="validate" multiple>
            </div>
            <div class="file-path-wrapper">
              <input class="file-path" type="text" placeholder="Upload one or more files">
            </div>
          </div>

        </form>
      </div>
      </div>

  <div class="modal-footer">
    <a href="#" class="waves-effect waves-light btn blue darken-2" id="btnAdd">Save</a>
  </div>
</div>
<!-- Add Product End -->
<a data-activates="editModal" class="popupforms waves-effect waves-light btn modal-trigger" href="#" id="openEditBtn" style="display:none;">Modal</a>
<!-- Edit Product Modal Structure -->
<div id="editModal" class="modal bottom-sheet" style="max-height: 80%;">
  <div class="modal-content">
    <h4>
      Edit Product
    </h4>
    <div class="row" id="editForm">
      
    </div>
  </div>
  <div class="modal-footer">
    <a class="waves-effect waves-light btn blue darken-2" id="btnEdit">Save</a>
  </div>
</div>
<!-- Edit Product End -->

<div id="viewPhotosModal" class="modal bottom-sheet viewPhotosModal" style="max-height: 80%;">
    <div class="modal-content">
        <h4>
            Pictures
        </h4>
        <div class="row photos lightgallery">

        </div>
    </div>
    <div class="modal-footer">
        <a href="#" class="waves-effect waves-light btn blue darken-2 modal-close" id="btnCloseViewModal">Close</a>
    </div>
</div>