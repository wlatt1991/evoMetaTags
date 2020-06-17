/**
 * METATAGS
 * 
 * Основные метатеги для сайта
 * 
 * @category	chunk
 * @version 	1.0
 * @license 	http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)
 * @modx_category Templates
 * @internal    @installset base
 * @internal    @overwrite false
 */

<base href="[!siteUrl!]" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" /> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
<link href="[!siteUrl!][[if? &is=[*id*]:!=:1 &then=[~[*id*]~]]]" rel="canonical">
<link rel="shortcut icon" href="[!siteUrl!]favicon.ico" />
<!--[if lt IE 9]><script src="[!siteUrl!]assets/templates/html5shiv/html5shiv.min.js"></script><![endif]-->