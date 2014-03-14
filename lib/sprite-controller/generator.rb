require "compass"
require "rmagick"

module SpriteController

    module SpriteChild
        # PNGメタ情報からパースする場合も考慮しFile.basename(@spriteImgChildren.to_a[1].base_filename)という形でファイル名は取得しない
        attr_accessor :name

        # スプライト画像中でのbackground-position
        attr_accessor :backgroundPos_x
        attr_accessor :backgroundPos_y
    end

    module Sprite
        # スプライト画像を構成する画像のMagick::ImageList
        attr_accessor :imgList

        def getPositionXByIndex()
        end

        def getPositionYByIndex()
        end

        # スプライト画像を保存
        def saveSprite
            self['comment'] = 'test'
            self.write("./images/sample-1.png")
        end

    end

end

module SpriteController

    attr_accessor :debug
    attr_accessor :manager

    class SpriteManager
        attr_accessor :name
        attr_accessor :spriteImg
        attr_accessor :spriteImgChildren

        def initialize(glob)
            readImgs(glob)

            # スプライト画像を作成
            @spriteImg = @spriteImgChildren.append(true).extend(SpriteController::Sprite)
            @spriteImg = composeSprite.extend(SpriteController::Sprite)

            @spriteImgChildren.to_a.each{|img|
                #img.extend(SpriteController::SpriteChild)
                p img.backgroundPos_y
            }

            @spriteImg.saveSprite
        end

        def background_pos
            @spriteImgChildren.to_a[1].backgroundPos_y
        end


        def readImgs(glob)
            # 画像へのパスはコマンドを実行した場所からの相対パス
            @spriteImgChildren = Magick::ImageList.new

            path, name = Compass::SpriteImporter::path_and_name(glob.value)
            files = Compass::SpriteImporter::files(glob.value)

            files.each{|f|
                # ファイル名からMagick::Imageクラスのインスタンスを作成し、SpriteChildのメソッドを特異メソッド化
                @spriteImgChildren.read(f).to_a.each{|img|
                    img.extend(SpriteController::SpriteChild)
                    img.name = File.basename(img.base_filename)
                }
            }

            @spriteImgChildren
        end

        def composeSprite
            pos_y = 0
            pos_x = 0
            @spriteImgChildren.backgroundPos_y = pos_y

            @spriteImgChildren.to_a.each{ |img|
                pos_y += img.columns

                img.backgroundPos_y = pos_y
                img.backgroundPos_x = 0
            }

            @spriteImgChildren.append(true)
        end

    end

    def init(glob, debug)
        @debug = debug
        if @debug
            @manager = SpriteManager.new(glob)
        else
            p "debug : false"
        end
    end

    def background_pos
        if @debug && !@manager.nil?
            @manager.background_pos
        else
            p "debug : false"
        end
    end

    module_function :init
    module_function :background_pos

end



