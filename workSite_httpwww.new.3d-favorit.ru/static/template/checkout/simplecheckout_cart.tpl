        <section class="section-basket-product section-padding-bottom">
          <div class="container">
            <div class="row">
			
              <div class="col-xl-12 wpap-table simplecheckout-block"  id="simplecheckout_cart" <?php echo $hide ? 'data-hide="true"' : '' ?> <?php echo $has_error ? 'data-error="true"' : '' ?>>
                
				<?php if ($attention) { ?>
    <div class="alert alert-danger simplecheckout-warning-block"><?php echo $attention; ?></div>
<?php } ?>
<?php if ($error_warning) { ?>
    <div class="alert alert-danger simplecheckout-warning-block"><?php echo $error_warning; ?></div>
<?php } ?>


				<table class="table-basket-product">
                  <tbody>
                    <tr class="table-basket-product__head">
                      <td class="td-img"></td>
                      <td class="td-name">Товар</td>
                      <td class="td-quantity">Количество</td>
                      <td class="td-price">Цена</td>
                      <td class="td-total">Итого</td>
                      <td class="td-button"></td>
                    </tr>
					
					<?php foreach ($products as $product) { ?>
                    <tr class="table-basket-product__product">
                      <td class="td-img"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>"></td>
                      <td class="td-name"><?php echo $product['name']; ?> <?php if (!$product['stock'] && ($config_stock_warning || !$config_stock_checkout)) { ?>
                            <span class="product-warning">***</span>
                        <?php } ?></td>
                      <td>
                        <div class="wrap-recount quantity">
                          <button class="wrap-recount__recount-minus" data-onclick="decreaseProductQuantity" >-</button>
						  <input class="wrap-recount__recount-input" type="text" data-onchange="changeProductQuantity" <?php echo $quantity_step_as_minimum ? 'onfocus="$(this).blur()" data-minimum="' . $product['minimum'] . '"' : '' ?> name="quantity[<?php echo !empty($product['cart_id']) ? $product['cart_id'] : $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" />
                          <button class="wrap-recount__recount-plus" data-onclick="increaseProductQuantity">+</button>
                        </div>
                      </td>
                      <td>
                        <p class="product-description__text-price product-description__text-price-base"><span class="number-space-js"><?php echo $product['price']; ?></span><span class="rub">&nbsp;</span></p>
                      </td>
                      <td>
                        <p class="product-description__text-price product-description__text-price-base"><span class="number-space-js"><?php echo $product['total']; ?></span><span class="rub">&nbsp;</span></p>
                      </td>
                      <td>
                        <button data-onclick="removeProduct" data-product-key="<?php echo !empty($product['cart_id']) ? $product['cart_id'] : $product['key'] ?>" class="button-delete"></button>
                      </td>
                    </tr>
					<?php } ?>

                    <tr class="table-basket-product__footer">
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td>
                        <?php foreach ($totals as $total) { ?>
						<?php if ($total['title'] == 'Итого') { ?>
						<p class="product-description__text-price product-description__text-price-base">
						<span class="number-space-js"><?php echo $total['text']; ?></span>
						<span class="rub">&nbsp;</span>
						</p>
					    <?php } ?>
						<?php } ?>
                      </td>
                      <td></td>
                    </tr>
                  </tbody>
                </table>
				
				<input type="hidden" name="remove" value="" id="simplecheckout_remove">
<div style="display:none;" id="simplecheckout_cart_total"><?php echo $cart_total ?></div>
<?php if ($display_weight) { ?>
    <div style="display:none;" id="simplecheckout_cart_weight"><?php echo $weight ?></div>
<?php } ?>

              </div>
            </div>
          </div>
        </section>