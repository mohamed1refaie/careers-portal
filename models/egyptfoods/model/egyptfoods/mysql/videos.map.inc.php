<?php
$xpdo_meta_map['Videos']= array (
  'package' => 'egyptfoods',
  'version' => '1.1',
  'table' => 'videos',
  'extends' => 'xPDOSimpleObject',
  'fields' => 
  array (
    'title_ar' => NULL,
    'title_en' => NULL,
    'video_url' => NULL,
    'video_image' => NULL,
    'created_by' => NULL,
    'updated_by' => NULL,
    'created_at' => 'CURRENT_TIMESTAMP',
    'updated_at' => '0000-00-00 00:00:00',
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
    'video_url' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '350',
      'phptype' => 'string',
      'null' => false,
    ),
    'video_image' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '250',
      'phptype' => 'string',
      'null' => false,
    ),
    'created_by' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '150',
      'phptype' => 'string',
      'null' => false,
    ),
    'updated_by' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '150',
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
  ),
);
