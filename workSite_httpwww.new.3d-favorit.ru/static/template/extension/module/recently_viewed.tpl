<?php if ($heading_title=='Просмотренные товары') { ?>
<section class="youWatched section-padding">
          <div class="container">
            <div class="row">
              <div class="col-xl-12">
                <h2 class="section-title title-dotted">Вы смотрели</h2>
              </div>
            </div>
            <div class="row row-wrap-card-little">
			<?php foreach ($products as $product) { ?>
              <div class="col-xl-3 col-lg-6 col-md-12">
                <div class="given-section-wrap-card">
                  <!-- шаблон №1 карточки товара-->
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
					    <?php foreach($product['attribute_groups'] as $attribute_group) { ?>
						<?php if($attribute_group['name']=='#Краткое описание') { ?>
                        <?php foreach($attribute_group['attribute'] as $attribute) { ?>
						<?php if($attribute['name']!='Дата поступления на склад') { ?>
						  <div class="card-product-wrap__wrap-info-text">
                            <div class="card-product-wrap__info-text"><?php echo $attribute['name']; ?>:</div>
                            <div class="card-product-wrap__info-param"><?php echo $attribute['text']; ?></div>
                          </div>
						<?php } ?>
                        <?php } ?>
						 <?php } ?>
						<?php } ?>
						<?php } ?>
                     
					 
			<div class="options-category product<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?>">
				  <?php foreach ($product['options_category'] as $option) { ?>
				  
				  <?php if ($option['type'] == 'select') { ?>
				  <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
				  <p class="card-product-wrap__name-descr"><?php echo $option['name']; ?>:</p>
					<select onchange="changeOption('<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?>');" name="option<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?>[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?><?php echo $option['product_option_id']; ?>" class="form-control">
					  <option value=""><?php echo $text_select; ?></option>
					  <?php foreach ($option['product_option_value'] as $option_value) { ?>
					  <option<?php if ($option_value['price_calc']) { ?> data-price-prefix="<?php echo $option_value['price_prefix_calc']; ?>" data-price="<?php echo $option_value['price_calc']; ?>"<?php if ($option_value['special_calc']) { ?> data-special="<?php echo $option_value['special_calc']; ?>"<?php } ?><?php if ($option_value['tax_calc']) { ?> data-tax="<?php echo $option_value['tax_calc']; ?>"<?php } ?><?php } ?> value="<?php echo $option_value['product_option_value_id']; ?>"<?php echo ($option_value['autoselect'] ? ' selected="selected"' : ''); ?><?php echo $option_value['no_stock_disabled']; ?>><?php echo $option_value['name']; ?><?php if ($option_value['price']) { ?><?php if (!$option_value['special']) { ?>, <?php echo $option_value['price']; ?><?php } else { ?>, <?php echo $option_value['special']; ?><?php } ?><?php } ?><?php if ($option_value['quantity']) { ?>, <?php echo $text_quantity; ?> <?php echo $option_value['quantity']; ?><?php } ?><?php if ($option_value['sku']) { ?>, <?php echo $text_sku; ?> <?php echo $option_value['sku']; ?><?php } ?><?php if ($option_value['points']) { ?>, <?php echo $text_points; ?> <?php echo $option_value['points_prefix']; ?><?php echo $option_value['points']; ?><?php } ?><?php if ($option_value['weight']) { ?>, <?php echo $text_weight; ?> <?php echo $option_value['weight_prefix']; ?><?php echo $option_value['weight']; ?><?php } ?></option>
					  <?php } ?>
					</select>
				  </div>
				  <?php } ?>
				  <?php if ($option['type'] == 'radio' || $option['type'] == 'image') { ?>
				  <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
				   <p class="card-product-wrap__name-descr"><?php echo $option['name']; ?>:</p>
				    <div id="input-option<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?><?php echo $option['product_option_id']; ?>">
					  <?php foreach ($option['product_option_value'] as $option_value) { ?>
					  <?php if ($option_setting['theme']) { ?>
					  <div class="radio-inline theme-button">
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
					      <input<?php if ($option_value['price_calc']) { ?> data-price-prefix="<?php echo $option_value['price_prefix_calc']; ?>" data-price="<?php echo $option_value['price_calc']; ?>"<?php if ($option_value['special_calc']) { ?> data-special="<?php echo $option_value['special_calc']; ?>"<?php } ?><?php if ($option_value['tax_calc']) { ?> data-tax="<?php echo $option_value['tax_calc']; ?>"<?php } ?><?php } ?> onchange="changeOption('<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?>');" type="radio" name="option<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?>[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>"<?php echo ($option_value['autoselect'] ? ' checked="checked"' : ''); ?><?php echo $option_value['no_stock_disabled']; ?>/>
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
						  <input<?php if ($option_value['price_calc']) { ?> data-price-prefix="<?php echo $option_value['price_prefix_calc']; ?>" data-price="<?php echo $option_value['price_calc']; ?>"<?php if ($option_value['special_calc']) { ?> data-special="<?php echo $option_value['special_calc']; ?>"<?php } ?><?php if ($option_value['tax_calc']) { ?> data-tax="<?php echo $option_value['tax_calc']; ?>"<?php } ?><?php } ?> onchange="changeOption('<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?>');" type="radio" name="option<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?>[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>"<?php echo ($option_value['autoselect'] ? ' checked="checked"' : ''); ?><?php echo $option_value['no_stock_disabled']; ?>/>
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
				   <p class="card-product-wrap__name-descr"><?php echo $option['name']; ?>:</p>
				    <div id="input-option<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?><?php echo $option['product_option_id']; ?>">
					  <?php foreach ($option['product_option_value'] as $option_value) { ?>
					  <?php if ($option_setting['theme']) { ?>
					  <div class="checkbox-inline theme-button">
					    <label<?php if ($option_value['option_tooltip']) { ?><?php if (!$option_setting['position']) { ?> data-placement="bottom"<?php } ?> data-container="body" data-html="true" title="<table class='option-table'>
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
					      <input<?php if ($option_value['price_calc']) { ?> data-price-prefix="<?php echo $option_value['price_prefix_calc']; ?>" data-price="<?php echo $option_value['price_calc']; ?>"<?php if ($option_value['special_calc']) { ?> data-special="<?php echo $option_value['special_calc']; ?>"<?php } ?><?php if ($option_value['tax_calc']) { ?> data-tax="<?php echo $option_value['tax_calc']; ?>"<?php } ?><?php } ?> onchange="changeOption('<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?>');" type="checkbox" name="option<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?>[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>"<?php echo ($option_value['autoselect'] ? ' checked="checked"' : ''); ?><?php echo $option_value['no_stock_disabled']; ?>/>
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
						  <input<?php if ($option_value['price_calc']) { ?> data-price-prefix="<?php echo $option_value['price_prefix_calc']; ?>" data-price="<?php echo $option_value['price_calc']; ?>"<?php if ($option_value['special_calc']) { ?> data-special="<?php echo $option_value['special_calc']; ?>"<?php } ?><?php if ($option_value['tax_calc']) { ?> data-tax="<?php echo $option_value['tax_calc']; ?>"<?php } ?><?php } ?> onchange="changeOption('<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?>');" type="checkbox" name="option<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?>[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>"<?php echo ($option_value['autoselect'] ? ' checked="checked"' : ''); ?><?php echo $option_value['no_stock_disabled']; ?>/>
						  <input<?php if ($option_value['price_calc']) { ?> data-price-prefix="<?php echo $option_value['price_prefix_calc']; ?>" data-price="<?php echo $option_value['price_calc']; ?>"<?php if ($option_value['special_calc']) { ?> data-special="<?php echo $option_value['special_calc']; ?>"<?php } ?><?php if ($option_value['tax_calc']) { ?> data-tax="<?php echo $option_value['tax_calc']; ?>"<?php } ?><?php } ?> onchange="changeOption('<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?>');" type="checkbox" name="option<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?>[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>"<?php echo ($option_value['autoselect'] ? ' checked="checked"' : ''); ?><?php echo $option_value['no_stock_disabled']; ?>/>
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
					<label class="control-label" for="input-option<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?><?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
					<input type="text" name="option<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?>[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?><?php echo $option['product_option_id']; ?>" class="form-control" />
				  </div>
				  <?php } ?>
				  <?php if ($option['type'] == 'textarea') { ?>
				  <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
					<label class="control-label" for="input-option<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?><?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
					<textarea name="option<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?>[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?><?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
				  </div>
				  <?php } ?>
				  <?php if ($option['type'] == 'file') { ?>
				  <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
					<label class="control-label"><?php echo $option['name']; ?></label>
					<button type="button" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block" id="button-upload<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?><?php echo $option['product_option_id']; ?>" onclick="uploadOptionFile('<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?><?php echo $option['product_option_id']; ?>');"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
					<input type="hidden" name="option<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?>[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?><?php echo $option['product_option_id']; ?>" class="form-control" />
				  </div>
				  <?php } ?>
				  <?php if ($option['type'] == 'date') { ?>
				  <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
					<label class="control-label" for="input-option<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?><?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
					<div class="input-group date">
					  <input type="text" name="option<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?>[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?><?php echo $option['product_option_id']; ?>" class="form-control" />
					  <span class="input-group-btn">
					  <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
					  </span></div>
				  </div>
				  <?php } ?>
				  <?php if ($option['type'] == 'datetime') { ?>
				  <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
					<label class="control-label" for="input-option<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?><?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
					<div class="input-group datetime">
					  <input type="text" name="option<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?>[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?><?php echo $option['product_option_id']; ?>" class="form-control" />
					  <span class="input-group-btn">
					  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
					  </span></div>
				  </div>
				  <?php } ?>
				  <?php if ($option['type'] == 'time') { ?>
				  <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
					<label class="control-label" for="input-option<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?><?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
					<div class="input-group time">
					  <input type="text" name="option<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?>[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?><?php echo $option['product_option_id']; ?>" class="form-control" />
					  <span class="input-group-btn">
					  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
					  </span></div>
				  </div>
				  <?php } ?>
				  <?php } ?>
				  <?php if ($option_setting['autoselect'] || $product['minimum'] > 1) { ?>
				  <script type="text/javascript">
					  $(document).ready(function() {
						  changeOption('<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?>');
					  });
				  </script>
				  <?php } ?>
				  <?php if ($product['discounts']) { ?>
				  <?php foreach ($product['discounts'] as $discount) { ?>
				  <input type="hidden" name="discount" value="<?php echo $discount['calc_price']; ?>" data-quantity="<?php echo $discount['quantity']; ?>" />
				  <?php } ?>
				  <?php } ?>
				  
				  
				   <div class="card-product-wrap__wrap-price">
                            <div class="card-product-wrap__wrap-price-base-sale">
                              <p class="card-product-wrap__text-price card-product-wrap__text-price-base">
							  <span data-price="<?php echo $product['price_calc']; ?>" class="number-space-js calc-price<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?>"><?php echo $product['price']; ?></span>
							  <span class="rub">&nbsp;</span></p>
                            </div>
                            <div class="wrap-recount">
                              <button class="wrap-recount__recount-minus" onclick="updateQuantity('-', '<?php echo $product['minimum']; ?>', '<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?>');">-</button>
							  <input data-minimum="<?php echo $product['minimum']; ?>" onkeyup="changeOption('<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?>');" onchange="changeOption('<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?>');" class="wrap-recount__recount-input input-quantity<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?>" type="text" name="quantity" value="<?php echo $product['minimum']; ?>"/>
                              <button class="wrap-recount__recount-plus" onclick="updateQuantity('+', '<?php echo $product['minimum']; ?>', '<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?>');">+</button>
                            </div>
							
								  <input type="hidden" name="price_format" value="" data-value="<?php echo $option_setting['value']; ?>" data-symbol-left="<?php echo $option_setting['symbol_left']; ?>" data-symbol-right="<?php echo $option_setting['symbol_right']; ?>" data-decimals="<?php echo $option_setting['decimals']; ?>" data-decimal-point="<?php echo $option_setting['decimal_point']; ?>" data-thousand-point="<?php echo $option_setting['thousand_point']; ?>" />
                    </div>


				</div>
						 
                        </div>
                        <button onclick="addCartOption('<?php echo $option_setting['id']; ?>','<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');" class="card-product-wrap__button-main card-product-wrap__button-main-basket"> 
                          <svg class="svg-sprite-icon icon-Basket">
                            <use xlink:href="static/images/sprite/symbol/sprite.svg#Basket"></use>
                          </svg>В корзину
                        </button>
						
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
              </div>
            <?php } ?>

            </div>
          </div>
</section>
<?php } ?>


<?php if ($heading_title=='Вы смотрели в товаре') { ?>
		      <section class="youWatched section-padding">
          <div class="container">
            <div class="row">
              <div class="col-xl-12">
                <h2 class="section-title title-dotted">Вы смотрели</h2>
              </div>
            </div>
            <div class="row row-wrap-card-little">
         
		 	<?php foreach ($products as $product) { ?>
              <div class="col-xl-3 col-lg-6 col-md-12">
                <div class="given-section-wrap-card">
                  <!-- шаблон №1 карточки товара-->
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
					    <?php foreach($product['attribute_groups'] as $attribute_group) { ?>
						<?php if($attribute_group['name']=='#Краткое описание') { ?>
                        <?php foreach($attribute_group['attribute'] as $attribute) { ?>
						<?php if($attribute['name']!='Дата поступления на склад') { ?>
						  <div class="card-product-wrap__wrap-info-text">
                            <div class="card-product-wrap__info-text"><?php echo $attribute['name']; ?>:</div>
                            <div class="card-product-wrap__info-param"><?php echo $attribute['text']; ?></div>
                          </div>
						<?php } ?>
                        <?php } ?>
						 <?php } ?>
						<?php } ?>
						<?php } ?>
                     
					 
			<div class="options-category product<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?>">
				  <?php foreach ($product['options_category'] as $option) { ?>
				  
				  <?php if ($option['type'] == 'select') { ?>
				  <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
				  <p class="card-product-wrap__name-descr"><?php echo $option['name']; ?>:</p>
					<select onchange="changeOption('<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?>');" name="option<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?>[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?><?php echo $option['product_option_id']; ?>" class="form-control">
					  <option value=""><?php echo $text_select; ?></option>
					  <?php foreach ($option['product_option_value'] as $option_value) { ?>
					  <option<?php if ($option_value['price_calc']) { ?> data-price-prefix="<?php echo $option_value['price_prefix_calc']; ?>" data-price="<?php echo $option_value['price_calc']; ?>"<?php if ($option_value['special_calc']) { ?> data-special="<?php echo $option_value['special_calc']; ?>"<?php } ?><?php if ($option_value['tax_calc']) { ?> data-tax="<?php echo $option_value['tax_calc']; ?>"<?php } ?><?php } ?> value="<?php echo $option_value['product_option_value_id']; ?>"<?php echo ($option_value['autoselect'] ? ' selected="selected"' : ''); ?><?php echo $option_value['no_stock_disabled']; ?>><?php echo $option_value['name']; ?><?php if ($option_value['price']) { ?><?php if (!$option_value['special']) { ?>, <?php echo $option_value['price']; ?><?php } else { ?>, <?php echo $option_value['special']; ?><?php } ?><?php } ?><?php if ($option_value['quantity']) { ?>, <?php echo $text_quantity; ?> <?php echo $option_value['quantity']; ?><?php } ?><?php if ($option_value['sku']) { ?>, <?php echo $text_sku; ?> <?php echo $option_value['sku']; ?><?php } ?><?php if ($option_value['points']) { ?>, <?php echo $text_points; ?> <?php echo $option_value['points_prefix']; ?><?php echo $option_value['points']; ?><?php } ?><?php if ($option_value['weight']) { ?>, <?php echo $text_weight; ?> <?php echo $option_value['weight_prefix']; ?><?php echo $option_value['weight']; ?><?php } ?></option>
					  <?php } ?>
					</select>
				  </div>
				  <?php } ?>
				  <?php if ($option['type'] == 'radio' || $option['type'] == 'image') { ?>
				  <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
				   <p class="card-product-wrap__name-descr"><?php echo $option['name']; ?>:</p>
				    <div id="input-option<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?><?php echo $option['product_option_id']; ?>">
					  <?php foreach ($option['product_option_value'] as $option_value) { ?>
					  <?php if ($option_setting['theme']) { ?>
					  <div class="radio-inline theme-button">
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
					      <input<?php if ($option_value['price_calc']) { ?> data-price-prefix="<?php echo $option_value['price_prefix_calc']; ?>" data-price="<?php echo $option_value['price_calc']; ?>"<?php if ($option_value['special_calc']) { ?> data-special="<?php echo $option_value['special_calc']; ?>"<?php } ?><?php if ($option_value['tax_calc']) { ?> data-tax="<?php echo $option_value['tax_calc']; ?>"<?php } ?><?php } ?> onchange="changeOption('<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?>');" type="radio" name="option<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?>[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>"<?php echo ($option_value['autoselect'] ? ' checked="checked"' : ''); ?><?php echo $option_value['no_stock_disabled']; ?>/>
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
						  <input<?php if ($option_value['price_calc']) { ?> data-price-prefix="<?php echo $option_value['price_prefix_calc']; ?>" data-price="<?php echo $option_value['price_calc']; ?>"<?php if ($option_value['special_calc']) { ?> data-special="<?php echo $option_value['special_calc']; ?>"<?php } ?><?php if ($option_value['tax_calc']) { ?> data-tax="<?php echo $option_value['tax_calc']; ?>"<?php } ?><?php } ?> onchange="changeOption('<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?>');" type="radio" name="option<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?>[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>"<?php echo ($option_value['autoselect'] ? ' checked="checked"' : ''); ?><?php echo $option_value['no_stock_disabled']; ?>/>
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
				   <p class="card-product-wrap__name-descr"><?php echo $option['name']; ?>:</p>
				    <div id="input-option<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?><?php echo $option['product_option_id']; ?>">
					  <?php foreach ($option['product_option_value'] as $option_value) { ?>
					  <?php if ($option_setting['theme']) { ?>
					  <div class="checkbox-inline theme-button">
					    <label<?php if ($option_value['option_tooltip']) { ?><?php if (!$option_setting['position']) { ?> data-placement="bottom"<?php } ?> data-container="body" data-html="true" title="<table class='option-table'>
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
					      <input<?php if ($option_value['price_calc']) { ?> data-price-prefix="<?php echo $option_value['price_prefix_calc']; ?>" data-price="<?php echo $option_value['price_calc']; ?>"<?php if ($option_value['special_calc']) { ?> data-special="<?php echo $option_value['special_calc']; ?>"<?php } ?><?php if ($option_value['tax_calc']) { ?> data-tax="<?php echo $option_value['tax_calc']; ?>"<?php } ?><?php } ?> onchange="changeOption('<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?>');" type="checkbox" name="option<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?>[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>"<?php echo ($option_value['autoselect'] ? ' checked="checked"' : ''); ?><?php echo $option_value['no_stock_disabled']; ?>/>
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
						  <input<?php if ($option_value['price_calc']) { ?> data-price-prefix="<?php echo $option_value['price_prefix_calc']; ?>" data-price="<?php echo $option_value['price_calc']; ?>"<?php if ($option_value['special_calc']) { ?> data-special="<?php echo $option_value['special_calc']; ?>"<?php } ?><?php if ($option_value['tax_calc']) { ?> data-tax="<?php echo $option_value['tax_calc']; ?>"<?php } ?><?php } ?> onchange="changeOption('<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?>');" type="checkbox" name="option<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?>[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>"<?php echo ($option_value['autoselect'] ? ' checked="checked"' : ''); ?><?php echo $option_value['no_stock_disabled']; ?>/>
						  <input<?php if ($option_value['price_calc']) { ?> data-price-prefix="<?php echo $option_value['price_prefix_calc']; ?>" data-price="<?php echo $option_value['price_calc']; ?>"<?php if ($option_value['special_calc']) { ?> data-special="<?php echo $option_value['special_calc']; ?>"<?php } ?><?php if ($option_value['tax_calc']) { ?> data-tax="<?php echo $option_value['tax_calc']; ?>"<?php } ?><?php } ?> onchange="changeOption('<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?>');" type="checkbox" name="option<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?>[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>"<?php echo ($option_value['autoselect'] ? ' checked="checked"' : ''); ?><?php echo $option_value['no_stock_disabled']; ?>/>
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
					<label class="control-label" for="input-option<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?><?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
					<input type="text" name="option<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?>[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?><?php echo $option['product_option_id']; ?>" class="form-control" />
				  </div>
				  <?php } ?>
				  <?php if ($option['type'] == 'textarea') { ?>
				  <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
					<label class="control-label" for="input-option<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?><?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
					<textarea name="option<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?>[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?><?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
				  </div>
				  <?php } ?>
				  <?php if ($option['type'] == 'file') { ?>
				  <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
					<label class="control-label"><?php echo $option['name']; ?></label>
					<button type="button" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block" id="button-upload<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?><?php echo $option['product_option_id']; ?>" onclick="uploadOptionFile('<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?><?php echo $option['product_option_id']; ?>');"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
					<input type="hidden" name="option<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?>[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?><?php echo $option['product_option_id']; ?>" class="form-control" />
				  </div>
				  <?php } ?>
				  <?php if ($option['type'] == 'date') { ?>
				  <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
					<label class="control-label" for="input-option<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?><?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
					<div class="input-group date">
					  <input type="text" name="option<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?>[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD" id="input-option<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?><?php echo $option['product_option_id']; ?>" class="form-control" />
					  <span class="input-group-btn">
					  <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
					  </span></div>
				  </div>
				  <?php } ?>
				  <?php if ($option['type'] == 'datetime') { ?>
				  <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
					<label class="control-label" for="input-option<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?><?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
					<div class="input-group datetime">
					  <input type="text" name="option<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?>[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?><?php echo $option['product_option_id']; ?>" class="form-control" />
					  <span class="input-group-btn">
					  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
					  </span></div>
				  </div>
				  <?php } ?>
				  <?php if ($option['type'] == 'time') { ?>
				  <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
					<label class="control-label" for="input-option<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?><?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
					<div class="input-group time">
					  <input type="text" name="option<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?>[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-date-format="HH:mm" id="input-option<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?><?php echo $option['product_option_id']; ?>" class="form-control" />
					  <span class="input-group-btn">
					  <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
					  </span></div>
				  </div>
				  <?php } ?>
				  <?php } ?>
				  <?php if ($option_setting['autoselect'] || $product['minimum'] > 1) { ?>
				  <script type="text/javascript">
					  $(document).ready(function() {
						  changeOption('<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?>');
					  });
				  </script>
				  <?php } ?>
				  <?php if ($product['discounts']) { ?>
				  <?php foreach ($product['discounts'] as $discount) { ?>
				  <input type="hidden" name="discount" value="<?php echo $discount['calc_price']; ?>" data-quantity="<?php echo $discount['quantity']; ?>" />
				  <?php } ?>
				  <?php } ?>
				  
				  
				   <div class="card-product-wrap__wrap-price">
                            <div class="card-product-wrap__wrap-price-base-sale">
                              <p class="card-product-wrap__text-price card-product-wrap__text-price-base">
							  <span data-price="<?php echo $product['price_calc']; ?>" class="number-space-js calc-price<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?>"><?php echo $product['price']; ?></span>
							  <span class="rub">&nbsp;</span></p>
                            </div>
                            <div class="wrap-recount">
                              <button class="wrap-recount__recount-minus" onclick="updateQuantity('-', '<?php echo $product['minimum']; ?>', '<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?>');">-</button>
							  <input data-minimum="<?php echo $product['minimum']; ?>" onkeyup="changeOption('<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?>');" onchange="changeOption('<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?>');" class="wrap-recount__recount-input input-quantity<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?>" type="text" name="quantity" value="<?php echo $product['minimum']; ?>"/>
                              <button class="wrap-recount__recount-plus" onclick="updateQuantity('+', '<?php echo $product['minimum']; ?>', '<?php echo $option_setting['id']; ?><?php echo $product['product_id']; ?>');">+</button>
                            </div>
							
								  <input type="hidden" name="price_format" value="" data-value="<?php echo $option_setting['value']; ?>" data-symbol-left="<?php echo $option_setting['symbol_left']; ?>" data-symbol-right="<?php echo $option_setting['symbol_right']; ?>" data-decimals="<?php echo $option_setting['decimals']; ?>" data-decimal-point="<?php echo $option_setting['decimal_point']; ?>" data-thousand-point="<?php echo $option_setting['thousand_point']; ?>" />
                    </div>


				</div>
						 
                        </div>
                        <button onclick="addCartOption('<?php echo $option_setting['id']; ?>','<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');" class="card-product-wrap__button-main card-product-wrap__button-main-basket"> 
                          <svg class="svg-sprite-icon icon-Basket">
                            <use xlink:href="static/images/sprite/symbol/sprite.svg#Basket"></use>
                          </svg>В корзину
                        </button>
						
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
              </div>
            <?php } ?>
            

            </div>
          </div>
        </section>
<?php } ?>