
require "rmagick"

class Sprite

    attr_accessor :spriteImg
    attr_accessor :imgArray
    attr_accessor :imgList
    attr_accessor :spriteWidth, :spriteHeight

    def initialize()
        # 画像へのパスはコマンドを実行した場所からの相対パス
        @imgList = Magick::ImageList.new("./images/assets/icons/icon-1.png", "./images/assets/icons/icon-2.png", "./images/assets/icons/icon-3.png", "./images/assets/icons/icon-4.png", "./images/assets/icons/icon-5.png")

        # Arrayに変換
        @imgArray = imgList.to_a

        # Arrayの長さとクラス名を取得
        p @imgArray.length
        p @imgArray[1].class

        @imgSprite = imgList.append(true)
        @imgSprite['comment'] = ''

        p @imgSprite.format
        @imgSprite.write("./images/sprite.png")

        p @imgList.format

        getPositionXByIndex
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

module SpriteController

end
