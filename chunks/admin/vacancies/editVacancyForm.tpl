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
        <input id="edit_name_en" name="edit_name_en" type="text" value="[[+title_en]]" class="validate">
        <label for="dir-edit_name_en">
           English Title
        </label>
      </div>

      <div class="input-field col s12">
        <textarea name="edit_description_en" type="text" class="validate" value="[[+description_en]]" id="edit_description_en"></textarea>
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
        <input id="edit_name_ar" name="edit_name_ar" type="text" class="validate">
        <label for="dir-edit_name_ar">
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
    <select id="governmentID">
      <option value="" disabled selected>Choose Government</option>
      [[+governmentsTPL]]
    </select>
    <label>Governments</label>
  </div>

  <div class="input-field col s12">
    <select id="departmentID">
      <option value="" disabled selected>Choose Department </option>
      [[+departmentsTPL]]
    </select>
    <label>Departments</label>
  </div>

  <div class="input-field col s12">
    <select id="typeID">
      <option value="" disabled selected>Choose Type </option>
      <option value="1" >Full Time</option>
      <option value="2" >Part Time </option>
    </select>
    <label>Vacancy Type</label>
  </div>
  
</form>