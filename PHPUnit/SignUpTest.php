<?php
use PHPUnit\Framework\TestCase;

class SignUpTest extends TestCase
{
    private $conn;

    protected function setUp(): void
    {
        // Initialize connection to test database
        require '../helpers/init_conn_db.php';
        $this->conn = $conn;
    }

    protected function tearDown(): void
    {
        // Close database connection after each test
        mysqli_close($this->conn);
    }

    public function testInvalidEmail()
    {
        // Test case where email is not valid
        $formData = array(
            'username' => 'testuser',
            'email_id' => 'not_a_valid_email',
            'password' => 'testpassword',
            'password_repeat' => 'testpassword'
        );
        $_POST = $formData;
        ob_start();
        include '../signup.php';
        $output = ob_get_clean();
        $this->assertStringContainsString('Location: ../register.php?error=invalidemail', $output);
    }

    public function testPasswordsNotMatching()
    {
        // Test case where password and password_repeat fields don't match
        $formData = array(
            'username' => 'testuser',
            'email_id' => 'test@example.com',
            'password' => 'testpassword',
            'password_repeat' => 'not_matching_password'
        );
        $_POST = $formData;
        ob_start();
        include '../signup.php';
        $output = ob_get_clean();
        $this->assertStringContainsString('Location: ../register.php?error=pwdnotmatch', $output);
    }

    public function testUsernameExists()
    {
        // Test case where username already exists in database
        $username = 'existinguser';
        $email = 'test@example.com';
        $pwd_hash = password_hash('testpassword', PASSWORD_DEFAULT);
        $stmt = mysqli_prepare($this->conn, 'INSERT INTO Users (username,email,password) VALUES (?,?,?)');
        mysqli_stmt_bind_param($stmt, 'sss', $username, $email, $pwd_hash);
        mysqli_stmt_execute($stmt);

        $formData = array(
            'username' => $username,
            'email_id' => 'newuser@example.com',
            'password' => 'testpassword',
            'password_repeat' => 'testpassword'
        );
        $_POST = $formData;
        ob_start();
        include '../signup.php';
        $output = ob_get_clean();
        $this->assertStringContainsString('Location: ../register.php?error=usernameexists', $output);

        // Clean up test data
        mysqli_query($this->conn, 'DELETE FROM Users WHERE username = "' . $username . '"');
    }

    public function testEmailExists()
    {
        // Test case where email already exists in database
        $username = 'testuser';
        $email = 'existinguser@example.com';
        $pwd_hash = password_hash('testpassword', PASSWORD_DEFAULT);
        $stmt = mysqli_prepare($this->conn, 'INSERT INTO Users (username,email,password) VALUES (?,?,?)');
        mysqli_stmt_bind_param($stmt, 'sss', $username, $email, $pwd_hash);
        mysqli_stmt_execute($stmt);

        $formData = array(
            'username' => 'newuser',
            'email_id' => $email,
            'password' => 'testpassword',
            'password_repeat' => 'testpassword'
        );
        $_POST = $formData;
        ob_start();
        include '../signup.php';
        $output = ob_get_clean();
        $this->assertStringContainsString('Location: ../register.php?error=emailexists', $output);

        // Clean up test data
        mysqli_query($this->conn, 'DELETE FROM Users WHERE email = "' . $email . '"');
    }

    public function testSuccessfulRegistration()
    {
        // Test case where registration and login are successful
        $formData = array(
            'username' => 'newuser',
            'email_id' => 'newuser@example.com',
            'password' => 'testpassword',
            'password_repeat' => 'testpassword'
        );
        $_POST = $formData;
        ob_start();
        include '../signup.php';
        $output = ob_get_clean();
        $this->assertStringContainsString('Location: ../index.php?login=success', $output);

        // Verify that session variables were set correctly
        $this->assertTrue(isset($_SESSION['userId']));
        $this->assertTrue(isset($_SESSION['userUid']));
        $this->assertTrue(isset($_SESSION['userMail']));
    
        // Clean up test data
        $stmt = mysqli_prepare($this->conn, 'DELETE FROM Users WHERE username = ? OR email = ?');
        mysqli_stmt
    
