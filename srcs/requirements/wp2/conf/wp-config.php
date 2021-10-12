<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */
define( 'WP_REDIS_HOST', 'redis' );
define( 'WP_REDIS_PORT', 6379 );
// define( 'WP_REDIS_PASSWORD', 'secret' );
define( 'WP_REDIS_TIMEOUT', 1 );
define( 'WP_REDIS_READ_TIMEOUT', 1 );

// change the database for each site to avoid cache collisions
define( 'WP_REDIS_DATABASE', 0 );

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', '__wp__user__' );

/** MySQL database password */
define( 'DB_PASSWORD', '__wp__pass__' );

/** MySQL hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'qC%/^vB6O4R3i@JQwh<n1sMZGEq/C@E)Oqv>.5!:,|hI B$O,Kf0QTyi6fqtyC?|' );
define( 'SECURE_AUTH_KEY',  'g6E4owu/)A=I-<&SmSZ20#iJhCqdOHlhtTk+u`2xUY1<xvc}U>)Zc4dqjr;GhF3:' );
define( 'LOGGED_IN_KEY',    'xvJ lI=l5RRB`obmL{yOvH{P9wmb>W`E4K>xYA,zgnj#b|6/$N(3{j}}>~:JtTwE' );
define( 'NONCE_KEY',        'Ds`B=*eQx_Zk{CKsKVy,8K]*wKZXstJTE9*!T-1c5ERRe2iz!*HCykxL|tNKMmW&' );
define( 'AUTH_SALT',        'tx6,)Ik7qPu1,-t^U]Sw_,wPN.2#G@:7gFAN}-yCM*h5t[ytSM!7%qhc^>k4*h,N' );
define( 'SECURE_AUTH_SALT', 'c;7d*bdRbg#`$u{hFiS&rSmhS0l<E`s+vaKAJh:DNCt>*<obiM9vqu B=i}RN/G<' );
define( 'LOGGED_IN_SALT',   'qj$71s{/43OY9<$1>[{LQA263f:tRN sH-8zzm4?h;A)]^*BrJ9zD<G$KBZ&biY3' );
define( 'NONCE_SALT',       'e)w-}d.q<h6V)7q7eGb&.dv]&zdUX<XLb7q,!iv74tL<d4=Kjm&*%`O#B?ax){K9' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
