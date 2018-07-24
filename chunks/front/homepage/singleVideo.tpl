<!-- Video widget -->
<div class="col s12 m6 l4">
    <div class="videoWidget" style="background-image: url('[[+video_image]]')">
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
    <!-- Dropdown Structure -->
    <ul id='dropdown[[+video_id]]' class='dropdown-content'>
        <li><a href="javascript:fbShare('[[+video_url]]', '', '', '', '');">Facebook</a></li>
        <li class="divider"></li>
        <li><a href="https://twitter.com/intent/tweet?url=[[+video_url]]&text=[[+video_title]]">Twitter</a></li>
        <li class="divider"></li>
        <li><a href="https://plus.google.com/share?url=[[+video_url]]"  onclick="javascript:window.open(this.href, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=600,width=600'); return false;">Google+</a></li>
    </ul>
</div>

<!--Video widget -->