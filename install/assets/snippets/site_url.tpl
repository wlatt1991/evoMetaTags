//<?php
/**
 * site_url
 *
 * @category  		add
 * @version   		1.0
 * @license     	GNU General Public License (GPL), http://www.gnu.org/copyleft/gpl.html
 * @param string 	$mode Какой протокол установить (https || http || auto)
 * @author 			wlatt <wlatt1991@yandex.ru>
*/
	
$mode = (isset($mode)) ? $mode : 'auto';
$slash = (isset($slash) && ($slash == 0)) ? '' : '/';

switch ($mode) {
    case 'https':
        $protocol = 'https';
        break;
    case 'http':
        $protocol = 'http';
        break;
	case 'auto':
        $protocol = ((isset($_SERVER['HTTPS']) && $_SERVER['HTTPS']=='on') ? 'https' : 'http');
        break;	
    default:
        $protocol = $modx->config['server_protocol'];
}

return $protocol.'://'.$_SERVER['SERVER_NAME'].$slash;
