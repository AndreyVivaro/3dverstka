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
				
				  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
  <?php } ?>
  
			<div class="row row-wrap-card-little">
			
	
              <div class="col-xl-3 col-lg-6 col-md-12">
                <div class="given-section-wrap-card">
                  <!-- шаблон №1 карточки товара-->
                  <div class="card-product-wrap card-product-wrap-js">
                    <!-- шапка карточки с иконками-->
    
					
                    <div class="card-product-wrap__wraper-content">
                      <p class="card-product-wrap__name">История заказов</p>
                   
                   
                    </div>
                    <button onclick="location.href='<?php echo $order; ?>'" class="card-product-wrap__button-main card-product-wrap__button-main-basket"> 
                     Просмотреть
                    </button>
                  </div>
                </div>
              </div>
			  
			          <div class="col-xl-3 col-lg-6 col-md-12">
                <div class="given-section-wrap-card">
                  <!-- шаблон №1 карточки товара-->
                  <div class="card-product-wrap card-product-wrap-js">
                    <!-- шапка карточки с иконками-->
    
					
                    <div class="card-product-wrap__wraper-content">
                      <p class="card-product-wrap__name">Изменение профиля</p>
                   
                   
                    </div>
                    <button onclick="location.href='<?php echo $edit; ?>'" class="card-product-wrap__button-main card-product-wrap__button-main-basket"> 
                  Изменить профиль
                    </button>
                  </div>
                </div>
              </div>
			  
			          <div class="col-xl-3 col-lg-6 col-md-12">
                <div class="given-section-wrap-card">
                  <!-- шаблон №1 карточки товара-->
                  <div class="card-product-wrap card-product-wrap-js">
                    <!-- шапка карточки с иконками-->
    
					
                    <div class="card-product-wrap__wraper-content">
                      <p class="card-product-wrap__name">Пароль</p>
                   
                   
                    </div>
                    <button onclick="location.href='<?php echo $password; ?>'" class="card-product-wrap__button-main card-product-wrap__button-main-basket"> 
                    Изменить пароль
                    </button>
                  </div>
                </div>
              </div>
			  
			  
			          <div class="col-xl-3 col-lg-6 col-md-12">
                <div class="given-section-wrap-card">
                  <!-- шаблон №1 карточки товара-->
                  <div class="card-product-wrap card-product-wrap-js">
                    <!-- шапка карточки с иконками-->
    
					
                    <div class="card-product-wrap__wraper-content">
                      <p class="card-product-wrap__name">Закладки</p>
                   
                   
                    </div>
                    <button onclick="location.href='<?php echo $wishlist; ?>'" class="card-product-wrap__button-main card-product-wrap__button-main-basket"> 
                    Просмотреть
                    </button>
                  </div>
                </div>
              </div>
			  
			  	          <div class="col-xl-3 col-lg-6 col-md-12">
                <div class="given-section-wrap-card">
                  <!-- шаблон №1 карточки товара-->
                  <div class="card-product-wrap card-product-wrap-js">
                    <!-- шапка карточки с иконками-->
    
					
                    <div class="card-product-wrap__wraper-content">
                      <p class="card-product-wrap__name">Выход</p>
                   
                   
                    </div>
                    <button onclick="location.href='/logout/'" class="card-product-wrap__button-main card-product-wrap__button-main-basket"> 
                    Выйти
                    </button>
                  </div>
                </div>
              </div>
         
            </div>


	  
              </div>
            </div>
            
          </div>
    	
</div>

<?php echo $footer; ?>