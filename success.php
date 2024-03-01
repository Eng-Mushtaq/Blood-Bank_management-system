<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">

    <title>Success</title>
    <style>
        /* Center the card */
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        /* Styling for the card */
        .card {
            padding: 20px;
            border-radius: 10px;
            background-color: #6bd454; /* Green color */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            min-width: 400px;
            max-width: 400px;
        }

        /* Style for the button */
        button {
            background-color: white; /* Green */
            color: green;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .card-header{
            border: 2px solid white;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="card">

            <h1 class="card-header">Success!</h1>
            <div class="card-body">

            <?php
            // Check if message is set from the previous page
            if(isset($_GET['message'])) {
                $message = $_GET['message'];
                echo "<p class='text-white'>$message</p>";
            } else {
                echo "<p>No message found.</p>";
            }
            ?>
            <button onclick="goBack()">OK</button>
        </div>
        </div>
    </div>

    <script>
        function goBack() {
            window.history.back();
        }
    </script>
</body>
</html>
