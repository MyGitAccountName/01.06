<?php

/* @var $this yii\web\View */

use yii\helpers\Html;
use \app\models\SubTheme;

$this->registerCssFile('css/contents.css');


$this->title = 'Учебники';


$subthemes = SubTheme::find()->orderBy(['subject' => SORT_ASC, 'theme' => SORT_ASC])->all();




?>
    <div class="site-test">
        <h1>Библиотека учебников</h1>

        <div id="contents">

<?php
$subject = 0;
$theme = 0;

/*    $ss = SubTheme::findOne(3);
    echo "<h1>".$ss->mainTheme->theme."</h1>";*/

foreach ($subthemes as $subtheme):

    if ($subtheme->subject != $subject)
    {
        ($theme = 0);
        if ($subject != 0) {
            echo '</div></div></div>';
            echo '
                <div class="show_all">
				    <div class="contents_item_title">
					    <div class="contents_item_title_inner show_all">
                Показать все
                </div></div></div></div></div></div>';

        }





        echo    '<div class="contents_item">
				        <div class="contents_item_title">
					        <div class="contents_item_title_inner">'.
            $subtheme->subject22->subjectName.
            '</div>
				        </div>
				        <div><div class="contents_item_body">';

        /*				    <div class="item_body">
                Текст внутри блока 1
                </div>*/
        /*</div>*/

        //         echo "<h2>".$subtheme->subject22->subjectName."</h2>";
        $subject = $subtheme->subject;
    }

    if ($subtheme->mainTheme != $theme)
    {
        // echo "<h4>".$subtheme->mainTheme->theme."</h4>";
        if ($theme != 0) echo '</div></div></div>';

        echo    '<div class="contents_item_level2">
				        <div class="contents_item_title_level2">
					        <div class="contents_item_title_inner_level2">'.
            $subtheme->mainTheme->theme.
            '</div>
				        </div>
				        <div><div class="contents_item_body_level2">';
        $theme = $subtheme->mainTheme;
    }
    echo "<a href=".Yii::$app->urlManager->createUrl(['site/chosen', 'type' => 'book', 'subthemeID' => $subtheme->id]).">".$subtheme->subtheme."</a>";

endforeach;

echo	'</div></div></div>
                <div class="show_all">
				    <div class="contents_item_title">
					    <div class="contents_item_title_inner show_all">
						    Показать все
					    </div>
				    </div>
			    </div></div></div></div>';

/*    foreach ($subthemes as $subtheme):
        if ($subtheme->subject != $subject)
        {
            echo "<h2>".$subtheme->subject22->subjectName."</h2>";
            $subject = $subtheme->subject;
        }

        if ($subtheme->mainTheme != $theme)
        {
            echo "<h4>".$subtheme->mainTheme->theme."</h4>";
            $theme = $subtheme->mainTheme;
        }
        echo "<p>".$subtheme->subtheme."</p>";
    endforeach;*/

?>