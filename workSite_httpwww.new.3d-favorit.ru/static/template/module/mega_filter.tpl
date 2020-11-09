<?php

	$mfp_options = array(
		'display_list_of_items' => array(
			'type' => empty( $settings['display_list_of_items']['type'] ) ? 'scroll' : $settings['display_list_of_items']['type'],
			'limit_of_items' => empty( $settings['display_list_of_items']['limit_of_items'] ) ? 4 : (int) $settings['display_list_of_items']['limit_of_items'],
			'max_height' => empty( $settings['display_list_of_items']['max_height'] ) ? 155 : (int) $settings['display_list_of_items']['max_height'],
			'standard_scroll' => empty( $settings['display_list_of_items']['standard_scroll'] ) ? false : $settings['display_list_of_items']['standard_scroll'],
		)
	);

?>

<?php

	$button_template = '<div class="mfilter-button mfilter-button-%s">%s</div>';
	$button_temp = '<a href="#" class="%s">%s</a>';
	$buttons = array( 'top' => array(), 'bottom' => array() );
	
	if( ! empty( $settings['show_reset_button'] ) ) {
		$buttons['bottom'][] = sprintf( $button_temp, 'mfilter-button-reset', '<i class="mfilter-reset-icon"></i>' . $text_reset_all );
	}
	
	if( ! empty( $settings['show_top_reset_button'] ) ) {
		$buttons['top'][] = sprintf( $button_temp, 'mfilter-button-reset', '<i class="mfilter-reset-icon"></i>' . $text_reset_all );
	}

	if( ! empty( $settings['refresh_results'] ) && $settings['refresh_results'] == 'using_button' && ! empty( $settings['place_button'] ) ) {
		$place_button = explode( '_', $settings['place_button'] );
	
		if( in_array( 'top', $place_button ) ) {
			$buttons['top'][] = sprintf( $button_temp, 'btn btn-primary btn-xs', $text_button_apply );
		}
		
		if( in_array( 'bottom', $place_button ) ) {
			$buttons['bottom'][] = sprintf( $button_temp, 'btn btn-primary btn-xs', $text_button_apply );
		}
	}
	
	foreach( $buttons as $bKey => $bVal ) {	
		$buttons[$bKey] = $bVal ? sprintf( $button_template, $bKey, implode( '', $bVal ) ) : '';
	}

	
?>

<?php if( ! empty( $hide_container ) ) { ?>
	<div style="display: none;">
<?php } ?>

