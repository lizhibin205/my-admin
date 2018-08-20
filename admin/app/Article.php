<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Utils\SoftDeletes;

class Article extends Model
{
    use SoftDeletes;
    //
    protected $table = 'article';
}
