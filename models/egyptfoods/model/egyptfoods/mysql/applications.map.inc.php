<?php
$xpdo_meta_map['Applications']= array (
  'package' => 'egyptfoods',
  'version' => '1.1',
  'table' => 'applications',
  'extends' => 'xPDOSimpleObject',
  'fields' => 
  array (
    'name' => NULL,
    'post_id' => NULL,
    'university' => NULL,
    'birthdate' => NULL,
    'email' => NULL,
    'cv' => NULL,
    'notes' => NULL,
  ),
  'fieldMeta' => 
  array (
    'name' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '300',
      'phptype' => 'string',
      'null' => false,
    ),
    'post_id' => 
    array (
      'dbtype' => 'int',
      'precision' => '11',
      'phptype' => 'integer',
      'null' => false,
    ),
    'university' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '300',
      'phptype' => 'string',
      'null' => false,
    ),
    'birthdate' => 
    array (
      'dbtype' => 'date',
      'phptype' => 'date',
      'null' => false,
    ),
    'email' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '300',
      'phptype' => 'string',
      'null' => false,
    ),
    'cv' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '300',
      'phptype' => 'string',
      'null' => false,
    ),
    'notes' => 
    array (
      'dbtype' => 'text',
      'phptype' => 'string',
      'null' => false,
    ),
  ),
);
