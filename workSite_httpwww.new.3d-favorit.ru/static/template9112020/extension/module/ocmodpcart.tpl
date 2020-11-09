<div id="ocmod-popup-okno">


        <div id="ocmod-popup-okno-inner">
		
				  <?php if ($products) { ?>

          <div class="cd-popup-close" onclick="$.magnificPopup.close();"><span class="cd-popup-close-icon"></span></div>
          <div class="cont-modal">
		  
            <p class="descr-modal">Товар добавлен в корзину</p>
			
			
            <div class="fields-modal">
              <div class="wrap-products-modal">
			      <?php if ($attention) { ?>
    <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $attention; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
	<br>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
	<br>
    <?php } else { ?>
    <div id="success-message"></div>
    <?php } ?>
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
	<br>
    <?php } ?>
	
	        <?php foreach ($products as $product) { ?>
                <div class="display-products-cart product-info-basket-modal"><img class="product-info-basket-modal-img" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>">
                  <p class="product-info-basket-modal-name"><?php echo $product['name']; ?> <?php if (!$product['stock']) { ?><span class="text-danger">***</span><?php } ?></p>
                  
				  <input name="product_id" value="<?php echo $product['key']; ?>" style="display: none;" type="hidden" />
			 
			         <div class="number">
              <input name="product_id" value="<?php echo $product['key']; ?>" style="display: none;" type="hidden" />
              <div class="frame-change-count">
                <div class="btn-plus">
                  <button type="button" onclick="$(this).parent().parent().next().val(~~$(this).parent().parent().next().val()+1); update( this, 'update' );">
                    +
                  </button>
                </div>
                <div class="btn-minus">
                  <button type="button" onclick="$(this).parent().parent().next().val(~~$(this).parent().parent().next().val()-1); update( this, 'update' );">
                    -
                  </button>
                </div>
              </div>
              <input type="text" name="quantity" value="<?php echo $product['quantity']; ?>" class="plus-minus" onchange="update_manual( this, '<?php echo $product['key']; ?>' ); return validate(this);" onkeyup="update_manual( this, '<?php echo $product['key']; ?>' ); return validate(this);" />
            </div>


              
                  <p class="product-description__text-price product-description__text-price-base">
				  <span class="number-space-js"><?php echo $product['total']; ?></span>
				  <span class="rub">&nbsp;</span>
				  </p>
                  <button class="button-delete" onclick="update( this, 'remove' );"></button>
				  <input name="product_key" value="<?php echo $product['key']; ?>" style="display: none;" hidden />
                </div>
            <?php } ?>
			
              </div>
              
			  <?php foreach ($totals as $total) { ?>
			  <p class="price-total-basket-modal"><?php echo $total['title']; ?>: 
			  <span class="product-description__text-price product-description__text-price-base">
			  <span class="number-space-js"><?php echo $total['text']; ?></span><span class="rub">&nbsp;</span>
			  </span>
			  </p>
			  <?php } ?>
         
              <div class="wrap-button-modal">
                <button class="button" onclick="$.magnificPopup.close();">Продолжить покупки</button>
                <button onclick="location.href='<?php echo $checkout_link; ?>'" class="button">Оформить заказ</button>
              </div>
            </div>
			
			<?php } else { ?>
			
			          <div class="cd-popup-close" onclick="$.magnificPopup.close();"><span class="cd-popup-close-icon"></span></div>

			   <div class="cont-modal">
		  
            <p class="descr-modal">Корзина</p>
		<br>
  <center><p><?php echo $text_cartpopup_empty; ?></p></center>
  <br>
   </div>
<?php } ?>

          </div>
        </div>
  
	
<script type="text/javascript"><!--
function masked(element, status) {
  if (status == true) {
    $('<div/>')
    .attr({ 'class':'masked' })
    .prependTo(element);
    $('<div class="masked_loading" />').insertAfter($('.masked'));
  } else {
    $('.masked').remove();
    $('.masked_loading').remove();
  }
}

function validate( input ) {
  input.value = input.value.replace( /[^\d,]/g, '' );
}

function update( target, status ) {
  masked('#ocmod-popup-okno-inner', true);
  var input_val    = $( target ).parent().parent().parent().children( 'input[name=quantity]' ).val(),
      quantity     = parseInt( input_val ),
      product_id   = $( target ).parent().parent().parent().children( 'input[name=product_id]' ).val(),
      product_key  = $( target ).next().val(),
      urls         = null;

  if ( quantity <= 0 ) {
    masked('#ocmod-popup-okno-inner', false);
    quantity = $( target ).parent().parent().parent().children( 'input[name=quantity]' ).val( 1 );
    return;
  }

  if ( status == 'update' ) {
    urls = 'index.php?route=extension/module/ocmodpcart&update=' + product_id + '&quantity=' + quantity;
  } else if ( status == 'add' ) {
    urls = 'index.php?route=extension/module/ocmodpcart&add=' + target + '&quantity=1';
  } else {
    urls = 'index.php?route=extension/module/ocmodpcart&remove=' + product_key;
  }
      
  $.ajax({
    url: urls,
    type: 'get',
    dataType: 'html',
    success: function( data ) {
      $.ajax({
        url: 'index.php?route=extension/module/ocmodpcart/status_cart',
        type: 'get',
        dataType: 'json',
        success: function( json ) {
          masked('#ocmod-popup-okno-inner', false);
          if (json['total']) {
            $('#cart-total' ).html(json['total']);
			$('#cart > ul').load('index.php?route=common/cart/info ul li');
          }
          $('#ocmod-popup-okno-inner').html( $( data ).find( '#ocmod-popup-okno-inner > *' ) );
        } 
      });
    } 
  });
}
function update_manual( target, product_id ) {
  masked('#ocmod-popup-okno-inner', true);
  var input_val = $( target ).val(),
      quantity  = parseInt( input_val );
    
  if ( quantity <= 0 ) {
    masked('#ocmod-popup-okno-inner', false);
    quantity = $( target ).val( 1 );
    return;
  }
  
  $.ajax({
    url: 'index.php?route=extension/module/ocmodpcart&update=' + product_id + '&quantity=' + quantity,
    type: 'get',
    dataType: 'html',
    success: function( data ) {
      $.ajax({
        url: 'index.php?route=extension/module/ocmodpcart/status_cart',
        type: 'get',
        dataType: 'json',
        success: function( json ) {
          masked('#ocmod-popup-okno-inner', false);
          if (json['total']) {
            $('#cart-total' ).html(json['total']);
            $('#cart > ul').load('index.php?route=common/cart/info ul li');
          }
          $('#ocmod-popup-okno-inner').html( $( data ).find( '#ocmod-popup-okno-inner > *' ) );
        } 
      });
    } 
  });
}
//--></script>
</div>