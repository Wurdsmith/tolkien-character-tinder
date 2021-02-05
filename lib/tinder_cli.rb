class Tinder_cli
    
    #A standard welcome message.
    def welcome
        puts ""
        puts "Thank you for signing up for Tolkien Tinder!" 
        puts "From the Shire to Gondor, there are many fine matches to be had in Middle Earth."
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
        input_1 = input_validator("first")
        puts ""
        puts "Please input your second race."
        puts ""
        input_2 = input_validator("second")
        puts ""
        puts "Please input your third race."
        puts ""
        input_3 = input_validator("third")
        character_preferences = Lotr_api.get_characters_by_race(input_1, input_2, input_3)
        puts ""
        puts "You have #{character_preferences.length} potential matches to choose from. Happy hunting!"
        puts ""
        sleep 2
        self.character_viewer(character_preferences)

    end

    def input_validator(number)
        input_1 = gets.strip 
        while input_1 != "Human" && input_1 != "Elf" && input_1 != "Hobbit" && input_1 != "Dwarf" && input_1 != "Orc" && input_1 != "Maiar" && input_1 != "Ent"
            self.input_error_message(number)
            input_1 = gets.strip
        end
        input_1
    end



    def input_error_message(number)
        puts ""
        puts "**Error** - Please enter a valid race. Your choices are: Human, Elf, Hobbit, Dwarf, Orc, Maiar, or Ent. These values are case sensitive!"
        puts "You may repeat races, but be aware that this will significantly limit your pool of potential matches."
        puts ""
        puts "Please input your #{number} race."
        puts ""
    end

    def swipe_validator
        input = gets.strip
        while input != "swipe right" && input != "Swipe right" && input != "swipe left" && input != "Swipe left"
            self.swipe_error_message(input)
            input = gets.strip
        end
        input
    end

    def swipe_error_message(input)
        puts ""
        puts "Invalid input. Please type 'swipe right' to match and begin a conversation, or type 'swipe left' to see your next potential match."
        puts ""
        input
    end

    #Takes in an array of characters based on the user's fictional race preferences and allows them to view more information about a particular character, and to start a conversation, if desired.
    def character_viewer(character_preferences)
        count = 0
        while count < character_preferences.length
            puts ""
            puts "Your next potential match is: #{character_preferences [count].name}. Would you like to know more?"
            puts ""
            puts "Type 'yes' to learn more, or type 'no' see your next potential match!"
            puts ""
            input = gets.strip
                if input == "yes" || input == "Yes"
                    puts ""
                    puts "#{character_preferences[count].name}"
                    puts "Race = #{character_preferences[count].race}"
                    puts "Gender = #{character_preferences[count].gender}"
                    puts "Birthday = #{character_preferences[count].birth}"
                    puts "Realm = #{character_preferences[count].realm}"
                    puts "Height = #{character_preferences[count].height}"
                    puts "Hair color = #{character_preferences[count].hair}"
                    puts ""
                    puts "Type 'swipe right' to match and to start a conversation. Otherwise, type 'swipe left' to see your next potential match!"
                    puts ""
                    input = self.swipe_validator
                        if input == "swipe right" || input == "Swipe right"
                            quote = Lotr_api.quote_getter(character_preferences[count]._id)
                                puts ""
                                puts "You succesfully matched with #{character_preferences [count].name}. Beginning conversation..."
                                puts ""
                                puts "#{character_preferences [count].name} says: #{quote}"
                                puts ""
                                sleep 4
                                count += 1
                        elsif input =="swipe left" || input == "Swipe right"
                            count += 1
                        else 

                        end
                elsif input ==  "no" || input == "No"
                    count += 1
                else
                    puts ""
                    puts "Invalid input. Please enter either 'yes' or 'no' to continue."
                end
            
        end
        puts ""
        puts "Thank you for using Tolkien Tinder! "
        puts""

    end
    
end





