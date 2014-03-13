require "compass"
require "rmagick"


module SpriteController

    attr_accessor :spriteImg
    attr_accessor :spriteImgChildren

    def createSprite
        tmpImgList = readImgs

        # Mgick::ImageクラスのArrayに変換
        @spriteImgChildren = tmpImgList.to_a

        # スプライト画像を作成
        @spriteImg = tmpImgList.append(true)

=begin
        # Arrayの長さとクラス名を取得
        p @spriteImgChildren.length
        p @spriteImgChildren[1].class
=end

=begin
        @imgSprite = imgList.append(true)
        @imgSprite['comment'] = ''

        p @imgSprite.format
        @imgSprite.write("./images/sprite.png")

        p @imgList.format

        getPositionXByIndex

        @imgArray = Compass::SpriteImporter::find_all_sprite_map_files("assets/icons/*.png")
        #@imgArray = Compass::SpriteImporter::find_all_sprite_map_files("assets/icons/*.png")
=end
    end

    def readImgs
        p "test"
        # 画像へのパスはコマンドを実行した場所からの相対パス
        imgList = Magick::ImageList.new

        path, name = Compass::SpriteImporter::path_and_name("assets/icons/*.png")
        files = Compass::SpriteImporter::files("assets/icons/*.png")

        files.each{|f|
            imgList.read f
        }

        imgList
    end

    module_function :createSprite
    module_function :readImgs

    class Img

        attr_accessor :path
        attr_accessor :width, :height

    end


    class SpriteChild < Img

        attr_accessor :bgPos

    end


    class Sprite < Img

        attr_accessor :spriteImg
        attr_accessor :imgArray
        attr_accessor :imgList
        attr_accessor :spriteWidth, :spriteHeight

        def initialize()

        end

        def getPositionXByIndex()
            sumX = 0
            sumY = 0

            @imgArray.each{|image|
                sumX += image.columns
                sumY += image.rows

                p sumX
                p sumY
            }
        end

        def getPositionYByIndex()
        end

        def createSrpite(path)
        end

        def saveSrpite(path)
        end

    end


end
