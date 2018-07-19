<?php
$xpdo_meta_map['Stories']= array (
  'package' => 'farmfrites',
  'version' => '1.1',
  'table' => 'stories',
  'extends' => 'xPDOSimpleObject',
  'fields' => 
  array (
    'title' => NULL,
    'image' => NULL,
    'created_at' => 'CURRENT_TIMESTAMP',
    'updated_at' => '0000-00-00 00:00:00',
    'updated_by' => NULL,
  ),
  'fieldMeta' => 
  array (
    'title' => 
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
      'precision' => '150',
      'phptype' => 'string',
      'null' => false,
    ),
  ),
);
