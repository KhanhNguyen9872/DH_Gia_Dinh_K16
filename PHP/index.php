<?php
require 'config/check_login.php';
$activePage = isset($_GET['page']) ? $_GET['page'] : 'Main';

?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quản lý cửa hàng điện thoại</title>
        <style>
            body, h1, p, button {
                margin: 0;
                padding: 0;
            }
            body {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background-color: #f0f2f5;
                color: #333;
                line-height: 1.6;
                padding: 20px;
            }
            .wrapper {
                width: 80%;
                margin: auto;
                overflow: hidden;
            }
            h1 {
                color: #023e8a;
                margin-bottom: 10px;
            }

            .tab {
                overflow: hidden;
                background-color: #ffffff;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
                border-radius: 10px;
                margin-bottom: 20px;
            }
            .tab button {
                background-color: inherit;
                float: left;
                border: none;
                outline: none;
                cursor: pointer;
                padding: 14px 20px;
                transition: background-color 0.3s, color 0.3s;
                font-size: 16px;
                border-bottom: 3px solid transparent;
            }
            .tab button:hover {
                background-color: #e9ecef;
                color: #023e8a;
            }
            .tab button.active {
                border-bottom: 3px solid #023e8a;
                color: #023e8a;
            }

            .tabcontent {
                display: none;
                padding: 20px;
                border: 1px solid #ccc;
                border-top: none;
                background-color: #fff;
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);
                border-radius: 0 0 10px 10px;
            }

            .wrapper a.button {
                display: inline-block;
                padding: 8px 16px;
                background-color: #007BFF; 
                color: white; 
                text-align: center;
                text-decoration: none;
                font-weight: bold;
                border-radius: 4px;
                border: none;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .wrapper a.button:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <div class="wrapper">
            <h1>Quản lý cửa hàng điện thoại</h1>
            <div class="tab">
                <button class="tablinks <?php echo $activePage === 'phone' ? 'active' : ''; ?>" onclick="location.href='?page=phone'">Quản lý điện thoại</button>
                <button class="tablinks <?php echo $activePage === 'customer' ? 'active' : ''; ?>" onclick="location.href='?page=customer'">Quản lý khách hàng</button>
                <button class="tablinks <?php echo $activePage === 'account' ? 'active' : ''; ?>" onclick="location.href='?page=account'">Quản lý tài khoản</button>
                <button class="tablinks <?php echo $activePage === 'order' ? 'active' : ''; ?>" onclick="location.href='?page=order'">Quản lý đơn hàng</button>
                <button class="tablinks <?php echo $activePage === 'staff' ? 'active' : ''; ?>" onclick="location.href='?page=staff'">Quản lý nhân viên</button>
            </div>

            <div id="contentArea" class="tabcontent" style="display: <?php echo $activePage === 'phone' ? 'block' : 'none'; ?>">
                <?php if ($activePage === 'phone') { 
                    include 'pages/phone/index.php'; 
                } ?>
            </div>
            <div id="contentArea" class="tabcontent" style="display: <?php echo $activePage === 'customer' ? 'block' : 'none'; ?>">
                <?php if ($activePage === 'customer') { 
                    include 'pages/customer/index.php'; 
                } ?>
            </div>
            <div id="contentArea" class="tabcontent" style="display: <?php echo $activePage === 'account' ? 'block' : 'none'; ?>">
                <?php if ($activePage === 'account') { 
                    include 'pages/account/index.php'; 
                } ?>
            </div>
            <div id="contentArea" class="tabcontent" style="display: <?php echo $activePage === 'order' ? 'block' : 'none'; ?>">
                <?php if ($activePage === 'order') { 
                    include 'pages/order/index.php'; 
                } ?>
            </div>
            <div id="contentArea" class="tabcontent" style="display: <?php echo $activePage === 'staff' ? 'block' : 'none'; ?>">
                <?php if ($activePage === 'staff') { 
                    include 'pages/staff/index.php'; 
                } ?>
            </div>

            <div id="contentArea" class="tabcontent" style="display: <?php echo $activePage === 'editPhone' ? 'block' : 'none'; ?>">
                <?php if ($activePage === 'editPhone') { 
                    include 'pages/phone/edit_phone.php';
                } ?>
            </div>

            <div id="contentArea" class="tabcontent" style="display: <?php echo $activePage === 'Main' ? 'block' : 'none'; ?>">
                <?php if ($activePage === 'Main') { 
                    echo "<p>Welcome, <b>" . htmlspecialchars($_SESSION["username"]) . "</b>!</p>";
                    echo "<p>Have a nice day</p>";
                } ?>
            </div>
        </div>
        
        <div class="wrapper">
            <a href="/auth.php?type=logout" class="button">Đăng xuất</a>
        </div>
    </body>
</html>