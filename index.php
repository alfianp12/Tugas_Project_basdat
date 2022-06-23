<?php
include 'koneksi.php';

$_SESSION['BASEURL'] = "http://localhost/minum";
?>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Halaman Login</title>
        <link rel="stylesheet" href="style.css">
    </head>
   
    <body>
        <div class="container">
          <h1>Login</h1>
            <form action="" method="POST">
                <label>Username</label><br>
                <input type="text" name="username"><br>
                <label>Password</label><br>
                <input type="password" name="password"><br>
                <button type="submit" name="submit">Log in</button>
            </form>
        </div>     
    </body>
</html>

<?php
if(isset($_POST['submit'])){
    $username = $_POST['username'];
    $password = $_POST['password'];

    $query = mysqli_query($koneksi, "SELECT * FROM pegawai WHERE nama_pegawai = '$username' AND password = '$password'");
    $selectDataPegawai  = mysqli_fetch_array($query);
    $num_row            = mysqli_num_rows($query);
    if($num_row > 0){
        $_SESSION['id_pegawai'] = $selectDataPegawai['id_pegawai'];
        header('Location: page/Dashboard.php');
    }
}
?>