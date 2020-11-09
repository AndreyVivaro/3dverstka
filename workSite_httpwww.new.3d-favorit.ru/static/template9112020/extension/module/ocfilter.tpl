<?php if ($options || $show_price) { ?>


<div class="row" id="ocfilter">

              <div class="col-xl-3 col-lg-12 col-wrap-choice">
	  
	   
	  
                <div class="accordion" id="accordionExample">
<?php foreach ($options as $option) { ?>
				  <div class="card">
                    <div class="card-header" id="heading<?php echo $option['option_id']; ?>">
                      <h5 class="mb-0">
                        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapse<?php echo $option['option_id']; ?>" aria-expanded="true" aria-controls="collapse<?php echo $option['option_id']; ?>"> <span class="animate-arrow-left-top"><?php echo $option['name']; ?>:</span></button>
                      </h5>
                    </div>
                    <div class="collapse" id="collapse<?php echo $option['option_id']; ?>" aria-labelledby="heading<?php echo $option['option_id']; ?>" data-parent="#accordionExample">
                      <div class="card-body">
                     <?php foreach ($option['values'] as $key => $value) { ?>
                     <?php if ($value['selected']) { ?>
						<label class="label-checkbox" id="v-<?php echo $value['id']; ?>">
                         <input type="<?php echo $option['type']; ?>" name="ocfilter_filter[<?php echo $option['option_id']; ?>]" value="<?php echo $value['href']; ?>" checked="checked" class="ocf-target" />
						  <span class="text-checkbox"><?php echo $value['name']; ?></span>
                        </label>
					<?php } elseif ($value['count']) { ?>
					   <label class="label-checkbox" id="v-<?php echo $value['id']; ?>">
                          <input type="<?php echo $option['type']; ?>" name="ocfilter_filter[<?php echo $option['option_id']; ?>]" value="<?php echo $value['href']; ?>" class="ocf-target" />
						  <span class="text-checkbox"><?php echo $value['name']; ?></span>
                        </label>
					<?php } else { ?>
					  <label class="label-checkbox" id="v-<?php echo $value['id']; ?>">
                          <input type="<?php echo $option['type']; ?>" name="ocfilter_filter[<?php echo $option['option_id']; ?>]" value="" disabled="disabled" class="ocf-target" />
						  <span class="text-checkbox"><?php echo $value['name']; ?></span>
                        </label>
				    <?php } ?>
		            <?php } ?>
                      
                      </div>
                    </div>
                  </div>
<?php } ?>

                </div>
              </div>
</div>

<script type="text/javascript"><!--
$(function() {
	var options = {
    mobile: false,
    php: {
	    showPrice    : <?php echo $show_price; ?>,
	    showCounter  : <?php echo $show_counter; ?>,
			manualPrice  : <?php echo $manual_price; ?>,
      link         : '<?php echo $link; ?>',
	    path         : '<?php echo $path; ?>',
	    params       : '<?php echo $params; ?>',
	    index        : '<?php echo $index; ?>'
	  },
    text: {
	    show_all: '<?php echo $text_show_all; ?>',
	    hide    : '<?php echo $text_hide; ?>',
	    load    : '<?php echo $text_load; ?>',
			any     : '<?php echo $text_any; ?>',
	    select  : '<?php echo $button_select; ?>'
	  }
	};

  if ($('#ocfilter').is(':hidden')) {
    $('#navbar-ocfilter').html($('#ocfilter').remove().get(0).outerHTML);

    var html = $('#ocfilter-mobile').remove().get(0).outerHTML;

    $('.breadcrumb').after(html);

    options['mobile'] = true;
  }

  setTimeout(function() {
    $('#ocfilter').ocfilter(options);
  }, 1);
});
//--></script>
<?php } ?>