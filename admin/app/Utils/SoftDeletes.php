<?php
namespace App\Utils;

trait SoftDeletes
{
    /**
     * Boot the soft deleting trait for a model.
     *
     * @return void
     */
    public static function bootSoftDeletes()
    {
        static::addGlobalScope(new SoftDeletingScope);
    }

    /**
     * Get the name of the "deleted at" column.
     * 返回软删除的标记字段
     * @return string
     */
    public function getDeletedAtColumn()
    {
        return 'is_deleted';
    }

    /**
     * Get the fully qualified "deleted at" column.
     * 获取删除字段名称，qualifyColumn会只能补充表的名称
     * @return string
     */
    public function getQualifiedDeletedAtColumn()
    {
        return $this->qualifyColumn($this->getDeletedAtColumn());
    }

    /**
     * Perform the actual delete query on this model instance.
     *
     * @return mixed
     */
    protected function performDeleteOnModel()
    {
        return $this->runSoftDelete();
    }

    /**
     * Perform the actual delete query on this model instance.
     *
     * @return void
     */
    protected function runSoftDelete()
    {
        $query = $this->newModelQuery()->where($this->getKeyName(), $this->getKey());

        $columns = [$this->getDeletedAtColumn() => 1];
        if ($query->update($columns)) {
            $this->syncOriginal();
        }
    }
}