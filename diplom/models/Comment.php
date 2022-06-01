<?php


namespace app\models;
use Yii;
use \yii\db\ActiveRecord;


class Comment extends ActiveRecord
{
/*    public $id;
    public $comText;
    public $userID;*/


    public static function getDb() {
        return \Yii::$app->db;
    }
    public static function tableName()
    {
        return 'feedbacks';
    }

    public function getUser() {
        return $this->hasOne(User::class, ['id' => 'user_id'])
            ->viaTable('users_feedbacks', ['feedback_id' => 'id']);
    }
}