<?php echo $header; ?>


<div class="content">
	<!-- страница каталога-->
	<nav aria-label="breadcrumb">
		<div class="container">
			<div class="row">
				<div class="col-xl-12">
					<ol class="breadcrumb">
						<?php foreach ($breadcrumbs as $i => $breadcrumb) { ?>
							<?php if ($i + 1 < count($breadcrumbs)) { ?>
								<li class="breadcrumb-item"><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
							<?php } else { ?>
								<li class="breadcrumb-item active" aria-current="page"><?php echo $breadcrumb['text']; ?></li>
							<?php } ?>
						<?php } ?>
					</ol>
				</div>
			</div>
		</div>
	</nav>


	<!-- откорректированная версия каталога. 26.10.2020-->
	<section class="section-catalog section-padding-bottom">
		<div class="container">
			<div class="row">

				<div class="col-xl-3 col-lg-12 col-wrap-choice">
					<?php echo $column_left; ?>
					<div class="row">
						<div class="col-xl-12">
							<div class="section-catalog__wrap-baner"><a class="section-catalog__baner-href" href="#"><img src="static/images/general/banner2.jpg" alt="изображение банера"></a></div>
						</div>
					</div>
        </div>
        
				<div class="col-xl-9">

					<!-- ряд с иконками компаний -->
					<?php if ($categories) { ?>
						<div class="row">
							<div class="col-xl-12">
								<div class="company">
									<?php foreach ($categories as $category) { ?>
										<a class="company-href" href="<?php echo $category['href']; ?>">
											<img src="<?php echo $category['thumb']; ?>" alt="<?php echo $category['name']; ?>">
										</a>
									<?php } ?>
								</div>
							</div>
						</div>
					<?php } ?>
					<!-- ряд с иконками компаний -->

					<?php if ($products) { ?>

						<!-- ряд с карточками товаров -->
						<div class="row row-wrap-products">
							<!--.col-xl-9.offset-xl-3.col-lg-9.offset-lg-3.col-md-9.offset-md-3.col-sm-12.offset-sm-0-->

							<div class="col-xl-12 col-lg-12">
								<div class="row row-wrap-card-little">

									<?php foreach ($products as $product) { ?>
										<div class="col-xl-4 col-lg-6">
											<div class="given-section-wrap-card">
												<!-- шаблон №1 карточки товара-->
												<div class="card-product-wrap card-product-wrap-js">
													<!-- шапка карточки с иконками-->
													<div class="card-product-wrap__wrap-info-icons-buttons">
														<div class="card-product-wrap__info-icons">
															<div class="card-product-wrap__info-icon"><span></span>
																<svg class="svg-sprite-icon icon-Top">
																	<use xlink:href="static/images/sprite/symbol/sprite.svg#Top"></use>
																</svg>
															</div>

															<div class="card-product-wrap__info-icon card-product-wrap__info-icon-basket-info-js"><span></span>
																<svg class="svg-sprite-icon icon-BasketInfo">
																	<use xlink:href="static/images/sprite/symbol/sprite.svg#BasketInfo"></use>
																</svg>
															</div>
														</div>
														<div class="card-product-wrap__info-buttons"><a onclick="location.href='<?php echo $product['href']; ?>'" style="cursor: pointer;" class="card-product-wrap__info-button">
																<svg class="svg-sprite-icon icon-Vue">
																	<use xlink:href="static/images/sprite/symbol/sprite.svg#Vue"></use>
																</svg></a>
															<button onclick="compare.add('<?php echo $product['product_id']; ?>');" class="card-product-wrap__info-button card-product-wrap__info-button-js">
																<svg class="svg-sprite-icon icon-Scales">
																	<use xlink:href="static/images/sprite/symbol/sprite.svg#Scales"></use>
																</svg>
															</button>
															<button onclick="wishlist.add('<?php echo $product['product_id']; ?>');" class="card-product-wrap__info-button card-product-wrap__info-button-js">
																<svg class="svg-sprite-icon icon-Love">
																	<use xlink:href="static/images/sprite/symbol/sprite.svg#Love"></use>
																</svg>
															</button>
														</div>
													</div>
													<a href="<?php echo $product['href']; ?>">
														<div class="card-product-wrap__wrap-img"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>"></div>
													</a>
													<div class="card-product-wrap__wraper-content">
														<a href="<?php echo $product['href']; ?>">
															<p class="card-product-wrap__name"><?php echo $product['name']; ?></p>
														</a>
														<?php if ($product['attribute_groups']) { ?>
															<?php $i = 1;
															foreach ($product['attribute_groups'] as $attribute_group) { ?>
																<?php if ($attribute_group['name'] == '#Краткое описание') { ?>
																	<?php foreach ($attribute_group['attribute'] as $attribute) { ?>
																		<?php if ($i == 4) {
																			break;
																		} ?>
																		<?php if ($attribute['name'] != 'Дата поступления на склад') { ?>

																			<div class="card-product-wrap__wrap-info-text">
																				<div class="card-product-wrap__info-text"><?php echo $attribute['name']; ?></div>
																				<div class="card-product-wrap__info-param"><?php echo $attribute['text']; ?></div>
																			</div>

																		<?php } ?>

																		<?php $i++; ?>
																	<?php } ?>
																<?php } ?>
															<?php } ?>
														<?php } ?>


													</div>


													<?php if ($product['quantity'] == 0) { ?>
														<button class="button-call3 card-product-wrap__button-main card-product-wrap__button-main-basket">
															<svg class="svg-sprite-icon icon-Basket">
																<use xlink:href="static/images/sprite/symbol/sprite.svg#Basket"></use>
															</svg>Запросить КП
														</button>
													<?php } else { ?>
														<button onclick="addCartOption('<?php echo $option_setting['id']; ?>','<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');" class="card-product-wrap__button-main card-product-wrap__button-main-basket">
															<svg class="svg-sprite-icon icon-Basket">
																<use xlink:href="static/images/sprite/symbol/sprite.svg#Basket"></use>
															</svg>В корзину
														</button>
													<?php } ?>

													<div class="card-product-wrap__wrap-buttons">
														<button onclick="fastorder_open(<?php echo $product['product_id']; ?>);" class="card-product-wrap__button-one">
															<svg class="svg-sprite-icon icon-message">
																<use xlink:href="static/images/sprite/symbol/sprite.svg#message"></use>
															</svg>Купить в 1 клик
														</button>
														<button class="button-call2 card-product-wrap__button-credit">
															<svg class="svg-sprite-icon icon-card">
																<use xlink:href="static/images/sprite/symbol/sprite.svg#card"></use>
															</svg>Купить в кредит
														</button>
													</div>
												</div>
											</div>
										</div>
									<?php } ?>

								</div>

							</div>
						</div>
						<!-- ряд с карточками товаров -->

						<!-- ряд с пагинацией -->
						<div class="row">
							<div class="col-xl-12">
								<nav class="page-navigation" aria-label="Page navigation">
									<ul class="pagination justify-content-center">
										<li class="page-item"><a class="page-link" href="#" aria-label="Start"><span aria-hidden="true">&#171;</span></a></li>
										<li class="page-item"><a class="page-link" href="#" aria-label="Previous"><span aria-hidden="true">&#8249;</span></a></li>
										<li class="page-item"><a class="page-link" href="#">1</a></li>
										<li class="page-item"><a class="page-link" href="#">2</a></li>
										<li class="page-item"><a class="page-link" href="#">3</a></li>
										<li class="page-item"><a class="page-link" href="#">4</a></li>
										<li class="page-item"><a class="page-link" href="#" aria-label="Next"><span aria-hidden="true">&#8250;</span></a></li>
										<li class="page-item"><a class="page-link" href="#" aria-label="Finish"><span aria-hidden="true">&#187;</span></a></li>
									</ul>
								</nav>
							</div>
						</div>
						<!-- ряд с пагинацией -->

					<?php } else { ?>
						<p><?php echo $text_empty; ?></p>
					<?php } ?>

				</div>
			</div>
		</div>
	</section>

	<!-- откорректированная версия каталога. 26.10.2020-->

	<section class="info-product section-padding">
		<div class="container">
			<div class="row">
				<?php if ($description) { ?>
					<div class="col-xl-6 col-lg-6 col-md-12">
						<?php echo $description; ?>
					</div>
				<?php } else { ?>
					<div class="col-xl-6 col-lg-6 col-md-12">
						Описание категории не указано
					</div>
				<?php } ?>

				<?php if ($thumb) { ?>
					<div class="col-xl-6 col-lg-6 col-md-12">
						<div class="info-product__wrap-img"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>"></div>
					</div>
				<?php } ?>


			</div>
		</div>
	</section>


	<?php echo $column_right; ?>


</div>


<?php echo $footer; ?>