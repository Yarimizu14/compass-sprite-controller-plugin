
require "./lib/sprite-controller/generator"

module Sass::Script::Functions

    def sprite_control()
        Sprite.new()

        Sass::Script::String.new("sprite-controller")
    end
    declare :escape, :args => [:string]

end

