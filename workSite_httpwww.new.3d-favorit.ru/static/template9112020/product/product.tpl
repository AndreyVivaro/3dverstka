<?php echo $header; ?>
   <div class="content">
        <nav aria-label="breadcrumb">
          <div class="container">
            <div class="row">
              <div class="col-xl-12">
                <ol class="breadcrumb">
             <?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
<?php if($i+1<count($breadcrumbs)) { ?>
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
        <section class="section-card-product section-padding-bottom">
          <div class="container">
            <div class="row">
			<span id="notify"></span>
              <div class="col-xl-6 col-lg-6">
                <div class="wrap-sliders">
                  <div class="swiper-container gallery-thumbs swiper-container-card-product-vertical">
                    <div class="swiper-wrapper">
                      <div class="swiper-slide"><img src="<?php echo $popup; ?>" alt="<?php echo $heading_title; ?>"></div>
                       <?php if ($images) { ?>
                       <?php foreach ($images as $image) { ?>
					  <div class="swiper-slide"><img src="<?php echo $image['popup']; ?>" alt="<?php echo $heading_title; ?>"></div>
					  <?php } ?>
                      <?php } ?>
                    </div>
                  </div>
                  <div class="swiper-container gallery-top swiper-container-card-product-big">
                    <div class="swiper-wrapper">
                      <div class="swiper-slide"><a href="<?php echo $popup; ?>" data-rel="lightcase"><img class="lightcase-card-product-js" src="<?php echo $popup; ?>" alt="<?php echo $heading_title; ?>"></a></div>
                     <?php if ($images) { ?>
                     <?php foreach ($images as $image) { ?>
					 <div class="swiper-slide"><a href="<?php echo $image['popup']; ?>" data-rel="lightcase"><img class="lightcase-card-product-js" src="<?php echo $image['popup']; ?>" alt="<?php echo $heading_title; ?>"></a></div>
					 <?php } ?>
                     <?php } ?>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-xl-6 col-lg-6">
                <div class="product-description" id="product">
                  <div class="product-description__info">
                    <div class="rating">
					
			  <?php for ($i = 1; $i <= 5; $i++) { ?>
              <?php if ($rating < $i) { ?>
			  <span class="rating__star">&#9734;</span>
              <?php } else { ?>
			  <span class="rating__star">&#9733;</span>
              <?php } ?>
              <?php } ?>
              </div>

                    <p class="product-description__presence"><?php echo $stock; ?></p>
                    <!-- p.product-description__presence.product-description__presence_no Нет в наличии-->
                    <div class="product-description__info-icons">
                      <div class="product-description__info-icon product-description__info-icon-basket-info-js"><span></span>
                        <svg class="svg-sprite-icon icon-BasketInfo">
                          <use xlink:href="static/images/sprite/symbol/sprite.svg#BasketInfo"></use>
                        </svg>
                      </div>
                      <div class="product-description__info-icon"><span></span>
                        <svg class="svg-sprite-icon icon-Top">
                          <use xlink:href="static/images/sprite/symbol/sprite.svg#Top"></use>
                        </svg>
                      </div>
                      <div class="product-description__info-icon"><span></span>
                        <svg class="svg-sprite-icon icon-New">
                          <use xlink:href="static/images/sprite/symbol/sprite.svg#New"></use>
                        </svg>
                      </div>
  
                    </div>
                  </div>
                  <div class="product-description__wrap-name">
                    <h3 class="product-description__name"><?php echo $heading_title; ?></h3>
                  </div>
				  
				  <?php if ($options) { ?>
            <hr>
   
            <?php foreach ($options as $option) { ?>
            <?php /*
			<?php if ($option['type'] == 'select') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                <?php if ($option_value['price']) { ?>
                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                <?php } ?>
                </option>
                <?php } ?>
              </select>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'radio') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="radio">
                  <label>
                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                    <?php if ($option_value['image']) { ?>
                    <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> 
                    <?php } ?>                    
                    <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'checkbox') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="checkbox">
                  <label>
                    <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                    <?php if ($option_value['image']) { ?>
                    <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> 
                    <?php } ?>
                    <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
			
			*/ ?>
				<?php if ($option['type'] == 'select') { ?>
				<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
				  <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
				  <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
					<option value=""><?php echo $text_select; ?></option>
					<?php foreach ($option['product_option_value'] as $option_value) { ?>
					<option<?php if ($option_value['price_calc']) { ?> data-price-prefix="<?php echo $option_value['price_prefix_calc']; ?>" data-price="<?php echo $option_value['price_calc']; ?>"<?php if ($option_value['special_calc']) { ?> data-special="<?php echo $option_value['special_calc']; ?>"<?php } ?><?php if ($option_value['tax_calc']) { ?> data-tax="<?php echo $option_value['tax_calc']; ?>"<?php } ?><?php } ?><?php if ($option_value['points_calc']) { ?> data-points-prefix="<?php echo $option_value['points_prefix']; ?>" data-points="<?php echo $option_value['points_calc']; ?>"<?php } ?> value="<?php echo $option_value['product_option_value_id']; ?>"<?php echo ($option_value['autoselect'] ? ' selected="selected"' : ''); ?><?php echo $option_value['no_stock_disabled']; ?>><?php echo $option_value['name']; ?><?php if ($option_value['price']) { ?><?php if (!$option_value['special']) { ?>, <?php echo $option_value['price']; ?><?php } else { ?>, <?php echo $option_value['special']; ?><?php } ?><?php } ?><?php if ($option_value['quantity']) { ?>, <?php echo $text_quantity; ?> <?php echo $option_value['quantity']; ?><?php } ?><?php if ($option_value['sku']) { ?>, <?php echo $text_sku; ?> <?php echo $option_value['sku']; ?><?php } ?><?php if ($option_value['points']) { ?>, <?php echo $text_points; ?> <?php echo $option_value['points_prefix']; ?><?php echo $option_value['points']; ?><?php } ?><?php if ($option_value['weight']) { ?>, <?php echo $text_weight; ?> <?php echo $option_value['weight_prefix']; ?><?php echo $option_value['weight']; ?><?php } ?></option>
					<?php } ?>
				  </select>
				</div>
				<?php } ?>
				<?php if ($option['type'] == 'radio' || $option['type'] == 'image') { ?>
				<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
				  <label class="control-label"><?php echo $option['name']; ?></label>
				  <div id="input-option<?php echo $option['product_option_id']; ?>">
					<?php foreach ($option['product_option_value'] as $option_value) { ?>
					<?php if ($option_setting['theme']) { ?>
					<div class="radio-inline theme-button">
					  <label<?php if ($option_value['option_tooltip']) { ?><?php if (!$option_setting['position']) { ?> data-placement="bottom"<?php } ?> data-container="body" data-html="true" ><div class='tooltip-inner'></div></div>" title="<table class='option-table'>
					  <?php if ($option_value['option_popup']) { ?>
					  <tr>
						<td colspan='2' class='text-center'><img class='option-thumbnail' src='<?php echo $option_value['option_popup']; ?>' alt='<?php echo $option_value['name']; ?>'></td>
				      </tr>
					  <?php } ?>
					  <?php if ($option_value['name_tooltip']) { ?>
					  <tr>
						<td class='text-left'><?php echo $text_name; ?></td>
						<td class='text-right'><?php echo $option_value['name_tooltip']; ?></td>
					  </tr>
					  <?php } ?>
					  <?php if ($option_value['price']) { ?>
					  <tr>
						<td class='text-left'><?php echo $text_price; ?></td>
						<td class='text-right'>
						  <?php if ($option_value['special']) { ?>
						  <span class='option-old-price'><?php echo $option_value['price']; ?></span>
						  <span class='option-new-price'><?php echo $option_value['special']; ?></apan>
						  <?php } else { ?>
						  <span class='option-price'><?php echo $option_value['price']; ?></apan>
						  <?php } ?>
						</td>
					  </tr>
					  <?php } ?>
					  <?php if ($option_value['quantity']) { ?>
					  <tr>
						<td class='text-left'><?php echo $text_quantity; ?></td>
						<td class='text-right'><?php echo $option_value['quantity']; ?></td>
					  </tr>
					  <?php } ?>
					  <?php if ($option_value['sku']) { ?>
					  <tr>
				        <td class='text-left'><?php echo $text_sku; ?></td>
						<td class='text-right'><?php echo$option_value['sku']; ?></td>
					  </tr>
					  <?php } ?>
					  <?php if ($option_value['points']) { ?>
					  <tr>
						<td class='text-left'><?php echo $text_points; ?></td>
						<td class='text-right'><?php echo $option_value['points_prefix']; ?><?php echo $option_value['points']; ?></td>
					  </tr>
					  <?php } ?>
					  <?php if ($option_value['weight']) { ?>
					  <tr>
						<td class='text-left'><?php echo $text_weight; ?></td>
						<td class='text-right'><?php echo $option_value['weight_prefix']; ?><?php echo $option_value['weight']; ?></td>
					  </tr>
					  <?php } ?></table>"<?php } ?>>
					    <input<?php if ($option_value['price_calc']) { ?> data-price-prefix="<?php echo $option_value['price_prefix_calc']; ?>" data-price="<?php echo $option_value['price_calc']; ?>"<?php if ($option_value['special_calc']) { ?> data-special="<?php echo $option_value['special_calc']; ?>"<?php } ?><?php if ($option_value['tax_calc']) { ?> data-tax="<?php echo $option_value['tax_calc']; ?>"<?php } ?><?php } ?><?php if ($option_value['points_calc']) { ?> data-points-prefix="<?php echo $option_value['points_prefix']; ?>" data-points="<?php echo $option_value['points_calc']; ?>"<?php } ?> type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>"<?php echo ($option_value['autoselect'] ? ' checked="checked"' : ''); ?><?php echo $option_value['no_stock_disabled']; ?>/>
					    <?php if ($option_value['image']) { ?>
					    <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name']; ?>"/>
					    <?php } else { ?>
					    <span><?php echo $option_value['name']; ?></span>
					    <?php } ?>
					  </label>
					</div>
					<?php } else { ?>
				    <div class="radio no-theme">
					  <label>
						<input<?php if ($option_value['price_calc']) { ?> data-price-prefix="<?php echo $option_value['price_prefix_calc']; ?>" data-price="<?php echo $option_value['price_calc']; ?>"<?php if ($option_value['special_calc']) { ?> data-special="<?php echo $option_value['special_calc']; ?>"<?php } ?><?php if ($option_value['tax_calc']) { ?> data-tax="<?php echo $option_value['tax_calc']; ?>"<?php } ?><?php } ?><?php if ($option_value['points_calc']) { ?> data-points-prefix="<?php echo $option_value['points_prefix']; ?>" data-points="<?php echo $option_value['points_calc']; ?>"<?php } ?> type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>"<?php echo ($option_value['autoselect'] ? ' checked="checked"' : ''); ?><?php echo $option_value['no_stock_disabled']; ?>/>
						<?php if ($option_value['image']) { ?>
					    <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name']; ?>"/>
						<?php if ($option_value['option_popup']) { ?>
					    <div><img src="<?php echo $option_value['option_popup']; ?>" alt="<?php echo $option_value['name']; ?>"/></div>
					    <?php } ?>
					    <?php } ?>
						<?php echo $option_value['name']; ?><?php if ($option_value['price']) { ?><?php if (!$option_value['special']) { ?>, <?php echo $option_value['price']; ?><?php } else { ?>, <span class="option-old-price"><?php echo $option_value['price']; ?></span> <span class="option-new-price"><?php echo $option_value['special']; ?></span><?php } ?><?php } ?><?php if ($option_value['quantity']) { ?>, <?php echo $text_quantity; ?> <?php echo $option_value['quantity']; ?><?php } ?><?php if ($option_value['sku']) { ?>, <?php echo $text_sku; ?> <?php echo $option_value['sku']; ?><?php } ?><?php if ($option_value['points']) { ?>, <?php echo $text_points; ?> <?php echo $option_value['points_prefix']; ?><?php echo $option_value['points']; ?><?php } ?><?php if ($option_value['weight']) { ?>, <?php echo $text_weight; ?> <?php echo $option_value['weight_prefix']; ?><?php echo $option_value['weight']; ?><?php } ?>
				      </label>
					</div>
					<?php } ?>
					<?php } ?>
				  </div>
				</div>
				<?php } ?>
				<?php if ($option['type'] == 'checkbox') { ?>
				<div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
				  <label class="control-label"><?php echo $option['name']; ?></label>
				  <div id="input-option<?php echo $option['product_option_id']; ?>">
					<?php foreach ($option['product_option_value'] as $option_value) { ?>
					<?php if ($option_setting['theme']) { ?>
					<div class="checkbox-inline theme-button">
					  <label<?php if ($option_value['option_tooltip']) { ?><?php if (!$option_setting['position']) { ?> data-placement="bottom"<?php } ?> data-container="body" data-html="true"  title="<table class='option-table'>
					  <?php if ($option_value['option_popup']) { ?>
					  <tr>
						<td colspan='2' class='text-center'><img class='option-thumbnail' src='<?php echo $option_value['option_popup']; ?>' alt='<?php echo $option_value['name']; ?>'></td>
				      </tr>
					  <?php } ?>
					  <?php if ($option_value['name_tooltip']) { ?>
					  <tr>
						<td class='text-left'><?php echo $text_name; ?></td>
						<td class='text-right'><?php echo $option_value['name_tooltip']; ?></td>
					  </tr>
					  <?php } ?>
					  <?php if ($option_value['price']) { ?>
					  <tr>
						<td class='text-left'><?php echo $text_price; ?></td>
						<td class='text-right'>
						  <?php if ($option_value['special']) { ?>
						  <span class='option-old-price'><?php echo $option_value['price']; ?></span>
						  <span class='option-new-price'><?php echo $option_value['special']; ?></apan>
						  <?php } else { ?>
						  <span class='option-price'><?php echo $option_value['price']; ?></apan>
						  <?php } ?>
						</td>
					  </tr>
					  <?php } ?>
					  <?php if ($option_value['quantity']) { ?>
					  <tr>
						<td class='text-left'><?php echo $text_quantity; ?></td>
						<td class='text-right'><?php echo $option_value['quantity']; ?></td>
					  </tr>
					  <?php } ?>
					  <?php if ($option_value['sku']) { ?>
					  <tr>
				        <td class='text-left'><?php echo $text_sku; ?></td>
						<td class='text-right'><?php echo$option_value['sku']; ?></td>
					  </tr>
					  <?php } ?>
					  <?php if ($option_value['points']) { ?>
					  <tr>
						<td class='text-left'><?php echo $text_points; ?></td>
						<td class='text-right'><?php echo $option_value['points_prefix']; ?><?php echo $option_value['points']; ?></td>
					  </tr>
					  <?php } ?>
					  <?php if ($option_value['weight']) { ?>
					  <tr>
						<td class='text-left'><?php echo $text_weight; ?></td>
						<td class='text-right'><?php echo $option_value['weight_prefix']; ?><?php echo $option_value['weight']; ?></td>
					  </tr>
					  <?php } ?></table>"<?php } ?>>
					    <input<?php if ($option_value['price_calc']) { ?> data-price-prefix="<?php echo $option_value['price_prefix_calc']; ?>" data-price="<?php echo $option_value['price_calc']; ?>"<?php if ($option_value['special_calc']) { ?> data-special="<?php echo $option_value['special_calc']; ?>"<?php } ?><?php if ($option_value['tax_calc']) { ?> data-tax="<?php echo $option_value['tax_calc']; ?>"<?php } ?><?php } ?><?php if ($option_value['points_calc']) { ?> data-points-prefix="<?php echo $option_value['points_prefix']; ?>" data-points="<?php echo $option_value['points_calc']; ?>"<?php } ?> type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>"<?php echo ($option_value['autoselect'] ? ' checked="checked"' : ''); ?><?php echo $option_value['no_stock_disabled']; ?>/>
					    <?php if ($option_value['image']) { ?>
					    <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name']; ?>"/>
					    <?php } else { ?>
					        <span>
						  <?php echo $option_value['name']; ?> 
						  <?php if ($option_value['special']) { ?>
						   (<?php echo $option_value['special']; ?>р.)
						  <?php } else { ?>
						  (<?php echo $option_value['price']; ?>р.)
						  <?php } ?>
						  </span>
					    <?php } ?>
					  </label>
					</div>
					<?php } else { ?>
				    <div class="checkbox no-theme">
					  <label>
						<input<?php if ($option_value['price_calc']) { ?> data-price-prefix="<?php echo $option_value['price_prefix_calc']; ?>" data-price="<?php echo $option_value['price_calc']; ?>"<?php if ($option_value['special_calc']) { ?> data-special="<?php echo $option_value['special_calc']; ?>"<?php } ?><?php if ($option_value['tax_calc']) { ?> data-tax="<?php echo $option_value['tax_calc']; ?>"<?php } ?><?php } ?><?php if ($option_value['points_calc']) { ?> data-points-prefix="<?php echo $option_value['points_prefix']; ?>" data-points="<?php echo $option_value['points_calc']; ?>"<?php } ?> type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>"<?php echo ($option_value['autoselect'] ? ' checked="checked"' : ''); ?><?php echo $option_value['no_stock_disabled']; ?>/>
						<?php if ($option_value['image']) { ?>
					    <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name']; ?>"/>
						<?php if ($option_value['option_popup']) { ?>
					    <div><img src="<?php echo $option_value['option_popup']; ?>" alt="<?php echo $option_value['name']; ?>"/></div>
					    <?php } ?>
					    <?php } ?>
						<?php echo $option_value['name']; ?><?php if ($option_value['price']) { ?><?php if (!$option_value['special']) { ?>, <?php echo $option_value['price']; ?><?php } else { ?>, <span class="option-old-price"><?php echo $option_value['price']; ?></span> <span class="option-new-price"><?php echo $option_value['special']; ?></span><?php } ?><?php } ?><?php if ($option_value['quantity']) { ?>, <?php echo $text_quantity; ?> <?php echo $option_value['quantity']; ?><?php } ?><?php if ($option_value['sku']) { ?>, <?php echo $text_sku; ?> <?php echo $option_value['sku']; ?><?php } ?><?php if ($option_value['points']) { ?>, <?php echo $text_points; ?> <?php echo $option_value['points_prefix']; ?><?php echo $option_value['points']; ?><?php } ?><?php if ($option_value['weight']) { ?>, <?php echo $text_weight; ?> <?php echo $option_value['weight_prefix']; ?><?php echo $option_value['weight']; ?><?php } ?>
				      </label>
					</div>
					<?php } ?>
					<?php } ?>
				  </div>
				</div>
				<?php } ?>
				
            <?php if ($option['type'] == 'text') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'textarea') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'file') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
              <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'date') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group date">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'datetime') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group datetime">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'time') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group time">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php } ?>
            <?php } ?>
			
			
                  <div class="product-description__quantity">
                    <div class="product-description__wrap-price-text">
                      <?php if (!$special) { ?>
					  
					   <p class="product-description__text-price product-description__text-price_sale">
					  <span data-price="<?php echo $price_calc; ?>" class="number-space-js calc-price"><?php echo $price; ?></span>
					  <span class="rub">&nbsp;</span></p>
					  
					  <?php } else { ?>
					  
                      <p class="product-description__text-price product-description__text-price-base product-description__text-price_thround">
					  <span data-price="<?php echo $price_calc; ?>" class="number-space-js calc-price"><?php echo $price; ?></span>
					  <span class="rub">&nbsp;</span></p>
					  
                      <p class="product-description__text-price product-description__text-price_sale">
					  <span data-special="<?php echo $special_calc; ?>" class="number-space-js calc-special"><?php echo $special; ?></span>
					  <span class="rub">&nbsp;</span></p>
                      <?php } ?>
					  
                    </div>
					
					<input type="hidden" name="price_format" value="" data-value="<?php echo $option_setting['value']; ?>" data-symbol-left="<?php echo $option_setting['symbol_left']; ?>" data-symbol-right="<?php echo $option_setting['symbol_right']; ?>" data-decimals="<?php echo $option_setting['decimals']; ?>" data-decimal-point="<?php echo $option_setting['decimal_point']; ?>" data-thousand-point="<?php echo $option_setting['thousand_point']; ?>" />
	
			    <?php if ($option_setting['autoselect'] || $minimum > 1) { ?>
				<script type="text/javascript"><!--
					$(document).ready(function() {
						changeOption('');
					});
				//--></script>
				<?php } ?>
				
				<?php if ($options) { ?>
				<script type="text/javascript"><!--
				$('#product input[type=\'radio\'], #product input[type=\'checkbox\'], #product select').on('change', function() {
					changeOption('');
				});
				//--></script>
				<?php } ?>

				
				 <div class="wrap-recount">
                      <button class="wrap-recount__recount-minus" onclick="updateQuantity('-', '<?php echo $minimum; ?>', '');">-</button>
					                <input type="number" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity" class="wrap-recount__recount-input" />
                      <button class="wrap-recount__recount-plus" onclick="updateQuantity('+', '<?php echo $minimum; ?>', '');">+</button>
                    </div>
				



					 <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
					 
                    <div class="product-description__info-buttons">
                      <button onclick="compare.add('<?php echo $product_id; ?>');" class="product-description__info-button product-description__info-button-js">
                        <svg class="svg-sprite-icon icon-Scales">
                          <use xlink:href="static/images/sprite/symbol/sprite.svg#Scales"></use>
                        </svg>
                      </button>
                      <button onclick="wishlist.add('<?php echo $product_id; ?>');" class="product-description__info-button product-description__info-button-js">
                        <svg class="svg-sprite-icon icon-Love">
                          <use xlink:href="static/images/sprite/symbol/sprite.svg#Love"></use>
                        </svg>
                      </button>
                    </div>
                  </div>
                  <div class="product-description__buttons">
                    <button id="button-cart" class="button button-basket">
                      <svg class="svg-sprite-icon icon-Basket">
                        <use xlink:href="static/images/sprite/symbol/sprite.svg#Basket"></use>
                      </svg>В корзину
                    </button>
                    <button onclick="fastorder_open(<?php echo $product_id; ?>);" class="button button-basket">
                      <svg class="svg-sprite-icon icon-message">
                        <use xlink:href="static/images/sprite/symbol/sprite.svg#message"></use>
                      </svg>Купить в один клик
                    </button>
                    <button class="button-call2 button button-basket">
                      <svg class="svg-sprite-icon icon-card">
                        <use xlink:href="static/images/sprite/symbol/sprite.svg#card"></use>
                      </svg>Купить в кредит
                    </button>
                  </div>
                  <div class="product-description__feature">
				    <?php foreach ($attribute_groups as $attribute_group) { ?>
					<?php if($attribute_group['name']=='#Краткое описание') { ?>
					<?php foreach ($attribute_group['attribute'] as $attribute) { ?>
					<?php if($attribute['name']!='Дата поступления на склад') { ?>
                    <p class="product-description__feature-text"><span><?php echo $attribute['name']; ?>:</span><span class="product-description__feature-dotted"></span><span class="product-description__feature-param"><?php echo $attribute['text']; ?></span></p>
					<?php } ?>
					 <?php } ?>
					 <?php } ?>
					 <?php } ?>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-xl-12">
			  
                <nav class="wrap-tabs-description">
                  <div class="nav nav-tabs" id="nav-tab" role="tablist">
				  <a class="nav-item nav-link active" id="nav-tab-1" data-toggle="tab" href="#nav-content-1" role="tab" aria-controls="nav-content-1" aria-selected="true">Описание</a>
				  <a class="nav-item nav-link" id="nav-tab-2" data-toggle="tab" href="#nav-content-2" role="tab" aria-controls="nav-content-2" aria-selected="false">Характеристики</a>
				  <a class="nav-item nav-link" id="nav-tab-3" data-toggle="tab" href="#nav-content-3" role="tab" aria-controls="nav-content-3" aria-selected="false">Отзывы</a>
				  <?php foreach($tab_info as $info){ ?>
				  <a class="nav-item nav-link" id="nav-tab-<?php echo $info['tab_id']; ?>" data-toggle="tab" href="#nav-content-<?php echo $info['tab_id']; ?>" role="tab" aria-controls="nav-content-<?php echo $info['tab_id']; ?>" aria-selected="false"><?php echo $info['title']; ?></a>
				  <?php } ?>
				  
				<?php foreach($product_tabs as $key => $tab){ ?>
			<a class="nav-item nav-link" id="nav-tab-<?php echo $tab['product_tab_id']; ?>" data-toggle="tab" href="#nav-content-<?php echo $tab['product_tab_id']; ?>" role="tab" aria-controls="nav-content-<?php echo $tab['product_tab_id']; ?>" aria-selected="false"><?php echo $tab['title']; ?></a>
				<?php } ?>
				  </div>
                </nav>
				
				<div class="tab-content wrap-tabContent-description" id="nav-tabContent">
						 
                  <div class="tab-pane fade show active" id="nav-content-1" role="tabpanel" aria-labelledby="nav-tab-1"> 
      <?php echo $description; ?>
                  </div>
				  
                  <div class="tab-pane fade" id="nav-content-2" role="tabpanel" aria-labelledby="nav-tab-2">
                           <?php if ($attribute_groups) { ?>
            <div class="tab-pane" id="tab-specification">
              <table class="table table-bordered">
                <?php foreach ($attribute_groups as $attribute_group) { ?>

              
                  <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                  <tr>
                    <td><?php echo $attribute['name']; ?></td>
                    <td><?php echo $attribute['text']; ?></td>
                  </tr>
                  <?php } ?>
              
                <?php } ?>
              </table>
            </div>
			   <?php } else { ?>
				   Характеристики не указаны
            <?php } ?>
                  </div>
				  
                  <div class="tab-pane fade" id="nav-content-3" role="tabpanel" aria-labelledby="nav-tab-3">
                            <form class="form-horizontal" id="form-review" style="padding-left: 0px;">
                <div id="review"></div>
                <h2><?php echo $text_write; ?></h2>
                <?php if ($review_guest) { ?>
                <div class="form-group required">
                  <div class="col-sm-12" style="padding-left: 0px;">
                    <label class="control-label" for="input-name"><?php echo $entry_name; ?></label>
                    <input type="text" name="name" value="<?php echo $customer_name; ?>" id="input-name" class="form-control" />
                  </div>
                </div>
                <div class="form-group required">
                  <div class="col-sm-12" style="padding-left: 0px;">
                    <label class="control-label" for="input-review"><?php echo $entry_review; ?></label>
                    <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                    <div class="help-block"><?php echo $text_note; ?></div>
                  </div>
                </div>
                <div class="form-group required">
                  <div class="col-sm-12" style="padding-left: 0px;">
                    <label class="control-label"><?php echo $entry_rating; ?></label>
                    &nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
                    <input type="radio" name="rating" value="1" />
                    &nbsp;
                    <input type="radio" name="rating" value="2" />
                    &nbsp;
                    <input type="radio" name="rating" value="3" />
                    &nbsp;
                    <input type="radio" name="rating" value="4" />
                    &nbsp;
                    <input type="radio" name="rating" value="5" />
                    &nbsp;<?php echo $entry_good; ?></div>
                </div>
                <?php echo $captcha; ?>
                <div class="buttons clearfix">
                  <div class="pull-right">

				  
                    <button type="button" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="button section-basket-order__button-zakaz">Оставить отзыв</button>
                  </div>
                </div>
                <?php } else { ?>
                <?php echo $text_login; ?>
                <?php } ?>
              </form>
                  </div>
				
				<?php foreach($tab_info as $info){ ?>
                  <div class="tab-pane fade" id="nav-content-<?php echo $info['tab_id']; ?>" role="tabpanel" aria-labelledby="nav-tab-<?php echo $info['tab_id']; ?>">
                 <?php echo $info['description']; ?>
                  </div>
				<?php } ?>
				
				<?php if ($product_tabs) { ?>
					<?php foreach($product_tabs as $key => $tab){ ?>
					
				<div class="tab-pane fade" id="nav-content-<?php echo $tab['product_tab_id']; ?>" role="tabpanel" aria-labelledby="nav-tab-<?php echo $tab['product_tab_id']; ?>">
              <?php echo $tab['description']; ?>
                  </div>
						
					<?php } ?>
				<?php } ?>

                </div>
				
		

              </div>
            </div>
          </div>
        </section>
		
		

		
		
	
 
