<h3 class="wfilter-heading"><?php echo $heading; ?> <a class="pull-right" onclick="clearfilter()"><span><i class="fa fa-refresh"></i> Clear</span></a></h3>
<?php if($layout == '1') { ?>
	<div class="horizontal_filter">
		<div class="table-responsive">          
			<table class="table table-bordered" cellspacing="0" cellpadding="0">
			<?php if($search_status) { ?>
				<tr>
					<th width="150px">Search</th>
					<td><div class="input-group search-area search-width">
						<input type="text" class="form-control" value="<?php echo $fsearch; ?>" name="fsearch" placeholder="Search....">
						<span class="input-group-btn"><button id="button-search<?php echo $module_id; ?>" class="btn btn-primary"><i class="fa fa-search"></i></button></span>
					</div>
					</td>
				</tr>
				<?php } ?>
				<?php if($extrfilters['price']['status'] && $maxprice) { ?>
				<tr class="<?php if($extrfilters['price']['displayon'] == '1') { ?>hidden-xs <?php } elseif($extrfilters['price']['displayon']  == '2') { ?>visible-xs <?php } ?>">
					<th width="150px">Price</th>
					<td class="fprice"><input id="slider<?php echo $module_id; ?>"><input type="hidden" name="filterprice" value="<?php echo $filter_price; ?>"></td>
				</tr>
				<?php } ?>
				<?php if ($filter_groups && $filter_status) { ?>
					<?php foreach ($filter_groups as $filter_group) { ?>
				<tr class="filtergroup <?php if($filter_displayon == '1') { ?>hidden-xs <?php } elseif ($filter_displayon == '2') { ?>visible-xs <?php } ?>">
					<th width="150px"><?php echo $filter_group['name']; ?></th>
					<td> <?php foreach($filter_group['filter'] as $filter) { ?>
						<div class="checkbox" <?php if(isset($filterfiters) && !in_array($filter['filter_id'],$filterfiters)) { ?>style="opacity:0.5;"<?php } ?>>
						  <label>
						  <?php if(in_array($filter['filter_id'],$filter_category)) { ?>
								<input id="box_<?php echo $filter['filter_id']; ?>" type="checkbox" name="filter[]" value="<?php echo $filter['filter_id']; ?>" checked="checked" />
								<label for="box_<?php echo $filter['filter_id']; ?>">
								<?php echo $filter['name']; ?><span class="label label-primary"><?php echo $filter['totalcount']; ?></span>
								</label>
							
							<?php } else { ?>
							
								<input id="box_<?php echo $module_id; ?>_<?php echo $filter['filter_id']; ?>" type="checkbox"  name="filter[]" value="<?php echo $filter['filter_id']; ?>" <?php if(isset($filterfiters) && !in_array($filter['filter_id'],$filterfiters)) { ?>disabled="disabled"<?php } ?>>
								<label for="box_<?php echo $module_id; ?>_<?php echo $filter['filter_id']; ?>">
									<?php echo $filter['name']; ?><span class="label label-primary"><?php echo $filter['totalcount']; ?></span>
								</label>
							
							<?php } ?>
							
						  </label>
						</div>
						<?php } ?>
					</td>
				</tr>
				<?php } ?>
				<?php } ?>
				<?php if(isset($attribute_groups) && $attribute_status) { ?>
					<?php foreach($attribute_groups as $attribute_group) { ?>
				<tr class="attributegroup <?php if($attribute_displayon == '1') { ?>hidden-xs <?php } elseif($attribute_displayon == '2') { ?>visible-xs <?php } ?>">
					<th width="150px"><?php echo $attribute_group['name']; ?></th>
					<td>  <?php foreach($attribute_group['attribute'] as $attribute) { ?>
						<span <?php if(isset($optionattributes) && !in_array($attribute['attribute_id'],$optionattributes)) { ?>style="opacity:0.5;"<?php } ?>>
						<?php if(in_array($attribute['attribute_id'],$filterattribute)) { ?>
								<input id="box_attribute<?php echo $attribute['attribute_id']; ?>" type="checkbox" name="attribute[]" value="<?php echo $attribute['attribute_id']; ?>" checked="checked" />
								<label for="box_attribute<?php echo $attribute['attribute_id']; ?>">
								<?php echo $attribute['name']; ?><span class="label label-primary"><?php echo $attribute['totalcount']; ?></span>
								</label>
							<?php } else { ?>
								<input id="box_attribute<?php echo $module_id; ?>_<?php echo $attribute['attribute_id']; ?>" type="checkbox"  name="attribute[]" value="<?php echo $attribute['attribute_id']; ?>" <?php if(isset($optionattributes) && !in_array($attribute['attribute_id'],$optionattributes)) { ?>disabled="disabled"<?php } ?>>
								<label for="box_attribute<?php echo $module_id; ?>_<?php echo $attribute['attribute_id']; ?>">
									<?php echo $attribute['name']; ?><span class="label label-primary"><?php echo $attribute['totalcount']; ?></span>
								</label>
							
							<?php } ?>
						
						</span>
						<?php } ?>
					</td>
				</tr>
				<?php } ?>
				<?php } ?>
				<?php if($product_options && $option_status) { ?>
				<?php foreach($product_options as $product_option) { ?>
				<tr class="optiongroup <?php if($option_displayon == '1') { ?>hidden-xs <?php } elseif($option_displayon == '2') { ?>visible-xs <?php } ?>">
					<th width="150px"><?php echo $product_option['name']; ?></th>
					<td>  <?php foreach($product_option['option'] as $option) { ?>
					<span <?php if(isset($optionfiters) && !in_array($option['option_value_id'],$optionfiters)) { ?>style="opacity:0.5;"<?php } ?>>
					 <?php if(in_array($option['option_value_id'],$filter_options)) { ?>
							<input id="box_<?php echo $option['option_value_id']; ?>" type="checkbox" name="option[]" value="<?php echo $option['option_value_id']; ?>" checked="checked" />
							<label for="box_<?php echo $option['option_value_id']; ?>">
							<?php echo $option['name']; ?><span class="label label-primary"><?php echo $option['totalcount']; ?></span>
							</label>
						<?php } else { ?>
							<input id="box_<?php echo $module_id; ?>_<?php echo $option['option_value_id']; ?>" type="checkbox"  name="option[]" value="<?php echo $option['option_value_id']; ?>" <?php if(isset($optionfiters) && !in_array($option['option_value_id'],$optionfiters )) { ?>disabled="disabled"<?php } ?>>
							<label for="box_<?php echo $module_id; ?>_<?php echo $option['option_value_id']; ?>">
								<?php echo $option['name']; ?><span class="label label-primary"><?php echo $option['totalcount']; ?></span>
							</label>
						
						<?php } ?>
					 </span>
					<?php } ?>
					</td>
				</tr>
				<?php } ?>
				<?php } ?>
				<?php if(isset($product_manufactures) && $extrfilters['manufacturer']['status']) { ?>
				<tr class="manufacturergroup <?php if($extrfilters['manufacturer']['displayon'] == '1') { ?>hidden-xs <?php } elseif($extrfilters['manufacturer']['displayon'] == '2') { ?>visible-xs <?php } ?>">
					<th width="150px">Manufacturer</th>
					<td> <?php foreach($product_manufactures as $product_manufacture) { ?>
					<span <?php if(isset($optionmanufacturers) && !in_array($product_manufacture['manufacturer_id'],$optionmanufacturers)){?>style="opacity:0.5;"<?php } ?>>
					  <label>
					  <?php if(in_array($product_manufacture['manufacturer_id'],$filtermanufacurer)) { ?>
							<input id="box_manufacturer<?php echo $product_manufacture['manufacturer_id']; ?>" type="checkbox" name="manufacture[]" value="<?php echo $product_manufacture['manufacturer_id']; ?>" checked="checked" />
							<label for="box_manufacturer<?php echo $product_manufacture['manufacturer_id']; ?>">
							<?php echo $product_manufacture['name']; ?><span class="label label-primary"><?php echo $product_manufacture['totalcount']; ?></span>
							</label>
						<?php } else { ?>
							<input id="box_manufacturer<?php echo $module_id; ?>_<?php echo $product_manufacture['manufacturer_id']; ?>" type="checkbox"  name="manufacture[]" value="<?php echo $product_manufacture['manufacturer_id']; ?>" <?php if(isset($optionmanufacturers) && !in_array($product_manufacture['manufacturer_id'],$optionmanufacturers )){?>disabled="disabled"<?php } ?>>
							<label for="box_manufacturer<?php echo $module_id; ?>_<?php echo $product_manufacture['manufacturer_id']; ?>">
								<?php echo $product_manufacture['name']; ?><span class="label label-primary"><?php echo $product_manufacture['totalcount']; ?></span>
							</label>
						
						<?php } ?>
						
					  </label>
					</span>
					<?php } ?>
					</td>
				</tr>
				<?php } ?>
				<?php if(($product_stockstatus) && $extrfilters['stockstatus']['status'])  { ?>
				<tr class="stockstatusgroup <?php if($extrfilters['stockstatus']['displayon'] == '1') { ?>hidden-xs <?php } elseif($extrfilters['stockstatus']['displayon'] == '2') { ?>visible-xs<?php } ?>">
					<th width="150px">Stock Status</th>
					<td>  <?php foreach($product_stockstatus as $product_stock) { ?>
						<span <?php if(isset($optionstockstatus) && !in_array($product_stock['stock_status_id'],$optionstockstatus)){?>style="opacity:0.5;"<?php } ?>>
						<?php if(in_array($product_stock['stock_status_id'],$filterstockstatus)) { ?>
								<input id="box_stock<?php echo $product_stock['stock_status_id']; ?>" type="checkbox" name="stockstatus[]" value="<?php echo $product_stock['stock_status_id']; ?>" checked="checked" />
								<label for="box_stock<?php echo $product_stock['stock_status_id']; ?>">
								<?php echo $product_stock['name']; ?><span class="label label-primary"><?php echo $product_stock['totalcount']; ?></span>
								</label>
							<?php } else { ?>
								<input id="box_stock<?php echo $module_id; ?>_<?php echo $product_stock['stock_status_id']; ?>" type="checkbox"  name="stockstatus[]" value="<?php echo $product_stock['stock_status_id']; ?>" <?php if(isset($optionstockstatus) && !in_array($product_stock['stock_status_id'],$optionstockstatus )){?>disabled="disabled"<?php } ?>>
								<label for="box_stock<?php echo $module_id; ?>_<?php echo $product_stock['stock_status_id']; ?>">
									<?php echo $product_stock['name']; ?><span class="label label-primary"><?php echo $product_stock['totalcount']; ?></span>
								</label>
							
							<?php } ?>
						</span>
						<?php } ?>
					</td>
				</tr>
				<?php } ?>
				<?php if(($product_ratings) && $extrfilters['rating']['status'])  { ?>
				<tr class="ratinggroup <?php if($extrfilters['rating']['displayon'] == '1') { ?>hidden-xs <?php } elseif($extrfilters['stockstatus']['rating'] == '2') { ?>visible-xs<?php } ?>">
					<th width="150px">Rating</th>
					<td>  <?php foreach($product_ratings as $product_rating) { ?>
						<span <?php if(isset($optionratings) && !in_array($product_rating,$optionratings )){?>style="opacity:0.5;"<?php } ?>>
						 <?php if(in_array($product_rating,$filter_rating)) { ?>
								<input id="box_rating<?php echo $product_rating; ?>" type="checkbox" name="rating[]" value="<?php echo $product_rating; ?>" checked="checked" />
								<label for="box_rating<?php echo $product_rating; ?>" class="rating">
									 <?php for($i=1;$i<5;$i++) { ?>
									  <?php if($product_rating < $i) { ?> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span> <?php } else { ?> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span><?php } ?>
									  <?php } ?>
								</label>
							<?php } else { ?>
								<input id="box_rating<?php echo $module_id; ?>_<?php echo $product_rating; ?>" type="checkbox"  name="rating[]" value="<?php echo $product_rating; ?>" <?php if(isset($optionratings) && !in_array($product_rating,$optionratings )){?>disabled="disabled"<?php } ?>>
								<label for="box_rating<?php echo $module_id; ?>_<?php echo $product_rating; ?>" class="rating">
									 <?php for($i=1;$i<5;$i++) { ?>
									  <?php if($product_rating < $i) { ?> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span> <?php } else { ?> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span><?php } ?>
									  <?php } ?>
								</label>
							
							<?php } ?>
						</span>
						<?php } ?>
					</td>
				</tr>
				<?php } ?>
				
			</table>
		</div>
	</div>
<?php } else { ?>
<div class="wajaxfilter">
	<?php if($search_status) { ?>
		<div class="panel wfilter">
		  <div class="panel-heading">
			<h3 class="panel-title">
				<ul class="list-group wlist" style="margin-bottom:0;">
					<li class="list-group-item" data-toggle="collapse" data-target="#search2<?php echo $module_id; ?>">
						Search<span class="badge"><i class="fa fa-angle-right"></i></span>
					</li>
				</ul>
			</h3>
		  </div>
		  <div class="panel-body content in nested collapse" id="search2<?php echo $module_id; ?>">
				<div class="input-group search-area search-width">
					<input type="text" class="form-control" value="<?php echo $fsearch; ?>" name="fsearch" placeholder="Search....">
					<span class="input-group-btn"><button id="button-search<?php echo $module_id; ?>" class="btn btn-primary"><i class="fa fa-search"></i></button></span>
				</div>
		  </div>
		</div>
	<?php } ?>
	<?php if($extrfilters['price']['status'] && $maxprice) { ?>
	<div class="panel pricegroup <?php if($extrfilters['price']['displayon'] == '1') { ?>hidden-xs <?php } elseif ($extrfilters['price']['displayon']  == '2') { ?>visible-xs <?php } ?>">
		  <div class="panel-heading">
			<h3 class="panel-title">
				<ul class="list-group wlist" style="margin-bottom:0;">
					<li class="list-group-item" data-toggle="collapse" data-target="#pricefilter<?php echo $module_id; ?>">
						Price<span class="badge"><i class="fa fa-angle-right"></i></span>
					</li>
				</ul>
			</h3>
		  </div>
		  <div class="panel-body" id="pricefilter<?php echo $module_id; ?>">
				<input id="slider<?php echo $module_id; ?>">
		  </div>
		   <input type="hidden" name="filterprice" value="<?php echo $filter_price; ?>">
		</div>
	<?php } ?>
	<?php if ($filter_groups && $filter_status) { ?>
		<?php foreach ($filter_groups as $filter_group) { ?>
		<div class="panel filtergroup <?php if($filter_displayon == '1') { ?>hidden-xs <?php } elseif ($filter_displayon == '2') { ?>visible-xs <?php } ?>">
		  <div class="panel-heading">
			<h3 class="panel-title">
				<ul class="list-group wlist" style="margin-bottom:0;">
					<li class="list-group-item" data-toggle="collapse" data-target="#filterdemo_<?php echo $module_id; ?>_<?php echo $filter_group.filter_group_id; ?>">
						<?php echo $filter_group['name']; ?><span class="badge"><i class="fa fa-angle-right"></i></span>
					</li>
				</ul>
			</h3>
		  </div>
		  <div class="panel-body content nested collapse in" id="filterdemo_<?php echo $module_id; ?>_<?php echo $filter_group.filter_group_id; ?>">
			  <div id="filter-group<?php echo $module_id; ?>_<?php echo $filter_group['filter_group_id']; ?>" class="scrollerheight">
				  <?php foreach($filter_group['filter'] as $filter) { ?>
				<div class="checkbox" <?php if(isset($filterfiters) && !in_array($filter['filter_id'],$filterfiters)) { ?>style="opacity:0.5;"<?php } ?>>
				  <label>
				  <?php if(in_array($filter['filter_id'],$filter_category)) { ?>
					
						<input id="box_<?php echo $filter['filter_id']; ?>" type="checkbox" name="filter[]" value="<?php echo $filter['filter_id']; ?>" checked="checked" />
						<label for="box_<?php echo $filter['filter_id']; ?>">
						<?php echo $filter['name']; ?><span class="label label-primary"><?php echo $filter['totalcount']; ?></span>
						</label>
					
					<?php } else { ?>
					
						<input id="box_<?php echo $module_id; ?>_<?php echo $filter['filter_id']; ?>" type="checkbox"  name="filter[]" value="<?php echo $filter['filter_id']; ?>" <?php if(isset($filterfiters) && !in_array($filter['filter_id'],$filterfiters)) { ?>disabled="disabled"<?php } ?>>
						<label for="box_<?php echo $module_id; ?>_<?php echo $filter['filter_id']; ?>">
							<?php echo $filter['name']; ?><span class="label label-primary"><?php echo $filter['totalcount']; ?></span>
						</label>
					
					<?php } ?>
					
				  </label>
				</div>
				<?php } ?>
			  </div>
		  </div>
		</div>
	<?php } ?>
	<?php } ?>
	 <?php if(isset($attribute_groups) && $attribute_status) { ?>
	<?php foreach($attribute_groups as $attribute_group) { ?>
		<div class="panel attributegroup <?php if($attribute_displayon == '1') { ?>hidden-xs <?php } elseif($attribute_displayon == '2') { ?>visible-xs <?php } ?>">
		  <div class="panel-heading">
			<h3 class="panel-title">
				<ul class="list-group wlist" style="margin-bottom:0;">
					<li class="list-group-item" data-toggle="collapse" data-target="#attributedemo_<?php echo $module_id; ?>_<?php echo $attribute_group['attribute_group_id']; ?>">
						<?php echo $attribute_group['name']; ?><span class="badge"><i class="fa fa-angle-right"></i></span>
					</li>
				</ul>
			</h3>
		  </div>
		  <div class="panel-body content nested collapse in" id="attributedemo_<?php echo $module_id; ?>_<?php echo $attribute_group['attribute_group_id']; ?>">
			  <div id="attribute-group<?php echo $module_id; ?>_<?php echo $attribute_group['attribute_group_id']; ?>" class="scrollerheight">
				  <?php foreach($attribute_group['attribute'] as $attribute) { ?>
				<div class="checkbox" <?php if(isset($optionattributes) && !in_array($attribute['attribute_id'],$optionattributes )) { ?>style="opacity:0.5;"<?php } ?>>
				  <label>
				  <?php if(in_array($attribute['attribute_id'],$filterattribute)) { ?>
						<input id="box_attribute<?php echo $attribute['attribute_id']; ?>" type="checkbox" name="attribute[]" value="<?php echo $attribute['attribute_id']; ?>" checked="checked" />
						<label for="box_attribute<?php echo $attribute['attribute_id']; ?>">
						<?php echo $attribute['name']; ?><span class="label label-primary"><?php echo $attribute['totalcount']; ?></span>
						</label>
					<?php } else { ?>
						<input id="box_attribute<?php echo $module_id; ?>_<?php echo $attribute['attribute_id']; ?>" type="checkbox"  name="attribute[]" value="<?php echo $attribute['attribute_id']; ?>" <?php if(isset($optionattributes) && !in_array($attribute['attribute_id'],$optionattributes )) { ?>disabled="disabled"<?php } ?>>
						<label for="box_attribute<?php echo $module_id; ?>_<?php echo $attribute['attribute_id']; ?>">
							<?php echo $attribute['name']; ?><span class="label label-primary"><?php echo $attribute['totalcount']; ?></span>
						</label>
					
					<?php } ?>
					
				  </label>
				</div>
				<?php } ?>
			  </div>
		  </div>
		</div>
	<?php } ?>
	<?php } ?>
	<?php if($product_options && $option_status) { ?>
   <?php foreach($product_options as $product_option) { ?>
		<div class="panel optiongroup <?php if($option_displayon == '1') { ?>hidden-xs <?php } elseif($option_displayon == '2') { ?>visible-xs <?php } ?>">
		  <div class="panel-heading">
			<h3 class="panel-title">
				<ul class="list-group wlist" style="margin-bottom:0;">
					<li class="list-group-item" data-toggle="collapse" data-target="#optiondemo_<?php echo $module_id; ?>_<?php echo $product_option['option_id']; ?>">
						<?php echo $product_option['name']; ?><span class="badge"><i class="fa fa-angle-right"></i></span>
					</li>
				</ul>
			</h3>
		  </div>
		  <div class="panel-body content in nested collapse" id="optiondemo_<?php echo $module_id; ?>_<?php echo $product_option['option_id']; ?>">
			  <div id="option-group<?php echo $module_id; ?>_<?php echo $product_option['option_id']; ?>" class="scrollerheight">
				   <?php foreach($product_option['option'] as $option) { ?>
				<div class="checkbox" <?php if(isset($optionfiters) && !in_array($option['option_value_id'],$optionfiters )) { ?>style="opacity:0.5;"<?php } ?>>
				  <label>
				 <?php if(in_array($option['option_value_id'],$filter_options)) { ?>
						<input id="box_<?php echo $option['option_value_id']; ?>" type="checkbox" name="option[]" value="<?php echo $option['option_value_id']; ?>" checked="checked" />
						<label for="box_<?php echo $option['option_value_id']; ?>">
						<?php echo $option['name']; ?><span class="label label-primary"><?php echo $option['totalcount']; ?></span>
						</label>
					<?php } else { ?>
						<input id="box_<?php echo $module_id; ?>_<?php echo $option['option_value_id']; ?>" type="checkbox"  name="option[]" value="<?php echo $option['option_value_id']; ?>" <?php if(isset($optionfiters) && !in_array($option['option_value_id'],$optionfiters )) { ?>disabled="disabled"<?php } ?>>
						<label for="box_<?php echo $module_id; ?>_<?php echo $option['option_value_id']; ?>">
							<?php echo $option['name']; ?><span class="label label-primary"><?php echo $option['totalcount']; ?></span>
						</label>
					
					<?php } ?>
				  </label>
				</div>
				<?php } ?>
			  </div>
		  </div>
		</div>
	<?php } ?>
	<?php } ?>
	<?php if(isset($product_manufactures) && $extrfilters['manufacturer']['status']) { ?>
		<div class="panel manufacturergroup <?php if($extrfilters['manufacturer']['displayon'] == '1') { ?>hidden-xs <?php } elseif($extrfilters['manufacturer']['displayon'] == '2') { ?>visible-xs <?php } ?>">
		  <div class="panel-heading">
			<h3 class="panel-title">
				<ul class="list-group wlist" style="margin-bottom:0;">
					<li class="list-group-item" data-toggle="collapse" data-target="#manufacturedemo_<?php echo $module_id; ?>_manufacturer">
						Manufacturer<span class="badge"><i class="fa fa-angle-right"></i></span>
					</li>
				</ul>
			</h3>
		  </div>
		  <div class="panel-body content nested collapse in" id="manufacturedemo_<?php echo $module_id; ?>_manufacturer">
			  <div id="manufacturer-group" class="scrollerheight">
				 <?php foreach($product_manufactures as $product_manufacture) { ?>
				<div class="checkbox" <?php if(isset($optionmanufacturers) && !in_array($product_manufacture['manufacturer_id'],$optionmanufacturers )){?>style="opacity:0.5;"<?php } ?>>
				  <label>
				  <?php if(in_array($product_manufacture['manufacturer_id'],$filtermanufacurer)) { ?>
						<input id="box_manufacturer<?php echo $product_manufacture['manufacturer_id']; ?>" type="checkbox" name="manufacture[]" value="<?php echo $product_manufacture['manufacturer_id']; ?>" checked="checked" />
						<label for="box_manufacturer<?php echo $product_manufacture['manufacturer_id']; ?>">
						<?php echo $product_manufacture['name']; ?><span class="label label-primary"><?php echo $product_manufacture['totalcount']; ?></span>
						</label>
					<?php } else { ?>
						<input id="box_manufacturer<?php echo $module_id; ?>_<?php echo $product_manufacture['manufacturer_id']; ?>" type="checkbox"  name="manufacture[]" value="<?php echo $product_manufacture['manufacturer_id']; ?>" <?php if(isset($optionmanufacturers) && !in_array($product_manufacture['manufacturer_id'],$optionmanufacturers )){?>disabled="disabled"<?php } ?>>
						<label for="box_manufacturer<?php echo $module_id; ?>_<?php echo $product_manufacture['manufacturer_id']; ?>">
							<?php echo $product_manufacture['name']; ?><span class="label label-primary"><?php echo $product_manufacture['totalcount']; ?></span>
						</label>
					
					<?php } ?>
					
				  </label>
				</div>
				<?php } ?>
			  </div>
		  </div>
		</div>
	<?php } ?>
	<?php if(($product_stockstatus) && $extrfilters['stockstatus']['status'])  { ?>
		<div class="panel stockstatusgroup <?php if($extrfilters['stockstatus']['displayon'] == '1') { ?>hidden-xs <?php } elseif($extrfilters['stockstatus']['displayon'] == '2') { ?>visible-xs<?php } ?>">
		  <div class="panel-heading">
			<h3 class="panel-title">
				<ul class="list-group wlist" style="margin-bottom:0;">
					<li class="list-group-item" data-toggle="collapse" data-target="#stockdemo_<?php echo $module_id; ?>_stock_status">
						Stock Status<span class="badge"><i class="fa fa-angle-right"></i></span>
					</li>
				</ul>
			</h3>
		  </div>
		  <div class="panel-body content nested collapse in" id="stockdemo_<?php echo $module_id; ?>_stock_status">
			  <div id="stock-group" class="scrollerheight">
				   <?php foreach($product_stockstatus as $product_stock) { ?>
				<div class="checkbox" <?php if(isset($optionstockstatus) && !in_array($product_stock['stock_status_id'],$optionstockstatus)){?>style="opacity:0.5;"<?php } ?>>
				  <label>
				  <?php if(in_array($product_stock['stock_status_id'],$filterstockstatus)) { ?>
						<input id="box_stock<?php echo $product_stock['stock_status_id']; ?>" type="checkbox" name="stockstatus[]" value="<?php echo $product_stock['stock_status_id']; ?>" checked="checked" />
						<label for="box_stock<?php echo $product_stock['stock_status_id']; ?>">
						<?php echo $product_stock['name']; ?><span class="label label-primary"><?php echo $product_stock['totalcount']; ?></span>
						</label>
					<?php } else { ?>
						<input id="box_stock<?php echo $module_id; ?>_<?php echo $product_stock['stock_status_id']; ?>" type="checkbox"  name="stockstatus[]" value="<?php echo $product_stock['stock_status_id']; ?>" <?php if(isset($optionstockstatus) && !in_array($product_stock['stock_status_id'],$optionstockstatus )){?>disabled="disabled"<?php } ?>>
						<label for="box_stock<?php echo $module_id; ?>_<?php echo $product_stock['stock_status_id']; ?>">
							<?php echo $product_stock['name']; ?><span class="label label-primary"><?php echo $product_stock['totalcount']; ?></span>
						</label>
					
					<?php } ?>
					
				  </label>
				</div>
				<?php } ?>
			  </div>
		  </div>
		</div>
	<?php } ?>
	<?php if(($product_ratings) && $extrfilters['rating']['status'])  { ?>
		<div class="panel ratinggroup <?php if($extrfilters['rating']['displayon'] == '1') { ?>hidden-xs <?php } elseif($extrfilters['stockstatus']['rating'] == '2') { ?>visible-xs<?php } ?>">
		  <div class="panel-heading">
			<h3 class="panel-title">
				<ul class="list-group wlist" style="margin-bottom:0;">
					<li class="list-group-item" data-toggle="collapse" data-target="#ratingdemo_<?php echo $module_id; ?>_rating">
						Rating<span class="badge"><i class="fa fa-angle-right"></i></span>
					</li>
				</ul>
			</h3>
		  </div>
		  <div class="panel-body content nested collapse in" id="ratingdemo_<?php echo $module_id; ?>_rating">
			  <div id="fiterrating" class="scrollerheight">
				  <?php foreach($product_ratings as $product_rating) { ?>
				<div class="checkbox" <?php if(isset($optionratings) && !in_array($product_rating,$optionratings)){?>style="opacity:0.5;"<?php } ?>>
				  <label>
				  <?php if(in_array($product_rating,$filter_rating)) { ?>
						<input id="box_rating<?php echo $product_rating; ?>" type="checkbox" name="rating[]" value="<?php echo $product_rating; ?>" checked="checked" />
						<label for="box_rating<?php echo $product_rating; ?>" class="rating">
							 <?php for($i=1;$i<5;$i++) { ?>
							  <?php if($product_rating < $i) { ?> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span> <?php } else { ?> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span><?php } ?>
							  <?php } ?>
						</label>
					<?php } else { ?>
						<input id="box_rating<?php echo $module_id; ?>_<?php echo $product_rating; ?>" type="checkbox"  name="rating[]" value="<?php echo $product_rating; ?>" <?php if(isset($optionratings) && !in_array($product_rating,$optionratings )){?>disabled="disabled"<?php } ?>>
						<label for="box_rating<?php echo $module_id; ?>_<?php echo $product_rating; ?>" class="rating">
							 <?php for($i=1;$i<5;$i++) { ?>
							  <?php if($product_rating < $i) { ?> <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span> <?php } else { ?> <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span><?php } ?>
							  <?php } ?>
						</label>
					
					<?php } ?>
					
				  </label>
				</div>
				<?php } ?>
			  </div>
		  </div>
		</div>
	<?php } ?>
</div>
<?php } ?>
<script type="text/javascript"><!--
$('#ajaxfilter<?php echo $module_id; ?> input[type="text"]').keydown(function(e) {
	if(e.keyCode == 13){
		$('#button-search<?php echo $module_id; ?>').trigger('click');
	}
});

 function unique<?php echo $module_id; ?>(array){ return array.filter(function(el, index, arr) { return index == arr.indexOf(el); }); }
 
