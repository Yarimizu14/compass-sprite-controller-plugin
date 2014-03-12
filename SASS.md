
# SASSコマンドの実行のされ方
/sass/bin以下にsass,scss,sass-convertコマンドがあり、そこから実行される

# sass/bin/sass
** Line5-6: SASSの実行ファイル内で以下のコマンドが実行される **
require File.dirname(THIS_FILE) + '/../lib/sass'
require 'sass/exec'

** Line190-489: Genericを継承するSASSクラスを作成
ARGVにはコマンドの後に指定した引数が格納されている

** Line8-9: SASSの実行ファイル内で以下のコマンドが実行される **
# インスタンスOPTSを作成し、parse!メソッドを実行する？
opts = Sass::Exec::Sass.new(ARGV)
opts.parse!

# sass/lib/exec.rb
** Line190-489: Genericを継承するSASSクラスを作成
class Sass < Generic
