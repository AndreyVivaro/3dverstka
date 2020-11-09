     <div class="col-xl-3 col-lg-3">
                <h3 class="title-column">Способ доставки</h3>
                <div class="section-basket-order__wrap-field simplecheckout-block" id="simplecheckout_shipping" <?php echo $hide ? 'data-hide="true"' : '' ?> <?php echo $display_error && $has_error ? 'data-error="true"' : '' ?>>
                  
				  <?php foreach ($shipping_methods as $shipping_method) { ?>
				  <?php foreach ($shipping_method['quote'] as $quote) { ?>
				  <label class="label-radio">
                   <input type="radio" data-onchange="reloadAll" name="shipping_method" <?php echo !empty($quote['dummy']) ? 'disabled="disabled"' : '' ?> <?php echo !empty($quote['dummy']) ? 'data-dummy="true"' : '' ?> value="<?php echo $quote['code']; ?>" id="<?php echo $quote['code']; ?>" <?php if ($quote['code'] == $code) { ?>checked="checked"<?php } ?> />
					<span class="text-radio"><?php echo !empty($quote['title']) ? $quote['title'] : ''; ?></span>
                  </label>
				  <?php } ?>
				  <?php } ?>
                 
				  
				   <input type="hidden" name="shipping_method_current" value="<?php echo $code ?>" />
            <input type="hidden" name="shipping_method_checked" value="<?php echo $checked_code ?>" />
                </div>
              </div>