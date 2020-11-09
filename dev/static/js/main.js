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
		shadow: false,
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
	// direction: 'vertical',
	direction: getDirection(),
	freeMode: true,
	watchSlidesVisibility: true,
	watchSlidesProgress: true,    
    on: {
        resize: function () {
			galleryThumbs.changeDirection(getDirection());
		}
	}
	
  });

  function getDirection() {
	var windowWidth = window.innerWidth;
	var direction = window.innerWidth <= 768 ? 'horizontal' : 'vertical';

	return direction;
  };



// правый большой

  var galleryTop = new Swiper('.gallery-top', {
	spaceBetween: 0,
	thumbs: {
	  swiper: galleryThumbs
	}
  });



// слайдер на странице карточки товара






// слайдер в popup окне быстрого просмотра
// левый вертиикальный
var galleryThumbsPopup = new Swiper('.gallery-thumbs-popup', {
	spaceBetween: 10,
	slidesPerView: 4,
	// direction: 'vertical',
	direction: getDirectionPopup(),
	freeMode: true,
	watchSlidesVisibility: true,
	watchSlidesProgress: true,    
    on: {
        resize: function () {
			galleryThumbsPopup.changeDirection(getDirectionPopup());
		}
	}
	
  });

  function getDirectionPopup() {
	var windowWidth = window.innerWidth;
	var direction = window.innerWidth <= 768 ? 'horizontal' : 'vertical';

	return direction;
  };



// правый большой

  var galleryTopPopup = new Swiper('.gallery-top-popup', {
	spaceBetween: 0,
	thumbs: {
	  swiper: galleryThumbsPopup
	}
  });



// слайдер в popup окне быстрого просмотра









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



// lightcase в карточке товара

$('a[data-rel^=lightcase]').lightcase();






	/*открытие и закрытие модального окна с формой*/

	//open popup cd-popup_call
	// заказать звонок
	$('.button-call').on('click', function(event){
		event.preventDefault();
		console.log("клик");
		$('.cd-popup_call').addClass('is-visible');
		$("body").addClass("vue-popup");

	});
	

	//open popup cd-popup_basket
	// добавление товара в корзину
	$('.card-product-wrap__button-main-basket-js').on('click', function(event){
		event.preventDefault();
		console.log("клик");
		$('.cd-popup_basket').addClass('is-visible');
		$("body").addClass("vue-popup");
	});


	//open popup cd-popup_quickView
	// быстрый просмотр
	$('a.card-product-wrap__info-button').on('click', function(event){
		event.preventDefault();
		console.log("клик");
		$('.cd-popup_quickView').addClass('is-visible');
		$("body").addClass("vue-popup");
	});


	//open popup cd-popup_quickView
	// заказ в один клик
	$('.card-product-wrap__button-one').on('click', function(event){
		event.preventDefault();
		console.log("клик");
		$('.cd-popup_oneClick').addClass('is-visible');
		$("body").addClass("vue-popup");
	});

	
	//open popup cd-popup_commercialProposal
	// запрос коммерческого предложения
	// необходимо выыести классы для вызова данного окна

	// $('.card-product-wrap__button-main-basket-js').on('click', function(event){
	// 	event.preventDefault();
	// 	console.log("клик");
	// 	$('.cd-popup_commercialProposal').addClass('is-visible');
	// 	$("body").addClass("vue-popup");
	// });


	//close popup
	$(".cd-popup").on('click', function(event){
		// $(event.target).is('.cd-popup-close') || $(event.target).is('.cd-popup')
		// if( $(event.target).is('.cd-popup-close') ) {

		if( $(event.target).is('.cd-popup-close-icon') || $(event.target).is('.cd-popup') ) {
			event.preventDefault();
			$(this).removeClass('is-visible');
			console.log("клик 2222");
			$("body").removeClass("vue-popup");
		}
	});

	//close popup when clicking the esc keyboard button
	$(document).keyup(function(event){
		if(event.which=='27'){
			$('.cd-popup').removeClass('is-visible');
			$("body").removeClass("vue-popup");
		}
	});




	// каталог 1 уровня и каталог 2 уровня


let xxx = $(".wrapper").find('.breadcrumb-item').length;
console.log(xxx);

if(xxx == 0){
	console.log("NO");
}else if(xxx == 1){
$(".company").children(".company-href").addClass("firstCatalog");
console.log("111111");

}else{
	$(".company").children(".company-href").removeClass("firstCatalog");
	console.log("2222222");

}



});