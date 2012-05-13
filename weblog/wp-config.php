<?php
// ** MySQL settings ** //
define('DB_NAME', 'wordpress');    // The name of the database
define('DB_USER', 'wordpress');     // Your MySQL username
define('DB_PASSWORD', 'w0rdpr3zz'); // ...and password
define('DB_HOST', 'localhost');    // 99% chance you won't need to change this value
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');

// Change each KEY to a different unique phrase.  You won't have to remember the phrases later,
// so make them long and complicated.  You can visit http://api.wordpress.org/secret-key/1.1/
// to get keys generated for you, or just make something up.  Each key should have a different phrase.
define('AUTH_KEY',        'pwtU.c39%uPh#42 GV9SLk`+yaG9*jAzsw|=qAc!HDtZ+6?u*qtl|kvFr}05F}UCr}');
define('SECURE_AUTH_KEY', 'pwPe_2!U-O5,q)mH.D^F46Cj.S76=71^_5G%T_i)*OMY;{u@Ehq*K7#_3b~+NP:[*?');
define('LOGGED_IN_KEY',   'pw+6Ix_i4{yldI%*euYUXe2xQ-|kX_a9KmV(k`uWi&-_Cx Vt@*Z]&n>,.7p@]ck3.');
define('NONCE_KEY',       'pw[@$[dtGz;Q|-nZfN=thrG>xi5P 6;!*shTI v<~9]$q(@5h74@ya F+}KE)lS)$z');

define('WP_CACHE', true);
define('WP_MEMORY_LIMIT', '64M');

define('FORCE_SSL_LOGIN', true);
define('FORCE_SSL_ADMIN', true);

// You can have multiple installations in one database if you give each a unique prefix
$table_prefix  = 'blog_';   // Only numbers, letters, and underscores please!

// Change this to localize WordPress.  A corresponding MO file for the
// chosen language must be installed to wp-content/languages.
// For example, install de.mo to wp-content/languages and set WPLANG to 'de'
// to enable German language support.
define ('WPLANG', '');

/* That's all, stop editing! Happy blogging. */

if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');
require_once(ABSPATH . 'wp-settings.php');
?>
