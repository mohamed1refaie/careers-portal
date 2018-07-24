<form id="editGL" class="col s12">
  <input type="hidden" name="operation" value="edit" />
  <input type="hidden" id="itemID" name="currID" value="[[+currID]]" />
  <div class="col s12 mb30">
    <ul class="tabs">
        <li class="tab col s3"><a  href="#EditTabEN">English Data</a></li>
        <li class="tab col s3"><a class="active" href="#EditTabAR">Arabic Data</a></li>
    </ul>
  </div>

  <div id="EditTabAR" class="col s12">
    <div class="row">
      
      <div class="input-field col s12">
        <input id="edit_name_ar" name="edit_name_ar" type="text" class="validate" value="[[+name_ar]]">
        <label for="dir-edit_name_ar">
           Arabic Name
        </label>
      </div>

      <div class="input-field col s12">
        <input id="edit_description_ar" name="edit_description_ar" type="text" class="validate" value="[[+description_ar]]">
        <label for="dir-edit_description_ar">
           Arabic Description
        </label>
      </div>
      
    </div>
  </div>

  <div id="EditTabEN" class="col s12">
    <div class="row">
      
      <div class="input-field col s12">
        <input id="edit_name_en" name="edit_name_en" type="text" class="validate" value="[[+name_en]]">
        <label for="dir-edit_name_en">
           English Name
        </label>
      </div>

      <div class="input-field col s12">
        <input id="edit_description_en" name="edit_description_en" type="text" class="validate" value="[[+description_en]]">
        <label for="dir-edit_description_en">
           English Description
        </label>
      </div>
      
    </div>
  </div>

  <div class="input-field col s12" class="validate">
    <input name="edit_sort" type="number" value="[[+sort_num]]" id="edit_sort">
    <label for="dir-edit_sort">
       Priority Number
    </label>
  </div>
  
  <div class="file-field input-field col s12">
    <div class="btn blue darken-2">
      <span>
        Main Image
      </span>
      <input name="picture" type="file">
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
      <input name="logo_picture" type="file">
    </div>
    <div class="file-path-wrapper">
      <input class="file-path" type="text">
    </div>
  </div>

  <div class="input-field col s12">
    <select id="editCategoryID">
      <option value="" disabled selected>Choose Category</option>
      [[+categoriesTPL]]
    </select>
    <label>Product Category</label>
  </div>

  <div class="input-field col s12">
    <select id="editVideoID">
      <option value="" disabled selected>Choose Video</option>
      [[+videosTPL]]
    </select>
    <label>Product Video</label>
  </div>

  <div class="input-field col s12">
    <select id="editFlavourIDs" multiple>
      <option value="" disabled selected>Choose Flavour</option>
      [[+flavoursTPL]]
    </select>
    <label>Product Flavour</label>
  </div>

  <div class="input-field col s12">
    <div class="btn blue darken-2" onclick="fnViewPhotosModal([[+currID]]);">
      <span>
        View Images
      </span>
    </div>
  </div>

  <div class="file-field input-field col s12">
    <div class="btn blue darken-2">
      <span>
        Product Images
      </span>
      <input name="pictures[]" type="file" multiple>
    </div>
    <div class="file-path-wrapper">
      <input class="file-path" type="text" placeholder="Upload one or more files">
    </div>
  </div>

</form>