<?php echo $content_bottom; ?>






      </div>
	  
<script type="text/javascript"><!--
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
	$.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#recurring-description').html('');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();

			if (json['success']) {
				$('#recurring-description').html(json['success']);
			}
		}
	});
});
//--></script>
<script type="text/javascript"><!--
$('#button-cart').on('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-cart').button('loading');
		},
		complete: function() {
			$('#button-cart').button('reset');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			$('.form-group').removeClass('has-error');

			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						var element = $('#input-option' + i.replace('_', '-'));

						if (element.parent().hasClass('input-group')) {
							element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						} else {
							element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
						}
					}
				}

				if (json['error']['recurring']) {
					$('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
				}

				// Highlight any found errors
				$('.text-danger').parent().addClass('has-error');
			}

			if (json['success']) {
				$('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

				$('#cart').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');

				$('html, body').animate({ scrollTop: 0 }, 'slow');

				$('#cart > ul').load('index.php?route=common/cart/info ul li');
			}
		},
        error: function(xhr, ajaxOptions, thrownError) {
            alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
        }
	});
});
//--></script>
<script type="text/javascript"><!--
$('.date').datetimepicker({
	pickTime: false
});

$('.datetime').datetimepicker({
	pickDate: true,
	pickTime: true
});

$('.time').datetimepicker({
	pickDate: false
});

