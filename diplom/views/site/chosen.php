<?php

/* @var $this yii\web\View */
/* @var $type string */
/* @var $subthemeID int */

use yii\helpers\Html;
use app\components\Materials;

$this->title = '$subject';
$this->registerCssFile("css/site.css");
$this->registerCssFile("css/subjects.css");

//$type = 'test'; //////////////////////////////


$subthemeID = Yii::$app->request->get('subthemeID');
?>

<div class="chosen">
    <div class="subjectContent">
   <!-- --><?/*= Materials::widget(['type'=>$type, 'subthemeID' => $subthemeid]);*/?>
    <?= Materials::widget(['type'=>$type, 'subthemeID' => $subthemeID]);?>
    </div>
</div>
