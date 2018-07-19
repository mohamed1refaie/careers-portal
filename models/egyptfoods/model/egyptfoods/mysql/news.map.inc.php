<?php
$xpdo_meta_map['News']= array (
  'package' => 'egyptfoods',
  'version' => '1.1',
  'table' => 'news',
  'extends' => 'xPDOSimpleObject',
  'fields' => 
  array (
    'name_ar' => NULL,
    'name_en' => NULL,
    'intro_ar' => NULL,
    'intro_en' => NULL,
    'image' => NULL,
    'description_ar' => NULL,
    'description_en' => NULL,
    'featured' => NULL,
    'publish_date' => NULL,
    'created_at' => 'CURRENT_TIMESTAMP',
    'updated_at' => '0000-00-00 00:00:00',
    'created_by' => NULL,
    'updated_by' => NULL,
  ),
  'fieldMeta' => 
  array (
    'name_ar' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '250',
      'phptype' => 'string',
      'null' => false,
    ),
    'name_en' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '250',
      'phptype' => 'string',
      'null' => false,
    ),
    'intro_ar' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '350',
      'phptype' => 'string',
      'null' => false,
    ),
    'intro_en' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '350',
      'phptype' => 'string',
      'null' => false,
    ),
    'image' => 
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
    'featured' => 
    array (
      'dbtype' => 'tinyint',
      'precision' => '2',
      'phptype' => 'integer',
      'null' => false,
    ),
    'publish_date' => 
    array (
      'dbtype' => 'date',
      'phptype' => 'date',
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
    'created_by' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '100',
      'phptype' => 'string',
      'null' => false,
    ),
    'updated_by' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '100',
      'phptype' => 'string',
      'null' => false,
    ),
  ),
);
