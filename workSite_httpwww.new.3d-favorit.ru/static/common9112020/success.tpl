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
                 <?php echo $text_message; ?>
              </div>
            </div>
            
          </div>
    	
</div>

<?php echo $footer; ?>