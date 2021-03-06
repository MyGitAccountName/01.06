<?php



namespace app\components;

use app\models\Subject;
use yii\base\Widget;
use app\models\Test;
use app\models\Book;
use app\models\SubTheme;
use yii;


class Materials extends Widget
{
    public $subject;
    public $subthemeID;
    public $begin;
    public $subjectName;
    public $type;
    public $materials;

    public function init()
    {
        parent::init(); // TODO: Change the autogenerated stub

        switch ($this->subject) {
            case 1:
            case 2:
            case 3:
            case 10:
            {
                $this->begin = 1;
                break;
            }
            case 5:
            {
                $this->begin = 2;
                break;
            }
            case 4:
            {
                $this->begin = 3;
                break;
            }
            case 11:
            {
                $this->begin = 4;
                break;
            }
            case 8:
            case 9:
            {
                $this->begin = 5;
                break;
            }
            case 6:
            {
                $this->begin = 6;
                break;
            }
            case 7:
            {
                $this->begin = 7;
                break;
            }
        }
    }

    public function select($chosenType) {
        if ($this->subthemeID) {
            $catalog = SubTheme::findOne($this->subthemeID);
        }
        else if ($this->subject) {
      //      $catalog = Subject::findOne($this->subject);

            $catalog = Subject::find()->where(['id'=> $this->subject])->one();
        }

  //     $materialSubject = Subject::findOne($materialSubtheme->subject);
        switch ($chosenType) {
            case NULL:
            {
                //$tests = $catalog->getTest()->where('theme1 = 2')->all();
                $tests = $catalog->getTest()->all();
                $books = $catalog->getBook()->all();

                //$tests = Test::find()->where('theme1 = 2')->all();

                return array_merge($tests,$books);
            }

            case 'test':
            {
                return $catalog->getTest()->all();
            }

            case 'book':
            {
                return $catalog->getBook()->all();
            }

        }
    }

    public function run()
    {
        echo '<div id="materials" class="w-100 justify-content-center">';

        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
/*        for ($i = $this->begin; $i <= 11; $i++) {
            echo '<a href="#" class="item test"><span class="classNum">' . $i . '</span><span>??????????</span></a>';
        }*/



        /*
                //$tests = Test::find()->all();
                $tests = Test::find()->where('subject = ' . $this->subject)->all();
                foreach ($tests as $test):
                    echo '<a href="#" class="item test"><span>' . $test->name . '</span><p>' . $test->theme13->subtheme . '</p></a>';
                endforeach;

                echo '</div>';*/

        //$tests = Test::find()->where('subject = ' . $this->subject)->all();


/*    foreach ($tests as $test):
        echo '<a href="'.Yii::$app->urlManager->createUrl(['test/test', 'id' => $test->id]).'" class="item test"><p class="testName">' . $test->name . '</p>';
        echo '<p class="testClass">' . $test->class . ' ??????????</p>';
        foreach ($test->theme13 as $theme):
            echo '<span>'.$theme->subtheme.'</span><br>';
        endforeach;
        echo '</a>';
    endforeach;*/

       // $books = Book::find()->where('subject = ' . $this->subject)->all();







/*        $materialSubject = Subject::findOne($this->subject);

        $tests = $materialSubject->getTest()->all();
        $books = $materialSubject->getBook()->all();*/






      //  print_r($b);

       // $books1 = Book::find()->subject2(1)->all();
   //     $books = Book::find()->all();

/*    foreach ($books as $book):
        echo '<a href="'.Yii::$app->urlManager->createUrl(['test/test', 'id' => $book->id]).'" class="item book"><p class="bookName">' . $book->name . '</p>';
        //echo '<p class="testSubject">' . $this->subjectName . '</p>';
        //var_dump($test->subject1);
        echo '<p class="testClass">' . $book->class . ' ??????????</p>';
        foreach ($book->theme13 as $theme):
            echo '<span>'.$theme->subtheme.'</span><br>';
        endforeach;
        echo '</a>';
    endforeach;*/


 //   $materials = array_merge($tests,$books);


        $materials = $this->select($this->type);

        if (!$materials) echo "?????? ???????????????????? ???? ???????????? ????????";
        else {

            shuffle($materials);
            // print_r($materials);
            foreach ($materials as $material):
                $id = $material->id;
                $name = $material->name;
                $type = $material->returnType();

                if ($type === 'book') $a = 'site/book';
                else $a = 'test/test';
                //echo $material->name;
                echo '<a href="' . Yii::$app->urlManager->createUrl([$a, 'id' => $id]) . '" class="item ' . $type . '"><p class="' . $type . 'Name">' . $name . '</p>';

                echo '<p class="testClass">' . $material->class . ' ??????????</p>';
                foreach ($material->theme13 as $theme):
                    echo '<span>' . $theme->subtheme . '</span><br>';
                endforeach;
                echo '</a>';
            endforeach;
        }

    echo '</div>';
    }
}







