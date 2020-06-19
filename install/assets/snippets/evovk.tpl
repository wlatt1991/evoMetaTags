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
                    var is_vk_comments = !!$("#vk_comments").length;
                    var is_vk_groups = !!$("#vk_groups").length;
                    var is_vk_like = !!$("#vk_like").length;
                    var is_vk_bookmarks = !!$("#vk_bookmarks").length;
                    var is_vk_save = !!$("#vk_save").length;

                    if(is_vk_save) {
                        $.getScript("//vk.com/js/api/share.js?95", function(){
                            $("#vk_save").html(VK.Share.button(false, '.$shareProps.'));
                        });
                    }
                    if(is_vk_comments || is_vk_groups || is_vk_like || is_vk_bookmarks) {
                        $.getScript("//vk.com/js/api/openapi.js?168", function(){
                            if(is_vk_comments || is_vk_groups || is_vk_like) {
                                VK.init({apiId: '.$apiId.', onlyWidgets: true});
                            }
                            if (is_vk_like) {
                                VK.Widgets.Like("vk_like", '.$likeProps.');
                            }
                            if (is_vk_comments) {
                                VK.Widgets.Comments("vk_comments", '.$commentsProps.');
                            }
                            if (is_vk_groups) {
                                VK.Widgets.Group("vk_groups", '.$groupsProps.', '.$groupsId.');
                            }
                            if (is_vk_bookmarks) {
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
