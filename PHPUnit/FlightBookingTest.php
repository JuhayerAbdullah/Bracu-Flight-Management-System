<?php

use PHPUnit\Framework\TestCase;

require_once 'helpers/helper.php';
require_once 'helpers/init_conn_db.php';

class FlightBookingTest extends TestCase
{
    public function testHeader()
    {
        ob_start();
        subview('header.php');
        $result = ob_get_clean();

        // Assert that the header contains the correct title
        $this->assertStringContainsString('<title>Flight Management</title>', $result);

        // Assert that the header contains the logo
        $this->assertStringContainsString('<img src="assets/images/airtic.png"', $result);
    }

    public function testFooter()
    {
        ob_start();
        subview('footer.php');
        $result = ob_get_clean();

        // Assert that the footer contains the correct year
        $this->assertStringContainsString(date('Y'), $result);

        // Assert that the footer contains the correct copyright information
        $this->assertStringContainsString('CSE470 Flight Management', $result);
    }

    public function testSearchFormErrors()
    {
        // Simulate a form submission with errors
        $_POST['dep_date'] = '';
        $_POST['ret_date'] = '';
        $_POST['dep_city'] = '0';
        $_POST['arr_city'] = '0';
        $_POST['type'] = 'one-way';
        $_POST['f_class'] = 'Economy';
        $_POST['passengers'] = '1';

        ob_start();
        include 'index.php';
        $result = ob_get_clean();

        // Assert that the correct error message is displayed for each error scenario
        $this->assertStringContainsString('Please select a valid departure date', $result);
        $this->assertStringContainsString('Please select a valid departure city', $result);
        $this->assertStringContainsString('Please select a valid arrival city', $result);
    }

    public function testFlightSearchResults()
    {
        // Simulate a form submission with valid input
        $_POST['dep_date'] = '2023-04-20';
        $_POST['ret_date'] = '';
        $_POST['dep_city'] = 'Dhaka';
        $_POST['arr_city'] = 'Chittagong';
        $_POST['type'] = 'one-way';
        $_POST['f_class'] = 'Economy';
        $_POST['passengers'] = '1';

        ob_start();
        include 'index.php';
        $result = ob_get_clean();

        // Assert that the flight search results are displayed correctly
        $this->assertStringContainsString('<td>Dhaka</td>', $result);
        $this->assertStringContainsString('<td>Chittagong</td>', $result);
        $this->assertStringContainsString('<td>$ 3000</td>', $result);
    }

    public function testLoginForm()
    {
        // Simulate a user who is not logged in
        unset($_SESSION['userId']);

        ob_start();
        include 'index.php';
        $result = ob_get_clean();

        // Assert that the login form is displayed when the user is not logged in
        $this->assertStringContainsString('<td>Login to continue</td>', $result);

        // Simulate a user who is logged in
        $_SESSION['userId'] = 1;

        ob_start();
        include 'index.php';
        $result = ob_get_clean();

        // Assert that the booking form is displayed when the user is logged in
        $this->assertStringContainsString('<button name=\'book_but\' type=\'submit\'', $result);
    }

    public function testTableFormatting()
    {
        // Simulate a form submission with valid input
        $_POST['dep_date'] = '2023-04-20';
        $_POST['ret_date'] = '';
        $_POST['dep_city'] = 'Dhaka';
        $_POST['arr_city'] = 'Chittagong';
        $_POST['type'] = 'one-way';
        $_POST['f_class'] = 'Economy';
        $_POST['passengers'] = '1';

        ob_start();
        include 'index.php';
        $result = ob_get_clean();

        // Assert that the table is well-formed and contains the expected content
        $this->assertStringContainsString('<table class="table table-striped table-bordered table-hover">', $result);
        $this->assertStringContainsString('<th scope="col">Airline</th>', $result);
        $this->assertStringContainsString('<th scope="col">Departure</th>', $result);
        $this->assertStringContainsString('<th scope="col">Arrival</th>', $result);
        $this->assertStringContainsString('<th scope="col">Price</th>', $result);
        $this->assertStringContainsString('<tr>', $result);
        $this->assertStringContainsString('</tr>', $result);
        $this->assertStringContainsString('<td>', $result);
        $this->assertStringContainsString('</td>', $result);
    }
}
