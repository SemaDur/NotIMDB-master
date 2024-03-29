<?php

namespace App\Http\Controllers;


use App\Country;
use App\Genre;
use App\Movie;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Input;


class AdminController extends Controller {
    const IMAGE_DIR = 'images';

    public function index() {
        if (!$this->isAdmin()) return redirect(route('index'));
        return view('admin');
    }

    private function isAdmin() {
        return Auth::check() && Auth::user()->user_type == 'ADMIN';
    }

    public function addMovie() {
        if (!$this->isAdmin()) return redirect(route('index'));

        return view('add_movie');
    }

    public function deleteMovie($id) {
        if (!$this->isAdmin()) return view('message',
            ['message' => "You don't have the permission to perform this action.",
                'sender_path' => route('movie', ['id' => $id])]);
        $movie = Movie::find($id);
        if ($movie == null) {
            return view('message',
                ['message' => "Couldn't find the movie."]);
        }
        $movie->delete();
        return view('message',
            ['message' => "Successfully deleted the movie... "]);
    }

    public function storeMovie(Request $request) {
        $rules =
            [
                'title' => 'required',
                'year' => 'required|integer|min:1888|max:' . date('Y'),
                'description' => 'required',
                'poster' => 'required|image',
                'trailer' => 'required',
                'country' => 'required|exists:countries,country_name'
            ];

        $this->validate($request, $rules);

        $genres = json_decode($request->input('genres'));
        $movie = new Movie();
        $image = Input::file('poster');
        $moved = $this->moveFile(self::IMAGE_DIR, $image->getClientOriginalName(), $image);
        $movie->title = $request->input('title');
        $movie->year = $request->input('year');
        $movie->description = $request->input('description');
        $movie->trailer = $request->input('trailer');
        $movie->poster = $moved;
        $movie->country_id = (new Country())->getByName($request->input('country'))->id;
        $movie->save();
        $movie->genres()->attach($this->get_ids($genres));

        return redirect(route('movie', ['id' => $movie->id]));

    }

    private function moveFile($directory, $name, $image) {
        if (!file_exists("$directory/$name")) {

            $image->move($directory, $name);
            return "$directory/$name";
        }
        $name_without_ext = substr($name, 0, strlen($name) - 1 - strlen($image->getClientOriginalExtension()));
        $ext = $image->getClientOriginalExtension();
        $i = 0;
        while (file_exists("$directory/$name_without_ext ($i).$ext")) $i++;
        $image->move($directory, "$name_without_ext ($i).$ext");
        return "$directory/$name_without_ext ($i).$ext";
    }

    protected function buildFailedValidationResponse(Request $request, array $errors) {
        return new JsonResponse($errors, 422);
    }

    private function get_ids($genre_names) {
        $result = [];
        foreach ($genre_names as $genre_name) {
            $genre = (new Genre())->findByName($genre_name);
            if ($genre != null) array_push($result, $genre->id);
        }
        return $result;
    }
}
