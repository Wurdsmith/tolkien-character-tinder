class Tinder_cli

    def welcome
        puts "Thank you for signing up for Tolkien Tinder!" 
        puts "There are many fine matches to be had in Middle Earth."
        self.race_preference_prompt
    end

    def race_preference_prompt
        puts "Please input the three fictional races that most interest you."
        puts "Your choices: Human, Elf, Hobbit, Dwarf, Orc, Maia, Ent"
        puts "Happy hunting!"
        input_1 = gets.strip
        input_2 = gets.strip
        input_3 = gets.strip
        character_preferences = Lotr_api.get_characters_by_race(input_1, input_2, input_3)
        self.character_viewer(character_preferences)
    end

    def character_viewer(character_preferences)
        # bring selected characters array by invoking get_characters_by_race method(array of characters hashes)
        count = 0
        index = 0
        while count < character_preferences.length
            puts "Your next potential match is: #{character_preferences [index].name}. Would you like to know more?"
            puts "Type 'yes' to learn more, or type 'no' see your next potential match!"
            input = gets.strip
                if input == "yes"
                    puts "#{character_preferences [index].name}"
                    puts "Race = #{character_preferences [index].race}"
                    puts "Gender = #{character_preferences [index].gender}"
                    puts "Realm = #{character_preferences [index].realm}"
                    puts "Height = #{character_preferences [index].height}"
                    puts "Hair color = #{character_preferences [index].hair}"

                elsif input == "no"
                    count += 1
                    index += 1
                end
        end
    end

end





