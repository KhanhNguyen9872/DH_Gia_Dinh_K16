<?php 
if (!function_exists('is_guest')) {
    include 'lib.php';
}
if (is_guest()) {
    redirect('/');
    exit();
}
?>