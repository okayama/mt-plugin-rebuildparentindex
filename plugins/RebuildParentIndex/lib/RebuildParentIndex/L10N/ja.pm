package RebuildParentIndex::L10N::ja;
use strict;
use base 'RebuildParentIndex::L10N';
use vars qw( %Lexicon );

our %Lexicon = (
    '_PLUGIN_DESCRIPTION' => &_plugin_description,
    'only publish status' => '公開状態の場合のみ親ウェブサイトの再構築を行う',
);

sub _plugin_description {
    return<<'TEXT';
ブログ記事またはウェブページが保存された際に、親ウェブサイトのインデックステンプレートを再構築します。mt-config.cgi に環境変数 <a href="http://www.movabletype.jp/documentation/appendices/config-directives/launchbackgroundtasks.html">LaunchBackGroundTasks</a> を設定しておけば再構築をバックグラウンドで行わせることができます。
TEXT
}

1;
