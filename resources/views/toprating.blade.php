

@extends ('layouts.app')
@section('title')
    <title>Top Rating</title>
@endsection
@section('scripts')
    <script src="{{asset('js/ratings.js')}}"></script>
@endsection
@section('content')
    <div class="general-agileits-w3l">
        <div class="w3l-medile-movies-grids">
            <div class="movie-browse-agile">
                <div class="browse-agile-w3ls general-w3ls">
                    <div class="tittle-head">
                    </div>
                    <div class="container">
                        <div class="browse-inner">
                            <div id="movies-container">
                                @foreach($movie as $x)
                                    <div class="col-md-2 w3l-movie-gride-agile">
                                        <a href="{{@route('movie', $x->movie_id)}}"
                                           class="hvr-shutter-out-horizontal "><img
                                                    src="{{asset($x->poster)}}"
                                                    title="album-name"
                                                    class="movie-poster"
                                                    alt=" "/>
                                            <div class="w3l-action-icon"><i class="fa fa-play-circle"
                                                                            aria-hidden="true"></i>
                                            </div>
                                        </a>
                                        <div class="mid-1">
                                            <div class="w3l-movie-text">
                                                <h6>
                                                    <a href="{{@route('movie',$x->movie_id)}}">{{$x->title}}</a>
                                                </h6>
                                            </div>
                                            <div class="mid-2">

                                                <p>{{$x->year}}</p>
                                                <div class="block-stars">
                                                    <ul class="w3l-ratings">
                                                        @php($x = $x->rating_value)
                                                        @for($r = 1; $r <= $rating; $r++)
                                                            <li class="rating-star">
                                                                <a href="{{route('rate_movie',
                                                            ['id'=>$x->id, 'rating'=>$r])
                                                            }}"><i
                                                                            class="fa fa-star"
                                                                            aria-hidden="true"
                                                                            data-index="{{$r}}"
                                                                            data-fill="full"></i></a>
                                                            </li>
                                                        @endfor
                                                        @if($rating - floor($rating) != 0)

                                                            <li class="rating-star">
                                                                <a href="{{route('rate_movie',
                                                            ['id'=>$x->id, 'rating'=>ceil($rating)])
                                                            }}">
                                                                    <i class="fa fa-star-half-o"
                                                                       aria-hidden="true"
                                                                       data-index="{{ceil($rating)}}"
                                                                       data-fill="half"></i>
                                                                </a>
                                                            </li>

                                                        @endif
                                                        @for($r = ceil($rating); $r < 5; $r++)
                                                            <li class="rating-star">
                                                                <a href="{{route('rate_movie',
                                                            ['id'=>$x->id, 'rating'=>$r + 1])
                                                            }}">
                                                                    <i class="fa fa-star-o"
                                                                       aria-hidden="true"
                                                                       data-index="{{$r + 1}}"
                                                                       data-fill="none"></i>
                                                                </a>
                                                            </li>
                                                        @endfor
                                                    </ul>
                                                </div>
                                                <div class="clearfix"></div>
                                            </div>

                                        </div>
                                        @if(strtotime($x->created_at)  > strtotime("-3 days"))
                                            <div class="ribben two">
                                                <p>NEW</p>
                                            </div>
                                        @endif
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    </div>
                </div>
        </div>

    </div>
@endsection
