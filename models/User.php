<?php

namespace app\models;

use Yii;
use yii\db\ActiveRecord;
use yii\web\IdentityInterface;

/**
 * This is the model class for table "user".
 *
 * @property int $id
 * @property string $name
 * @property string $email
 * @property string $password
 * @property int $isAdmin
 * @property string $photo
 *
 * @property Comment[] $comments
 */
class User extends ActiveRecord implements IdentityInterface
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'user';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['isAdmin'], 'integer'],
            [['name', 'email', 'password', 'photo'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'Name',
            'email' => 'Email',
            'password' => 'Password',
            'isAdmin' => 'Is Admin',
            'photo' => 'Photo',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getComments()
    {
        return $this->hasMany(Comment::className(), ['user_id' => 'id']);
    }

    /**
     * Возвращает пользователя по id
     * @param int|string $id
     * @return null|static
     */
    public static function findIdentity($id)
    {
        return User::findOne($id);
    }

    public static function findIdentityByAccessToken($token, $type = null)
    {
        // TODO: Implement findIdentityByAccessToken() method.
    }

    /**
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    public function getAuthKey()
    {
        // TODO: Implement getAuthKey() method.
    }

    public function validateAuthKey($authKey)
    {
        // TODO: Implement validateAuthKey() method.
    }


    /**
     * Вытаскиваем пользователя
     * @param $email
     * @return array|null|ActiveRecord
     */
    public static function findByEmail($email)
    {
        return User::find()->where(['email' => $email])->one();
    }

    /**
     * Проверяем пароли
     * @param $password
     * @return bool
     */
    public function validatePassword($password)
    {
        return ($this->password == $password) ? true : false;
    }

    /**
     * Сохранить в базу
     * @return bool
     */
    public function create()
    {
        return $this->save(false);
    }

    /**
     * Получаем данные из вк и добавляем в БД
     */
    public function saveFromVk($uid, $name, $photo)
    {
        $user = User::findOne($uid);
        if ($user) {
            return Yii::$app->user->login($user);
        }

        $this->id = $uid;
        $this->name = $name;
        $this->photo = $photo;
        $this->create();

        return Yii::$app->user->login($this);
    }

    public function getImage()
    {
        return $this->photo;
    }
}
