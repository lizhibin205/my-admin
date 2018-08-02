<?php

namespace App\Admin\Controllers;

use App\Article;

use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Grid\Filter;
use Encore\Admin\Facades\Admin;
use Encore\Admin\Layout\Content;
use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\ModelForm;

class ArticleController extends Controller
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
            $content->header('文章管理');
            $content->description('文章列表');
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
            $content->header('文章编辑');
            $content->description('');
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
            $content->header('文章创建');
            $content->description('');
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
        return Admin::grid(Article::class, function (Grid $grid) {
            $grid->model()->orderBy('id', 'desc');
            $grid->filter(function(Filter $filter){
                $filter->like('title', '文章标题');
            });
            $grid->disableRowSelector();
            $grid->columns([
                'id' => '文章ID',
                'title' => '文章名称',
                'created_at' => '创建时间',
                'updated_at' => '更新时间',
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
        return Admin::form(Article::class, function (Form $form) {
            $form->display('id', '文章ID');
            $form->text('title', '文章标题');
            $form->ckeditor('content', '文章内容');
            //$form->editor('content', '文章内容');
        });
    }
}
