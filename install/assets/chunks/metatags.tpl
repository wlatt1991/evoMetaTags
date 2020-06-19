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

<base href="[(site_url)]" />
<meta http-equiv="Content-Type" content="text/html; charset=[(modx_charset)]" /> 
<meta http-equiv="X-UA-Compatible" content="IE=edge" /> 
<link href="[(site_url)][[if? &is=[*id*]:!=:1 &then=[~[*id*]~]]]" rel="canonical">
<link rel="shortcut icon" href="[(site_url)]favicon.ico" />
<!--[if lt IE 9]><script src="[(site_url)]assets/templates/utils/html5shiv.min.js"></script><![endif]-->
[[evoMetaTags]]
[[evoNoCopy]]
[[evoLI]]