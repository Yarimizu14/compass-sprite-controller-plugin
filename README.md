
# Compass-sprite-control-plugin

# Usage

```sass
@include sprite-controll($map, )
```

```sass
$sprite-map-ext($glob, $debug)

sprite-map-name-ext($map)
: returns sprite-name

* sprite-ext($map, $map-item)
: returns sprite url and sprite-item background position
sprite-url-ext($map)
: returns sprite relative path
sprite-url-file-ext($map, $map-item)
: returns sprite relative path and sprite-item background position

sprite-position-ext
: returns sprite background position
```

TODO

* sprite-map-extの$debugがtrueの場合、新しいスプライト画像を出力する
* sprite-map-ext以外の関数は、スプライト画像のメタ情報から情報を読み、ない場合はエラーを返す。

