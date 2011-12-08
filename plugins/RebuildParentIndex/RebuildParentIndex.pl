package MT::Plugin::RebuildParentIndex;
use strict;
use MT;
use MT::Plugin;

use MT::Util qw ( start_background_task );

our $VERSION = "1.0";

@MT::Plugin::RebuildParentIndex::ISA = qw(MT::Plugin);

my $plugin = new MT::Plugin::RebuildParentIndex({
    id => 'RebuildParentIndex',
    key => 'rebuildparentindex',
    name => 'RebuildParentIndex',
    author_name => 'okayama',
    author_link => 'http://weeeblog.net/',
    description => '<MT_TRANS phrase=\'_PLUGIN_DESCRIPTION\'>',
	version => $VERSION,
    l10n_class => 'RebuildParentIndex::L10N',
});

MT->add_plugin($plugin);

sub init_registry {
    my $plugin = shift;
    $plugin->registry( {
        callbacks => {
            'cms_post_save.entry',
                => \&_post_save_entry,
            'cms_post_save.page',
                => \&_post_save_entry,
            'api_post_save.entry',
                => \&_post_save_entry,
            'api_post_save.page',
                => \&_post_save_entry,
        },
   } );
}

######################################### Mainroutine #########################################

sub _post_save_entry {
	my ( $eh, $app, $obj, $original ) = @_;
	if ( my $blog = $obj->blog ) {
        if ( my $website = $blog->website ) {
            my $pub = MT::WeblogPublisher->new;
            MT::Util::start_background_task( sub { $pub->rebuild_indexes( Blog => $website ); } );
        }
	}
    return 1;
}

1;



