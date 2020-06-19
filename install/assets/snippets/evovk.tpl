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
$shareProps = isset($shareProps) ? (string)$shareProps : '{type: "round", text: "Сохранить"}';
$likeProps = isset($likeProps) ? (string)$likeProps : '{type: "button"}';
$commentsProps = isset($commentsProps) ? (string)$commentsProps : '{limit: 20, attach: "*", autoPublish: 1}';
$groupProps = isset($groupProps) ? (string)$groupProps : '{mode: 1, no_cover: 1}';
$groupId = isset($groupId) ? (int)$groupId : 0;
$bookmarksProps = isset($bookmarksProps) ? (string)$bookmarksProps : '{"height":20}';

$output = '';

switch ($widget) {
    case 'comments':
        $output = '<div id="evo_vk_comments"></div>';
        break;

    case 'group':
        $output = '<div id="evo_vk_group"></div>';
        break;

    case 'like':
        $output = '<div id="evo_vk_like"></div>';
        break;

    case 'save':
        $output = '<div id="evo_vk_save"></div>';
        break;

    case 'bookmarks':
        $output = '<div id="evo_vk_bookmarks"></div>';
        break;
}

if (!function_exists('addVkScripts') && !empty($output)) {
    $html_block = '
        <script>
            $(document).ready(function() {
                setTimeout(function() {
                    var is_comments = !!$("#evo_vk_comments").length;
                    var is_group = !!$("#evo_vk_group").length;
                    var is_like = !!$("#evo_vk_like").length;
                    var is_bookmarks = !!$("#evo_vk_bookmarks").length;
                    var is_save = !!$("#evo_vk_save").length;

                    if(is_save) {
                        $.getScript("//vk.com/js/api/share.js?95", function(){
                            $("#vk_save").html(VK.Share.button(false, '.$shareProps.'));
                        });
                    }
                    if(is_comments || is_group || is_like || is_bookmarks) {
                        $.getScript("//vk.com/js/api/openapi.js?168", function(){
                            if(is_comments || is_group || is_like) {
                                VK.init({apiId: '.$apiId.', onlyWidgets: true});
                                if (is_like) {
                                    VK.Widgets.Like("evo_vk_like", '.$likeProps.');
                                }
                                if (is_comments) {
                                    VK.Widgets.Comments("evo_vk_comments", '.$commentsProps.');
                                }
                                if (is_group) {
                                    VK.Widgets.Group("evo_vk_group", '.$groupProps.', '.$groupId.');
                                }
                            }
                            if (is_bookmarks) {
                                VK.Widgets.Bookmarks("evo_vk_bookmarks", '.$bookmarksProps.');
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
