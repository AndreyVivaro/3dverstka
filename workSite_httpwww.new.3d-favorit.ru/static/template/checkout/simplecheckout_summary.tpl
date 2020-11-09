
                  <div class="wrap-total-button"  id="simplecheckout_summary">
                    <p>Итого к оплате:</p>
                    <p class="product-description__text-price simplecheckout-block" id="simplecheckout_summary">
					    <?php foreach ($totals as $total) { ?>
						<?php if ($total['title'] == 'Итого') { ?>
						<span class="number-space-js"><?php echo $total['text']; ?></span>
						<span class="rub">&nbsp;</span>
					    <?php } ?>
						<?php } ?>
						
					</p>
					
					<span id="movezone"><span>
                  </div>
                </div>
              </div>
			  
			  
			   </div>
          </div>
        </section>

