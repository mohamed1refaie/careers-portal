<?php
$xpdo_meta_map['ProductPhotos']= array (
  'package' => 'egyptfoods',
  'version' => '1.1',
  'table' => 'product_photos',
  'extends' => 'xPDOSimpleObject',
  'fields' => 
  array (
    'product_id' => NULL,
    'photo' => NULL,
  ),
  'fieldMeta' => 
  array (
    'product_id' => 
    array (
      'dbtype' => 'int',
      'precision' => '11',
      'phptype' => 'integer',
      'null' => false,
    ),
    'photo' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '300',
      'phptype' => 'string',
      'null' => false,
    ),
  ),
);
