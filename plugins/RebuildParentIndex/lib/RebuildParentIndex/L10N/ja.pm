package RebuildParentIndex::L10N::ja;
use strict;
use base 'RebuildParentIndex::L10N';
use vars qw( %Lexicon );

our %Lexicon = (
    '_PLUGIN_DESCRIPTION' => &_plugin_description,
);

sub _plugin_description {
    return<<'TEXT';
ブログ記事またはウェブページが保存された際に、親ウェブサイト(保存が行われたのがウェブサイトの場合は自分自身)のインデックステンプレートを再構築します。mt-config.cgi に環境変数 <a href="http://www.movabletype.jp/documentation/appendices/config-directives/launchbackgroundtasks.html">LaunchBackGroundTasks</a> を設定しておけば再構築をバックグラウンドで行わせることができるので、見た目上の負荷は変わりません。<br />
TEXT
}

1;
