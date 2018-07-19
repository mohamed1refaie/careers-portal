<?php
$xpdo_meta_map['Applicants']= array (
  'package' => 'egyptfoods',
  'version' => '1.1',
  'table' => 'applicants',
  'extends' => 'xPDOSimpleObject',
  'fields' => 
  array (
    'first_name' => NULL,
    'last_name' => NULL,
    'email' => NULL,
    'phone' => NULL,
    'department' => NULL,
    'cv' => NULL,
    'message' => NULL,
  ),
  'fieldMeta' => 
  array (
    'first_name' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '250',
      'phptype' => 'string',
      'null' => false,
    ),
    'last_name' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '250',
      'phptype' => 'string',
      'null' => false,
    ),
    'email' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '250',
      'phptype' => 'string',
      'null' => false,
    ),
    'phone' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '13',
      'phptype' => 'string',
      'null' => false,
    ),
    'department' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '250',
      'phptype' => 'string',
      'null' => false,
    ),
    'cv' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '250',
      'phptype' => 'string',
      'null' => false,
    ),
    'message' => 
    array (
      'dbtype' => 'text',
      'phptype' => 'string',
      'null' => false,
    ),
  ),
);
