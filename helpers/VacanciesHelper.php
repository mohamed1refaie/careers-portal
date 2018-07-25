<?php
if (!isset($_SESSION)) session_start();
require_once('AdminUsersHelper.php');

class VacanciesHelper extends BaseHelper
{

    // Add Member
    public function Add() 
    {
      global $xpdo;

      $title_ar               = $_POST['title_ar'];
      $title_en               = $_POST['title_en'];
      $description_en         = $_POST['description_en'];
      $description_ar         = $_POST['description_ar'];
      $required_skills_ar     = $_POST['required_skills_ar'];
      $required_skills_en     = $_POST['required_skills_en'];
      $government_id          = $_POST['governmentID'];
      $department_id          = $_POST['departmentID'];
      $typeID                = $_POST['typeID'];

      $member_obj = $xpdo->newObject('Vacancies');

      $fields['title_ar']           = $title_ar;
      $fields['title_en']           = $title_en;
      $fields['description_en']     = $description_en;
      $fields['description_ar']     = $description_ar;
      $fields['required_skills_ar'] = $required_skills_ar;
      $fields['required_skills_en'] = $required_skills_en;
      $fields['government_id']      = $government_id;
      $fields['department_id']      = $department_id;

      if (!empty($typeID) && $typeID == 1) {
        $fields['type_en'] = "Full Time";
        $fields['type_ar'] = "دوام كامل";
      }
      elseif (!empty($typeID) && $typeID == 2) {
        $fields['type_en'] = "Part Time";
        $fields['type_ar'] = "دوام مؤقت";
      }
      
      $fields['updated_by']         = $_SESSION['AdminUser']['name'];
      $fields['created_by']         = $_SESSION['AdminUser']['name'];

      $member_obj->fromArray($fields);
      $member_obj->save();

    }

    public function GetAll()
    {
       global $xpdo;

          $query = $xpdo->newQuery('Vacancies');
          $query->sortby('created_at', 'DESC');

          $pagesCount = $xpdo->getCount('Vacancies', $query); 
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

          $allObj = $xpdo->getCollection('Vacancies' ,$query);

          $output = '';

          if (empty($allObj)) {
              $output .= new LoadChunk('no-data','admin/master', array(), '../');
          }

          foreach($allObj as $currObj)
          { 
              $output .= new LoadChunk('vacancy', 'admin/vacancies', array(
                                                'totalPages'     =>  $totalpages,
                                                'name_en'        =>  $currObj->Get('title_en'),
                                                'name_ar'        =>  $currObj->Get('title_ar'),
                                                'currID'         =>  $currObj->Get('id')
                                            ),'../');
          }
          return $output;
    }

    public function GetVacancy()
    { 
      global $xpdo;

      if(isset($_POST['currID'])) {
    
        $vacancy_id     = $_POST['currID'];
        $vacancy        = $xpdo->getObject('Vacancies', array('id' => $vacancy_id));
        return json_encode($vacancy->toArray());
      }
    }

    public function EditVacancy()
    {
      global $xpdo;
      
      $vacancy = $xpdo->getObject('Vacancies', array('id' => $_POST['itemID']));

      $fields = array(
                      'title_ar'            => $_POST['edit_title_ar'],
                      'title_en'            => $_POST['edit_title_en'],
                      'description_en'      => $_POST['edit_description_en'],
                      'description_ar'      => $_POST['edit_description_ar'],
                      'required_skills_ar'  => $_POST['edit_required_skills_ar'],
                      'required_skills_en'  => $_POST['edit_required_skills_en'],
                      'government_id'       => $_POST['governmentID'],
                      'department_id'       => $_POST['departmentID'],
                      'updated_by'          => $_SESSION['AdminUser']['name']
                      );

      $typeID = $_POST['typeID'];

      if (!empty($typeID) && $typeID == 1) {
        $fields['type_en'] = "Full Time";
        $fields['type_ar'] = "دوام كامل";
      }
      elseif (!empty($typeID) && $typeID == 2) {
        $fields['type_en'] = "Part Time";
        $fields['type_ar'] = "دوام مؤقت";
      }

      $vacancy->fromArray($fields);

      return  $vacancy->save();
    }

    public function EditPost()
    {
      global $xpdo;
      
      $post = $xpdo->getObject('Posts', array('id' => $_POST['id']));
      echo $_POST['id'];
      echo $_POST['title'];
      $fields = array(
                      'title'         => $_POST['title'],
                      'experience'    => $_POST['experience'],
                      'breif'         => $_POST['breif'],
                      'start_date'    => $_POST['start_date'],
                      'end_date'      => $_POST['end_date']
                      );

      $post->fromArray($fields);
      return  $post->save();
    }

    public function DeleteVacancy()
    {
      global $xpdo;
      if(isset($_POST['currID']))
      {
        $vacancy   = $xpdo->getObject('Vacancies', array('id' => $_POST['currID']));
        
        return $vacancy->remove();
      }
    }

    public function DeletePost($id)
    {
      global $xpdo;
      
        $post   = $xpdo->getObject('Posts', array('id' => $id));
        return $post->remove();
      
    }

