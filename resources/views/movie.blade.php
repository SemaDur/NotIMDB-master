
@extends('layouts.app')
@section('scripts')
    <script src="{{asset("js/comments.js")}}"></script>
@endsection
@section('title')
    <title>{{$movie->title}} - NotIMDB</title>
@endsection
@section('content')
    <div class="single-page-agile-main">
        <div class="single-page-agile-info">
            <div class="container">
                <div class="show-top-grids-w3lagile">
                    <div class="col-sm-8 single-left">
                        <div class="song">
                            <div class="song-info">
                                <h3>{{$movie->title}}</h3>
                            </div>
                            <div class="video-grid-single-page-agileits">
                                <div class="video-grid-single-page-agileits">
                                    <div data-video="{{$movie->trailer}}" id="video"><img src="{{asset($movie->poster)}}"
                                                                                          alt=""
                                                                                          class="img-responsive trailer-poster"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="song-grid-right">
                            <h4 id="summary">{{$movie->description}}</h4>
                            <label for="year">Year:</label>
                            <span id='year'>{{$movie->year}}</span>
                            <br>
                            <label for="cast">Cast:</label>
                            @php($cast = App\Cast::findOrFail(App\Role::where('movie_id', $movie->id)->get(['cast_id'])))
                            {{--@php(dd($cast))--}}
                            @foreach($cast as $name)
                            <span id='cast'>{{$name->first_name}} {{$name->last_name}},</span>
                            @endforeach
                            <br>
                            <label for="genre">Genre{{count($movie->genres) != 1 ? 's' : ''}}: </label>
                            <span id="genre">{{implode(', ',array_column($movie->genres->all(), 'genre_name'))}}</span>
                            <br>


                        </div>
                        @if(Auth::check() && Auth::user()->user_type =='ADMIN')
                            <button class="btn btn-danger" data-toggle="modal"
                                    data-target="#confirm-delete">
                                Delete
                            </button>
                            <div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog"
                                 aria-labelledby="myModalLabel"
                                 aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            Are you sure you want to delete "{{$movie->title}}"?
                                        </div>
                                        <div class="modal-body">
                                            This will remove the movie from database permanently.
                                        </div>
                                        <div class="modal-footer">
                                            <form action="{{route('delete_movie', ['id' => $movie->id])}}"
                                                  method="post">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">
                                                    Cancel
                                                </button>
                                                {{csrf_field()}}
                                                <button type="submit" class="btn btn-danger btn-ok">Delete</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>@endif

                        <div class="clearfix"></div>

                        <div class="all-comments">
                            <div class="all-comments-info">
                                <a href="#">Comments</a>
                                @if(Auth::check())
                                    <div class="agile-info-wthree-box">
                                        <form id="comment-form" action="{{route('add_comment')}}">
                                            <textarea placeholder="Message" name="content" id='content'
                                                      required=""></textarea>
                                            <input type="hidden" name="movie_id" value="{{$movie->id}}">
                                            {{csrf_field()}}
                                            <input type="submit" value="SEND">
                                            <div class="clearfix"></div>
                                        </form>
                                    </div>
                                @endif
                            </div>
                            <div class="media-grids" id="comment-grids">
                                @php($comments = $movie->comments)
                                @foreach($comments as $comment)
                                    <div class="media">
                                        <h5>{{$comment->author->name}}</h5>
                                        <div class="media-left">
                                            <a href="#">
                                                <img src="{{asset($comment->author->get_profile_picture())}}"
                                                     title="One movies" alt=" "/>
                                            </a>
                                        </div>
                                        <div class="media-body">
                                            <p>{{$comment->content}}</p>
                                            <span>View all posts by :<a href="#"> Admin </a></span>
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    </div>



                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>
    <script src="{{asset('js/simplePlayer.js')}}"></script>
    <script>
        $("document").ready(function () {
            $("#video").simplePlayer();
        });
    </script>


@endsection
