<?php


namespace app\models;

/**
 * This is the model class for table "subthemes".
 *
 * @property int $id
 * @property int $theme
 */

class Theme extends \yii\db\ActiveRecord
{
    public static function getDb() {
        return \Yii::$app->db2;
    }
    public static function tableName()
    {
        return 'themes';
    }
    public function getSubTheme()
    {
        return $this->hasMany(SubTheme::class, ['theme' => 'id']);
    }
}