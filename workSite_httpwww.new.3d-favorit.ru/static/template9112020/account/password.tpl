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
               
	<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
        <fieldset style="padding-left: 0px;">
          <legend><?php echo $text_password; ?></legend>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-password" style="padding-left: 0px;"><?php echo $entry_password; ?></label>
            <div class="col-sm-10" style="padding-left: 0px;">
              <input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
              <?php if ($error_password) { ?>
              <div class="text-danger"><?php echo $error_password; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-confirm" style="padding-left: 0px;"><?php echo $entry_confirm; ?></label>
            <div class="col-sm-10" style="padding-left: 0px;">
              <input type="password" name="confirm" value="<?php echo $confirm; ?>" placeholder="<?php echo $entry_confirm; ?>" id="input-confirm" class="form-control" />
              <?php if ($error_confirm) { ?>
              <div class="text-danger"><?php echo $error_confirm; ?></div>
              <?php } ?>
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