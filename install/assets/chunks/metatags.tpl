/**
 * METATAGS
 * 
 * Основные метатеги для сайта
 * 
 * @category	Templates
 * @version 	1.0
 * @license 	http://www.gnu.org/copyleft/gpl.html GNU Public License (GPL)
 * @internal @modx_category Js
 * @internal    @installset base
 * @internal    @overwrite false
 */

<base href="[!site_url!]" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" /> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
<link href="[!site_url!][[if? &is=[*id*]:!=:1 &then=[~[*id*]~]]]" rel="canonical">
<link rel="shortcut icon" href="[!site_url!]favicon.ico" />
<!--[if lt IE 9]><script src="[!site_url!]assets/templates/html5shiv/html5shiv.min.js"></script><![endif]-->