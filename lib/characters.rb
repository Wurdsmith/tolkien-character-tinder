class Characters
    
    attr_accessor :name, :race, :gender, :hair_color, :birthday, :height, :realm
   
    def initialize (character_array)
        binding.pry
        @name = character_array["name"]
        @race = character_array["race"]
        @hair_color = character_array["hair"]
        @bday =  charater_array["birth"]
        @height = character_array["height"]
        @realm = character_array ["realm"]
        
    end
    
end


    