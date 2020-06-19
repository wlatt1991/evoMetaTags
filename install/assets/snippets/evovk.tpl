//<?php
/**
 * evoVK
 *
 * VK виджеты для Evo
 *
 * @category	snippet
 * @internal	@modx_category Content
 * @internal	@installset base
 * @internal	@overwrite true
 * @internal	@properties {}
 */
if(!defined('MODX_BASE_PATH')) {die('What are you doing? Get out of here!');}

$widget = isset($widget) ? (string)$widget : '';

$apiId = isset($apiId) ? (string)$apiId : '';

if (empty($apiId)) {
    return 'Требуется apiId';
}

$initProps = '{apiId: '.$appId.', onlyWidgets: true}';
$shareProps = 'false, {type: "round", text: "Сохранить"}';
$likeProps = '"vk_like", {type: "button"}';
$commentsProps = '"vk_comments", {limit: 20, attach: "*", autoPublish: 1}';
$groupsProps = '"vk_groups", {mode: 1, no_cover: 1}, 179258215';

$output = '';

switch ($widget) {
    case 'vk_comments':
        $output = '<div id="vk_comments"></div>';
        break;

    case 'vk_groups':
        $output = '<div id="vk_groups"></div>';
        break;

    case 'vk_like':
        $output = '<div id="vk_like"></div>';
        break;

    case 'vk_save':
        $output = '<div id="vk_save"></div>';
        break;
}

if (!function_exists('addVkScripts')) {
    $html_block = '
        <script>
            $(document).ready(function() {
                setTimeout(function() {
                    if($("#vk_save").length) {
                        $.getScript("//vk.com/js/api/share.js?95", function(){
                            $("#vk_save").html(VK.Share.button('.$shareProps.'));
                        });
                    }
                    if($("#vk_comments").length || $("#vk_groups").length || $("#vk_like").length) {
                        $.getScript("//vk.com/js/api/openapi.js?168", function(){
                            VK.init('.$initProps.');
                            if ($("#vk_like").length) {
                                VK.Widgets.Like('.$likeProps.');
                            }
                            if ($("#vk_comments").length) {
                                VK.Widgets.Comments('.$commentsProps.');
                            }
                            if ($("#vk_groups").length) {
                                VK.Widgets.Group('.$groupsProps.');
                            }
                        });
                    }
                }, 2500);
            });
        </script>
    ';

    function addVkScripts() {}

    $modx->regClientHTMLBlock($html_block);
}

return $output;
