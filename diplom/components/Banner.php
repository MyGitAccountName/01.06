<?php


namespace app\components;


use yii\base\Widget;
use yii\helpers\Html;

class Banner extends Widget
{
    public $subject;
    public $view = 'ruBanner';

    public function init()
    {
        parent::init(); // TODO: Change the autogenerated stub

        switch ($this->subject) {
            case 1: { $this->view = 'ruBanner'; break; }
            case 2: { $this->view = 'litBanner'; break; }
            case 3: { $this->view = 'mathBanner'; break; }
            case 7: { $this->view = 'chimBanner'; break; }
        }
    }
    public function run()
    {
        return $this->render($this->view);
    }
}