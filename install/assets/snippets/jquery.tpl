//<?php
/**
 * evojQuery
 *
 * jQuery для Evo
 *
 * @category	snippet
 * @internal	@modx_category Utils
 * @internal	@installset base
 * @internal	@overwrite true
 * @internal	@properties {}
 */
if(!defined('MODX_BASE_PATH')) {die('What are you doing? Get out of here!');}

$version = isset($version) ? (int)$version : '3';

$versions = [
    '3' => '3.5.1',
    '2' => '2.2.4',
];

$modx->regClientScript('/assets/templates/jquery/jquery-'.$versions[$version].'.min.js');

return;