<div class="accordion box mfilter-box mfilter-box-<?php echo $_idx; ?><?php echo $theme ? ' ' . $theme : '' ?> mfilter-<?php echo $_position; ?><?php echo ! empty( $hide_container ) ? ' mfilter-hide-container' : '' ?><?php echo ! empty( $_displayOptionsAs ) && $_displayOptionsAs == 'modern_horizontal' ? ' mfilter-hide' : ''; ?> mfilter-direction-<?php echo $direction; ?>" id="mfilter-box-<?php echo $_idx; ?>">


		<?php echo $buttons['top']; ?>
		<ul>
			<?php 
				foreach( $filters as $key_group => $gfilter ) {
					$gfilters = array();
					$gkey = '';
					
					if( $gfilter['type'] == 'attribute_group' ) {
						$gkey = $gfilter['group_key'];
						$gfilters = & $gfilter['attributes'];
					} else {
						$gfilters = array( & $gfilter );
					}
			?>
		
				<?php foreach( $gfilters as $filter ) { ?>
					<?php

						$base_type = empty( $filter['base_type'] ) ? $filter['type'] : $filter['base_type'];
						$base_id = empty( $filter['id'] ) ? '' : $filter['id'];
						$display_list_of_items = empty( $filter['display_list_of_items'] ) ? $mfp_options['display_list_of_items']['type'] : $filter['display_list_of_items'];

						if( in_array( $filter['type'], array( 'vehicles', 'levels', 'price', 'slider', 'select', 'search', 'search_oc', 'text', 'related' ) ) ) {
							$display_list_of_items = '-1';
						}

					?>
					<li
						data-type="<?php echo $filter['type']; ?>"
						data-base-type="<?php echo $base_type; ?>"
						data-id="<?php echo $base_id; ?>"
						data-group-key="<?php echo $gkey; ?>"
						data-seo-name="<?php echo $filter['seo_name']; ?>"
						data-inline-horizontal="<?php echo $_horizontalInline ? '1' : '0'; ?>"
						<?php if( isset( $filter['auto_levels'] ) ) { ?>
							data-auto-levels="<?php echo $filter['auto_levels']; ?>"
						<?php } ?>
						data-display-live-filter="<?php 
							$display_live_filter = ! empty( $settings['display_live_filter']['enabled'] ) ? '1' : '-1';

							if( ! empty( $filter['display_live_filter'] ) ) {
								$display_live_filter = $filter['display_live_filter'];
							} 

							if( $display_live_filter == '1' && ! empty( $settings['display_live_filter']['items'] ) ) {
								echo $settings['display_live_filter']['items'];
							} else {
								echo 0;
							}
						?>"
						<?php if( $filter['type'] == 'levels' ) { ?>
							data-labels="<?php echo implode( '||', $filter['labels'] ); ?>"
						<?php } ?>
						data-display-list-of-items="<?php echo $display_list_of_items; ?>"
						class="card mfilter-filter-item mfilter-<?php echo $filter['type']; ?> mfilter-<?php echo $base_type; ?><?php echo $base_type == 'attribute' ? ' mfilter-attributes' : ( $base_type == 'option' ? ' mfilter-options' : ( $base_type == 'filter' ? ' mfilter-filters' : '' ) ); ?>"
						>

						<?php if( $filter['collapsed'] != 'hide_header' && ! empty( $filter['name'] ) && empty( $filter['hide_header'] ) ) { ?>
					<div class="card-header" id="heading<?php echo $filter['seo_name']; ?>">
                      <h5 class="mb-0">
                        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapse<?php echo $filter['seo_name']; ?>" aria-expanded="true" aria-controls="collapse<?php echo $filter['seo_name']; ?>">
						<span class="animate-arrow-left-top"><?php echo $filter['name']; ?>:</span></button>
                      </h5>
                    </div>
						<?php } ?>
							
						           
                    <div class="collapse" id="collapse<?php echo $filter['seo_name']; ?>" aria-labelledby="heading<?php echo $filter['seo_name']; ?>" data-parent="#accordionExample">

									<div class="card-body mfilter-options">
										<?php if( $base_type == 'categories' ) { ?>
										
										<?php } else if( $filter['type'] == 'search' || $filter['type'] == 'search_oc' ) { ?>
											
										<?php } else if( $filter['type'] == 'price' ) { ?>
										
										<?php } else if( $filter['type'] == 'slider' ) { ?>
											
										<?php } else if( $filter['type'] == 'text' ) { ?>
											
										<?php } else if( $filter['type'] == 'rating' ) { ?>
											
										<?php } else if( in_array( $filter['type'], array( 'stock_status', 'manufacturers', 'checkbox', 'radio', 'image_list_radio', 'image_list_checkbox' ) ) ) { ?>
											<?php

												$_tmp_type = $filter['type'];

												if( in_array( $filter['type'], array( 'stock_status', 'manufacturers' ) ) ) {
													$_tmp_type = 'checkbox';
												}

											?>
											
						
						
									
												<?php $options_tmp = array(); ?>
												<?php foreach( $filter['options'] as $option_id => $option ) { if( $option['name'] === '' || isset( $options_tmp[$option['key']] ) ) continue; $options_tmp[$option['key']] = true; ?>
											
													<div class="mfilter-option mfilter-tb-as-tr">
														
						<label for="mfilter-opts-attribs-<?php echo $_idx; ?>-<?php echo $base_id; ?>-<?php echo $option['key']; ?>" class="label-checkbox">
                         <input 
																id="mfilter-opts-attribs-<?php echo $_idx; ?>-<?php echo $base_id; ?>-<?php echo $option['key']; ?>" 
																name="<?php echo $filter['seo_name']; ?>"
																type="<?php echo $_tmp_type == 'image_list_checkbox' ? 'checkbox' : ( $_tmp_type == 'image_list_radio' ? 'radio' : $_tmp_type ); ?>"
																<?php echo ! empty( $params[$filter['seo_name']] ) && ( in_array( $option['value'], $params[$filter['seo_name']] ) || in_array( $option['key'], $params[$filter['seo_name']] ) ) ? ' checked="checked"' : ''; ?>
																value="<?php echo str_replace( '"', '&quot;', $option['value'] ); ?>" />
						  <span class="text-checkbox"><?php echo $option['name']; ?></span>
                        </label>
												
													</div>
											
												<?php } ?>
												
										<?php } else if( $filter['type'] == 'vehicles' ) { ?>
											
										<?php } else if( $filter['type'] == 'levels' ) { ?>
										
										<?php } else if( $filter['type'] == 'select' ) { ?>
											
										<?php } else if( in_array( $filter['type'], array( 'image', 'image_radio' ) ) ) { ?>
											
										<?php } ?>
									</div>
							
                                 </div>
						
					</li>
				<?php } ?>
			<?php } ?>
		</ul>
		<?php echo $buttons['bottom']; ?>
	
