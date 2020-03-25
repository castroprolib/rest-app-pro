<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Country;

class CountryController extends Controller
{
    //

	public function index()
	{
        //
		// echo "countrys";
	}


	public function create()
	{
        //

		$countrys = Country::all();

		return response()
		->json($countrys);
	}
}
