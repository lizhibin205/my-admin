<?php
namespace App\Admin\Extensions\Form;

use Encore\Admin\Form\Field;

class CKEditor extends Field
{
    public static $js = [
        '/packages/ckeditor_4.10.0_standard/ckeditor/ckeditor.js',
        '/packages/ckeditor_4.10.0_standard/ckeditor/adapters/jquery.js',
    ];
    
    protected $view = 'admin.ckeditor';
    
    public function render()
    {
        $this->script = "$('textarea.{$this->getElementClassString()}').ckeditor();";
        
        return parent::render();
    }
}