</div>

<?php if( ! empty( $hide_container ) ) { ?>
	</div>
<?php } ?>

<script type="text/javascript">
	MegaFilterLang.text_display = '<?php echo $text_display; ?>';
	MegaFilterLang.text_list	= '<?php echo $text_list; ?>';
	MegaFilterLang.text_grid	= '<?php echo $text_grid; ?>';
	MegaFilterLang.text_select	= '<?php echo $text_select; ?>';
	
	if( typeof MegaFilterOverrideFn == 'undefined' ) {
		var MegaFilterOverrideFn = {};
	}
	
	if( typeof MegaFilterCommonData == 'undefined' ) {
		var MegaFilterCommonData = {};
	}
	
	MegaFilterCommonData.seo = {
		'currentUrl' : '<?php echo addslashes( $current_url ); ?>',
		'aliases' : <?php echo json_encode( $aliases ); ?>
	};
	
	if( typeof MegaFilterOverrideFn['<?php echo $_idx; ?>'] == 'undefined' ) {
		MegaFilterOverrideFn['<?php echo $_idx; ?>'] = {};
	}
	
	<?php if( ! empty( $settings['javascript'] ) ) { ?>
		<?php echo htmlspecialchars_decode( $settings['javascript'] ); ?>
	<?php } ?>
	
	jQuery().ready(function(){			
		jQuery('#mfilter-box-<?php echo $_idx; ?>').each(function(){
			var _t = jQuery(this).addClass('init'),
				_p = { };
			
			for( var i = 0; i < MegaFilterINSTANCES.length; i++ ) {
				if( _t.attr('id') == MegaFilterINSTANCES[i]._box.attr('id') ) {
					return;
				}
			}
			
			<?php foreach( $requestGet as $k => $v ) { ?>
				_p['<?php echo $k; ?>'] = '<?php echo addslashes( $v ); ?>';
			<?php } ?>
			
			var mfpModule = new MegaFilter();
			
			if( typeof MegaFilterOverrideFn['<?php echo $_idx; ?>'] != 'undefined' ) {
				for( var i in MegaFilterOverrideFn['<?php echo $_idx; ?>'] ) {
					mfpModule[i] = MegaFilterOverrideFn['<?php echo $_idx; ?>'][i];
				}
			}
			
			MegaFilterINSTANCES.push(mfpModule.init( _t, {
				'idx'					: '<?php echo $_idx; ?>',
				'route'					: '<?php echo $_route; ?>',
				'routeProduct'			: '<?php echo $_routeProduct; ?>',
				'routeHome'				: '<?php echo $_routeHome; ?>',
				'routeCategory'			: '<?php echo $_routeCategory; ?>',
				'routeInformation'		: '<?php echo $_routeInformation; ?>',
				'contentSelector'		: '<?php echo empty( $settings['content_selector'] ) ? '#mfilter-content-container' : addslashes( htmlspecialchars_decode( $settings['content_selector'] ) ); ?>',
				'contentSelectorH1'		: '<?php echo empty( $settings['content_selector_h1'] ) ? '#content h1,#content h2' : addslashes( htmlspecialchars_decode( $settings['content_selector_h1'] ) ); ?>',
				'contentSelectorPagination'	: '<?php echo empty( $settings['content_selector_pagination'] ) ? '#mfilter-content-container .pagination:first' : addslashes( htmlspecialchars_decode( $settings['content_selector_pagination'] ) ); ?>',
				'contentSelectorProduct': '<?php echo empty( $settings['content_selector_product'] ) ? '#mfilter-content-container .product-layout:first' : addslashes( htmlspecialchars_decode( $settings['content_selector_product'] ) ); ?>',
				'infiniteScroll'		: <?php echo empty( $settings['infinite_scroll'] ) ? 'false' : 'true'; ?>,
				'refreshResults'		: '<?php echo empty( $settings["refresh_results"] ) ? "immediately" : $settings["refresh_results"]; ?>',
				'refreshDelay'			: <?php echo empty( $settings["refresh_delay"] ) ? 1000 : (int) $settings["refresh_delay"]; ?>,
				'usingButtonWithCountInfo' : <?php echo empty( $settings['using_button_with_count_info'] ) ? 'false' : 'true'; ?>,
				'autoScroll'			: <?php echo empty( $settings["auto_scroll_to_results"] ) ? 'false' : 'true'; ?>,
				'ajaxGetInfoUrl'		: '<?php echo $ajaxGetInfoUrl; ?>',
				'ajaxResultsUrl'		: '<?php echo $ajaxResultsUrl; ?>',
				'ajaxGetCategoryUrl'	: '<?php echo $ajaxGetCategoryUrl; ?>',
				'priceMin'				: <?php echo (string) $price['min']; ?>,
				'priceMax'				: <?php echo (string) $price['max']; ?>,
				'mijoshop'				: <?php echo $mijo_shop ? 'true' : 'false'; ?>,
				'joo_cart'				: <?php echo $joo_cart ? json_encode( $joo_cart ) : 'false'; ?>,
				'jcart'					: <?php echo $jcart ? json_encode( $jcart ) : 'false'; ?>,
				'showNumberOfProducts'	: <?php echo empty( $settings['show_number_of_products'] ) ? 'false' : 'true'; ?>,
				'calculateNumberOfProducts' : <?php echo empty( $settings['calculate_number_of_products'] ) ? 'false' : 'true'; ?>,
				'addPixelsFromTop'		: <?php echo empty( $settings['add_pixels_from_top'] ) ? 0 : (int) $settings['add_pixels_from_top']; ?>,
				'displayListOfItems'	: {
					'type'				: '<?php echo $mfp_options['display_list_of_items']['type']; ?>',
					'limit_of_items'	: <?php echo $mfp_options['display_list_of_items']['limit_of_items']; ?>,
					'maxHeight'			: <?php echo $mfp_options['display_list_of_items']['max_height']; ?>,
					'textMore'			: '<?php echo $text_show_more; ?>',
					'textLess'			: '<?php echo $text_show_less; ?>',
					'standardScroll'	: <?php echo $mfp_options['display_list_of_items']['standard_scroll'] ? 'true' : 'false'; ?>
				},
				'smp'					: {
					'isInstalled'			: <?php echo empty( $smp['isInstalled'] ) ? 'false' : 'true'; ?>,
					'disableConvertUrls'	: <?php echo empty( $smp['disableConvertUrls'] ) ? 'false' : 'true'; ?>
				},
				'params'					: _p,
				'inStockDefaultSelected'	: <?php echo empty( $settings['in_stock_default_selected'] ) ? 'false' : 'true'; ?>,
				'inStockDefaultSelectedGlobal' : <?php echo $inStockDefaultSelectedGlobal ? 'true' : 'false'; ?>,
				'inStockStatus'				: '<?php echo empty( $settings['in_stock_status'] ) ? 7 : $settings['in_stock_status']; ?>',
				'inStockStatusSelected'		: '<?php echo json_encode( empty( $settings['in_stock_status_selected'] ) ? array( empty( $settings['in_stock_status'] ) ? 7 : $settings['in_stock_status'] ) : $settings['in_stock_status_selected'] ); ?>',
				'showLoaderOverResults'		: <?php echo empty( $settings['show_loader_over_results'] ) ? 'false' : 'true'; ?>,
				'showLoaderOverFilter'		: <?php echo empty( $settings['show_loader_over_filter'] ) ? 'false' : 'true'; ?>,
				'hideInactiveValues'		: <?php echo empty( $settings['hide_inactive_values'] ) ? 'false' : 'true'; ?>,
				'manualInit'				: '<?php echo empty( $settings['manual_init'] ) ? '0' : $settings['manual_init']; ?>',
				'homePageAJAX'				: <?php echo empty( $settings['home_page_ajax'] ) ? 'false' : 'true'; ?>,
				'homePageContentSelector'	: '<?php echo empty( $settings['home_page_content_selector'] ) ? '#content' : addslashes( htmlspecialchars_decode( $settings['home_page_content_selector'] ) ); ?>',
				'ajaxPagination'			: <?php echo empty( $settings['ajax_pagination'] ) ? 'false' : 'true'; ?>,
				'text'						: {
					'loading'		: '<?php echo $text_loading; ?>',
					'go_to_top'		: '<?php echo $text_go_to_top; ?>',
					'init_filter'	: '<?php echo $text_init_filter; ?>',
					'initializing'	: '<?php echo $text_initializing; ?>'
				},
				'color' : {
					'loader_over_results' : '<?php echo empty( $settings['color_of_loader_over_results'] ) ? '#ffffff' : $settings['color_of_loader_over_results']; ?>',
					'loader_over_filter' : '<?php echo empty( $settings['color_of_loader_over_filter'] ) ? '#ffffff' : $settings['color_of_loader_over_filter']; ?>'
				},
				'direction'				: '<?php echo $direction; ?>',
				'seo' : {
					'enabled'	: <?php echo empty( $seo['enabled'] ) ? 'false' : 'true'; ?>,
					'aliasesEnabled' : <?php echo empty( $seo['aliases_enabled'] ) ? 'false' : 'true'; ?>,
					'alias'		: '<?php echo addslashes( $seo_alias ); ?>',
					'parameter'	: '<?php echo empty( $seo['url_parameter'] ) ? 'mfp' : $seo['url_parameter']; ?>',
					'separator'	: '<?php echo empty( $seo['separator'] ) ? 'mfp' : $seo['separator']; ?>',
					'valuesAreLinks' : <?php echo empty( $seo['values_are_links'] ) ? 'false' : 'true'; ?>,
					'valuesLinksAreClickable' : <?php echo empty( $seo['values_links_are_clickable'] ) ? 'false' : 'true'; ?>,
					'usePostAjaxRequests' : <?php echo empty( $seo['use_post_ajax_requests'] ) ? 'false' : 'true'; ?>,
					'addSlashAtTheEnd' : <?php echo empty( $seo['add_slash_at_the_end'] ) ? 'false' : 'true'; ?>,
					'metaRobots' : <?php echo empty( $seo['meta_robots'] ) ? 'false' : 'true'; ?>,
					'metaRobotsValue' : '<?php echo empty( $seo['meta_robots_value'] ) ? 'noindex,follow' : addslashes( $seo['meta_robots_value'] ); ?>'
				},
				'displayAlwaysAsWidget'		: <?php echo empty( $displayAlwaysAsWidget ) ? 'false' : 'true'; ?>,
				'displaySelectedFilters'	: <?php echo empty( $displaySelectedFilters ) ? 'false' : "'" . $displaySelectedFilters . "'"; ?>,
				'isMobile' : <?php echo empty( $is_mobile ) ? 'false' : 'true'; ?>,
				'widgetWithSwipe' : <?php echo empty( $widgetWithSwipe ) ? 'false' : 'true'; ?>,
				'widgetPosition' : '<?php echo empty( $widgetPosition ) ? '' : $widgetPosition; ?>',
				'theme' : '<?php echo addslashes( $theme ); ?>',
				'data' : {
					'category_id' : <?php echo empty( $_data['filter_category_id'] ) ? 'null' : (int) $_data['filter_category_id']; ?>
				}
			}));
		});
	});
</script>