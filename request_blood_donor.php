<?php
// Include your database connection file here
include('db_connection.php');
// Check if form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Required fields
    $name = isset($_POST['name']) ? $_POST['name'] : null;
    $email = isset($_POST['email']) ? $_POST['email'] : null;
    $phone = isset($_POST['phone']) ? $_POST['phone'] : null;
    $bloodGroup = isset($_POST['bloodGroup']) ? $_POST['bloodGroup'] : null;
    $gender = isset($_POST['gender']) ? $_POST['gender'] : null;
    $isDonor =$_POST['isDonor'];
$message="";
    $userId=null;
    // Optional fields with default value "Not entered" if not provided
    $state = isset($_POST['state']) ? $_POST['state'] : "Not entered";
    $city = isset($_POST['city']) ? $_POST['city'] : "Not entered";
    $street = isset($_POST['street']) ? $_POST['street'] : "Not entered";
    $religion = isset($_POST['religion']) ? $_POST['religion'] : "Not entered";
    $profession = isset($_POST['profession']) ? $_POST['profession'] : "Not entered";
    $totalDonate = isset($_POST['totalDonate']) ? $_POST['totalDonate'] : "Not entered";
    $lastDonate = isset($_POST['lastDonate']) ? $_POST['lastDonate'] : "Not entered";
    $aboutYou = isset($_POST['aboutYou']) ? $_POST['aboutYou'] : "Not entered";

    // Validate required fields
    if (!$name || !$email || !$phone || !$bloodGroup || !$gender) {
        // Handle missing required fields, redirect or show error message
    } else {
        // Prepare SQL statements to check if the user exists
        $sql = "SELECT * FROM users WHERE email = :email";
        $stmt = $pdo->prepare($sql);
        $stmt->bindParam(':email', $email);
        $stmt->execute();
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        // If user does not exist, insert a new user
        if (!$user) {
            // Insert user data into the users table
            $sql = "INSERT INTO users (name, email, phone,gender,bloodtype ,usertype) VALUES (:name, :email, :phone,:gender,:bloodtype, $isDonor)";
            $stmt = $pdo->prepare($sql);
            $stmt->bindParam(':name', $name);
            $stmt->bindParam(':email', $email);
            $stmt->bindParam(':phone', $phone);
            $stmt->bindParam(':gender', $gender);
            $stmt->bindParam(':bloodtype', $bloodGroup);

            $stmt->execute();
            $userId = $pdo->lastInsertId();
              // Insert address data into the address table
              $sql = "INSERT INTO address (city, street, state, user_id) VALUES (:city, :street, :state, :user_id)";
              $stmt = $pdo->prepare($sql);
              $stmt->bindParam(':city', $city);
              $stmt->bindParam(':street', $street);
              $stmt->bindParam(':state', $state);
              $stmt->bindParam(':user_id', $userId);
              $stmt->execute();
  
              // Insert personal information into the personal_information table
              $sql = "INSERT INTO personal_information (profession, religion, total_donate, last_donate, about_you, user_id) 
              VALUES (:profession, :religion, :total_donate, :last_donate, :about_you, :user_id)";
              $stmt = $pdo->prepare($sql);
              $stmt->bindParam(':profession', $profession);
              $stmt->bindParam(':religion', $religion);
              $stmt->bindParam(':total_donate', $totalDonate);
              $stmt->bindParam(':last_donate', $lastDonate);
              $stmt->bindParam(':about_you', $aboutYou);
              $stmt->bindParam(':user_id', $userId);
              $stmt->execute();
              $message="Thanks now You are  On the list of blood donors ";

        }
        else{
            $sql = "SELECT * FROM users WHERE email = :email";
            $stmt = $pdo->prepare($sql);
            $stmt->bindParam(':email', $email);
            $stmt->execute();
            $user = $stmt->fetch(PDO::FETCH_ASSOC);
            $userId = $user['id'];
        }
          
        if($isDonor==0){

        
        $date = date('Y-m-d');
        // Insert personal information into the personal_information table
             $sql = "INSERT INTO request_donor (patient_id, date, blood_type, required_total_donate) 
             VALUES (:patient_id, :date, :blood_type, :required_total_donate)";
             $stmt = $pdo->prepare($sql);
             $stmt->bindParam(':patient_id', $userId);
             $stmt->bindParam(':date', $date);
             $stmt->bindParam(':blood_type', $bloodGroup);
             $stmt->bindParam(':required_total_donate', $totalDonate);
             $stmt->execute();
             $message="Your Request Added Successfully";

            // Handle any other tables you want to insert data into
        }
            // Redirect user to a confirmation page or display a success message
            header("Location: success.php?message=$message");
            exit();
        } 
    }

?>
