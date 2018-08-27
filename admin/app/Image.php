<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Utils\SoftDeletes;

class Image extends Model
{
    use SoftDeletes;

    protected $table = 'images';
}
