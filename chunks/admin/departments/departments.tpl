<input type="hidden" id="currPage" name="currPage" value="1" />
<!-- Fixed Action Button Start -->
<div class="fixed-action-btn" style="bottom: 45px; right: 24px;" id="addAlertBtnCnt">
  <a class="btn-floating btn-large amber darken-4 [[+addFlag]]">
  <i class="large material-icons">add</i>
  </a>
  <ul>
    <li>
      <a class="btn-floating btn-large blue tooltipped modal-trigger popupforms" data-position="left" data-delay="50" data-tooltip="Add New Department"  id="addItem">
      <i class="material-icons">announcement</i>
      </a>
    </li>
  </ul>
</div>
<!-- Fixed Action Button End -->
<div class="row">
  <div class="large-12 columns">
    <h1 class="main-title">
        Departments
    </h1>
    <p class="subtitle-text">
      Manage Departments on your website.
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
<!-- Add Item Modal Structure -->
<div id="addModal" class="modal bottom-sheet" style="max-height: 80%;">
  <div class="modal-content">
      <h4>
        Add New Department
      </h4>
    <div class="row">
      <form id="addGL" class="col s12">
        <div class="col s12 mb30">
            <ul class="tabs">
                <li class="tab col s3"><a  href="#TabEN">English Data</a></li>
                <li class="tab col s3"><a class="active" href="#TabAR">Arabic Data</a></li>
            </ul>
        </div>

        <div id="TabEN" class="col s12">
          <!-- English Fields -->
            <input type="hidden" name="operation" value="add" />
            <div class="row">

              <div class="input-field col s12">
                <input name="name_en" type="text" class="validate">
                <label for="dir-name_en">
                   English Name
                </label>
              </div>
            </div>
          <!-- End English Fields -->
        </div>
        <div id="TabAR" class="col s12">
          <!-- Arabic Fields -->
                <input type="hidden" name="operation" value="add" />
                <div class="row">
                  <div class="input-field col s12">
                    <input name="name_ar" type="text" class="validate">
                    <label for="dir-name_ar">
                       Arabic Name
                    </label>
                  </div>
                </div>
        </div>

      </form>
    </div>
  </div>
  <!-- End Arabic Fields -->
  
  <div class="modal-footer">
    <a href="#" class="waves-effect waves-light btn blue darken-2" id="btnAdd">Save</a>
  </div>
</div>

<!-- Add Item End -->
<a data-activates="editModal" class="popupforms waves-effect waves-light btn modal-trigger" href="#" id="openEditBtn" style="display:none;">Modal</a>
<!-- Edit ItemModal Structure -->
<div id="editModal" class="modal bottom-sheet" style="max-height: 80%;">
  <div class="modal-content">
    <h4>
      Edit Department
    </h4>
    <div class="row">
      <form id="editGL" class="col s12">
        <input type="hidden" name="operation" value="edit" />
        <input type="hidden" id="itemID" name="itemID" value="" />
        <div class="col s12 mb30">
            <ul class="tabs">
                <li class="tab col s3"><a  href="#EditTabEN">English Data</a></li>
                <li class="tab col s3"><a class="active" href="#EditTabAR">Arabic Data</a></li>
            </ul>
        </div>
        <div id="EditTabEN" class="col s12">
          <!-- English Fields -->
          <div class="row">

            <div class="input-field col s12">
              <input id="edit_name_en" name="edit_name_en" type="text" class="validate">
              <label for="dir-edit_name_en">
                 English Name
              </label>
            </div>
          </div>
          <!-- End English Fields -->
        </div>

        <div id="EditTabAR" class="col s12">
          <!-- Arabic Fields -->
          <div class="row">
            
            <div class="input-field col s12">
              <input id="edit_name_ar" name="edit_name_ar" type="text" class="validate">
              <label for="dir-edit_name_ar">
                 Arabic Name
              </label>
            </div>
          </div>
          <!-- End Arabic Fields -->   
        </div>
        
      </form>
    </div>
  </div>
  <div class="modal-footer">
    <a href="#" class="waves-effect waves-light btn blue darken-2" id="btnEdit">Save</a>
  </div>
</div>
<!-- Edit Item End -->