//<?php
/**
 * evoNoCopy
 *
 * Запрет копирования для Evo
 *
 * @category	snippet
 * @internal	@modx_category Content
 * @internal	@installset base
 * @internal	@overwrite true
 * @internal	@properties {}
 */

$modx->regClientHTMLBlock('<script type="text/javascript">(function(d,s){document.ondragstart=z3;document.onselectstart=z3;document.oncontextmenu=z3;function z3(){return false}})(document,screen)</script><style type="text/css">html,body{-moz-user-select:none;-webkit-user-select:none;-ms-user-select:none;-o-user-select:none;user-select:none;}</style>');

return;
