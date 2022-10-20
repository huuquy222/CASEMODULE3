<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>The gioi di dong</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
        integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="/frontend/style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
        integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
</head>

<body>
     <header>
        <img src="/frontend/images/anh.jpg/anhthegioididong.png" alt="">
    </header> 
    <nav>
        <div class="container">
             <ul>
                 <li><a href=""><img style="width: 150px;" src="/frontend/images/anh.jpg/anhlogothegioididong.webp" alt=""></a>
                 </li>
                <li id="address-form"><a href="#">Huế<i class="fa-solid fa-sort"></i></a> </li>
                <li><input type="text" placeholder="ban dang tim gi..."><</li>
                <li><a href=""></a><button><i class="fa-solid fa-cart-shopping"></i>Giỏ hàng</button></li>
                <li><a href="">Lịch sử <br>đơn hàng<i class="fa-solid fa-paper-plane"></i></a></li>
                <li><a href=""><span class="btn-content"><span class="btn-top"></span></span>Mua thẻ nạp ngay</a></li>
                <li><a href="">24h công nghệ</a></li>
                <li><a href="">Hỏi đáp</a></li>
                <li><a href="">Game app</a></li>
                <div class="address-form">
                    <div class="address-form-content">
                        <h2>Chọn địa chỉ nhận hàng <span id="address-close">X Đóng</span></h2>
                        <form action="">
                            <p>Quý khách vui lòng cho biết Địa Chỉ Nhận Hàng để biết chính xác thời gian giao hàng</p>
                            <select name="" id="">
                                <option value="#">--Chọn địa điểm giao hàng</option>
                                <option value="#">Huế</option>
                            </select>
                            <select name="" id="">
                                <option value="#">--Chọn quận huyện</option>
                                <option value="#">Triệu phong</option>
                            </select>
                            <select name="" id="">
                                <option value="#">--Chọn phường xã</option>
                                <option value="#">Triệu đại</option>
                            </select>

                            <input type="text" placeholder="Số nhà tên đường">
                            <button id="address-acept">Xác nhận</button>
                        </form>

                    </div>
                </div>
            </ul>
        </div>
    </nav>
    <div class="menu-bar">
        <div class="container">
            <div class="menu-bar-content">
                <ul>
                    <li><a href="#">Điện thoại </a> <i class="fa-solid fa-mobile-screen-button"></i></li>
                    <li><a href="#">LapTop</a> <i class="fa-sharp fa-solid fa-laptop"></i></li>
                    <li><a href="">Máy tính bảng</a> <i class="fa-solid fa-tablet"></i></li>
                    <li><i class="fa-solid fa-keyboard">    </i><a href="">Phụ kiện</a> <i class="fa-solid fa-caret-down"></i>
                        <div class="submenu">
                            <ul>
                                <li><a href="">Sạc dự phòng</a></li>
                                <li><a href="">Sạc cap</a></li>
                                <li><a href="">ốp lưng điện thoại</a></li>
                                <li><a href="">ốp lưng máy tính bảng</a></li>
                                <li><a href="">Miếng dán màn hình</a></li>
                                <li><a href="">Gậy chụp ảnh, Gimbal</a></li>
                                <li><a href="">Gía đỡ điện thoại</a></li>
                                <li><a href="">Đế, Móc điện thoại</a></li>
                                <li><a href="">Phụ kiện</a></li>
                                <li><a href="">Túi chóng nước</a></li>
                                <li><a href="">Kính cường lực</a></li>
                                <li><a href="">Túi đựng AIRPOD</a></li>
                                <li><a href="">AIRTAG</a></li>
                                <li><a href="">Phụ kiện tablet</a></li>
                                <li><a href="">Chuột, Bàn phím, Túi chống xóc</a></li>
                                <li><a href="">Gía đỡ laptop</a></li>
                                <li><a href="">Phần mềm</a></li> 
                            </ul>
                        </div>
                    </li>
                    <li><a href="">Smartwatch</a> <i class="fa-solid fa-clock"></i></li>
                    <li><a href="">Đồng hồ</a> <i class="fa-solid fa-clock"></i></li>
                    <li><i class="fa-sharp fa-solid fa-computer"></i> <a href="">Pc Máy tính</a>  <i class="fa-solid fa-caret-down"></i>
                        <div class="submenu">
                            <ul>
                                <li><a href="">Máy in</a></li>
                                <li><a href="">Mực in</a></li>
                                <li><a href="">Màn hình máy tính</a></li>
                                <li><a href="">Máy tính để bàn</a></li>
                                
                            </ul>
                        </div>
                    </li>
                    <li><a href="">Máy cũ giá rẻ</a> <i class="fa-solid fa-fax"></i></li>
                    <li><a href="">Sim, thẻ cào</a> <i class="fa-solid fa-credit-card"></i></li>
                    <li><i class="fa-brands fa-usps"></i> <a href="">Dịch vụ, tiện ích</a> <i class="fa-solid fa-caret-down"></i>
                        <div class="submenu">
                            <ul>
                                <li><a href="">Đóng tiền trả góp</a></li>
                                <li><a href="">Đóng tiền điện</a></li>
                                <li><a href="">Đóng tiền nước</a></li>
                                <li><a href="">Đóng tiền vé tàu, máy bay</a></li>
                                <li><a href="">Đóng tiền net FPT</a></li>
                                <li><a href="">Đóng tiền net, cáp VNPT</a></li>
                                <li><a href="">Đóng cước điện thoại trả sau</a></li>
                                <li><a href="">Lắp đặt internet, truyền hình</a></li>
                                <li><a href="">Mua gói cước truyền hình</a></li>
                                <li><a href="">Mua bảo hiểm, xe máy. oto</a></li>
                                <li><a href="">Đóng tiền bảo hiểm</a></li>
                                <li><a href="">Đóng tiền viện phí, BHYT</a></li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div> 
    <section>
        <header>
            <h1>Thế Giới Điện Thoại</h1>
        </header>
        <h3><i class="fa-solid fa-mobile-screen-button"></i> Danh Sách Điện Thoại </h3>
        <div class="products">
            <div class="product">
                <img src="/frontend/images/anh.jpg/redminot11.jpg" alt="">
                <div class="info">
                    <h4>redminot11</h4>
                    <h8>29.000.000 VND</h8>
                    <div >
                        <button class="btn btn-danger" type="button" onclick="buy(id)">Mua Sản Phẩm</button>
                    </div>
                </div>

            </div>

            <div class="product">
                <img src="/frontend/images/anh.jpg/samsungj4prime.jpg" alt="">
                <div class="info">
                    <h4>samsungj4prime</h4>
                    <h8>19.000.000 VND</h8>
                    <div>
                        <button class="btn btn-danger" type="button" onclick="buy(id)">Mua Sản Phẩm</button>
                     
                    </div>
                </div>
            </div>

            <div class="product">
                <img src="/frontend/images/anh.jpg/samsungflip.webp" alt="">
                <div class="info">
                    <h4>samsunga21</h4>
                    <h8>29.000.000 VND</h8>
                    <div>
                        <button class="btn btn-danger" type="button" onclick="buy(id)">Mua Sản Phẩm</button>
        
                    </div>
                </div>
            </div>

            <div class="product">
                <img src="/frontend/images/anh.jpg/samsungs20Fe.webp" alt="">
                <div class="info">
                    <h4>samsungs20Fe</h4>
                    <h8>29.000.000 VND</h8>
                    <div>
                        <button class="btn btn-danger" type="button" onclick="buy(id)">Mua Sản Phẩm</button>
                
                    </div>
                </div>
            </div>

            <div class="product">
                <img src="/frontend/images/anh.jpg/samsungse21.jpg" alt="">
                <div class="info">
                    <h4>samsungse21</h4>
                    <h8>29.000.000 VND</h8>
                    <div>
                        <button class="btn btn-danger" type="button" onclick="buy(id)">Mua Sản Phẩm</button>
    
                    </div>
                </div>
            </div>

            <div class="product">
                <img src="/frontend/images/anh.jpg/xiaomi.jpg" alt="">
                <div class="info">
                    <h4>xiaomi</h4>
                    <h8>29.000.000 VND</h8>
                    <div>
                        <button class="btn btn-danger" type="button" onclick="buy(id)">Mua Sản Phẩm</button>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section>
        <header>
            <h1>Tuần Lễ Vàng Của Máy Tính</h1>
        </header>
        <h3><i class="fa-sharp fa-solid fa-computer"></i> Danh Sách Máy Tính Pc </h3>
        <div class="products2">
            <div class="product">
                <img src="/frontend/images/anh.jpg/pc1.jpg" alt="">
                <div class="info">
                    <h4>ACER</h4>
                    <h8>290.000.000 VND</h8>
                    <div>
                        <button class="btn btn-danger" type="button" onclick="buy(id)">Mua Sản Phẩm</button>
                    </div>
                </div>

            </div>

            <div class="product">
                <img src="/frontend/images/anh.jpg/pc2.jpg" alt="">
                <div class="info">
                    <h4>ASUS</h4>
                    <h8>190.000.000 VND</h8>
                    <div>
                        <button class="btn btn-danger" type="button" onclick="buy(id)">Mua Sản Phẩm</button>
                    </div>
                </div>
            </div>

            <div class="product">
                <img src="/frontend/images/anh.jpg/pc3.jpg" alt="">
                <div class="info">
                    <h4>DELL</h4>
                    <h8>390.000.000 VND</h8>
                    <div>
                        <button class="btn btn-danger" type="button" onclick="buy(id)">Mua Sản Phẩm</button>
                    </div>
                </div>
            </div>

            <div class="product">
                <img src="/frontend/images/anh.jpg/pc4.jpg" alt="">
                <div class="info">
                    <h4>MSI</h4>
                    <h8>29.000.000 VND</h8>
                    <div>
                        <button class="btn btn-danger" type="button" onclick="buy(id)">Mua Sản Phẩm</button>
                
                    </div>
                </div>
            </div>

            <div class="product">
                <img src="/frontend/images/anh.jpg/pc5.jpg" alt="">
                <div class="info">
                    <h4>DELL2019</h4>
                    <h8>29.000.000 VND</h8>
                    <div>
                        <button class="btn btn-danger" type="button" onclick="buy(id)">Mua Sản Phẩm</button>
                    </div>
                </div>
            </div>

            <div class="product">
                <img src="/frontend/images/anh.jpg/pc6.jpg" alt="">
                <div class="info">
                    <h4>HP3005</h4>
                    <h8>29.000.000 VND</h8>
                    <div>
                        <button class="btn btn-danger" type="button" onclick="buy(id)">Mua Sản Phẩm</button>
                    </div>
                </div>

            </div>
        </div>



        <header>
            <h1></h1>
        </header>
        <h3><i class="fa-sharp fa-solid fa-computer"></i> Danh Sách Máy Tính laptop </h3>
        <div class="products2">
            <div class="product">
                <img src="images/anh.jpg/lap1.jpg" alt="">
                <div class="info">
                    <h4>ACER</h4>
                    <h8>290.000.000 VND</h8>
                    <div>
                        <button class="btn btn-danger" type="button" onclick="buy(id)">Mua Sản Phẩm</button>
                    </div>
                </div>

            </div>

            <div class="product">
                <img src="images/anh.jpg/lap2.jpg" alt="">
                <div class="info">
                    <h4>ASUS VFTUS</h4>
                    <h8>190.000.000 VND</h8>
                    <div>
                        <button class="btn btn-danger" type="button" onclick="buy(id)">Mua Sản Phẩm</button>
                    </div>
                </div>
            </div>

            <div class="product">
                <img src="images/anh.jpg/lap3.jpg" alt="">
                <div class="info">
                    <h4>LENOVO IELPAD</h4>
                    <h8>390.000.000 VND</h8>
                    <div>
                        <button class="btn btn-danger" type="button" onclick="buy(id)">Mua Sản Phẩm</button>
                    </div>
                </div>
            </div>

            <div class="product">
                <img src="images/anh.jpg/lap4.jpg" alt="">
                <div class="info">
                    <h4>MSI</h4>
                    <h8>29.000.000 VND</h8>
                    <div>
                        <button class="btn btn-danger" type="button" onclick="buy(id)">Mua Sản Phẩm</button>

                    </div>
                </div>
            </div>

            <div class="product">
                <img src="images/anh.jpg/lap5.jpg" alt="">
                <div class="info">
                    <h4>MSI</h4>
                    <h8>29.000.000 VND</h8>
                    <div>
                        <button class="btn btn-danger" type="button" onclick="buy(id)">Mua Sản Phẩm</button>
                    </div>
                </div>
            </div>

            <div class="product">
                <img src="images/anh.jpg/lap6.jpg" alt="">
                <div class="info">
                    <h4>ACER NITRO5 A5N5</h4>
                    <h8>29.000.000 VND</h8>
                    <div>
                        <button class="btn btn-danger" type="button" onclick="buy(id)">Mua Sản Phẩm</button>
                    </div>
                </div>

            </div>
        </div>
    <script src="/frontend/script.js"></script>
</body>
</html>