<?php

namespace App\Admin\Controllers;

use App\Image;

use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Grid\Filter;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Layout\Content;
use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\ModelForm;

class ImageController extends Controller
{
    use ModelForm;

    /**
     * Index interface.
     *
     * @return Content
     */
    public function index()
    {
        return Admin::content(function (Content $content) {

            $content->header('图片库');
            $content->description('图片列表');

            $content->body($this->grid());
        });
    }

    /**
     * Edit interface.
     *
     * @param $id
     * @return Content
     */
    public function edit($id)
    {
        return Admin::content(function (Content $content) use ($id) {

            $content->header('header');
            $content->description('description');

            $content->body($this->form()->edit($id));
        });
    }

    /**
     * Create interface.
     *
     * @return Content
     */
    public function create()
    {
        return Admin::content(function (Content $content) {

            $content->header('header');
            $content->description('description');

            $content->body($this->form());
        });
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        return Admin::grid(Image::class, function (Grid $grid) {
            $grid->model()->orderBy('id', 'desc');
            $grid->filter(function(Filter $filter) {
                $filter->like('title', '图片标题');
            });
            $grid->disableRowSelector();
            $grid->columns([
                'id' => '图片ID',
                'title' => '图片标题',
                'image_url' => '图片地址',
            ]);
        });
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        return Admin::form(Image::class, function (Form $form) {
            $form->display('id', '图片ID');
            $form->text('title', '图片标题');
            $form->image('image_url', '图片');
        });
    }
}
