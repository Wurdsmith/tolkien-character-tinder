class Tinder_cli
    
    #A standard welcome message.
    def welcome
        puts ""
        puts "Thank you for signing up for Tolkien Tinder!" 
        puts "There are many fine matches to be had in Middle Earth."
        self.race_preference_prompt
    end

    #Prompts the user to select three preferred, fictional races to filter their matches into a smaller, customized list.
    def race_preference_prompt
        puts "Please input the three fictional races that most interest you."
        puts ""
        puts "Your choices: Human, Elf, Hobbit, Dwarf, Orc, Maiar, Ent"
        puts ""
        puts "Please input your first race."
        puts ""
        input_1 = gets.strip 
            while input_1 != "Human" && input_1 != "Elf" && input_1 != "Hobbit" && input_1 != "Dwarf" && input_1 != "Orc" && input_1 != "Maiar" && input_1 != "Ent"
                puts ""
                puts "**Error** - Please enter a valid race. Your choices are: Human, Elf, Hobbit, Dwarf, Orc, Maiar, or Ent. These values are case sensitive!"
                puts "You may repeat races, but be aware that this will significantly limit your pool of potential matches."
                puts ""
                puts "Please input your first race."
                puts ""
                input_1 = gets.strip
            end
        puts ""
        puts "Please input your second race."
        puts ""
        input_2 = gets.strip 
            while input_2 != "Human" && input_2 != "Elf" && input_2 != "Hobbit" && input_2 != "Dwarf" && input_2 != "Orc" && input_2 != "Maiar" && input_2 != "Ent"
                    puts ""
                    puts "**Error** - Please enter a valid race. Your choices are: Human, Elf, Hobbit, Dwarf, Orc, Maiar, or Ent. These values are case sensitive!"
                    puts "You may repeat races, but be aware that this will significantly limit your pool of potential matches."
                    puts ""
                    puts "Please input your second race."
                    puts ""
                input_2 = gets.strip
            end
        puts ""
        puts "Please input your third race."
        puts ""
        input_3 = gets.strip 
            while input_3 != "Human" && input_3 != "Elf" && input_3 != "Hobbit" && input_3 != "Dwarf" && input_3 != "Orc" && input_3 != "Maiar" && input_3 != "Ent"
                    puts ""
                    puts "**Error** - Please enter a valid race. Your choices are: Human, Elf, Hobbit, Dwarf, Orc, Maiar, or Ent. These values are case sensitive!"
                    puts "You may repeat races, but be aware that this will significantly limit your pool of potential matches."
                    puts ""
                    puts "Please input your third race."
                    puts ""
                input_3 = gets.strip
            end
        character_preferences = Lotr_api.get_characters_by_race(input_1, input_2, input_3)
        puts ""
        puts "You have #{character_preferences.length} potential matches to choose from. Happy hunting!"
        puts ""
        sleep 2
        self.character_viewer(character_preferences)

    end

    #Takes in an array of characters based on the user's fictional race preferences and allows them to view more information about a particular character, and to start a conversation, if desired.
    def character_viewer(character_preferences)
        count = 0
        while count < character_preferences.length
            puts ""
            puts "Your potential match is: #{character_preferences [count].name}. Would you like to know more?"
            puts "Type 'yes' to learn more, or type 'no' see your next potential match!"
            puts ""
            input = gets.strip
                if input == "yes"
                    puts ""
                    puts "#{character_preferences[count].name}"
                    puts "Race = #{character_preferences[count].race}"
                    puts "Gender = #{character_preferences[count].gender}"
                    puts "Birthday = #{character_preferences[count].birth}"
                    puts "Realm = #{character_preferences[count].realm}"
                    puts "Height = #{character_preferences[count].height}"
                    puts "Hair color = #{character_preferences[count].hair}"
                    puts "Type 'swipe right' to start a conversation, otherwise, type 'swipe left' to see your next match!"
                    puts ""
                    input = gets.strip
                        if input == "swipe right"
                            quote = Lotr_api.quote_getter(character_preferences[count]._id)
                                puts ""
                                puts "#{character_preferences [count].name} says: #{quote}"
                                puts ""
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





