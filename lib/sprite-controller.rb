
require "./lib/sprite-controller/generator"

module Sass::Script::Functions

    # sprte-map-ext
    # : create sprite image if debug is true
    def sprite_map_ext(map, debug)
        SpriteController.createSprite

        Sass::Script::String.new("sprite-controller")
    end

    def sprite_control(map)
        #SpriteController::Sprite.new()

        Sass::Script::String.new("sprite-controller")
    end
    #declare :escape, :args => [:string]

end