var clientHeight = $("#content #ajaxfilter<?php echo $module_id; ?>").css('height');
var filterprice = $('#ajaxfilter<?php echo $module_id; ?> input[name="filterprice"]').val();

$("#slider<?php echo $module_id; ?>").ionRangeSlider({
        skin: "modern",
		min: 0,
		from: filterprice ? filterprice : 0,
        max: <?php echo $maxprice; ?>,
		grid: true,
		prefix: "<?php echo $getcurrency['symbol_left']; ?>",
		onFinish: function (data) {
			if(data['from'] != ""){
				$('#ajaxfilter<?php echo $module_id; ?> input[name="filterprice"]').val(data['from']);
				getfilterwithsearch<?php echo $module_id; ?>(data['from']);
			}
         },
    });
$('#ajaxfilter<?php echo $module_id; ?> input[type="checkbox"],#ajaxfilter<?php echo $module_id; ?> #button-search<?php echo $module_id; ?>').on('click', function() {
	getfilterwithsearch<?php echo $module_id; ?>("0");
});

function getfilterwithsearch<?php echo $module_id; ?>(price){
	<?php if($search_status) { ?>
	var search = $('#ajaxfilter<?php echo $module_id; ?> .search-area input[name="fsearch"]').val(); 
	<?php } else { ?>
		var search = '';
	<?php } ?>
	 var filter  = $('#ajaxfilter<?php echo $module_id; ?> .filtergroup input[type="checkbox"]:checked').map(function(){return $(this).val();}).get();
	 var attribute  = $('#ajaxfilter<?php echo $module_id; ?> .attributegroup input[type="checkbox"]:checked').map(function(){return $(this).val();}).get();
	 var manufacturer  = $('#ajaxfilter<?php echo $module_id; ?> .manufacturergroup input[type="checkbox"]:checked').map(function(){return $(this).val();}).get();
	 var stockstatus  = $('#ajaxfilter<?php echo $module_id; ?> .stockstatusgroup input[type="checkbox"]:checked').map(function(){return $(this).val();}).get();
	 var rating  = $('#ajaxfilter<?php echo $module_id; ?> .ratinggroup input[type="checkbox"]:checked').map(function(){return $(this).val();}).get();
	 var option  = $('#ajaxfilter<?php echo $module_id; ?> .optiongroup input[type="checkbox"]:checked').map(function(){return $(this).val();}).get();
	 
 
	var newattribute = unique<?php echo $module_id; ?>(attribute);
	var newfilter = unique<?php echo $module_id; ?>(filter);
	var newmanufacturer = unique<?php echo $module_id; ?>(manufacturer);
	var newstockstatus = unique<?php echo $module_id; ?>(stockstatus);
	var newrating = unique<?php echo $module_id; ?>(rating);
	var newoption = unique<?php echo $module_id; ?>(option);
	
	var dataurl = '<?php echo $action; ?>';
	
	var data = '';
	  if(search != ''){
		  var data = data +'&fsearch='+search;
	 }
	 
	if(newfilter != ''){
		 var data = data +'&filter=' + newfilter;
	 }
	 
	if(newattribute != ''){
		 var data = data +'&attr='+newattribute;
	 } 
	 
	 if(newmanufacturer != ''){
		 var data = data +'&mf='+newmanufacturer;
	 }
	 
	 if(newstockstatus != ''){
		 var data = data +'&sf='+newstockstatus;
	 }
	 
	 if(newrating != ''){
		 var data = data +'&rf='+newrating;
	 }
	 
	 if(newoption != ''){
		 var data = data +'&op='+newoption;
	 }
	 
	 if(price > '0'){
		 var data = data +'&filter_price='+price;
	 }else{
		 var newprice = $('input[name="filterprice"]').val();
		  if(newprice > '0'){
				var data = data +'&filter_price='+newprice;
		  }
		}
		
		if(data != ''){
			var newurl = dataurl+'&wc=<?php echo $wfilter_condition; ?>'+data;
		}else{
			var newurl = dataurl+data;
		}
		
		<?php foreach($getmodules as $getmodule) { ?>
		$('#ajaxfilter<?php echo $getmodule['module_id']; ?>').load('index.php?route=extension/module/wfilter/loadhtml&cpath=<?php echo $cpath; ?>&module_id=<?php echo $getmodule['module_id']; ?>'+data);
		<?php } ?>

	 getfilters(newurl);
  }; 
 

 
