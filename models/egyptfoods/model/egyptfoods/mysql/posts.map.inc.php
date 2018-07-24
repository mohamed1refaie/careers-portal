<?php
$xpdo_meta_map['Posts']= array (
  'package' => 'egyptfoods',
  'version' => '1.1',
  'table' => 'posts',
  'extends' => 'xPDOSimpleObject',
  'fields' => 
  array (
    'title' => NULL,
    'experience' => NULL,
    'breif' => NULL,
    'start_date' => NULL,
    'end_date' => NULL,
  ),
  'fieldMeta' => 
  array (
    'title' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '200',
      'phptype' => 'string',
      'null' => false,
    ),
    'experience' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '250',
      'phptype' => 'string',
      'null' => false,
    ),
    'breif' => 
    array (
      'dbtype' => 'text',
      'phptype' => 'string',
      'null' => false,
    ),
    'start_date' => 
    array (
      'dbtype' => 'date',
      'phptype' => 'date',
      'null' => false,
    ),
    'end_date' => 
    array (
      'dbtype' => 'date',
      'phptype' => 'date',
      'null' => false,
    ),
  ),
);
