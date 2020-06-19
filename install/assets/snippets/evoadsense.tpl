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
            var count = $(".adsbygoogle").length;
            if(count) {
                $.getScript("https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js", function(){
                    for (var i = 0; i < count; i++) {
                        (adsbygoogle = window.adsbygoogle || []).push({});
                    }
                });
            }
        }, 1500);
    });
</script>
');

return;
