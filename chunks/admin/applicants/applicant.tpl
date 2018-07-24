<style type="text/css">               
tr.border_bottom td {
  border-bottom:1pt solid #edecec;
}

</style>
              <tr class="record-row border_bottom">
                      <!-- <td>
                          <label class="label--checkbox">
                            <input type="checkbox" class="checkbox status" [[+checked]] id="[[+ID]]" >
                          </label>
                       </td> -->
                        <td>[[+first_name]]</td>
                        <td>[[+last_name]]</td>
                        <td>[[+email]]</td>
                        <td>[[+phone]]</td>
                        <td>[[+department]]</td>
                        <td>[[+message]]</td>
                        <td><a href="[[+cv]]" download>
                             <i class="fa fa-download" aria-hidden="true"></i>Download
                            </a>
                        </td>
                        <td><button class="btn bule-btn" onClick="fnDel([[+ID]])"><i class="material-icons">delete</i></button></td>
                            
                        <!-- <td><a href="viewApplication.php?appID=[[+ID]]" class="primary-btn m10">View Application <img src="img/arrow-right.svg"></a></td> -->
              </tr>
<script>
$(document).ready(function(){

});
</script>