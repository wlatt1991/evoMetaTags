//<?php
/**
 * evoMetaTags
 *
 * Выводим мета теги
 *
 * @category	snippet
 * @internal	@modx_category Utils
 * @internal	@installset base
 * @internal	@overwrite true
 * @internal	@properties {}
 * add mm_moveFieldsToTab('meta_title,meta_description,meta_image,meta_og_off,seoOverride,noIndex,sitemap_changefreq,sitemap_priority,sitemap_exclude', 'seo', '', '');
 */
if(!defined('MODX_BASE_PATH')) {die('What are you doing? Get out of here!');}

return require MODX_BASE_PATH.'assets/snippets/evoUtils/snippet.evoMetaTags.php';
