<?php

namespace App;


use Illuminate\Database\Eloquent\Model;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
// use Illuminate\Foundation\Auth\User as Authenticatable;
// use Illuminate\Notifications\Notifiable;

class User extends Model
{

	// cuando la tabla no se llama igual que el modelo, colocarla de la siguiente forma
	protected $table = "users";

}
