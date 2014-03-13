require "compass"
require "rmagick"


module SpriteController

    module SpriteChild

        attr_accessor :bgPos

        def self.test
            puts "child"
        end

        #module_function :test
    end

end

# 既存クラスの拡張
module Magick
    class Image

        def test
            puts "hoge"
        end

    end
end

module SpriteController

    attr_accessor :spriteImg
    attr_accessor :spriteImgChildren

    #Magick::Image.extend(SpriteChild)

    def createSprite
        tmpImgList = readImgs
=begin
        # Mgick::ImageクラスのArrayに変換
        @spriteImgChildren = tmpImgList.to_a

        # スプライト画像を作成
        @spriteImg = tmpImgList.append(true)

        saveSprite
=end

=begin
        # Arrayの長さとクラス名を取得
        p @spriteImgChildren.length
        p @spriteImgChildren[1].class

        p @spriteImg.format
        Compass::SpriteImporter::find_all_sprite_map_files("assets/icons/*.png")
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

        imgList.to_a.each{|f|
            p f.class
            f.test
            #p f.bgPos
            #f.bgPos = "hoge"
        }

        imgList
    end


    # スプライト画像を保存
    def saveSprite
        @spriteImg['comment'] = 'test'
        @spriteImg.write("./images/sprite.png")
    end

    module_function :createSprite
    module_function :readImgs
    module_function :saveSprite


    # 上となにが違う
=begin
    class SpriteChild < Magick::Image

        attr_accessor :bgPos

    end
=end

    class Sprite < Magick::Image

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
