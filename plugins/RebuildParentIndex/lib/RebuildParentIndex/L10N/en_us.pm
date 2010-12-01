package RebuildParentIndex::L10N::en_us;
use strict;
use base 'RebuildParentIndex::L10N';
use vars qw( %Lexicon );

our %Lexicon = (
    '_PLUGIN_DESCRIPTION' => &_plugin_description,
);

sub _plugin_description {
    return<<'TEXT';
Rebuild index templates in parent website, at saving entry/page(if page is saved at website, rebuild own index templates).
If added <a href="http://www.movabletype.jp/documentation/appendices/config-directives/launchbackgroundtasks.html">LaunchBackGroundTasks</a> to mt-config.cgi, rebuild proccess works on background.
TEXT
}

1;
