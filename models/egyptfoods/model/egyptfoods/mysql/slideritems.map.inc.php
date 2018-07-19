<?php
$xpdo_meta_map['SliderItems']= array (
  'package' => 'egyptfoods',
  'version' => '1.1',
  'table' => 'slider_items',
  'extends' => 'xPDOSimpleObject',
  'fields' => 
  array (
    'title_ar' => NULL,
    'title_en' => NULL,
    'image' => NULL,
    'thumb_image' => NULL,
    'description_ar' => NULL,
    'description_en' => NULL,
    'created_by' => NULL,
    'updated_by' => NULL,
    'created_at' => 'CURRENT_TIMESTAMP',
    'updated_at' => NULL,
  ),
  'fieldMeta' => 
  array (
    'title_ar' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '250',
      'phptype' => 'string',
      'null' => false,
    ),
    'title_en' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '250',
      'phptype' => 'string',
      'null' => false,
    ),
    'image' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '250',
      'phptype' => 'string',
      'null' => false,
    ),
    'thumb_image' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '250',
      'phptype' => 'string',
      'null' => false,
    ),
    'description_ar' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '350',
      'phptype' => 'string',
      'null' => false,
    ),
    'description_en' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '350',
      'phptype' => 'string',
      'null' => false,
    ),
    'created_by' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '250',
      'phptype' => 'string',
      'null' => false,
    ),
    'updated_by' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '250',
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
      'extra' => 'on update current_timestamp',
    ),
  ),
);
