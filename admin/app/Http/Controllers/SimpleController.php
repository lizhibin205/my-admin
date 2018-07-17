<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class SimpleController extends Controller
{
    /**
     * 显示简单信息
     */
    public function show()
    {
        return 'simple controller show!';
    }
}
