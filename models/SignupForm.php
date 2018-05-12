<?php

namespace app\models;

use yii\base\Model;

Class SignupForm extends Model
{
    public $name;
    public $email;
    public $password;

    public function rules()
    {
        return [
            [['name', 'email', 'password'], 'required'],
            [['name'], 'string'],
            [['email'], 'email'],
            [['email'], 'unique', 'targetCLass' => 'app\models\User', 'targetAttribute' => 'email'],
        ];
    }
}