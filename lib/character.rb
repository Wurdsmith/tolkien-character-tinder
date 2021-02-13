class Character
    @@all = []
    #Standard initaliziation of our character array to return dynamic keys and values to the CLI.
    def initialize (hash)
        hash.each {|key, value|
            self.class.attr_accessor(key)
            self.send(("#{key}="), value)
        }
    end

    ## LIVE CODING : AFTER ALL CHARACTERS HAVE BEEN CREASTED STORED INSIDE OF @@ALL NOT HASHES
    ## CREATE A METHOD THAT FINDS A CHARACTER BY THERE

    # MAIN THEME IS OOD 
end



    