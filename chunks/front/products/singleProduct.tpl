<!--Product Widget Start-->

<div class="col s12 m6 l4 prodWidget">
    <a href="productDetails.php?id=[[+id]]&lang=[[+lang]]">

        <div class="valign-wrapper prodImage">
            <img src="[[+product_image]]" alt="">
        </div>
    </a>
    <a href="productDetails.php?id=[[+id]]&lang=[[+lang]]">
        <h5>[[+product_name]] <i class="material-icons">arrow_forward</i></h5>
    </a>
    <p>
        [[+description]]
    </p>
</div>
<input type="hidden" class="totalpages" name="totalpages" value="[[+totalPages]]" />

<!--Product Widget End-->