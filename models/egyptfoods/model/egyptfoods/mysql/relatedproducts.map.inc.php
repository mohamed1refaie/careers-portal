<?php
$xpdo_meta_map['RelatedProducts']= array (
  'package' => 'egyptfoods',
  'version' => '1.1',
  'table' => 'related_products',
  'extends' => 'xPDOObject',
  'fields' => 
  array (
    'main_product_id' => NULL,
    'related_product_id' => NULL,
  ),
  'fieldMeta' => 
  array (
    'main_product_id' => 
    array (
      'dbtype' => 'int',
      'precision' => '11',
      'phptype' => 'integer',
      'null' => false,
      'index' => 'pk',
      'generated' => 'native',
    ),
    'related_product_id' => 
    array (
      'dbtype' => 'int',
      'precision' => '11',
      'phptype' => 'integer',
      'null' => false,
    ),
  ),
  'indexes' => 
  array (
    'PRIMARY' => 
    array (
      'alias' => 'PRIMARY',
      'primary' => true,
      'unique' => true,
      'type' => 'BTREE',
      'columns' => 
      array (
        'main_product_id' => 
        array (
          'length' => '',
          'collation' => 'A',
          'null' => false,
        ),
      ),
    ),
  ),
);
