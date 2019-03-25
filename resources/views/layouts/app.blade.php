
@php
    $all_genres = (new \App\Genre())->all();
    $columns = intval(count($all_genres) / 8) + 1;
    $genre_columns = [];
for ($i = 0, $k = 0; $i < $columns; $i++){
    $genre_columns[$i] =  [];
    for ($j = 0; $j < 8 && $k < count($all_genres); $j++,$k++){
        $genre_columns[$i][$j] = $all_genres[$k];
    }
}
@endphp
<!DOCTYPE html>
    <html lang="en">
    <head>
    <meta name="csrf-token" content="{{ csrf_token() }}">
    @hasSection('title')
        @yield('title')
    @else
        <title>Not IMDB | Home :: w3layouts</title>
    @endif

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content="One Movies Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template,
                Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design"/>

    <link href="{{asset('vendor/bootstrap-tagsinput/bootstrap-tagsinput.css')}}" rel="stylesheet">

    <link href="{{ asset('css/bootstrap.css') }}" rel="stylesheet" type="text/css" media="all"/>
    <link href="{{ asset('css/style.css') }}" rel="stylesheet" type="text/css" media="all"/>
    <link rel="stylesheet" href="{{ asset('css/contactstyle.css') }}" type="text/css" media="all"/>
    <link rel="stylesheet" href="{{ asset('css/faqstyle.css') }}" type="text/css" media="all"/>
    <link rel="stylesheet" href="{{ asset('css/main.css') }}" type="text/css" media="all"/>
    <link rel="stylesheet" href="{{ asset('css/search.css') }}" type="text/css" media="all"/>
    <link rel="stylesheet" href="{{asset('vendor/jquery-ui-1.12.1/jquery-ui.theme.css')}}">
    <link rel="stylesheet" href="{{asset('vendor/jquery-ui-1.12.1/jquery-ui.structure.css')}}">
    <link rel="stylesheet" href="{{asset('vendor/jquery-ui-1.12.1/jquery-ui.min.css')}}">
    <link href="{{ asset('css/single.css') }}" rel='stylesheet' type='text/css'/>
    <link href="{{ asset('css/medile.css') }}" rel='stylesheet' type='text/css'/>

    <link rel="stylesheet" href="{{ asset('css/font-awesome.min.css') }}"/>

    <script type="text/javascript" src="{{ asset('js/jquery-2.1.4.min.js') }}"></script>
    <script type="text/javascript" src="{{ asset('vendor/jquery-ui-1.12.1/jquery-ui.min.js') }}"></script>

    <link href='//fonts.googleapis.com/css?family=Roboto+Condensed:400,700italic,700,400italic,300italic,300' ) }}
          rel='stylesheet' type='text/css'>

    <script type="text/javascript" src="{{ asset('js/move-top.js') }}"></script>
    <script type="text/javascript" src="{{ asset('js/easing.js') }}"></script>
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            $(".scroll").click(function (event) {
                event.preventDefault();

            });
        });
    </script>

</head>

<body>

<div class="header">
    <div class="container">
        <div class="w3layouts_logo">
            <a href="{{route('index')}}"><h1>Not<span>IMDB</span></h1></a>
        </div>
        <div class="w3_search">
            <form id="search" action="{{route('search_movies')}}" method="get">
                <input autocomplete="off" autocomplete="false" type="text" name="title" placeholder="Search"
                       required="">
                <input type="submit" value="Search">
                @hasSection('search_parameters')
                    @yield('search_parameters')
                @endif
                <ul id="search-results">

                </ul>
            </form>
        </div>
        <div class="w3l_sign_in_register">
            <ul>
                <li><i class="fa fa-phone" aria-hidden="true"></i> (+000) 123 345 653</li>
                @if(Auth::check())
                    @php(Auth::user()->user_type == 'USER')
                    <li>Logged in as {{Auth::user()->name}}</li>
                    <li>
                        <form method="post" action="{{route('logout')}}"><input type="submit" value="Log Out"></form>
                    </li>
                    @if(Auth::check() && Auth::user()->user_type == 'ADMIN')
                    <li>
                        <form action="{{route('admin')}}"><input type="submit" value="Admin Panel"></form>
                    </li>
                    @endif

                @else
                    <li><a href="#" data-toggle="modal" data-target="#myModal">Login</a></li>
            </ul>
            @endif
        </div>
        <div class="clearfix"></div>
    </div>
</div>

