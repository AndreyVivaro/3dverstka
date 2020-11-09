 <div class="col-xl-4 col-lg-8 col-md-12 item-category-product">
                <div class="slider-product-cart">
                  <div class="slider-product-cart__title title-dotted-min">Новинки</div>
                  <div class="swiper-container slider-product-cart__swiper-container">
                    <div class="swiper-wrapper">
					  <?php foreach ($products as $product) { ?>
                      <!-- один слайдер с карточкой-->
                      <div class="swiper-slide">
                        <!-- шаблон №3 карточки товара-->
                    <div class="card-product-wrap card-product-wrap-js">
                        <!-- шапка карточки с иконками-->
                        <div class="card-product-wrap__wrap-info-icons-buttons">
                          <div class="card-product-wrap__info-icons">
                            <div class="card-product-wrap__info-icon"><span></span>
                              <svg class="svg-sprite-icon icon-Top">
                                <use xlink:href="static/images/sprite/symbol/sprite.svg#Top"></use>
                              </svg>
                            </div>
                            <!--div.card-product-wrap__info-icon
                            span
                            +icon("New")
                            -->
                            <!--div.card-product-wrap__info-icon
                            span 13%
                            +icon("Sale")
                            -->
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
                        <a href="<?php echo $product['href']; ?>"><div class="card-product-wrap__wrap-img"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>"></div></a>
                        <div class="card-product-wrap__wraper-content">
                         <a href="<?php echo $product['href']; ?>"><p class="card-product-wrap__name"><?php echo $product['name']; ?></p></a>
            <?php if($product['attribute_groups']) { ?>
					  <?php $i = 1; foreach($product['attribute_groups'] as $attribute_group) { ?>
						<?php if($attribute_group['name']=='#Краткое описание') { ?>
                        <?php foreach($attribute_group['attribute'] as $attribute) { ?>
					 <?php if($i==4){break;} ?>
						<?php if($attribute['name']!='Дата поступления на склад') { ?>
						
						  <div class="card-product-wrap__wrap-info-text">
                            <div class="card-product-wrap__info-text"><?php echo $attribute['name']; ?>:</div>
                            <div class="card-product-wrap__info-param"><?php echo $attribute['text']; ?></div>
                          </div>
						  
						<?php } ?>
	
					<?php $i++; ?>
                        <?php } ?>
						 <?php } ?>
						<?php } ?>
						<?php } ?>
                     
					 

						 
                        </div>
                  	<?php if ($product['quantity']==0) { ?>
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
                     <?php } ?>
                    </div>
                    <div class="slider-product-cart__swiper-button-next"><span class="arrow"></span></div>
                    <div class="slider-product-cart__swiper-button-prev"><span class="arrow"></span></div>
                  </div>
                </div>
    </div>
