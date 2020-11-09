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
  
 
            <div class="row row-wrap-card-little">
			
			  <?php foreach ($articles as $article) { ?>
              <div class="col-xl-3 col-lg-6 col-md-12">
                <div class="given-section-wrap-card">
                  <!-- шаблон №1 карточки товара-->
                  <div class="card-product-wrap card-product-wrap-js">
                    <!-- шапка карточки с иконками-->
                    <div class="card-product-wrap__wrap-info-icons-buttons">
                      
                    </div>
                    <div class="card-product-wrap__wrap-img"><img src="<?php echo $article['thumb']; ?>" alt="<?php echo $article['name']; ?>"></div>
					
                    <div class="card-product-wrap__wraper-content">
                      <p class="card-product-wrap__name"><?php echo $article['name']; ?></p>
                   
                      <p class="card-product-wrap__name-descr"><?php echo $article['preview']; ?></p>
					  <br>
                   
                    </div>
                    <button onclick="location.href='<?php echo $article['href']; ?>'" class="card-product-wrap__button-main card-product-wrap__button-main-basket"> 
                     Подробнее
                    </button>
                  </div>
                </div>
              </div>
             <?php } ?>
			 
            </div>
   
   
				
              </div>
            </div>
            
          </div>
    	
</div>

<?php echo $footer; ?>