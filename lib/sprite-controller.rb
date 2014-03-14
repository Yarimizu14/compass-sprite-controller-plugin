
require "./lib/sprite-controller/generator"

module Sass::Script::Functions

    # sprte-map-ext
    # : create sprite image if debug is true
    def sprite_map_ext(glob, debug, *args)
        SpriteController::init(glob, debug.value)

        Sass::Script::String.new("sprite-controller")
    end

    def sprite_position_ext(map, name)
        Sass::Script::String.new(SpriteController.background_pos.to_s)
    end
    #declare :escape, :args => [:string]

end

