<?php

namespace app\controllers;

use app\models\Article;
use app\models\Category;
use Yii;
use yii\data\Pagination;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\web\Response;
use yii\filters\VerbFilter;
use app\models\LoginForm;
use app\models\ContactForm;

class SiteController extends Controller
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['logout'],
                'rules' => [
                    [
                        'actions' => ['logout'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }

    /**
     * Displays homepage.
     *
     * @return string
     */
    public function actionIndex()
    {
        # Вывод всех статей
        $data = Article::getAll(1);
        # Вывод популярных статей в сайдбаре
        $popular = Article::getPopular();
        # Вывод последних статей
        $recent = Article::getRecent();
        # Вывод всех категорий
        $categories = Category::getAll();

        return $this->render('index', [
            'articles' => $data['articles'],
            'pagination' => $data['pagination'],
            'popular' => $popular,
            'recent' => $recent,
            'categories' => $categories,
        ]);
    }

    /**
     * Login action.
     *
     * @return Response|string
     */
    public function actionLogin()
    {
        if (!Yii::$app->user->isGuest) {
            return $this->goHome();
        }

        $model = new LoginForm();
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            return $this->goBack();
        }

        $model->password = '';
        return $this->render('login', [
            'model' => $model,
        ]);
    }

    /**
     * Logout action.
     *
     * @return Response
     */
    public function actionLogout()
    {
        Yii::$app->user->logout();

        return $this->goHome();
    }

    /**
     * Displays contact page.
     *
     * @return Response|string
     */
    public function actionContact()
    {
        $model = new ContactForm();
        if ($model->load(Yii::$app->request->post()) && $model->contact(Yii::$app->params['adminEmail'])) {
            Yii::$app->session->setFlash('contactFormSubmitted');

            return $this->refresh();
        }
        return $this->render('contact', [
            'model' => $model,
        ]);
    }

    /**
     * Displays about page.
     *
     * @return string
     */
    public function actionAbout()
    {
        return $this->render('about');
    }

    /**
     * Страница одной статьи
     * @param $id
     * @return string
     */
    public function actionView($id)
    {
        # Получить из базы статью
        $article = Article::findOne($id);
        # Вывод популярных статей в сайдбаре
        $popular = Article::getPopular();
        # Вывод последних статей
        $recent = Article::getRecent();
        # Вывод всех категорий
        $categories = Category::getAll();

        return $this->render('single', [
            'article' => $article,
            'popular' => $popular,
            'recent' => $recent,
            'categories' => $categories,
        ]);
    }

    public function actionCategory($id)
    {
        $data = Category::getArticlesByCategory($id);
        # Вывод популярных статей в сайдбаре
        $popular = Article::getPopular();
        # Вывод последних статей
        $recent = Article::getRecent();
        # Вывод всех категорий
        $categories = Category::getAll();

        return $this->render('category', [
            'articles' => $data['articles'],
            'pagination' => $data['pagination'],
            'popular' => $popular,
            'recent' => $recent,
            'categories' => $categories,
        ]);
    }
}
