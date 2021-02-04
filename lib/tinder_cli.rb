class Tinder_cli
    #Our standard welcome message.
    def welcome
        puts "Thank you for signing up for Tolkien Tinder!" 
        puts "There are many fine matches to be had in Middle Earth."
        self.race_preference_prompt
    end

    #Prompts the user to select three preferred, fictional races to filter their matches into a smaller, customized list.
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
        count = 0
        while count < character_preferences.length
            puts "Your next potential match is: #{character_preferences [count].name}. Would you like to know more?"
            puts "Type 'yes' to learn more, or type 'no' see your next potential match!"
            input = gets.strip
                if input == "yes"
                    puts "#{character_preferences [count].name}"
                    puts "Race = #{character_preferences [count].race}"
                    puts "Gender = #{character_preferences [count].gender}"
                    puts "Realm = #{character_preferences [count].realm}"
                    puts "Height = #{character_preferences [count].height}"
                    puts "Hair color = #{character_preferences [count].hair}"
                    puts "Type 'swipe right' to start a conversation, otherwise, type 'swipe left' to see your next match!"
                    input = gets.strip
                        if input == "swipe right"
                            Lotr_api.quote_getter(character_preferences[count]._id)
                            count += 1
                        elsif input =="swipe left"
                            count += 1
                        end
                elsif input == "no"
                    count += 1
                end
        end
    end

end





