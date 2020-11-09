  <footer class="footer-main">
        <div class="footer-top">
          <div class="container">
            <div class="row">
              <div class="col-xl-6 col-lg-6 col-md-9">
                <div class="row">
                  <div class="col-xl-6 col-lg-6 col-md-6">
                    <p class="footer-main__descr">Информация</p>
                    <ul class="footer-main__menu">
		  <?php foreach ($informations as $information) { ?>
		  <li class="footer-main__item-menu"><a class="footer-main__ankor-menu" href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
          <?php } ?>
                    </ul>
                  </div>
                  <div class="col-xl-6 col-lg-6 col-md-6">
                    <p class="footer-main__descr">Оборудование</p>
                    <ul class="footer-main__menu">
                      <li class="footer-main__item-menu"><a class="footer-main__ankor-menu" href="/kupit-3d-printer/">3D принтеры</a></li>
                      <li class="footer-main__item-menu"><a class="footer-main__ankor-menu" href="/3d-scaner/">3D сканеры</a></li>
                      <li class="footer-main__item-menu"><a class="footer-main__ankor-menu" href="/kupit-3d-printer/">Аксессуары</a></li>
                    </ul>
                  </div>
                </div>
                <div class="row">
                  <div class="col-xl-6 col-lg-6 col-md-6">
                    <p class="footer-main__descr">Покупателям</p>
                    <ul class="footer-main__menu">
                      <li class="footer-main__item-menu"><a class="footer-main__ankor-menu" href="/politika_konfidencialnosti">Политика конфиденциальности</a></li>
                      <li class="footer-main__item-menu"><a class="footer-main__ankor-menu" href="/otzyvy/">Отзывы о нас</a></li>
                      <li class="footer-main__item-menu"><a class="footer-main__ankor-menu" href="/blog/">Блог</a></li>
                    </ul>
                  </div>
                  <div class="col-xl-6 col-lg-6 col-md-6">
                    <p class="footer-main__descr">Расходные материалы</p>
                    <ul class="footer-main__menu">
                      <li class="footer-main__item-menu"><a class="footer-main__ankor-menu" href="/rashodnye-materialy/photopolymernaya-smola/">Фотополимеры</a></li>
                      <li class="footer-main__item-menu"><a class="footer-main__ankor-menu" href="/rashodnye-materialy/abs-filament/">ABS пластик</a></li>
                      <li class="footer-main__item-menu"><a class="footer-main__ankor-menu" href="/rashodnye-materialy/pla-filament/">PLA пластик</a></li>
                      <li class="footer-main__item-menu"><a class="footer-main__ankor-menu" href="/rashodnye-materialy/hips/">HIPS пластик</a></li>
                      <li class="footer-main__item-menu"><a class="footer-main__ankor-menu" href="/rashodnye-materialy/flex/">FLEX пластик</a></li>
                    </ul>
                  </div>
                </div>
              </div>
              <div class="col-xl-6 col-lg-6 col-md-3">
                <div class="footer-main__wrap-social-text">
                  <p class="footer-main__social-text">Мы в соц. сетях:</p>
                  <div class="socials"><a class="socialHref" href="https://wa.me/79081361978" target="_blank" title="Связаться по 'whatsapp'"><img src="static/images/general/iconWhatsap.png" alt="Иконка"></a><a class="socialHref" href="https://3d-favorit.ru/image/catalog/revolution/other/vk.png" target="_blank" title="Перейти на страницу 'В контакте'"><img src="static/images/general/iconVK.png" alt="Иконка"></a><a class="socialHref" href="https://www.instagram.com/favorit3d/" target="_blank" title="Перейти на страницу 'Инстаграмм'"><img src="static/images/general/iconInsta.png" alt="Иконка"></a><a class="socialHref" href="https://www.youtube.com/channel/UCovsd7mCCbHUKQLHATxvc7A" target="_blank" title="Перейти на канал 'YouTybe'"><img src="static/images/general/iconYouTybe.png" alt="Иконка"></a></div><a class="footer-main__ankor-menu footer-main__ankor-menu-mobile" href="#">Политика конфиденциальности</a>
                </div>
                <p class="footer-main__text-about">Компания "Фаворит 3D" существует и активно развивается уже более трех лет. За это время десятки компаний доверили нам свой бизнес. Если Вы зашли на наш сайт, значит у Вас есть интерес к 3D-технологиям, стремление к развитию и внедрению современных тенденций, а значит Вы любознательны, молоды и активны. Мы являемся официальным поставщиком 3D оборудования самых популярных брендов. На нашем сайте мы подобрали только самое лучшее оборудование и расходные материалы. У нас Вы получите предложение на любой Ваш запрос и под любую специфику (большой объем камеры построения, точность, скорость, универсальность... И всегда по самым лучшим ценам!</p>
              </div>
            </div>
          </div>
        </div>
        <div class="footer-bottom">
          <div class="container">
            <div class="row">
              <div class="footer-main__wrap-payment"><img src="static/images/general/icon_visa.png" alt="Иконка"><img src="static/images/general/icon_master.png" alt="Иконка"><img src="static/images/general/icon_sber.png" alt="Иконка"><img src="static/images/general/icon_A.png" alt="Иконка"><img src="static/images/general/icon_Unit.png" alt="Иконка"></div>
              <div class="footer-main__text-copy">Все права защищены ©"Фаворит 3D" <span class="without-breaking">2015-2020</span></div><a href="https://intrid.ru/" target="_blank" class="made-intrid" title="Разработка сайтов в веб-студии Воронежа">made in INTRID</a>
            </div>
          </div>
        </div>
      </footer>
      <!-- footer-->
    </div>
	
    <!-- bootstrap подключаем отдельно-->
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="static/js/vendor/libs.js"></script>
    <script src="static/js/main.js"></script>

<?php echo $sobfeedback_id43; ?>
<?php echo $sobfeedback_id44; ?>
<?php echo $sobfeedback_id45; ?>


	<!-- ocmodpcart start //-->
				<?php if ($ocmodpcart) { ?>
				<link href="catalog/view/javascript/ocmod/magnific-popup.css" rel="stylesheet" media="screen"/>
				<link href="catalog/view/theme/default/stylesheet/ocmodpcart.css" rel="stylesheet" media="screen"/>
				<script src="catalog/view/javascript/ocmod/jquery.magnific-popup.min.js" type="text/javascript"></script>
				<script type="text/javascript"><!--
				$(function() {
					$.each($("[onclick^='cart.add']"), function() {
						var product_id = $(this).attr('onclick').match(/[0-9]+/);
						$(this).attr('onclick', 'get_ocmodpcart(\'' + $(this).attr('onclick').match(/[0-9]+/) + '\',\'' + 'catalog' + '\');');
					});
					var main_product_id = $('input[name=\'product_id\']').val();
					$('#button-cart').unbind('click').attr('onclick', 'get_ocmodpcart(\'' + main_product_id + '\',\'' + 'product' + '\');');
					$('#cart > button').removeAttr('data-toggle').attr('onclick', 'get_ocmodpcart(false,\'' + 'show_cart' + '\');');
				});
				function get_ocmodpcart(product_id, action, quantity) {
					quantity = typeof(quantity) != 'undefined' ? quantity : 1;
					if (action == "catalog") {
						$.ajax({
							url: 'index.php?route=checkout/cart/add',
							type: 'post',
							data: 'product_id=' + product_id + '&quantity=' + quantity,
							dataType: 'json',
							success: function(json) {
								$('.alert, .text-danger').remove();
								if (json['redirect']) {
									location = json['redirect'];
								}
								if (json['success']) {
									$.magnificPopup.open({
									removalDelay: 300,
									callbacks: {
										beforeOpen: function() {
										   this.st.mainClass = 'mfp-zoom-in';
										}
									},
									tLoading: '',
									items: {
										src: 'index.php?route=extension/module/ocmodpcart',
										type: 'ajax'
									}
									});
									$('#cart-total').html(json['total']);
									$('#cart-total-popup').html(json['total']);
									$('#cart > ul').load('index.php?route=common/cart/info ul li');
								}
							}
						});
					}
					if (action == "product") {
						$.ajax({
							url: 'index.php?route=checkout/cart/add',
							type: 'post',
							data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
							dataType: 'json',
							success: function(json) {
							$('.alert, .text-danger').remove();
							$('.form-group').removeClass('has-error');
							$('.success, .warning, .attention, information, .error').remove();							
								if (json['error']) {
									if (json['error']['option']) {
										for (i in json['error']['option']) {
											$('#input-option' + i).before('<span class="error bg-danger">' + json['error']['option'][i] + '</span>');
										}
									}
								}
								if (json['success']) {
									$.magnificPopup.open({
										removalDelay: 300,
										callbacks: {
											beforeOpen: function() {
											   this.st.mainClass = 'mfp-zoom-in';
											}
										},
										tLoading: '',
										items: {
											src: 'index.php?route=extension/module/ocmodpcart',
											type: 'ajax'
										}
									});
									$('#cart-total').html(json['total']);
									$('#cart-total-popup').html(json['total']);
									$('#cart > ul').load('index.php?route=common/cart/info ul li');
								}
							}
						});
					}
					if (action == "show_cart") {
						$.magnificPopup.open({
							removalDelay: 300,
							callbacks: {
								beforeOpen: function() {
								   this.st.mainClass = 'mfp-zoom-in';
								}
							},
							tLoading: '',
							items: {
								src: 'index.php?route=extension/module/ocmodpcart',
								type: 'ajax'
							}
						});
					}
				}
				//--></script>
				<?php } ?>
				<!-- ocmodpcart stop //-->
  </body>
</html>