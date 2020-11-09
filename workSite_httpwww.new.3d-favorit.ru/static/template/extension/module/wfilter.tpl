<script src="catalog/view/javascript/wfilter/ion.rangeSlider.min.js"></script>
<link href="catalog/view/javascript/wfilter/ion.rangeSlider.min.css" rel="stylesheet">
<div id="ajaxfilter<?php echo $module_id; ?>" class="filterpro<?php if($display == 1) {  ?> hidden-xs <?php } elseif ($display == 2) { ?> visible-xs <?php } ?> " <?php if($layout) { ?>style="min-height:350px;"<?php } ?>></div>
<script type="text/javascript"><!--
<?php foreach($getmodules as $getmodule) { ?>
$('#ajaxfilter<?php echo $getmodule['module_id']; ?>').load('index.php?route=extension/module/wfilter/loadhtml&cpath=<?php echo $cpath; ?>&module_id=<?php echo $getmodule['module_id']; ?><?php echo $filterurl; ?>');
<?php } ?>
//--></script>