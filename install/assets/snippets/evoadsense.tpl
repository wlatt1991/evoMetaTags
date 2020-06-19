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
                var deq = ["gea","og","gea","d2.g", "dsb", "e."];
                $.getScript("htt"+"ps:"+"//pa"+deq[0]+deq[3]+"o"+deq[1]+"le"+"sy"+"nd"+"icat"+"ion"+".co"+"m/"+"pa"+deq[2]+"d/"+"js/a"+deq[4]+"yg"+"oo"+"gl"+deq[5]+"js", function(){
                    var as = (adsbygoogle = window.adsbygoogle || []);
                    for (var i = 0; i < count; i++) {
                        setTimeout(function() {
                            as.push({});
                        }, i*1000);
                    }
                });
            }
        }, 1000);
    });
</script>
');

return;
