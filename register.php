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
                <label for="" class="form-label">First Name</label>
                <input
                    type="text"
                    class="form-control"
                    name="f-name"
                    id=""
                    aria-describedby="helpId"
                    placeholder="" />
            </div>

            <div class="mb-3">
                <label for="" class="form-label">Last Name</label>
                <input
                    type="text"
                    class="form-control"
                    name="l-name"
                    id=""
                    aria-describedby="helpId"
                    placeholder="" />
            </div>

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

            <div class="mb-3">
                <label for="" class="form-label">Confirm Password</label>
                <input
                    type="password"
                    class="form-control"
                    name="rptpass"
                    placeholder="" />
            </div>

            <button type="submit" class="btn btn-primary btn-user btn-block" name="submit">
                Create Account
            </button>
            <span>Already have an account? <a href="login.php">Log-In</a></span>

        </form>

        <?php

        if (isset($_POST["submit"])) {
            $fname = $_POST["f-name"];
            $lname = $_POST["l-name"];
            $email = $_POST["email"];
            $pass = $_POST["pass"];
            $rptpass = $_POST["rptpass"];
            if ($pass != $rptpass) {
                echo "<script>
                        alert('Passwords don\'t match!')
                    </script>";
            } else if ($pass == $rptpass) {
                echo "<script>
                        alert('Account created successfully!')
                    </script>";

                $query = mysqli_query($conn, "insert into accounts (first_name, last_name, email, password, role) values ('$fname', '$lname', '$email', '$pass', 'user')");
                if ($query) {
                    echo "<script>location.href = 'login.php'</script>";
                }
            }
        }
        ?>
    </div>
</body>

</html>