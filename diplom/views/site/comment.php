<?php

/* @var $this yii\web\View */

use yii\helpers\Html;
use yii\widgets\Pjax;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\CommentSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
/* @var $model app\models\Comment*/

$this->registerCssFile("css/menu.css");

$this->title = 'Отзывы';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="site-test">
    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form',[
        'model' => $model,
    ]) ?>

    <?php Pjax::begin(['id' => 'notes']) ?>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'feedback:ntext',
            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
    <?php Pjax::end() ?>

</div>
