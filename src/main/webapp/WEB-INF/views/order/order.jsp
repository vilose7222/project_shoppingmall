<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>E Shop - Bootstrap Ecommerce Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Bootstrap Ecommerce Template" name="keywords">
        <meta content="Bootstrap Ecommerce Template Free Download" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700&display=swap" rel="stylesheet">

        <!-- CSS Libraries -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="/css/slick.css" rel="stylesheet">
        <link href="/css/slick-theme.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="/css/style.css" rel="stylesheet">
        <script defer src="/js/main.js"></script>
    </head>

    <body>
        <jsp:include page="/WEB-INF/views/modules/header.jsp"/>
        
        
        <!-- Breadcrumb Start -->
        <div class="breadcrumb-wrap">
            <div class="container">
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                    <li class="breadcrumb-item"><a href="#">Products</a></li>
                    <li class="breadcrumb-item active">Checkout</li>
                </ul>
            </div>
        </div>
        <!-- Breadcrumb End -->
        
        
        <!-- Checkout Start -->
        <div class="checkout">
            <div class="container"> 
                <div class="row">
                    <div class="col-md-7">
                        <div class="billing-address">
                            <h2>Billing Address</h2>
                            <div class="row insert">
                                <div class="col-md-6">
                                    <label>Name</label>
                                    <input class="form-control" type="text" placeholder="성함">
                                </div>
                              
                                <div class="col-md-6">
                                    <label>Phone No</label>
                                    <input class="form-control" type="text" placeholder="연락처">
                                </div>
                                <div class="col-md-6">
                                    <label>E-mail</label>
                                    <input class="form-control" type="text" placeholder="이메일">
                                </div>
                                <div class="col-md-12">
                                    <label>Address</label>
                                    <input class="form-control" type="text" placeholder="주소">
                                </div>
                                
                              
                                <div class="col-md-12">
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="newaccount">
                                        <label class="custom-control-label" for="newaccount">Create an account</label>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="shipto">
                                        <label class="custom-control-label" for="shipto">신규 주소를 입력하시려면 체크해주세요</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                   
                        <div class="shipping-address">
                          
                            <h2>Shipping Address</h2>
                            <div class="row insert">
                                <div class="col-md-6">
                                    <label>Name</label>
                                    <input class="form-control" type="text" placeholder="성함">
                                </div>
                                <div class="col-md-6">
                                    <label>Phone No</label>
                                    <input class="form-control" type="text" placeholder="연락처">
                                </div>
                                <div class="col-md-6">
                                    <label>E-mail</label>
                                    <input class="form-control" type="text" placeholder="이메일">
                                </div>
                                <div class="col-md-12">
                                    <label>Address</label>
                                    <input class="form-control" type="text" placeholder="주소">
                                </div>
                               
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="checkout-summary">
                            <h2>Cart Total</h2>
                            <div class="checkout-content">
                                <h3>Products</h3>
                                <p>Product Name<span>$11</span></p>
                                <p>Product Name<span>$11</span></p>
                                <p>Product Name<span>$11</span></p>
                                <p class="sub-total">상품 가격<span>$22</span></p>
                                <p class="ship-cost">배송비<span>$1</span></p>
                                <h4>총 금액<span>$23</span></h4>
                            </div>
                        </div>
                        
                        <div class="checkout-payment">
                            <h2>Payment Methods</h2>
                            <div class="payment-methods">
                                <div class="payment-method">
                                    <div class="custom-control custom-radio">
                                        <input type="radio" class="custom-control-input" id="payment-1" name="payment">
                                        <label class="custom-control-label" for="payment-1">Paypal</label>
                                    </div>
                                    <div class="payment-content" id="payment-1-show">
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tincidunt orci ac eros volutpat maximus lacinia quis diam.
                                        </p>
                                    </div>
                                </div>
                                <div class="payment-method">
                                    <div class="custom-control custom-radio">
                                        <input type="radio" class="custom-control-input" id="payment-2" name="payment">
                                        <label class="custom-control-label" for="payment-2">Payoneer</label>
                                    </div>
                                    <div class="payment-content" id="payment-2-show">
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tincidunt orci ac eros volutpat maximus lacinia quis diam.
                                        </p>
                                    </div>
                                </div>
                                <div class="payment-method">
                                    <div class="custom-control custom-radio">
                                        <input type="radio" class="custom-control-input" id="payment-3" name="payment">
                                        <label class="custom-control-label" for="payment-3">Check Payment</label>
                                    </div>
                                    <div class="payment-content" id="payment-3-show">
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tincidunt orci ac eros volutpat maximus lacinia quis diam.
                                        </p>
                                    </div>
                                </div>
                                <div class="payment-method">
                                    <div class="custom-control custom-radio">
                                        <input type="radio" class="custom-control-input" id="payment-4" name="payment">
                                        <label class="custom-control-label" for="payment-4">Direct Bank Transfer</label>
                                    </div>
                                    <div class="payment-content" id="payment-4-show">
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tincidunt orci ac eros volutpat maximus lacinia quis diam.
                                        </p>
                                    </div>
                                </div>
                                <div class="payment-method">
                                    <div class="custom-control custom-radio">
                                        <input type="radio" class="custom-control-input" id="payment-5" name="payment">
                                        <label class="custom-control-label" for="payment-5">Cash on Delivery</label>
                                    </div>
                                    <div class="payment-content" id="payment-5-show">
                                        <p>
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tincidunt orci ac eros volutpat maximus lacinia quis diam.
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="checkout-btn">
                                <button>Place Order</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Order End -->
        
        
         <jsp:include page="/WEB-INF/views/modules/footer.jsp"/>
        
        <!-- Back to Top -->
        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

        
        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="/js/easing.min.js"></script>
        <script src="/js/slick.min.js"></script>
    </body>
</html>
