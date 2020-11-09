<?php echo $header; ?>

<div class="content">

<section class="section-basket-product section-padding-bottom">

<div class="container">

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
		
            <div class="row">
              <div class="col-xl-12">
                <h1 class="section-title"><?php echo $heading_title; ?></h1>
				
				  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?></div>
  <?php } ?>
  
               <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
        <fieldset style="padding-left: 0px;">
          <legend><?php echo $text_your_email; ?></legend>
          <div class="form-group required">
            <label class="col-sm-2 control-label" style="padding-left: 0px;" for="input-email"><?php echo $entry_email; ?></label>
            <div class="col-sm-4" style="padding-left: 0px;">
              <input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
            </div>
          </div>
        </fieldset>
        <div class="buttons clearfix">
          <div class="pull-right">
            <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-success" />
          </div>
        </div>
      </form>
              </div>
            </div>
            
          </div>
    	
</div>

<?php echo $footer; ?>