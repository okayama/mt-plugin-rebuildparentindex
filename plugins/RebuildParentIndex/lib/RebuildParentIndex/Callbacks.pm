package RebuildParentIndex::Callbacks;
use strict;

use MT::Util qw( start_background_task );

sub _cb_cms_post_save_entry {
	my ( $eh, $app, $obj, $original ) = @_;
	my $plugin = MT->component( 'RebuildParentIndex' );
	if ( $plugin->get_config_value( 'only_pulish_status', 'blog:' . $obj->blog_id ) ) {
	    return 1 unless $obj->status eq MT::Entry::RELEASE();
	}
	if ( my $blog = $obj->blog ) {
        if ( my $website = $blog->website ) {
            my $pub = MT::WeblogPublisher->new;
            start_background_task( sub { $pub->rebuild_indexes( Blog => $website ); } );
        }
	}
    return 1;
}

1;
