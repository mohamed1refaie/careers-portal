<?php
$xpdo_meta_map['MembersBoard']= array (
  'package' => 'egyptfoods',
  'version' => '1.1',
  'table' => 'members_board',
  'extends' => 'xPDOSimpleObject',
  'fields' => 
  array (
    'member_name_ar' => NULL,
    'member_name_en' => NULL,
    'job_title_ar' => NULL,
    'job_title_en' => NULL,
    'job_description_ar' => NULL,
    'job_description_en' => NULL,
    'image' => NULL,
    'facebook_url' => NULL,
    'twitter_url' => NULL,
    'linked_url' => NULL,
    'instagram_url' => NULL,
    'created_at' => 'CURRENT_TIMESTAMP',
    'updated_at' => '0000-00-00 00:00:00',
    'created_by' => NULL,
    'updated_by' => NULL,
  ),
  'fieldMeta' => 
  array (
    'member_name_ar' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '250',
      'phptype' => 'string',
      'null' => false,
    ),
    'member_name_en' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '250',
      'phptype' => 'string',
      'null' => false,
    ),
    'job_title_ar' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '250',
      'phptype' => 'string',
      'null' => false,
    ),
    'job_title_en' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '250',
      'phptype' => 'string',
      'null' => false,
    ),
    'job_description_ar' => 
    array (
      'dbtype' => 'text',
      'phptype' => 'string',
      'null' => false,
    ),
    'job_description_en' => 
    array (
      'dbtype' => 'text',
      'phptype' => 'string',
      'null' => false,
    ),
    'image' => 
    array (
      'dbtype' => 'varchar',
      'precision' => '350',
      'phptype' => 'string',
      'null' => false,
    ),
    'facebook_url' => 
    array (
      'dbtype' => 'text',
      'phptype' => 'string',
      'null' => false,
    ),
    'twitter_url' => 
    array (
      'dbtype' => 'text',
      'phptype' => 'string',
      'null' => false,
    ),
    'linked_url' => 
    array (
      'dbtype' => 'text',
      'phptype' => 'string',
      'null' => false,
    ),
    'instagram_url' => 
    array (
      'dbtype' => 'text',
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
  ),
);
