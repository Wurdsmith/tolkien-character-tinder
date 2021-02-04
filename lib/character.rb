class Character
    
    attr_accessor :name, :race, :gender, :hair_color, :birthday, :height, :realm
   
    #Standard initaliziation of our character array to return dynamic keys and values to the CLI.
    def initialize (hash)
        hash.each {|key, value|
            self.class.attr_accessor(key)
            self.send(("#{key}="), value)
        }
    end

end



    