<?php
if (!isset($_SESSION)) {
    session_start();
}
require_once('AdminUsersHelper.php');
require_once('PasswordHelper.php');

class signUpHelper extends BaseHelper
{
    public function GetAll()
    {
        global $xpdo;
        
        $submissions = $xpdo->getCollection('Submissions');
        $allApplications = '';
        if (!empty($submissions)) {
            // <td>Actions</td>
            $allApplications .="<table class='responsive-table'><thead><tr>
					<td>Name</td>
                    <td>Phone</td>
                    <td>Email</td>
					<td>Message</td>
                    <td>Delete</td>
					

                    

                    </tr></thead><tbody>";

            foreach ($submissions as $submission) {
                $allApplications .= new LoadChunk('submission', 'admin/submissions', array(
                                                             'ID'               => $submission->get('id'),
                                                             'name'             => $submission->get('name'),
                                                             'phone'            => $submission->get('phone'),
                                                             'email'            => $submission->get('email'),
                                                             'message'          => $submission->get('message')
                                                             ), '../');
            }

            $allApplications .="</tbody></table>";
        }
        

        return $allApplications;
    }


    public function Add()
    {
        
        global $xpdo;
        $fields['user_name']       = $_POST['user_name'];
        $temp=password_hash($_POST['password'], PASSWORD_DEFAULT);
        $fields['password']        = $temp;
        $fields['name']            = $_POST['name'];
        $fields['email']           = $_POST['email'];
        $fields['role']            = $_POST['role'];
        $user = $xpdo->getObject('Users', array('user_name' => $fields['user_name']));
        if(empty($user)==false)
        {
            return UtilityHelper::Response('error', 'This username is already taken.');
        }
        $user = $xpdo->getObject('Users', array('email' => $fields['email']));
        if(empty($user)==false)
        {
            return UtilityHelper::Response('error', 'This email is already exists.');
        }
        
        $users = $xpdo->newObject('Users');
        $users->fromArray($fields);
        if($users->save()==false)
        {
            echo "false heree ";
        }
    }

    public function DeleteSubmission()
    {
        global $xpdo;
        if (isset($_POST['itemID'])) {
            $submission = $xpdo->getObject('Submissions', array('id' => $_POST['itemID']));
        
            return $submission->remove();
        }
    }
}
