 <section class="main-catalog section-padding">
          <div class="container-fluid">
            <div class="row">
			  <?php foreach ($items as $item) { ?>
              <div class="col-xl-4 col-lg-6 col-md-6">
                <div class="main-catalog__card main-catalog__card_img-1" style="background-image: url(<?php echo $item['thumb']; ?>);">
                  <div class="main-catalog__card-content">
                    <h3 class="main-catalog__card-title"><?php echo $item['name']; ?></h3>
					<?php if ($item['children1']) { ?>
                    <ul class="main-catalog__card-wrap-text">
					  <?php foreach ($item['children1'] as $child1) { ?>
                      <li><a class="main-catalog__card-text" href="<?php echo $child1['href']; ?>">- <?php echo $child1['name']; ?></a></li>
					  <?php } ?>
                    </ul>
					<?php } ?>
                  </div>
                </div>
              </div>
             <?php } ?>
            </div>
          </div>
</section>