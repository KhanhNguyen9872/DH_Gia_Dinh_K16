<?php
function redirect($url) {
    echo "<script>window.location.href='" . $url . "';</script>";
    exit();
}

function redirectIfNotAdmin() {
    if (!is_admin()) {
        redirect('/');
    }
}

function redirectIfNotStaff() {
    if(!is_staff()) {
        redirect('/');
    }
}

function is_admin() {
    if ($_SESSION['admin'] == false) {
        return false;
    }
    return true;
}

function is_staff() {
    if (($_SESSION['guest'] == false) && ($_SESSION["admin"] == false)) {
        return true;
    }
    return false;
}

function is_guest() {
    if (($_SESSION['guest'] == true) && ($_SESSION["admin"] == false)) {
        return true;
    }
    return false;
}

?>