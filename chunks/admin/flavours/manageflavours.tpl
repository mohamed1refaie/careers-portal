<input type="hidden" id="currPage" name="currPage" value="1" />
<!-- Fixed Action Button Start -->
<div class="fixed-action-btn" style="bottom: 45px; right: 24px;" id="addAlertBtnCnt">
  <a class="btn-floating btn-large amber darken-4">
  <i class="large material-icons">add</i>
  </a>
  <ul>
    <li>
      <a class="btn-floating btn-large blue tooltipped modal-trigger popupforms" data-position="left" data-delay="50" data-tooltip="Add Flavour"  id="addFlavour">
      <i class="material-icons">announcement</i>
      </a>
    </li>
  </ul>
</div>
<div class="row">
  <div class="large-12 columns">
    <h1 class="main-title">
       Flavours
    </h1>
    <p class="subtitle-text">
      Manage Flavours Items.
    </p>


    <div id="contentContainer">
      <!-- To be filled out by an AJAX call -->
      <table>
        <thead>
          <tr>
            <td>English Name</td>
            <td>Arabic Name</td>
            <td>Actions</td>
          </tr>

          <tbody id="contentContainerc">
            
          </tbody>
        </thead>
      </table>
    </div>

  </div>
  <div class="row mt20">
      <div class="small-4 small-centered columns center">
        <a href="#" id="loadMore" style="display:none;" class="btn blue-grey darken-2 waves-effect waves-light">load More</a>
      </div>
    </div>
</div>
<!-- Add Flavour Modal Structure -->
<div id="addFlavourModal" class="modal bottom-sheet" style="max-height: 80%;">
  <div class="modal-content">
    <h4>
      Add Flavour
    </h4>
    <div class="row">
      <form id="addGLI" class="col s12">
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
          </div>
        </div>

        <div class="input-field col s12">
          <input name="sort" type="number" class="validate">
          <label for="dir-sort">
             Priority Number
          </label>
        </div>
      </form>
    </div>
  </div>
  <div class="modal-footer">
    <a href="#" class="waves-effect waves-light btn blue darken-2" id="btnFlavourAdd">Save</a>
  </div>
</div>
<!-- Add Flavour End -->


<a data-activates="editFlavourModal" class="popupforms waves-effect waves-light btn modal-trigger" href="#" id="openEditBtn" style="display:none;">Modal</a>
<!-- Edit Flavour Modal Structure -->
<div id="editFlavourModal" class="modal bottom-sheet" style="max-height: 80%;">
  <div class="modal-content">
    <h4>
      Edit Flavour
    </h4>
    <div class="row">
      <form id="editGLI" class="col s12">
        <input type="hidden" name="operation" value="edit" />
        <input type="hidden" id="itemID" name="itemID" value="" />
        <div class="col s12 mb30">
            <ul class="tabs">
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
        </div>
        <div class="input-field col s12" class="validate">
          <input name="edit_sort" type="number" value="" id="edit_sort">
          <label for="dir-edit_sort">
             Priority Number
          </label>
        </div>
      </form>
    </div>
  </div>
  <div class="modal-footer">
    <a href="#" class="waves-effect waves-light btn blue darken-2" id="btnFlavourEdit">Save</a>
  </div>
</div>
<!-- Edit Flavour End -->

