<?php

/* @var $this yii\web\View */

use yii\helpers\Html;

$this->title = 'О проекте';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="site-about">
    <h1><?= Html::encode($this->title) ?></h1>

    <p>
		НЕ ТУПИ - платформа, предназначенная для прокачки мозгов как её пользователей, так и создателей.
    </p>

    <button id="testBut">Нажать</button>
</div>

<?php
/*$js = <<<JS
   $("#testBut").on("click", function(e) {
         $.ajax({
         	url : "index.php?r=site/about",
         	type : "POST",
         	data : {dat : "qwe"},
         	success : function(res){
         		console.log(res);
        },
      error : function(){
        alert("Ошибка при отправке данных: перезагрузите страницу!");
      }
         })
          return false;
      })');
*/?>



<!--$js = <<<JS-->
<!--<script type="text/javascript">
    $(document).ready(function() {
    $('#testBut').on('click', function(){
        $.ajax({
            type: 'POST',
            url: "<site/about",
            dataType: 'text',
            data: {
                test: '123',
                _csrf: '<?/*=Yii::$app->request->getCsrfToken()*/?>'
            },


            success: function (res) {
                console.log(res);
                alert("yes!!!");
            },
            error: function (res) {
                console.log(res);
                alert("No!!!");
            }
        });
        return false;
    });
    });
</script>-->
<!--/*JS;-->

<!--$this->registerJs($js);*/-->
