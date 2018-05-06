<?php

use yii\db\Migration;

/**
 * Handles the creation of table `tag`.
 */
class m180506_155328_create_tag_table extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->createTable('tag', [
            'id' => $this->primaryKey(),
        ]);
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        $this->dropTable('tag');
    }
}
