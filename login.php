<?php
session_start();
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <?php
    // Header links
    include('./head-links.php');
    // Connection link
    include('./connection.php');
    ?>
</head>

<body>
    <div class="container">
        <form action="" method="post">

            <div class="mb-3">
                <label for="" class="form-label">Email</label>
                <input
                    type="email"
                    class="form-control"
                    name="email"
                    aria-describedby="emailHelpId"
                    placeholder="" />
            </div>

            <div class="mb-3">
                <label for="" class="form-label">Password</label>
                <input
                    type="password"
                    class="form-control"
                    name="pass"
                    placeholder="" />
            </div>

            <button type="submit" class="btn btn-primary btn-user btn-block" name="submit">
                Login
            </button>
            <span>Don't have an account? <a href="register.php">Sign Up</a></span>

        </form>

        <?php
        if (isset($_POST['submit'])) {
            $email = $_POST['email'];
            $pass = $_POST['pass'];

            $query = mysqli_query($conn, "Select * from accounts where email = '$email'");

            $row = mysqli_fetch_assoc($query);

            if (mysqli_num_rows($query) == 0) {
                echo "<script>alert('Account not found!')</script>";
            } else if ($row["email"] == $email) {
                if ($pass == $row["password"]) {

                    $_SESSION["username"] = $row["first_name"] . " " . $row["last_name"];
                    if(isset($_SESSION["username"])){
                        echo "<script>location.href = 'index.php'</script>";
                    }
                } else if ($pass != $row["password"]) {
                    echo "<script>alert('Password not matched')</script>";
                }
            }
        }
        ?>
    </div>
</body>

</html>