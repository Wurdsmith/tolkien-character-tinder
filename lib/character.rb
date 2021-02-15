class Character
    @@all = []
    #Standard initaliziation of our character array to return dynamic keys and values to the CLI.
    def initialize (hash)
        hash.each {|key, value|
            self.class.attr_accessor(key)
            self.send(("#{key}="), value)
        }
        @@all << self
    end

    def self.find_by_race(input_1, input_2, input_3)
        requested_characters = []
        @@all.each do |character|
            if character.race == input_1
                requested_characters << character
            elsif character.race == input_2
                requested_characters << character
            elsif character.race == input_3
                requested_characters << character
            end
            
        end
        requested_characters.shuffle
    end

    ## LIVE CODING : AFTER ALL CHARACTERS HAVE BEEN CREATED STORED INSIDE OF @@ALL NOT HASHES.
    ## CREATE A METHOD THAT FINDS A CHARACTER BY THEIR RACE.

    # MAIN THEME IS OOD.
end



    