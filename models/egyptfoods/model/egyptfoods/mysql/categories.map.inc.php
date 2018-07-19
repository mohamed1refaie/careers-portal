<?php
$xpdo_meta_map['Categories']= array (
  'package' => 'egyptfoods',
  'version' => '1.1',
  'table' => 'categories',
  'extends' => 'xPDOSimpleObject',
  'fields' => 
  array (
    'name_ar' => NULL,
    'name_en' => NULL,
    'description_ar' => NULL,
    'description_en' => NULL,
    'created_at' => 'CURRENT_TIMESTAMP',
    'updated_at' => '0000-00-00 00:00:00',
    'updated_by' => NULL,
  ),
  'fieldMeta' => 
  array (
    'name_ar' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '300',
      'phptype' => 'string',
      'null' => false,
    ),
    'name_en' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '300',
      'phptype' => 'string',
      'null' => false,
    ),
    'description_ar' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '300',
      'phptype' => 'string',
      'null' => false,
    ),
    'description_en' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '300',
      'phptype' => 'string',
      'null' => false,
    ),
    'created_at' => 
    array (
      'dbtype' => 'datetime',
      'phptype' => 'datetime',
      'null' => false,
      'default' => 'CURRENT_TIMESTAMP',
    ),
    'updated_at' => 
    array (
      'dbtype' => 'datetime',
      'phptype' => 'datetime',
      'null' => false,
      'default' => '0000-00-00 00:00:00',
      'extra' => 'on update current_timestamp',
    ),
    'updated_by' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '200',
      'phptype' => 'string',
      'null' => false,
    ),
  ),
);