<div class="modal video-modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                Sign In & Sign Up
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
            </div>
            <section>
                <div class="modal-body">
                    <div class="w3_login_module">
                        <div class="module form-module">
                            <div class="toggle"><i class="fa fa-times fa-pencil"></i>
                                <div class="tooltip">Click Me</div>
                            </div>
                            <div class="form">
                                <h3>Login to your account</h3>
                                <form action="{{route('login')}}" id='login-form' method="post">
                                    <input type="text" id="mail" name="email" placeholder="Username" required="">
                                    <label for="mail" id="ajax_error"></label>
                                    <input type="password" name="password" placeholder="Password" required="">
                                    <input type="submit" value="Login">
                                </form>
                            </div>
                            <div class="form">
                                <h3>Create an account</h3>
                                <form action="{{route('register')}}" id='register-form' method="post">
                                    <input type="text" name="name" placeholder="Username" required="">
                                    <input type="password" name="password" placeholder="Password" required="">
                                    <input type="password" name="password_confirmation" placeholder="Confirm Password"
                                           required="">
                                    <input type="email" name="email" placeholder="Email Address" required="">
                                    <input type="hidden" name="profile_picture" placeholder="Phone Number" required="">
                                    <input type="submit" value="Register">
                                </form>
                            </div>
                            <div class="cta"><a href="#">Forgot your password?</a></div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
</div>
<script>
    $('.toggle').click(function () {

        $(this).children('i').toggleClass('fa-pencil');

        $('.form').animate({
            height: "toggle",
            'padding-top': 'toggle',
            'padding-bottom': 'toggle',
            opacity: "toggle"
        }, "slow");
    });
</script>

<div class="movies_nav">
    <div class="container">
        <nav class="navbar navbar-default">
            <div class="navbar-header navbar-left">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>

            <div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1">
                <nav>
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="{{route('index')}}">Home</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Genres <b class="caret"></b></a>
                            <ul class="dropdown-menu multi-column columns-3">
                                <li>
                                    @foreach($genre_columns as $genres)
                                        <div class="col-sm-4">
                                            <ul class="multi-column-dropdown">
                                                @foreach($genres as $genre)
                                                    <li>
                                                        <a href="{{route('genre',
                                                        ['genre_name' => $genre->genre_name,
                                                         'page' => 1]
                                                         )}}">{{$genre->genre_name}}</a>
                                                    </li>
                                                @endforeach
                                            </ul>
                                        </div>
                                    @endforeach
                                    <div class="clearfix"></div>
                                </li>
                            </ul>
                        </li>
                        <li><a href="{{asset('')}}">tv - series</a></li>
                        <li><a href="{{asset('')}}">Placeholder</a></li>
                        <li><a href="{{asset('')}}">Placeholder</a></li>
                        <li><a href="{{asset('')}}">Placeholder</a></li>
                        <li><a href="{{asset('movies/all/1')}}">All Movies</a></li>
                    </ul>
                </nav>
            </div>
        </nav>
    </div>
</div>
@yield('slidey')

@hasSection('banner_bottom')
    @yield('banner_bottom')
@endif


<input type="hidden" id='search_route' value="{{route('search_movies')}}">

@yield('content')

@hasSection('most_popular')
    @yield('most_popular')
@endif

<div class="footer">
    <div class="container">
        <div class="w3ls_footer_grid">
            <div class="col-md-6 w3ls_footer_grid_left">
                <div class="w3ls_footer_grid_left1">
                    <h2>Subscribe to us</h2>
                    <div class="w3ls_footer_grid_left1_pos">
                        <form action="#" method="post">
                            <input type="email" name="email" placeholder="Your email..." required="">
                            <input type="submit" value="Send">
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-6 w3ls_footer_grid_right">
                <a href="index.html"><h2>Not<span>IMDB</span></h2></a>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="col-md-5 w3ls_footer_grid1_left">
            <p>Not IMDB | Design by Semir Durakovic</p>
        </div>
        <div class="col-md-7 w3ls_footer_grid1_right">
            <ul>
                <li>
                    <a href="">Movies</a>
                </li>
                <li>
                    <a href="">FAQ</a>
                </li>
                <li>
                    <a href="">Action</a>
                </li>
                <li>
                    <a href="">Adventure</a>
                </li>
                <li>
                    <a href="">Comedy</a>
                </li>
                <li>
                    <a href="">Icons</a>
                </li>
                <li>
                    <a href="">Contact Us</a>
                </li>
            </ul>
        </div>
        <div class="clearfix"></div>
    </div>
</div>

<script src="{{ asset('js/bootstrap.min.js') }}"></script>
<script>
    $(document).ready(function () {
        $(".dropdown").hover(
            function () {
                $('.dropdown-menu', this).stop(true, true).slideDown("fast");
                $(this).toggleClass('open');
            },
            function () {
                $('.dropdown-menu', this).stop(true, true).slideUp("fast");
                $(this).toggleClass('open');
            }
        );
    });
</script>

<script src="{{asset('js/auth.js')}}"></script>
<script type="x-template/mustache" id='search-item'>
    <img src="@{{poster}}">
    <a target="_blank" href="@{{url}}">@{{title}}</a>
</script>

</body>
@hasSection('scripts')
    <script src="{{asset('vendor/mustache/mustache.min.js')}}"></script>
    <script src="{{asset('/vendor/socket.io.js')}}"></script>
    <script src="{{asset('js/bootstrap.js',true)}}"></script>
    <script src="{{asset('/vendor/lodash.js')}}"></script>
    <script src="{{asset('js/search.js')}}"></script>
    @yield('scripts')
@endif
</html>