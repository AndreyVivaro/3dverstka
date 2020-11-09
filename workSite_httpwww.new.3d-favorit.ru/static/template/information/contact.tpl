<?php echo $header; ?>

<div class="content">

<section class="section-basket-product section-padding-bottom">

<div class="container">

		
            <div class="row">
              <div class="col-xl-12">
                <h1 class="section-title"><?php echo $heading_title; ?></h1>
              
			  
			        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
        <fieldset style="padding-left: 0px;">
          <legend><?php echo $text_contact; ?></legend>
          <div class="form-group required">
            <label class="col-sm-2 control-label" style="padding-left: 0px;" for="input-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-10" style="padding-left: 0px;">
              <input type="text" name="name" value="<?php echo $name; ?>" id="input-name" class="form-control" />
              <?php if ($error_name) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" style="padding-left: 0px;" for="input-email"><?php echo $entry_email; ?></label>
            <div class="col-sm-10" style="padding-left: 0px;">
              <input type="text" name="email" value="<?php echo $email; ?>" id="input-email" class="form-control" />
              <?php if ($error_email) { ?>
              <div class="text-danger"><?php echo $error_email; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" style="padding-left: 0px;" for="input-enquiry"><?php echo $entry_enquiry; ?></label>
            <div class="col-sm-10" style="padding-left: 0px;">
              <textarea name="enquiry" rows="10" id="input-enquiry" class="form-control"><?php echo $enquiry; ?></textarea>
              <?php if ($error_enquiry) { ?>
              <div class="text-danger"><?php echo $error_enquiry; ?></div>
              <?php } ?>
            </div>
          </div>
          <?php echo $captcha; ?>
        </fieldset>
        <div class="buttons">
          <div class="pull-right">
            <input class="button section-basket-order__button-zakaz" type="submit" value="<?php echo $button_submit; ?>" />
          </div>
        </div>
      </form>
	  
	  
              </div>
            </div>
            
          </div>
    	
</div>

<?php echo $footer; ?>