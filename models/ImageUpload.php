<?php

namespace app\models;

use Yii;
use yii\base\Model;
use yii\web\UploadedFile;

class ImageUpload extends Model
{
    public $image;

    /**
     * @return array
     */
    public function rules()
    {
        return [
            [['image'], 'required'],
            [['image'], 'file', 'extensions' => 'jpg,png']
        ];
    }

    /**
     * Загружаю картинку, при этом проходит валидацию и удаляет, если картинка уже существует на сервере
     * @param UploadedFile $file
     * @param $currentImage
     * @return string
     */
    public function uploadFile(UploadedFile $file, $currentImage)
    {
        $this->image = $file;

        if ($this->validate()) {
            $this->deleteCurrentImage($currentImage);
            return $this->saveImage();
        }
    }

    /**
     * Получить путь для загрузки картинки
     * @return string
     */
    public function getFolder()
    {
        return Yii::getAlias('@web') . 'uploads/';
    }

    /**
     * Меняю название картинки
     * @return string
     */
    public function generateFileName()
    {
        return strtolower(md5(uniqid($this->image->baseName)) . '.' . $this->image->extension);
    }

    /**
     * Удалить картинку, если картинка существует на сервере
     * @param $currentImage
     */
    public function deleteCurrentImage($currentImage)
    {
        if ($this->fileExists($currentImage)) {
            unlink($this->getFolder() . $currentImage);
        }
    }

    /**
     * Проверка, существует ли данный файл с таким же названием
     * @param $currentImage
     * @return bool
     */
    public function fileExists($currentImage)
    {
        if (!empty($currentImage) && $currentImage != null) {
            return file_exists($this->getFolder() . $currentImage);
        }
    }

    /**
     *  Загружаю картинку на сервер в директорию
     */
    public function saveImage()
    {
        $filename = $this->generateFilename();
        $this->image->saveAs($this->getFolder() . $filename);
        return $filename;
    }
}