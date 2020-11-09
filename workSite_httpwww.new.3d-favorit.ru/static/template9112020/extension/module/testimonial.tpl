 <section class="main-reviews section-padding section-button-margin-mobile">
          <div class="container">
            <div class="row">
              <div class="col"><a class="button button-from-title" href="<?php echo $keyword; ?>">Читать все</a></div>
            </div>
            <div class="row">
              <div class="col-xl-12">
                <h2 class="section-title title-dotted">Отзывы</h2>
              </div>
            </div>
            <div class="row row-wrap-swiper">
              <div class="swiper-container swiper-container-reviews">
                <div class="swiper-wrapper">
				  <?php foreach ($reviews as $review) { ?>
                  <div class="swiper-slide">
                    <div class="swiper-container-reviews__wrap-item">
                      <div class="rating">
					   <?php for ($i = 1; $i <= 5; $i++) { ?>
                       <?php if ($review['rating'] < $i) { ?>
					   <span class="rating__star">&#9734;</span>
                      <?php } else { ?>
					   <span class="rating__star">&#9733;</span>
					   <?php } ?>
                       <?php } ?>
					  </div>
                      <p class="swiper-container-reviews__text"><?php echo $review['text']; ?></p>
                      <p class="swiper-container-reviews__name"><?php echo $review['author']; ?></p>
                      <p class="swiper-container-reviews__date"><?php echo $review['date_added']; ?></p>
                    </div>
                  </div>
                <?php } ?>
                </div>
              </div>
              <div class="swiper-container-reviews__swiper-pagination"></div>
              <div class="swiper-container-reviews__swiper-button-next"><span class="arrow"></span></div>
              <div class="swiper-container-reviews__swiper-button-prev"><span class="arrow"></span></div>
            </div>
          </div>
</section>