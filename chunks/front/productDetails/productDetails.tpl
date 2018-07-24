[[+head]] [[+header]]


<section class="newsDetails">
    <div class="container">
        <div class="row">
            <div class="productDetails col s12">

                <!--Left Carousel-->
                <div class="prodDetailsCarousel col s12 m12 l6 owl-carousel">

                    [[+productImagesTPL]]

                </div>

                <!--Right Video-->
                <input type="hidden" id="hideVideo" value="[[+hide_video]]">
                <div class="col s12 m12 l6 videosSectionDetails" id="videoHidden">
                    <!--Video widget-->
                    <div class="videoWidget z-depth-2" style="background-image: url('[[+video_image]]')">
                        <div class="videoText">
                            <a class="videoLink" href="[[+video_url]]">
                                <img class="playBtn" src="img/youtube.svg" />
                            </a>
                            <h6 class="white-text truncate">[[+video_title]] </h6>
                            <!-- <span class="left"><img src="img/clock.svg" /> 1:33</span> -->
                            <span class="right">
                            <a class='dropdown-button' href='#' data-activates='dropdown[[+video_id]]'>
                                <img src="img/share.svg" /> [[+share]]
                            </a>
                        </span>

                        </div>

                        <div class="overlay"></div>

                    </div>
                    <!--Video widget-->
                    <!-- Dropdown Structure -->
                    <ul id='dropdown[[+video_id]]' class='dropdown-content'>
                        <li><a href="javascript:fbShare('[[+video_url]]', '[[+video_title]]', '[[+video_image]]', 320, 150);">Facebook</a></li>
                        <li class="divider"></li>
                        <li><a href="https://twitter.com/intent/tweet?url=[[+video_url]]&text=[[+video_title]]">Twitter</a></li>
                        <li class="divider"></li>
                        <li><a href="https://plus.google.com/share?url=[[+video_url]]" onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600'); return false;">Google+</a></li>
                    </ul>
                </div>

                <!--Details Body-->
                <div class="col s12">
                    <h3>[[+product_name]]<span>[[+product_description]]</span></h3>
                    <p>[[+description]]</p>
                </div>
                <!--Flavors List-->
                <div class="col s12">
                    <h3>[[+product_name]] <span>[[+flavours]]</span></h3>
                    <ul class="flavorsList">
                        [[+flavoursTPL]]
                    </ul>
                </div>

                <!--Related Products-->
                <div class="col s12">
                    <h3>[[+related]] <span>[[+products]]</span></h3>

                    <div class="card productsList z-depth-3 col s12">
                        [[+related_productsTPL]]
                    </div>
                </div>

            </div>
        </div>
    </div>

</section>


[[+extraScript]] [[+footer]]