<?php
function redirect($url) {
    echo "<script>window.location.href='" . $url . "';</script>";
    exit();
}
?>