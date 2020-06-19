<?php
require_once MODX_BASE_PATH.'assets/snippets/evoMetaTags/evoMetaTags.php';
require_once MODX_BASE_PATH.'assets/snippets/DocLister/lib/DLTemplate.class.php';

$share = new evoMetaTags($modx,$params);

if($params['api'] == '1'){
    echo json_encode($share->getFields());
}
else {
    echo $share->render();
}

return;