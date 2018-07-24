[[+head]]

[[+header]]

    <section class="newsDetails">
        <div class="container">
            <div class="row">
            <input type="hidden" name="lastCatID" value="[[+lastCatID]]" id="lastCatID">
            <input type="hidden" id="currPage" name="currPage" value="1" />
            <input type="hidden" id="categoryID" value="">
                <div class="card productsList z-depth-3 col s12">

                    <div class="col s12">
                        <ul class="tabs">
                            [[+categoriesTPL]]
                        </ul>
                    </div>
                    <div id="test1" class="col s12">
                        <p class="center" id="category_description">
                            
                        </p>

                        <div id="products_widget">

                        </div>

                        <div class="center col s12">
                            <a class="btn waves-effect light-waves blue-btn mt30" id="loadMore">[[+view_more]]</a>
                        </div>
                    </div>

                </div>
            </div>
        </div>

    </section>


[[+extraScript]]

[[+footer]]