<?php
$xpdo_meta_map['NewsTags']= array (
  'package' => 'egyptfoods',
  'version' => '1.1',
  'table' => 'news_tags',
  'extends' => 'xPDOObject',
  'fields' => 
  array (
    'news_id' => NULL,
    'tag_id' => NULL,
  ),
  'fieldMeta' => 
  array (
    'news_id' => 
    array (
      'dbtype' => 'int',
      'precision' => '11',
      'phptype' => 'integer',
      'null' => false,
      'index' => 'pk',
      'generated' => 'native',
    ),
    'tag_id' => 
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
        'news_id' => 
        array (
          'length' => '',
          'collation' => 'A',
          'null' => false,
        ),
      ),
    ),
  ),
);
