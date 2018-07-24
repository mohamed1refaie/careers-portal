<!--news widget-->
<div class="col s12 m6 l4">
    <div class="card medium newsCard">
        <div class="card-image">
            <a href="newsDetails.php?id=[[+currID]]&lang=[[+lang]]">
                <img src="[[+image]]">
            </a>
            <span>[[+publishDate]]</span>
        </div>
        <div class="card-content">
            <a href="newsDetails.php?id=[[+currID]]&lang=[[+lang]]">
                <h5>[[+name]]</h5>
            </a>
            <p>[[+intro]]</p>
        </div>
        <a href="newsDetails.php?id=[[+currID]]&lang=[[+lang]]" class="readMore">[[+see_more]] <i class="material-icons">arrow_forward</i></a>
    </div>
</div>
<input type="hidden" class="totalpages" name="totalpages" value="[[+totalPages]]" />
<!--news widget-->