function getfilters(url){
	 $.ajax({
        type: 'GET',
        url: url,
        data: {},
        beforeSend: function() {
			$('#wajaxfilter .loader').show();
		},
		complete: function (data) {
		  $('#wajaxfilter .loader').hide();
		   $('#wajaxfilter').html('');
		 $('#wajaxfilter').html($("#wajaxfilter", data.responseText).html());
          history.pushState({page: url}, url, url);      
          
		  setlayout();
		},
	   });
 }

function setlayout(){
	$('#list-view').click(function(){
		$('#content .product-layout > .clearfix').remove();

		$('#content .product-layout').attr('class', 'product-layout product-list col-xs-12');

		localStorage.setItem('display', 'list');
	});
	
	// Product Grid
	$('#grid-view').click(function() {
	  $('#content .product-layout').attr('class', 'product-layout product-grid col-md-4 col-sm-4 col-xs-12');	
	 localStorage.setItem('display', 'grid');
	});
	
	if(localStorage.getItem('display') == 'list') {
		$('#list-view').trigger('click');
	}else{
		$('#grid-view').trigger('click');
	}
}

function clearfilter(){
	$('#ajaxfilter<?php echo $module_id; ?> input[type="checkbox"]').prop('checked',false);
	<?php foreach($getmodules as $getmodule) { ?>
		$('#ajaxfilter<?php echo $getmodule['module_id']; ?>').load('index.php?route=extension/module/wfilter/loadhtml&cpath=<?php echo $cpath; ?>&module_id=<?php echo $getmodule['module_id']; ?>');
		<?php } ?>
	$.ajax({
        type: 'GET',
        url: '<?php echo $action; ?>',
        beforeSend: function() {
		 $('#wajaxfilter .loader').show();
        },
        complete: function (data) {  
		$('#wajaxfilter .loader').hide();
		$('#wajaxfilter').html('');
		$('#wajaxfilter').html($("#wajaxfilter", data.responseText).html());
        history.pushState({page: '<?php echo $action; ?>'}, '<?php echo $action; ?>', '<?php echo $action; ?>');
        setlayout();
		$('#ajaxfilter<?php echo $module_id; ?> input[type="text"]').val('');
        }
    });
}

//--></script>