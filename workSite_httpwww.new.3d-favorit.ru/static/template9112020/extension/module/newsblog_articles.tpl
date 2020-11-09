<section class="main-blog section-padding section-button-margin-mobile" style="background-image:url(static/images/general/fon-main-product.jpg)">
          <div class="container">
            <div class="row">
              <div class="col"><a class="button button-from-title" href="<?php echo $link_to_category; ?>">Читать все</a></div>
            </div>
            <div class="row">
              <div class="col-xl-12">
                <h2 class="section-title title-dotted">Блог</h2>
              </div>
            </div>
            <div class="row">
			<?php foreach ($articles as $article) { ?>
              <div class="col-xl-4 col-lg-6 col-md-6 main-blog-item">
                <div class="blog-item">
                  <div class="blog-item__img-wrap"><img src="<?php echo $article['thumb']; ?>" alt=""></div>
                  <div class="blog-item__content"><a class="blog-item__title" href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a>
                    <p class="blog-item__text"><?php echo $article['preview']; ?></p>
                    <div class="blog-item__info">
                      <p class="blog-item__data"><?php echo $article['date']; ?></p><a class="blog-item__href-article" href="<?php echo $article['href']; ?>">Подробнее...</a>
                    </div>
                  </div>
                </div>
              </div>
              <?php } ?>
            </div>
          </div>
</section>