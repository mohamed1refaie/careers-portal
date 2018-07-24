 [[+head]] [[+header]]

<section class="newsDetails">
    <div class="container">
        <div class="row">
            <div class="col s12" id="newsDetailsCard">
                <div class="card detailsCard z-depth-3">
                    <h2>[[+title]].</h2>
                    <div class="socialShare">
                        <span class="newsDate"><i class="material-icons">today</i> [[+publishDate]]</span>
                        <ul class="shareIcons">
                            <li>
                                <a href="javascript:fbShare('[[+server]]/newsDetails.php?id=[[+id]]&lang=[[+lang]]', '', '', '', '');"><img src="img/fb.svg" alt=""></a>
                            </li>
                            <li>
                                <a href="https://twitter.com/intent/tweet?url=[[+server]]/newsDetails.php?id=[[+id]]&lang=[[+lang]]&text=[[+title]]"><img src="img/twt.svg" alt=""></a>
                            </li>
                            <li>
                                <a href="https://plus.google.com/share?url=[[+server]]/newsDetails.php?id=[[+id]]&lang=[[+lang]]" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600'); return false;">
                                    <img src="img/gpls.svg" alt=""> </a>
                            </li>
                        </ul>
                    </div>

                    <div class="newsBody">
                        [[+description]]
                    </div>
                </div>
            </div>

        </div>
        <!--Related Articles-->
        <div class="col s12 relatedNews">
            <div class="innerTitle">
                <h3>[[+relatedtxt]]</h3>
            </div>
            <!--news widget-->
            [[+relatedTPL]]
            <!--news widget-->
        </div>
    </div>

</section>

[[+extraScript]] [[+footer]]