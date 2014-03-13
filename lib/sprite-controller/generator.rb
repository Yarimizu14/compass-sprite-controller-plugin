require "compass"
require "rmagick"

module SpriteController

    module SpriteChild
        # スプライト画像中でのbackground-position
        attr_accessor :backgroundPos
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
            self.write("./images/sprite.png")
        end

    end

end

module SpriteController

    attr_accessor :spriteImg
    attr_accessor :spriteImgChildren

    def createSprite
        readImgs

        # スプライト画像を作成
        @spriteImg = @spriteImgChildren.append(true).extend(SpriteController::Sprite)

        @spriteImg.saveSprite
    end

    def readImgs
        # 画像へのパスはコマンドを実行した場所からの相対パス
        @spriteImgChildren = Magick::ImageList.new

        path, name = Compass::SpriteImporter::path_and_name("assets/icons/*.png")
        files = Compass::SpriteImporter::files("assets/icons/*.png")

        files.each{|f|
            # ファイル名からMagick::Imageクラスのインスタンスを作成し、SpriteChildのメソッドを特異メソッド化
            @spriteImgChildren.read(f).extend(SpriteController::SpriteChild)
        }

        @spriteImgChildren
    end

    module_function :createSprite
    module_function :readImgs

end



