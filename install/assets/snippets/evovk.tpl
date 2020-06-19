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
$apiId = isset($apiId) ? (int)$apiId : 0;
$shareProps = isset($shareProps) ? (string)$shareProps : 'false, {type: "round", text: "Сохранить"}';
$likeProps = isset($likeProps) ? (string)$likeProps : '{type: "button"}';
$commentsProps = isset($commentsProps) ? (string)$commentsProps : '{limit: 20, attach: "*", autoPublish: 1}';
$groupsProps = isset($groupsProps) ? (string)$groupsProps : '{mode: 1, no_cover: 1}';
$groupsId = isset($groupsId) ? (int)$groupsId : 0;
$bookmarksProps = isset($bookmarksProps) ? (string)$bookmarksProps : '{"height":20}';

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

    case 'vk_bookmarks':
        $output = '<div id="vk_bookmarks"></div>';
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
                    if($("#vk_comments").length || $("#vk_groups").length || $("#vk_like").length || $("#vk_bookmarks").length) {
                        $.getScript("//vk.com/js/api/openapi.js?168", function(){
                            if($("#vk_comments").length || $("#vk_groups").length || $("#vk_like").length) {
                                VK.init({apiId: '.$apiId.', onlyWidgets: true});
                            }
                            if ($("#vk_like").length) {
                                VK.Widgets.Like("vk_like", '.$likeProps.');
                            }
                            if ($("#vk_comments").length) {
                                VK.Widgets.Comments("vk_comments", '.$commentsProps.');
                            }
                            if ($("#vk_groups").length) {
                                VK.Widgets.Group("vk_groups", '.$groupsProps.', '.$groupsId.');
                            }
                            if ($("#vk_bookmarks").length) {
                                VK.Widgets.Bookmarks("vk_bookmarks", '.$bookmarksProps.');
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
