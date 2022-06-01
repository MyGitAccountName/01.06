<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\widgets\Pjax;

use app\models\Comment;

/* @var $this yii\web\View */
/* @var $model app\models\Comment */
/* @var $form yii\widgets\ActiveForm */


    $session = Yii::$app->session;
    $session->open();

    $userID = $session->get('userID');

/*    $modelFB = new Comment();
    $modelFB->comText = "Отзыв";
    $modelFB->userID = $userID;

    $modelFB->save();*/


    $this->registerJs(
        '$("document").ready(function(){
                $("#new_note").on("pjax:end", function() {
                alert("функция! '.$userID.'");
                $.pjax.reload({container:"#notes"});  //Reload GridView
            });
        });'
    );
?>

<div class="notes-form">
    <?php yii\widgets\Pjax::begin(['id' => 'new_note']) ?>
    <?php $form = ActiveForm::begin(['options' => ['data-pjax' => true]]); ?>

    <?= $form->field($model, 'feedback')->textarea(['rows' => 6])->label('Ваш отзыв:',['class' => 'someClass']) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Добавить') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>
    <?php Pjax::end(); ?>

</div>