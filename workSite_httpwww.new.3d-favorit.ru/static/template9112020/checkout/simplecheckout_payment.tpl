<div class="col-xl-4 col-lg-4">
                <h3 class="title-column">Способ оплаты</h3>
                <div class="section-basket-order__wrap-field simplecheckout-block">
                  
				  
				  <div id="simplecheckout_payment" <?php echo $hide ? 'data-hide="true"' : '' ?> <?php echo $display_error && $has_error ? 'data-error="true"' : '' ?>>
				 
				 <?php foreach ($payment_methods as $payment_method) { ?>
				  <label for="<?php echo $payment_method['code']; ?>" class="label-radio">
                 <input type="radio" data-onchange="reloadAll" name="payment_method" value="<?php echo $payment_method['code']; ?>" <?php echo !empty($payment_method['dummy']) ? 'disabled="disabled"' : '' ?> <?php echo !empty($payment_method['dummy']) ? 'data-dummy="true"' : '' ?> id="<?php echo $payment_method['code']; ?>" <?php if ($payment_method['code'] == $code) { ?>checked="checked"<?php } ?> />
					<span class="text-radio"><?php echo $payment_method['title']; ?></span>
                  </label>
				 <?php } ?>
				  
			 <input type="hidden" name="payment_method_current" value="<?php echo $code ?>" />
            <input type="hidden" name="payment_method_checked" value="<?php echo $checked_code ?>" />
				  </div>
				  
				  
                  
               