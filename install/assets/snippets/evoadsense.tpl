//<?php
/**
 * evoAdSense
 *
 * adSense для Evo
 *
 * @category	snippet
 * @internal	@modx_category Utils
 * @internal	@installset base
 * @internal	@overwrite true
 * @internal	@properties {}
 */
 if(!defined('MODX_BASE_PATH')) {die('What are you doing? Get out of here!');}

$modx->regClientHTMLBlock('
<script>
    $(document).ready(function() {
        setTimeout(function() {
            if($(".adsbygoogle").length) {
                $.getScript("https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js", function(){
                    (adsbygoogle = window.adsbygoogle || []).push({});
                });
            }
        }, 1500);
    });
</script>
');

return;
