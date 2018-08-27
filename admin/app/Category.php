<?php

namespace App;

use Encore\Admin\Traits\AdminBuilder;
use Encore\Admin\Traits\ModelTree;
use Illuminate\Database\Eloquent\Model;
use App\Utils\SoftDeletes;

class Category extends Model
{
    use ModelTree, AdminBuilder, SoftDeletes;

    protected $table = 'categories';

    /**
     * 获取分类下的分类列表
     * @param number $parentId
     * @return array
     */
    public static function getCategoryMap(int $parentId = 0) : array
    {
        $categories = self::where('parent_id', $parentId)->get()->toArray();
        return array_column($categories, 'title', 'id');
    }
}
