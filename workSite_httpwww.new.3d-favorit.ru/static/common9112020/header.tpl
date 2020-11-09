<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title><?php echo $title;  ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta property="og:title" content="<?php echo $title; ?>" />
<meta property="og:type" content="website" />
<meta property="og:url" content="<?php echo $og_url; ?>" />
<?php if ($og_image) { ?>
<meta property="og:image" content="<?php echo $og_image; ?>" />
<?php } else { ?>
<meta property="og:image" content="<?php echo $logo; ?>" />
<?php } ?>
<meta property="og:site_name" content="<?php echo $name; ?>" />
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<link href="https://fonts.googleapis.com/css2?family=Ubuntu:wght@300;400;500;700&amp;display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="static/css/styles.css">
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>

<?php if($design_fastorder){ ?>
	<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/fastorder<?php echo $design_fastorder;?>.css" />
<?php } else { ?>
	<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/fastorder1.css" />
<?php } ?>
<script src="catalog/view/javascript/newfastorder.js" type="text/javascript"></script>	
<script src="catalog/view/javascript/jquery/magnific/jquery.magnific-popup.min.js" type="text/javascript"></script>
<link media="screen" href="catalog/view/javascript/jquery/magnific/magnific-popup.css" type="text/css" rel="stylesheet">	
<script type="text/javascript" src="catalog/view/javascript/quickorder/owl-carousel/owl.carousel.min.js"></script> 
<link media="screen" href="catalog/view/javascript/quickorder/owl-carousel/owl.carousel.css" rel="stylesheet">
<script type="text/javascript">
function fastorder_open(product_id) {  
    $.magnificPopup.open({
        tLoading: '<span><i style="font-size:50px;" class="fa fa-spinner fa-pulse"></i></span>',
        items: {
        src: 'index.php?route=extension/module/newfastorder&product_id='+product_id,
        type: 'ajax'
		}
    });
}
function fastorder_open_cart() {  
    $.magnificPopup.open({
        tLoading: '<span><i style="font-size:50px;" class="fa fa-spinner fa-pulse"></i></span>',
        items: {
        src: 'index.php?route=extension/module/newfastordercart',
        type: 'ajax'
        }	
    });
}		
</script>

