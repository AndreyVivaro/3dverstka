        <section class="section-basket-order section-padding-bottom">
          <div class="container">
            <div class="row">
              <div class="col-xl-12">
                <h2 class="section-title">Оформление заказа</h2>
              </div>
            </div>
            <div class="row">
              <div class="col-xl-5 col-lg-5">
                <h3 class="title-column">Адрес доставки</h3>
                <div class="section-basket-order__wrap-field simplecheckout-block"  id="simplecheckout_shipping_address" <?php echo $hide ? 'data-hide="true"' : '' ?> <?php echo $display_error && $has_error ? 'data-error="true"' : '' ?>>
                  <?php foreach ($rows as $row) { ?>
      <?php echo $row ?>
    <?php } ?>
    <?php foreach ($hidden_rows as $row) { ?>
      <?php echo $row ?>
    <?php } ?>
                </div>
              </div>