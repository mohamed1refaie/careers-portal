<section class="heroSection">
    <header>
        <div class="subHeader">
            <div class="container center">
                <ul class="socialIcons left">
                    <li>
                        <a href="https://www.facebook.com/mohamed1refaie/"><img src="img/facebook.svg" /></a>
                    </li>
                    <li>
                        <a href="https://www.instagram.com/mohamed1refaie/"><img src="img/instagram.svg" /></a>
                    </li>
                    <li>
                        <a href="https://www.github.com/mohamed1refaie/"><img src="img/github4.png" /></a>
                    </li>
                </ul>

                <p class="inline-block white-text">
                    Ref's career portal
                </p>

            </div>
        </div>

        <div class="mainHeader">
            <div class="container">

                <div class="menuContainer">
                    <div class="stick stick-1"></div>
                    <div class="stick stick-2"></div>
                    <div class="stick stick-3"></div>
                </div>

                <div class="row">
                    <div class="left logoContainer">
                        <a href="index.php">
                            <img src="img/refLogo.png" />
                        </a>
                    </div>
                    <div class="right">
                        <ul class="mainMenu">
                            <a href="createPost.php">
                                <li>Create Post</li>
                            </a>
                            <a href="applications.php">
                                <li>Applications</li>
                            </a>
                            <a href="logout.php">
                                <li>Logout</li>
                            </a>

                        </ul>
                    </div>
                </div>

            </div>
        </div>

    </header>

    [[+titleTPL]]
</section>

<script type="text/javascript">
    $(document).ready(function() {
        var langu = $('#lang').val();

        if (langu == 'ar')
            $('#langLink').text('English');
        else
            $('#langLink').text('عربي');
    });

    function changeLanguage(lang) {
        $('#loadingContainer')
            .show();

        $.ajax({
                url: 'handlers/LangHandler.php',
                type: 'POST',
                data: {
                    operation: 'changeLanguage',
                    lang: lang,
                },
            })
            .done(function(data) {
                console.log(data);


                if (window.location.hostname == 'localhost') {
                    finalurl = UpdateQueryString('lang', data, window.location.href);
                    window.location.href = finalurl;
                } else {
                    finalurl = UpdateQueryString('lang', data, window.location.href);
                        window.location.href = finalurl;
                    // window.location.href =  window.location.origin+window.location.pathname+"?lang="+data;
                }


            })
            .fail(function() {
                console.log("error");
            })
            .always(function() {
                $('#loadingContainer')
                    .hide();
            });
    }

    function UpdateQueryString(key, value, url) {
        if (!url) url = window.location.href;
        var re = new RegExp("([?&])" + key + "=.*?(&|#|$)(.*)", "gi"),
            hash;

        if (re.test(url)) {
            if (typeof value !== 'undefined' && value !== null)
                return url.replace(re, '$1' + key + "=" + value + '$2$3');
            else {
                hash = url.split('#');
                url = hash[0].replace(re, '$1$3').replace(/(&|\?)$/, '');
                if (typeof hash[1] !== 'undefined' && hash[1] !== null)
                    url += '#' + hash[1];
                return url;
            }
        } else {
            if (typeof value !== 'undefined' && value !== null) {
                var separator = url.indexOf('?') !== -1 ? '&' : '?';
                hash = url.split('#');
                url = hash[0] + separator + key + '=' + value;
                if (typeof hash[1] !== 'undefined' && hash[1] !== null)
                    url += '#' + hash[1];
                return url;
            } else
                return url;
        }
    }
</script>