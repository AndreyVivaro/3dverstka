window.addEventListener('load', () => {
	console.log("Начало работы скрипта");



// header при прокрутке
	var header = document.querySelector('.header-main');
  var headerHeight = parseInt(getComputedStyle(header).height);

  var fixedHeader = function fixedHeader(e) {
    if (headerHeight <= window.pageYOffset) {
      header.classList.add('fixed');
      setTimeout(function () {
        return header.classList.add('active');
      }, 50);
    } else {
      header.classList.remove('fixed');
      header.classList.remove('active');
    }
  };
  fixedHeader();
	window.addEventListener('scroll', fixedHeader);
// header при прокрутке







// слайдер на первом экране
var swiperTopSlider = new Swiper('#top-slider-swiper', {
	speed: 1500,
	parallax: true,
	loop: true,

	autoplay: {
		delay: 4000,
		disableOnInteraction: false,
	},
});
// слайдер на первом экране



// слайдер на главной стр. - товары
var swiperMainProduct = new Swiper('.slider-product-cart__swiper-container', {
	slidesPerView: 1,
	loop: true,

		effect: 'cube',
	grabCursor: true,
	cubeEffect: {
		shadow: true,
		slideShadows: false,
		shadowOffset: 20,
		shadowScale: 0.94,
	},
 
	navigation: {
		nextEl: '.slider-product-cart__swiper-button-next',
		prevEl: '.slider-product-cart__swiper-button-prev',
	},
});
// слайдер на главной стр. - товары



// слайдер с отзывами
var swiperReviews = new Swiper('.swiper-container-reviews', {
	loop: true,
	slidesPerView: 1,
	slidesPerGroup: 1,
	spaceBetween: 0,
	// loopFillGroupWithBlank: false,
	breakpoints: {
		768: {
			slidesPerView: 2,
			slidesPerGroup: 2,
			spaceBetween: 10,
			// loopFillGroupWithBlank: true,
		}, 
		1024: {
			slidesPerView: 3,
			slidesPerGroup: 3,
			spaceBetween: 30,
		},
	},

	pagination: {
		el: '.swiper-container-reviews__swiper-pagination',
		clickable: true,
		// dynamicBullets: true,
	},
	navigation: {
		nextEl: '.swiper-container-reviews__swiper-button-next',
		prevEl: '.swiper-container-reviews__swiper-button-prev',
	},
});
// слайдер с отзывами






// слайдер на странице карточки товара
// левый вертиикальный
var galleryThumbs = new Swiper('.gallery-thumbs', {
	spaceBetween: 10,
	slidesPerView: 4,
	direction: 'vertical',
	freeMode: true,
	watchSlidesVisibility: true,
	watchSlidesProgress: true,
  });

// правый большой

  var galleryTop = new Swiper('.gallery-top', {
	spaceBetween: 0,
	thumbs: {
	  swiper: galleryThumbs
	}
  });



// слайдер на странице карточки товара






// открытие/закрытие мобильного меню
$(".menu-icon-mobile-js").on("click", function(){
	$(".header-popup-js").toggleClass("active");
});



// открытие/закрытие подменю в мобильном меню
$('.menu-catalog__item-js').on('click', function(){
	$(this).toggleClass("active");
	$(this).children(".menu-catalog__sub-menu-js").slideToggle();
});



// добавление класса иконке в карточке товара на главной
$(".card-product-wrap__info-button-js").on('click', function(){
	$(this).toggleClass("active");
});



// при добавлении товара в корзину из карточки товара
$(".card-product-wrap__button-main-basket-js").on("click", function(){
$(this).closest(".card-product-wrap-js").find(".card-product-wrap__info-icon-basket-info-js").addClass("active");
});




	// выбор дополнительного оборудования в карточке товара
	$(".card-product-wrap__wrap-text-dop-js").on('click', function(){
		$(this).toggleClass("active");
	});



// калькуляция кол-ва
function quantityProducts() {
	console.log("стилизация кнопок input ");
	var $quantityArrowMinus = $(".quantity-arrow-minus-js");
	var $quantityArrowPlus = $(".quantity-arrow-plus-js");
	var $quantityNum = "";
	var $quantityNumVal = "";

	$quantityArrowMinus.click(quantityMinus);
	$quantityArrowPlus.click(quantityPlus);
	function quantityMinus() {
		$quantityNum = $(this).closest(".quantity-block-js").find(".inputQuantity-js");
		if ($quantityNum.val() > 1) {
			$quantityNum.val(+$quantityNum.val() - 1);
			console.log($quantityNum);
		}
		$quantityNumVal = +$quantityNum.val();
		console.log($quantityNumVal);
		calcQuantityPrice($quantityNum, $quantityNumVal);
	};

	function quantityPlus() {
		$quantityNum = $(this).closest(".quantity-block-js").find(".inputQuantity-js");
		$quantityNum.val(+$quantityNum.val() + 1);
		console.log($quantityNum);
		$quantityNumVal = +$quantityNum.val();
		console.log($quantityNumVal);
		calcQuantityPrice($quantityNum, $quantityNumVal);
	};
};
quantityProducts();
// калькуляция кол-ва


// пересчет цены в карточке слайдера, в зав-ти от кол-ва
function calcQuantityPrice(item, quantity ){
	let priceItem = item.closest(".card-product-wrap-js").find(".price-product-js");
	let priceProduct = +priceItem.attr("data-priceProduct");
	priceItem.text(priceProduct * quantity);
}






});