    public function GetGovernments()
    {
      global $xpdo;
      $governments = $xpdo->getCollection('Governments');

      return $governments;
    }

    public function GetDepartments()
    {
      global $xpdo;
      $departments = $xpdo->getCollection('Departments');
      return $departments;
    }

    // front functions

    public function GetAllVacancies()
    {
       global $xpdo;

          $langFile  = json_decode(file_get_contents('../lang/careers.json'), true);
          $lang = $_SESSION['lang'] ;
          $apply_now       = 'Edit Post';
          $submit_now       = $langFile['submitN'][$lang];
          $link             = 'editPost';
          $query = $xpdo->newQuery('Posts');
          $singleCareerPath='singleCareerAdmin';
          if(AdminUsersHelper::IsLoggedIn()==false||$_SESSION['AdminUser']['role']=='user')
          {
             $today = date("Y/m/d");
             $query->where(array('end_date:>='=>$today,'start_date:<='=>$today));
             $link = 'careerDetails';
             $apply_now       = $langFile['submit'][$lang];
             $singleCareerPath='singleCareer';
          }
          
          $allObj = $xpdo->getCollection('Posts' ,$query);

          $output = '';

          if (empty($allObj)) {
              $no_data       = $langFile['noData'][$lang];
              $output .= new LoadChunk('no-data','front/careers', array('lang'    => $lang,
                                                                        'no_data' => $no_data,
                                                                        'submit_now' => $submit_now), '../');
              
          }


          foreach($allObj as $currObj)
          { 
            $output .= new LoadChunk($singleCareerPath, 'front/careers', array(
                                                'link'            =>  $link,
                                                'title'           =>  $currObj->Get('title'),
                                                'experience'      =>  $currObj->Get('experience'),
                                                'apply_now'       =>  $apply_now,
                                                'currID'          =>  $currObj->Get('id')
                                            ),'../');
          }
          return $output;
    }

    public function AddNewSub()
    {
      global $xpdo;

      $fields['first_name']  = $_POST['first_name'];
      $fields['last_name']   = $_POST['last_name'];
      $fields['email']       = $_POST['email'];
      $fields['phone']       = $_POST['phoneNumber'];
      $fields['department']  = $_POST['department'];
      $fields['message']     = $_POST['message'];

      if(isset($_FILES['cv'])){
        $nowDate = time();
        $path = '../uploads/CVs/' .$nowDate .$_FILES['cv']['name'];
          if (move_uploaded_file($_FILES['cv']['tmp_name'], $path)) {
              $fields['cv'] = $path;
          } else {
            echo "Error";
          }
        }

          $cv = $xpdo->newObject('Applicants');

          $to = 'a.algeioshy@egyptfoodsgroup.com';
          $subject = 'Via Careers | Egypt Foods';
          $name = $fields['first_name']." ".$fields['last_name'];
          
          $message = new LoadChunk('emailForm', 'front/careers', array(
              'name' => $name,
              'email' => $fields['email'],
              'department' => $fields['department'],
              'phoneNumber' =>  $fields['phone'] ,
              'message' => $_POST['message'],
          ), '../');
          // Always set content-type when sending HTML email
          $headers = "MIME-Version: 1.0" . "\r\n";
          $headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";
  
          mail($to, $subject, $message, $headers);
          $cv->fromArray($fields);
          $cv->save();
    }

      public function GetAllApplicants()
    {

      global $xpdo;
      $query = $xpdo->newQuery('Applicants');
      $query->sortby('id', 'DESC');
      $applicants = $xpdo->getCollection('Applicants', $query);
      $allApplications = '';
      if (!empty($applicants)) {
        // <td>Actions</td>
        $allApplications .="<table class='responsive-table'><thead><tr>
                      <td>First Name</td>
                      <td>Last Name</td>
                      <td>Email</td>
                      <td>Phone Number</td>
                      <td>Department</td>
                      <td>Message</td>
                      <td>CV</td>
                      <td>Delete</td>

                      

                      </tr></thead><tbody>";

              foreach ($applicants as $applicant) {
                $allApplications .= new LoadChunk('applicant', 'admin/applicants', array(
                                                               'ID'               => $applicant->get('id'),
                                                               'first_name'       => $applicant->get('first_name'),
                                                               'last_name'        => $applicant->get('last_name'),
                                                               'phone'            => $applicant->get('phone'),
                                                               'email'            => $applicant->get('email'),
                                                               'cv'               => $applicant->get('cv'),
                                                               'department'       => $applicant->get('department'),
                                                               'message'          => $applicant->get('message')
                                                               ), '../');
              }

              $allApplications .="</tbody></table>";
      }
      

          return $allApplications;
    }

    public function DeleteApplication()
    {
      global $xpdo;
      if(isset($_POST['itemID']))
      {
        $applicant   = $xpdo->getObject('Applicants', array('id' => $_POST['itemID']));

        unlink($applicant->get('cv'));

        return $applicant->remove();
      }
    }
	
}

