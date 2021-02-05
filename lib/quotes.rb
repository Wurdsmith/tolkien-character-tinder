class Quotes

    #Standard initaliziation of our quote array to return dynamic keys and values to the CLI.
    def initialize (hash)
        hash.each {|key, value|
            self.class.attr_accessor(key)
            self.send(("#{key}="), value)
        }
    end
end