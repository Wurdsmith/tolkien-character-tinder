class Character
    
    attr_accessor :name, :race, :gender, :hair_color, :birthday, :height, :realm
   
    # def initialize (character_array)
    #     self.character_getter(character_array)
    # end
    
    def initialize (hash)
        hash.each {|key, value|
            self.class.attr_accessor(key)
            self.send(("#{key}="), value)
        }
    end

    def character_getter(character_array)
        character_array.each do |character|
            return character
        end
    end
end



    