<style>
.btn-quick-order {
	background:#<?php echo $background_button_open_form_send_order;?>;
	border-color:#<?php echo $background_button_open_form_send_order;?>;
	color:#<?php echo $color_button_open_form_send_order;?> !important;
}
.btn-quick-order:hover {
	background:#<?php echo $background_button_open_form_send_order_hover;?>;
	border-color:#<?php echo $background_button_open_form_send_order_hover;?>;				
}
.fast-checkout .btn-ordercart {
	background:#<?php echo $background_button_open_form_send_order;?>;
	border-color:#<?php echo $background_button_open_form_send_order;?>;
	color:#<?php echo $color_button_open_form_send_order;?> !important;
}
.fast-checkout .btn-ordercart:hover {
	background:#<?php echo $background_button_open_form_send_order_hover;?>;
	border-color:#<?php echo $background_button_open_form_send_order_hover;?>;	
}
</style>
</head>

  <body>
    <div class="wrapper">
      <!-- header-->
      <header class="header-main">
        <div class="header-top">
          <div class="container">
            <div class="menu-wrap-icon-mobile menu-icon-mobile-js">
              <div class="menu-icon-mobile"></div>
            </div>
            <ul class="menu-company">
          <?php foreach ($informations as $information) { ?>
          <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
          <?php } ?>
		  
            </ul>
            <ul class="menu-navigation">
              <li><a href="/compare-products/">
                  <svg class="svg-sprite-icon icon-Scales">
                    <use xlink:href="static/images/sprite/symbol/sprite.svg#Scales"></use>
                  </svg><span class="text">Сравнение</span></a></li>
              <li><a href="<?php echo $wishlist; ?>"> 
                  <svg class="svg-sprite-icon icon-Love">
                    <use xlink:href="static/images/sprite/symbol/sprite.svg#Love"></use>
                  </svg><span class="text">Закладки</span></a></li>
              
			  <li><a href="<?php echo $account; ?>"> 
                  <svg class="svg-sprite-icon icon-Man">
                    <use xlink:href="static/images/sprite/symbol/sprite.svg#Man"></use>
                  </svg><span class="text">Личный кабинет</span></a></li>
            </ul>
          </div>
        </div>
        <div class="header-center">
          <div class="container"><a class="logo" href="/" title="На главную"><img src="static/images/general/logo.png" alt="Логотип Favorit 3D"></a>
            <div class="socials"><a class="socialHref" href="https://wa.me/79081361978" target="_blank" title="Связаться по 'whatsapp'"><img src="static/images/general/iconWhatsap.png" alt="Иконка"></a><a class="socialHref" href="https://3d-favorit.ru/image/catalog/revolution/other/vk.png" target="_blank" title="Перейти на страницу 'В контакте'"><img src="static/images/general/iconVK.png" alt="Иконка"></a><a class="socialHref" href="https://www.instagram.com/favorit3d/" target="_blank" title="Перейти на страницу 'Инстаграмм'"><img src="static/images/general/iconInsta.png" alt="Иконка"></a><a class="socialHref" href="https://www.youtube.com/channel/UCovsd7mCCbHUKQLHATxvc7A" target="_blank" title="Перейти на канал 'YouTybe'"><img src="static/images/general/iconYouTybe.png" alt="Иконка"></a></div>
            <div class="contacts-email"><a class="email-href" href="mailto:Info@3d-favorit.ru" title="Написать письмо">
                <svg class="svg-sprite-icon icon-Mail">
                  <use xlink:href="static/images/sprite/symbol/sprite.svg#Mail"></use>
                </svg>Info@3d-favorit.ru</a></div>
            <div class="contacts-telephone"><a class="phone-href" href="tel:+74732959349" title="Связаться по телефону">
                <svg class="svg-sprite-icon icon-Phone">
                  <use xlink:href="static/images/sprite/symbol/sprite.svg#Phone"></use>
                </svg>+7 (473) 295-93-49</a><a class="phone-href" href="tel:+79009597796" title="Связаться по телефону">+7 (900) 959-77-96</a></div>
            <div class="wrap-buttons"><a class="button button-call" href="#">Заказать звонок</a><a class="button button-basket" href="/simplecheckout">
                <svg class="svg-sprite-icon icon-Basket">
                  <use xlink:href="static/images/sprite/symbol/sprite.svg#Basket"></use>
                </svg>Корзина (<?php echo $cart; ?>)</a></div>
          </div>
        </div>
        <nav class="header-bottom">
          <div class="container"><a class="logo" href="#" title="На главную"><img src="static/images/general/logoMin.png" alt="Логотип Favorit 3D"></a>
            <ul class="menu-catalog">
              <?php foreach ($categories as $category) { ?>
			 <?php if ($category['children']) { ?>
			  <li class="menu-catalog__item menu-catalog__item-children menu-catalog__item-js"> <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
                <ul class="menu-catalog__sub-menu">
                 <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
				 <?php foreach ($children as $child) { ?>
				 <li><a class="menu-catalog__sub-menu-href" href="<?php echo $child['href']; ?>">
                      <div class="menu-catalog__sub-menu-icon"><img src="<?php echo $child['thumb']; ?>" alt="иконка пункта подменю"></div><span class="menu-catalog__sub-menu-text"><?php echo $child['name']; ?></span></a></li>
                 <?php } ?>
				 <?php } ?>
                </ul>
              </li>
              <?php } else { ?>
		     <li class="menu-catalog__item menu-catalog__item-js"> <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
             <?php } ?>
			 <?php } ?>
			 
			 <li class="menu-catalog__item menu-catalog__item-js"> <a href="/uslugi-3d-pechati">Услуги 3D печати</a></li>
			 <li class="menu-catalog__item menu-catalog__item-js"> <a href="/specials/">Акции</a></li>
			 
 
            </ul>
			
			<?php echo $search; ?>
        
			
			<a class="phone-href" href="tel:+74732959349" title="Связаться по телефону">+7 (473) 295-93-49</a>
          </div>
        </nav>
        <div class="header-mobile">
          <div class="menu-wrap-icon-mobile menu-icon-mobile-js">
            <div class="menu-icon-mobile"></div>
          </div><a href="tel:+74732959349" title="Связаться по телефону">
            <svg class="svg-sprite-icon icon-Phone">
              <use xlink:href="static/images/sprite/symbol/sprite.svg#Phone"></use>
            </svg></a>
          <div class="wrap-logo-mobile" onclick="location.href='/'" style="cursor: pointer;"><img src="static/images/general/logo.png" alt="Логотип Favorit 3D"></div><a href="<?php echo $account; ?>">
            <svg class="svg-sprite-icon icon-Man">
              <use xlink:href="static/images/sprite/symbol/sprite.svg#Man"></use>
            </svg></a><a href="<?php echo $shopping_cart; ?>">
            <svg class="svg-sprite-icon icon-Basket">
              <use xlink:href="static/images/sprite/symbol/sprite.svg#Basket"></use>
            </svg></a>
        </div>
        <!-- .active-->
        <div class="header-popup header-popup-js">
          <div class="container">
            <div class="menu-wrap-icon-mobile menu-icon-mobile-js">
              <div class="menu-icon-mobile menu-icon-mobile-close"></div>
            </div>
			
            <div class="header-search" id="search2">
              <input class="search-input" type="text" name="search" value="" placeholder="Поиск">
			  <button type="button"></button>
              <div class="header-search__icon"></div>
            </div>
            <ul class="menu-catalog">
              
			 <?php foreach ($categories as $category) { ?>
			 <?php if ($category['children']) { ?>
			  <li class="menu-catalog__item menu-catalog__item-children menu-catalog__item-js"> <span><?php echo $category['name']; ?></span>
                <ul class="menu-catalog__sub-menu menu-catalog__sub-menu-js">
				  <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
				  <?php foreach ($children as $child) { ?>
                  <li><a class="menu-catalog__sub-menu-href" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
				  <?php } ?>
				  <?php } ?>
                </ul>
              </li>
              <?php } else { ?>
              <li class="menu-catalog__item menu-catalog__item-js"> <span><?php echo $category['name']; ?></span></li>
              <?php } ?>
              <?php } ?>
			   
            </ul>
            <ul class="menu-company">
		<?php foreach ($informations as $information) { ?>
          <li class="menu-company__item"><a href="<?php echo $information['href']; ?>"  class="menu-company__href"><?php echo $information['title']; ?></a></li>
          <?php } ?>
            </ul>
            <div class="contacts-telephone"><a class="phone-href icon" href="tel:+74732959349" title="Связаться по телефону">
                <svg class="svg-sprite-icon icon-Phone">
                  <use xlink:href="static/images/sprite/symbol/sprite.svg#Phone"></use>
                </svg>+7 (473) 295-93-49</a><a class="phone-href icon" href="tel:+79009597796" title="Связаться по телефону">+7 (900) 959-77-96</a></div>
            <div class="contacts-email"><a class="email-href icon" href="mailto:info@invoice77.ru" title="Написать письмо">
                <svg class="svg-sprite-icon icon-Mail">
                  <use xlink:href="static/images/sprite/symbol/sprite.svg#Mail"></use>
                </svg>Info@3d-favorit.ru</a></div>
            <div class="socials"><a class="socialHref" href="https://wa.me/79081361978" target="_blank" title="Связаться по 'whatsapp'"><img src="static/images/general/iconWhatsap.png" alt="Иконка"></a><a class="socialHref" href="https://3d-favorit.ru/image/catalog/revolution/other/vk.png" target="_blank" title="Перейти на страницу 'В контакте'"><img src="static/images/general/iconVK.png" alt="Иконка"></a><a class="socialHref" href="https://www.instagram.com/favorit3d/" target="_blank" title="Перейти на страницу 'Инстаграмм'"><img src="static/images/general/iconInsta.png" alt="Иконка"></a><a class="socialHref" href="https://www.youtube.com/channel/UCovsd7mCCbHUKQLHATxvc7A" target="_blank" title="Перейти на канал 'YouTybe'"><img src="static/images/general/iconYouTybe.png" alt="Иконка"></a></div>
            <ul class="menu-navigation">
              <li class="menu-navigation__item"><a class="menu-navigation__href" href="/compare-products/">
                  <svg class="svg-sprite-icon icon-Scales">
                    <use xlink:href="static/images/sprite/symbol/sprite.svg#Scales"></use>
                  </svg><span class="text">Сравнение</span></a></li>
              <li class="menu-navigation__item"><a class="menu-navigation__href" href="<?php echo $wishlist; ?>">
                  <svg class="svg-sprite-icon icon-Love">
                    <use xlink:href="static/images/sprite/symbol/sprite.svg#Love"></use>
                  </svg><span class="text">Закладки</span></a></li>
            </ul>
          </div>
        </div>
      </header>