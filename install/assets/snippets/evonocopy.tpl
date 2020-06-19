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

$templates = isset($templates) ? (string)$templates : '';
$div_attrs = isset($div_attrs) ? (string)$div_attrs : 'html,body,body>div';

$html_block = '<script type="text/javascript">(function(d,s){document.ondragstart=z3;document.onselectstart=z3;document.oncontextmenu=z3;function z3(){return false}})(document,screen)</script><style type="text/css">' . $div_attrs . '{-moz-user-select:none;-webkit-user-select:none;-ms-user-select:none;-o-user-select:none;user-select:none;}</style>';

if (!empty($templates)) {
    $templates_arr = explode(',', trim($templates));
    $cur_template = $modx->documentObject['template'];

    if (in_array($cur_template, $templates_arr)) {
        $modx->regClientHTMLBlock($html_block);
    }
} else {
    $modx->regClientHTMLBlock($html_block);
}

return;
