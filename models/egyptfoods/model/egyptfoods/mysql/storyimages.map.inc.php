<?php
$xpdo_meta_map['StoryImages']= array (
  'package' => 'farmfrites',
  'version' => '1.1',
  'table' => 'story_images',
  'extends' => 'xPDOSimpleObject',
  'fields' => 
  array (
    'image' => NULL,
    'storyID' => NULL,
    'number' => NULL,
  ),
  'fieldMeta' => 
  array (
    'image' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '250',
      'phptype' => 'string',
      'null' => false,
    ),
    'storyID' => 
    array (
      'dbtype' => 'int',
      'precision' => '11',
      'phptype' => 'integer',
      'null' => false,
    ),
    'number' => 
    array (
      'dbtype' => 'int',
      'precision' => '11',
      'phptype' => 'integer',
      'null' => false,
    ),
  ),
);