$('button[id^=\'button-upload\']').on('click', function() {
	var node = this;

	$('#form-upload').remove();

	$('body').prepend('<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

	$('#form-upload input[name=\'file\']').trigger('click');

	if (typeof timer != 'undefined') {
    	clearInterval(timer);
	}

	timer = setInterval(function() {
		if ($('#form-upload input[name=\'file\']').val() != '') {
			clearInterval(timer);

			$.ajax({
				url: 'index.php?route=tool/upload',
				type: 'post',
				dataType: 'json',
				data: new FormData($('#form-upload')[0]),
				cache: false,
				contentType: false,
				processData: false,
				beforeSend: function() {
					$(node).button('loading');
				},
				complete: function() {
					$(node).button('reset');
				},
				success: function(json) {
					$('.text-danger').remove();

					if (json['error']) {
						$(node).parent().find('input').after('<div class="text-danger">' + json['error'] + '</div>');
					}

					if (json['success']) {
						alert(json['success']);

						$(node).parent().find('input').val(json['code']);
					}
				},
				error: function(xhr, ajaxOptions, thrownError) {
					alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
				}
			});
		}
	}, 500);
});
//--></script>
<script type="text/javascript"><!--
$('#review').delegate('.pagination a', 'click', function(e) {
    e.preventDefault();

    $('#review').fadeOut('slow');

    $('#review').load(this.href);

    $('#review').fadeIn('slow');
});

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').on('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: $("#form-review").serialize(),
		beforeSend: function() {
			$('#button-review').button('loading');
		},
		complete: function() {
			$('#button-review').button('reset');
		},
		success: function(json) {
			$('.alert-success, .alert-danger').remove();

			if (json['error']) {
				$('#review').after('<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + '</div>');
			}

			if (json['success']) {
				$('#review').after('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');

				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').prop('checked', false);
			}
		}
	});
    grecaptcha.reset();
});

$(document).ready(function() {
	$('.thumbnails').magnificPopup({
		type:'image',
		delegate: 'a',
		gallery: {
			enabled:true
		}
	});
});

$(document).ready(function() {
	var hash = window.location.hash;
	if (hash) {
		var hashpart = hash.split('#');
		var  vals = hashpart[1].split('-');
		for (i=0; i<vals.length; i++) {
			$('#product').find('select option[value="'+vals[i]+'"]').attr('selected', true).trigger('select');
			$('#product').find('input[type="radio"][value="'+vals[i]+'"]').attr('checked', true).trigger('click');
			$('#product').find('input[type="checkbox"][value="'+vals[i]+'"]').attr('checked', true).trigger('click');
		}
	}
})
//--></script>


<?php echo $footer; ?>
