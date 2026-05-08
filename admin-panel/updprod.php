<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Cards</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">

    <?php
    include("./nav.php");
    include("../connection.php");
    ?>

    <!-- Begin Page Content -->
    <div class="container-fluid">
        <?php

        $id = $_GET["id"];
        $col = mysqli_query($conn, "select * from products where id = $id");
        $row = mysqli_fetch_array($col);

        ?>

        <h4>Update Category</h4>
        <div class="form-group">
            <form action="" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="">Category Name</label>
                    <input type="text" name="prod_name" class="form-control" value="<?php echo $row['name'] ?>">
                    <label for="">Description</label>
                    <input type="text" name="prod_desc" class="form-control" value="<?php echo $row['description'] ?>">
                    <label for="">Price</label>
                    <input type="number" name="prod_price" class="form-control" value="<?php echo $row['price'] ?>">
                    <label for="">Quantity</label>
                    <input type="number" name="prod_qty" class="form-control" value="<?php echo $row['quantity'] ?>">
                    <div class="my-2">
                        <label for="">Select Category</label>
                        <div>
                            <select name="prod_cat">

                                <?php
                                $cat_id = $row['cat_id'];
                                $query = mysqli_query($conn, "Select * from categories where id = '$cat_id'");
                                $catrow = mysqli_fetch_assoc($query);
                                ?>

                                <option value="<?php echo $catrow['id'] ?>"><?php echo $catrow['name'] ?></option>

                                <?php
                                $query = mysqli_query($conn, "Select * from categories where NOT id = '$cat_id'");
                                while ($catrow = mysqli_fetch_assoc($query)) {
                                    ?>

                                    <option value="<?php echo $catrow['id'] ?>"><?php echo $catrow['name'] ?></option>

                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    <label for="">Image</label>
                    <input type="file" name="prod_img" class="d-block mt-2 mb-3">
                    <input type="submit" value="Update Category" name="produpd" class="btn btn-primary">
                </div>
            </form>
        </div>

        <?php

        if (isset($_POST['produpd'])) {
            $pname = $_POST['prod_name'];
            $pdesc = $_POST['prod_desc'];
            $price = $_POST['prod_price'];
            $qty = $_POST['prod_qty'];
            $cat = $_POST['prod_cat'];
            $pimgtmp = $_FILES['prod_img']['tmp_name'];
            $pimgname = $_FILES['prod_img']['name'];

            $query = mysqli_query($conn, "update products set name='$pname', description='$pdesc', price='$price', quantity='$qty', cat_id='$cat' where id=$id");

            if ($_FILES['cat_img']['error'] === UPLOAD_ERR_OK) {
                $cimgtmp = $_FILES['cat_img']['tmp_name'];
                $cimgname = $_FILES['cat_img']['name'];

                $destination = '../img/' . $cimgname;

                $exte = pathinfo($cimgname, PATHINFO_EXTENSION);
                if ($exte == 'png' || $exte == 'jpg' || $exte == 'jpeg' || $exte == 'webp') {
                    if (move_uploaded_file($cimgtmp, $destination)) {
                        mysqli_query($conn, "update categories set img='$pimgname' where id = $id");
                    }

                }
            }

            if ($query) {
                echo "<script>location.href = 'viewprod.php'</script>";
            }
        }

        ?>
    </div>

    </div>
    <!-- End of Main Content -->

    <!-- Footer -->
    <footer class="sticky-footer bg-white">
        <div class="container my-auto">
            <div class="copyright text-center my-auto">
                <span>Copyright &copy; Your Website 2020</span>
            </div>
        </div>
    </footer>
    <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.php">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

</body>

</html>