<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>E Shop - Bootstrap Ecommerce Template</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="Bootstrap Ecommerce Template" name="keywords">
<meta content="Bootstrap Ecommerce Template Free Download"
	name="description">

<!-- Favicon -->
<link href="/img/favicon.ico" rel="icon">

<!-- Google Fonts -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<!-- CSS Libraries -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href="/css/slick.css" rel="stylesheet">
<link href="/css/slick-theme.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="/css/style.css" rel="stylesheet">
<script defer src="/js/product-quantity.js"></script>
<script defer src="/js/main.js"></script>

<style>
#description img {
	width: inherit;
}
</style>
</head>

<body>


	<jsp:include page="/WEB-INF/views/modules/header.jsp" />


	<!-- Breadcrumb Start -->
	<div class="breadcrumb-wrap">
		<div class="container">
			<ul class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">Home</a></li>
				<li class="breadcrumb-item"><a href="#">Products</a></li>
				<li class="breadcrumb-item active">product details</li>
			</ul>
		</div>
	</div>
	<!-- Breadcrumb End -->


	<%--제품 상세 등록 시작... --%>


	<!-- Product Detail Start -->
	<div class="product-detail">
		<div class="container">
			<div class="row">
				<div class="col-lg-9">
					<div class="row align-items-center product-detail-top">
						<div class="col-md-5">
							<div class="product-slider-single">
								<c:forEach var="images" items="${images}">
									<img src="${images.path}" alt="Product Image">
								</c:forEach>
							</div>
						</div>
						<div class="col-md-7">
							<div class="product-content">
								<div class="title">
									<h2>${product.p_name}</h2>
								</div>
								<div class="ratting">
									<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i>
								</div>
								<div class="price">
									$${product.saleprice}<span>$${product.price}</span>
								</div>
								<div class="details">
									<p>${product.p_desc}</p>
								</div>

								<%-- 마이너스, 수량, 플러스 버튼 --%>
								<div class="quantity">
									<h4>수량:</h4>
									<div class="qty">
										<button class="btn-minus btn-plus-minus">
											<i class="fa fa-minus"></i>
										</button>
										<input type="text" value="1" name="quantity"
											id="quantityInput">
										<button class="btn-plus btn-plus-minus">
											<i class="fa fa-plus"></i>
										</button>
									</div>
								</div>


								<div class="action">
									<a href="#" id="addToCartButton"
										data-productid="${product.product_id}"><i
										class="fa fa-cart-plus"></i></a> <a href="#"><i
										class="fa fa-heart"></i></a> <a href="${path}/order"><i
										class="fas fa-credit-card"></i></a>

								</div>
							</div>
						</div>
					</div>

					<div class="row product-detail-bottom">
						<div class="col-lg-12">
							<ul class="nav nav-pills nav-justified">
								<li class="nav-item"><a class="nav-link active"
									data-toggle="pill" href="#description">Description</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="pill"
									href="#specification">Specification</a></li>
								<li class="nav-item"><a class="nav-link" data-toggle="pill"
									href="#reviews">Reviews (1)</a></li>
							</ul>

							<div class="tab-content">
								<div id="description" class="container tab-pane active">
									<br>
									<h4>상품 상세정보</h4>
									<%--               <p>
                                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum quam ac mi viverra dictum. In efficitur ipsum diam, at dignissim lorem tempor in. Vivamus tempor hendrerit finibus. Nulla tristique viverra nisl, sit amet bibendum ante suscipit non. Praesent in faucibus tellus, sed gravida lacus. Vivamus eu diam eros. Aliquam et sapien eget arcu rhoncus scelerisque. Suspendisse sit amet neque neque. Praesent suscipit et magna eu iaculis. Donec arcu libero, commodo ac est a, malesuada finibus dolor. Aenean in ex eu velit semper fermentum. In leo dui, aliquet sit amet eleifend sit amet, varius in turpis. Maecenas fermentum ut ligula at consectetur. Nullam et tortor leo. 
                                        </p>--%>
									<img src="${product.p_detaildesc}" alt="detail">
								</div>
								<div id="specification" class="container tab-pane fade">
									<br>
									<h4>Product specification</h4>
									<ul>
										<li>Lorem ipsum dolor sit amet</li>
										<li>Lorem ipsum dolor sit amet</li>
										<li>Lorem ipsum dolor sit amet</li>
										<li>Lorem ipsum dolor sit amet</li>
										<li>Lorem ipsum dolor sit amet</li>
									</ul>
								</div>
								<div id="reviews" class="container tab-pane fade">
									<br>
									<div class="reviews-submitted">
										<div class="reviewer">
											Phasellus Gravida - <span>01 Jan 2020</span>
										</div>
										<div class="ratting">
											<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i> <i class="fa fa-star"></i> <i
												class="fa fa-star"></i>
										</div>
										<p>Sed ut perspiciatis unde omnis iste natus error sit
											voluptatem accusantium doloremque laudantium, totam rem
											aperiam.</p>
									</div>
									<div class="reviews-submit">
										<h4>Give your Review:</h4>
										<div class="ratting">
											<i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i
												class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i
												class="fa fa-star-o"></i>
										</div>
										<div class="row form">
											<div class="col-sm-6">
												<input type="text" placeholder="Name">
											</div>
											<div class="col-sm-6">
												<input type="email" placeholder="Email">
											</div>
											<div class="col-sm-12">
												<textarea placeholder="Review"></textarea>
											</div>
											<div class="col-sm-12">
												<button>Submit</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>





					<div class="container">
						<div class="section-header">
							<h3>Related Products</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
								Donec viverra at massa sit amet ultricies. Nullam consequat,
								mauris non interdum cursus</p>
						</div>
					</div>

					<div class="row align-items-center product-slider product-slider-3">
						<div class="col-lg-3">
							<div class="product-item">
								<div class="product-image">
									<a href="product-detail.html"> <img src="img/product-1.png"
										alt="Product Image">
									</a>
									<div class="product-action">
										<a href="#"><i class="fa fa-cart-plus"></i></a> <a href="#"><i
											class="fa fa-heart"></i></a> <a href="#"><i
											class="fa fa-search"></i></a>
									</div>
								</div>
								<div class="product-content">
									<div class="title">
										<a href="#">Phasellus Gravida</a>
									</div>
									<div class="ratting">
										<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i>
									</div>
									<div class="price">
										$22 <span>$25</span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3">
							<div class="product-item">
								<div class="product-image">
									<a href="product-detail.html"> <img src="img/product-2.png"
										alt="Product Image">
									</a>
									<div class="product-action">
										<a href="#"><i class="fa fa-cart-plus"></i></a> <a href="#"><i
											class="fa fa-heart"></i></a> <a href="#"><i
											class="fa fa-search"></i></a>
									</div>
								</div>
								<div class="product-content">
									<div class="title">
										<a href="#">Phasellus Gravida</a>
									</div>
									<div class="ratting">
										<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i>
									</div>
									<div class="price">
										$22 <span>$25</span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3">
							<div class="product-item">
								<div class="product-image">
									<a href="product-detail.html"> <img src="img/product-3.png"
										alt="Product Image">
									</a>
									<div class="product-action">
										<a href="#"><i class="fa fa-cart-plus"></i></a> <a href="#"><i
											class="fa fa-heart"></i></a> <a href="#"><i
											class="fa fa-search"></i></a>
									</div>
								</div>
								<div class="product-content">
									<div class="title">
										<a href="#">Phasellus Gravida</a>
									</div>
									<div class="ratting">
										<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i>
									</div>
									<div class="price">
										$22 <span>$25</span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3">
							<div class="product-item">
								<div class="product-image">
									<a href="product-detail.html"> <img src="img/product-4.png"
										alt="Product Image">
									</a>
									<div class="product-action">
										<a href="#"><i class="fa fa-cart-plus"></i></a> <a href="#"><i
											class="fa fa-heart"></i></a> <a href="#"><i
											class="fa fa-search"></i></a>
									</div>
								</div>
								<div class="product-content">
									<div class="title">
										<a href="#">Phasellus Gravida</a>
									</div>
									<div class="ratting">
										<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i>
									</div>
									<div class="price">
										$22 <span>$25</span>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3">
							<div class="product-item">
								<div class="product-image">
									<a href="product-detail.html"> <img src="img/product-5.png"
										alt="Product Image">
									</a>
									<div class="product-action">
										<a href="#"><i class="fa fa-cart-plus"></i></a> <a href="#"><i
											class="fa fa-heart"></i></a> <a href="#"><i
											class="fa fa-search"></i></a>
									</div>
								</div>
								<div class="product-content">
									<div class="title">
										<a href="#">Phasellus Gravida</a>
									</div>
									<div class="ratting">
										<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i>
									</div>
									<div class="price">
										$22 <span>$25</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-3">
					<div class="sidebar-widget category">
						<h2 class="title">Category</h2>
						<ul>
							<li><a href="#">Lorem Ipsum</a><span>(83)</span></li>
							<li><a href="#">Cras sagittis</a><span>(198)</span></li>
							<li><a href="#">Vivamus</a><span>(95)</span></li>
							<li><a href="#">Fusce vitae</a><span>(48)</span></li>
							<li><a href="#">Vestibulum</a><span>(210)</span></li>
							<li><a href="#">Proin phar</a><span>(78)</span></li>
						</ul>
					</div>

					<div class="sidebar-widget image">
						<h2 class="title">Featured Product</h2>
						<a href="#"> <img src="img/category-1.jpg" alt="Image">
						</a>
					</div>

					<div class="sidebar-widget brands">
						<h2 class="title">Our Brands</h2>
						<ul>
							<li><a href="#">Nulla </a><span>(45)</span></li>
							<li><a href="#">Curabitur </a><span>(34)</span></li>
							<li><a href="#">Nunc </a><span>(67)</span></li>
							<li><a href="#">Ullamcorper</a><span>(74)</span></li>
							<li><a href="#">Fusce </a><span>(89)</span></li>
							<li><a href="#">Sagittis</a><span>(28)</span></li>
						</ul>
					</div>

					<div class="sidebar-widget tag">
						<h2 class="title">Tags Cloud</h2>
						<a href="#">Lorem ipsum</a> <a href="#">Vivamus</a> <a href="#">Phasellus</a>
						<a href="#">pulvinar</a> <a href="#">Curabitur</a> <a href="#">Fusce</a>
						<a href="#">Sem quis</a> <a href="#">Mollis metus</a> <a href="#">Sit
							amet</a> <a href="#">Vel posuere</a> <a href="#">orci luctus</a> <a
							href="#">Nam lorem</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Product Detail End -->


	<jsp:include page="/WEB-INF/views/modules/footer.jsp" />


	<!-- Back to Top -->
	<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>


	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
	<script src="/js/easing.min.js"></script>
	<script src="/js/slick.min.js"></script>


	<!-- Template Javascript -->
	<script src="/js/main.js"></script>
</body>
</html>
