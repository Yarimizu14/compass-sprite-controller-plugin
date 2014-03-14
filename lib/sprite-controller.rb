
require "./lib/sprite-controller/generator"

module Sass::Script::Functions

    # sprte-map-ext
    # : create sprite image if debug is true
    def sprite_map_ext(map, debug, *args)
        SpriteController.createSprite

        Sass::Script::String.new("sprite-controller")
    end

    def sprite_control(map)
        #SpriteController::Sprite.new()

        Sass::Script::String.new("sprite-controller")
    end

    def sprite_position_ext_y(map, name)
        p name.class
        p map
        SpriteController.background_pos

        Sass::Script::String.new(SpriteController.background_pos.to_s)
    end


    #declare :escape, :args => [:string]

end

