<?php
if (!isset($_SESSION)) session_start();
require_once('AdminUsersHelper.php');

class CreatePostHelper extends BaseHelper
{

    public function Add() 
    {
      global $xpdo;

      $title                    = $_POST['title'];
      $experience               = $_POST['experience'];
      $breif                    = $_POST['breif'];
      $start_date               = $_POST['start_date'];
      $end_date                 = $_POST['end_date'];
      $posts = $xpdo->newObject('Posts');
      $fields['title']     = $title;
      $fields['experience']     = $experience;
      $fields['breif']         = $breif;
      $fields['start_date']         = $start_date;
      $fields['end_date']         = $end_date;
      $posts->fromArray($fields);
      $posts->save();

    }

    public function GetAll()
    {
       global $xpdo;

          $query = $xpdo->newQuery('Departments');
          $query->sortby('created_at', 'DESC');

          $pagesCount = $xpdo->getCount('Departments', $query); 
          $limit = 20;
          $totalpages  = ceil($pagesCount / $limit);

          if (isset($_POST['currentpage']) && is_numeric($_POST['currentpage'])) {
            $currentpage = (int) $_POST['currentpage'];
          } else {
                  $currentpage = 1;
          }

          if ($currentpage > $totalpages) {
                  $currentpage = $totalpages;
          }

              if ($currentpage < 1) {
                  $currentpage = 1;
          }

          $offset = ($currentpage - 1) * $limit;

          $query->limit($limit, $offset);

          $allObj = $xpdo->getCollection('Departments' ,$query);

          $output = '';

          if (empty($allObj)) {
              $output .= new LoadChunk('no-data','admin/master', array(), '../');
          }

          foreach($allObj as $currObj)
          { 
              $output .= new LoadChunk('department', 'admin/departments', array(
                                                'totalPages'     =>  $totalpages,
                                                'name_en'        =>  $currObj->Get('name_en'),
                                                'name_ar'        =>  $currObj->Get('name_ar'),
                                                'currID'         =>  $currObj->Get('id')
                                            ),'../');
          }
          return $output;
    }

    public function GetDepartment()
    { 
      global $xpdo;

      if(isset($_POST['currID'])) {
    
        $department_id = $_POST['currID'];
        $department = $xpdo->getObject('Departments', array('id' => $department_id));

        return json_encode($department->toArray());
      }
    }

    public function EditDepartment()
    {
      global $xpdo;

      $department = $xpdo->getObject('Departments', array('id' => $_POST['itemID']));

      $fields = array(
                      'name_ar'        => $_POST['edit_name_ar'],
                      'name_en'        => $_POST['edit_name_en'],
                      'updated_by'     => $_SESSION['AdminUser']['name']
                      );

      $department->fromArray($fields);

      return  $department->save();
    }

    public function DeleteDepartment()
    {
      global $xpdo;
      if(isset($_POST['currID']))
      {
        $department   = $xpdo->getObject('Departments', array('id' => $_POST['currID']));
        
        return $department->remove();
      }
    }
	
}