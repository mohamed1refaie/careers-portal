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
        Vacancies
    </h1>
    <p class="subtitle-text">
      Manage Vacancies on your website.
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
        Add New Vacancy
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
                <input name="title_en" type="text" class="validate">
                <label for="dir-title_en">
                   English Title
                </label>
              </div>

              <div class="input-field col s12">
                <textarea name="description_en" type="text" class="validate"></textarea>
                <label for="dir-description_en">
                   English Description
                </label>
              </div>

              <div class="input-field col s12">
                <textarea name="required_skills_en" type="text" class="validate"></textarea>
                <label for="dir-required_skills_en">
                   English Required Skills
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
                    <input name="title_ar" type="text" class="validate">
                    <label for="dir-title_ar">
                       Arabic Title
                    </label>
                  </div>

                  <div class="input-field col s12">
                    <textarea name="description_ar" type="text" class="validate"></textarea>
                    <label for="dir-description_ar">
                       Arabic Description
                    </label>
                  </div>

                  <div class="input-field col s12">
                    <textarea name="required_skills_ar" type="text" class="validate"></textarea>
                    <label for="dir-required_skills_ar">
                       Arabic Required Skills
                    </label>
                  </div>

                </div>
        </div>

        <div class="input-field col s12">
          <select id="governmentID">
            <option value="0" disabled selected>Choose Government</option>
            [[+governmentsTPL]]
          </select>
          <label>Governments</label>
        </div>

        <div class="input-field col s12">
          <select id="departmentID">
            <option value="0" disabled selected>Choose Department </option>
            [[+departmentsTPL]]
          </select>
          <label>Departments</label>
        </div>

        <div class="input-field col s12">
          <select id="typeID">
            <option value="0" disabled selected>Choose Type </option>
            <option value="1" >Full Time</option>
            <option value="2" >Part Time </option>
          </select>
          <label>Vacancy Type</label>
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
      Edit Vacancy
    </h4>
    <div class="row" >
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
        <input id="edit_title_en" name="edit_title_en" type="text" class="validate">
        <label for="dir-edit_title_en">
           English Title
        </label>
      </div>

      <div class="input-field col s12">
        <textarea name="edit_description_en" type="text" class="validate" id="edit_description_en"></textarea>
        <label for="dir-edit_description_en">
           English Description
        </label>
      </div>

      <div class="input-field col s12">
        <textarea name="edit_required_skills_en" type="text" class="validate" id="edit_required_skills_en"></textarea>
        <label for="dir-edit_required_skills_en">
           English Required Skills
        </label>
      </div>

    </div>
    <!-- End English Fields -->
  </div>

  <div id="EditTabAR" class="col s12">
    <!-- Arabic Fields -->
    <div class="row">
      
      <div class="input-field col s12">
        <input id="edit_title_ar" name="edit_title_ar" type="text" class="validate">
        <label for="dir-edit_title_ar">
           Arabic Title
        </label>
      </div>

      <div class="input-field col s12">
        <textarea name="edit_description_ar" type="text" class="validate" id="edit_description_ar"></textarea>
        <label for="dir-edit_description_ar">
           Arabic Description
        </label>
      </div>

      <div class="input-field col s12">
        <textarea name="edit_required_skills_ar" type="text" class="validate" id="edit_required_skills_ar"></textarea>
        <label for="dir-edit_required_skills_ar">
           Arabic Required Skills
        </label>
      </div>
    </div>
    <!-- End Arabic Fields -->   
  </div>

  <div class="input-field col s12">
    <select id="editGovernmentID">
      <option value="" disabled selected>Choose Government</option>
      [[+governmentsTPL]]
    </select>
    <label>Governments</label>
  </div>

  <div class="input-field col s12">
    <select id="editDepartmentID">
      <option value="" disabled selected>Choose Department </option>
      [[+departmentsTPL]]
    </select>
    <label>Departments</label>
  </div>

  <div class="input-field col s12">
    <select id="editTypeID">
      <option value="" disabled selected>Choose Type </option>
      <option value="1" >Full Time</option>
      <option value="2" >Part Time </option>
    </select>
    <label>Vacancy Type</label>
  </div>
  
</form>
    </div>
  </div>
  <div class="modal-footer">
    <a href="#" class="waves-effect waves-light btn blue darken-2" id="btnEdit">Save</a>
  </div>
</div>
<!-- Edit Item End -->