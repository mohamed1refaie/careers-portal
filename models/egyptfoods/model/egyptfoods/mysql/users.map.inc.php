<?php
$xpdo_meta_map['Users']= array (
  'package' => 'egyptfoods',
  'version' => '1.1',
  'table' => 'users',
  'extends' => 'xPDOSimpleObject',
  'fields' => 
  array (
    'user_name' => NULL,
    'password' => NULL,
    'name' => NULL,
    'email' => NULL,
    'role' => NULL,
  ),
  'fieldMeta' => 
  array (
    'user_name' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '100',
      'phptype' => 'string',
      'null' => false,
    ),
    'password' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '350',
      'phptype' => 'string',
      'null' => false,
    ),
    'name' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '100',
      'phptype' => 'string',
      'null' => false,
    ),
    'email' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '100',
      'phptype' => 'string',
      'null' => false,
    ),
    'role' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '30',
      'phptype' => 'string',
      'null' => false,
    ),
  ),
);
