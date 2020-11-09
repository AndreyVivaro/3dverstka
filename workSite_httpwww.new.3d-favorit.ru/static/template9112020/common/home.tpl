<?php echo $header; ?>
   <div class="content">
        <!-- блоки, которые подгружаются в main.pug-->
        <!-- include - имеет возможность вставки содержимого одного файла в другой файл Pug.-->
		<?php echo $content_top; ?>

        <section class="main-product section-padding" style="background-image:url(static/images/general/fon-main-product-1.png), url(static/images/general/fon-main-product-2.png)">
          <div class="container">
            <div class="row">
			<?php echo $column_left; ?>
            </div>
          </div>
        </section>
		
		<?php echo $content_bottom; ?>
      </div>
<?php echo $footer; ?>