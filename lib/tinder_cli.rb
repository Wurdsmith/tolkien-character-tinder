class Tinder_cli

    def welcome
        puts "Thank you for signing up for Tolkien Tinder!" 
        puts "There are many fine matches to be had in Middle Earth."
        self.race_preference_prompt
    end

    def race_preference_prompt
        puts "Please input the three fictional races that most interest you."
        puts "Your choices: Human, Elf, Hobbit, Dwarf, Orc, Wizard, Ent"
        puts "Happy hunting!"
        input_1 = gets.strip
        input_2 = gets.strip
        input_3 = gets.strip

        Lotr_api.get_characters_by_race(input_1, input_2, input_3)
    end
end




