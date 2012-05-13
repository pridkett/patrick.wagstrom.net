<?php
/**
 * Builds a pullout with meta information for a page. This file should not be loaded by itself, but should instead be included using get_template_part or locate_template.
 * Users can override this in a child theme. Note that if you want to have a differently styled pullout for a particular page template, you could call the file
 * pullout-page-<page-template>.php in your child theme. E.g. pullout-page-1l-sidebar.php will apply to the Single Left Sidebar template.
 *
 * @since 3.8.3
 * @package Suffusion
 * @subpackage Custom
 */

global $post, $suf_page_meta_position, $suf_page_show_posted_by, $suf_page_show_comment;

$page_meta_position = apply_filters('suffusion_pullout_position', $suf_page_meta_position);
if ($page_meta_position == 'corners') {
	return;
}

echo "<div class='meta-pullout meta-$page_meta_position'>\n";
echo "<ul>\n";

if ($suf_page_show_posted_by != 'hide') {
	echo "<li>";
	suffusion_print_author_byline();
	echo "</li>\n";
}

if ($suf_page_show_comment != 'hide') {
	if ('open' == $post->comment_status) {
		echo "<li><span class='comments'><a href='#respond'>".__('Add comments', 'suffusion')."</a></span></li>\n";
	}
}

if (get_edit_post_link() != '') {
	echo "<li><span class='edit'>";
	edit_post_link(__('Edit', 'suffusion'), '', '');
	echo "</span></li>\n";
}

echo "</ul>\n";
echo "</div>\n";
?>