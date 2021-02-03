class Tinder_cli

    def welcome
        puts "Thank you for signing up for Tolkien Tinder!" 
        puts "There are many fine matches to be had in Middle Earth."
        self.race_preference_prompt
    end

    def race_preference_promt
        puts "Please select input the three fictional races that most interest you."
        puts "Your choices: Human, Elf, Hobbit, Dwarf, Orc, Wizard"
        puts "Be sure to separate your choices with a comma! *Example: Human, Hobbit, Elf."
        puts "Happy hunting!"
        input = gets.strip
    end
end




