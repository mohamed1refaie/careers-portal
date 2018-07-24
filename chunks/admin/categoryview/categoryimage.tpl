 <!-- alert widget -->
<div class="col s12 m4 singleArticle">
  <div class="card medium priv-card hoverable">
    <div class="card-image articleImage" style="min-height:45%;">

      <a id="openEditArticle" onclick="fnOpenEdit([[+imageID]]);" class="btn-floating btn-large waves-effect waves-light blue float-edit edit-btn [[+editFlag]]"><i class="material-icons">edit</i></a>

      <a id="deletePrivilegeBtn" onclick="fnDel([[+imageID]]);"
        class="btn-floating btn-large waves-effect waves-light red float-edit delete-btn" style="bottom: 80px; right: 20px;"><i class="material-icons ">delete</i></a>

      <img class="storyImage" src="../[[+picture]]">
      <!-- <span class="card-title">Program Title</span> -->
    </div>
    <div class="card-content articleContent">
      <a href="#"><h5>[[+number]]</h5></a>
    </div>
  </div>
</div>
<input type="hidden" class="totalpages" name="totalpages" value="[[+totalPages]]" />
<!-- alert widget -->