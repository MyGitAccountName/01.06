<?php


namespace app\components;

use app\widgets\Alert;
use yii\base\Widget;
use yii;

class TestResult extends Widget
{
    public $test;
    public $user;
    public $size;
    public $rAnswers;
    public $score;
    public $t;

    public function init()
    {
        parent::init();

    }

    public function run()
    {
        echo '<script type="text/javascript">
            function getRAnswers() {
                return +(document.getElementById("resSpan").innerHTML);       
            }
        </script>';


        $this->rAnswers = '<script type="text/javascript">
            function getRAnswers() {
                return document.getElementById("resSpan").innerHTML;
            }
            getRAnswers();
        </script>';

        echo '<span>tmp: '.$this->rAnswers.'</span>';


        $this->score = '<script type="text/javascript">
            function getScore($size) {
                let $rAnswers = +(document.getElementById("resSpan").innerHTML);
                
                let $t = $rAnswers/$size;            
                switch ($t = $rAnswers/$size) {
                    case  ($t < 0.2):
                        return 1;
                    case  ($t < 0.5):
                        return 2;   
                    case  ($t < 0.75):
                        return 3;
                    case  ($t < 0.9):
                        return 4;
                    case  ($t <= 1):
                        return 5;
                }
            }
            getScore('.$this->size.');
        </script>';




        $this->t = (int)($this->rAnswers)/(int)($this->size);
/*        switch ($this->t = (int)($this->rAnswers)/(int)($this->size)) {
            case  ($this->t < 0.2):
                $this->score = 1;
                break;
            case  ($this->t < 0.5):
                $this->score = 2;
                break;
            case  ($this->t < 0.75):
                $this->score = 3;
                break;
            case  ($this->t < 0.9):
                $this->score = 4;
                break;
            case  ($this->t <= 1):
                $this->score = 5;
                break;
        }*/

        echo 't = '.$this->t;

        echo '<div id="result" hidden>

            Количество правильных ответов: 
            <span id="resSpan">0</span>  из '.$this->size.'
            <span>Оценка: '.$this->score.'</span>
        </div>';



    }
}