class Tinder_cli
    
    #A standard welcome message.
    def welcome
        puts ""
        puts "Thank you for signing up for Tolkien Tinder!".colorize(:green).bold.underline
        puts ""
        puts "From the Shire to Gondor, there are many fine matches to be had in Middle Earth. Find your fictional soulmate and strike up a conversation with them today!".colorize(:green)
        puts "**Please note that Tolkien Tinder does not take responsibility for the actions of beliefs of its users, especially those who subscribe to the way of Sauron.**".colorize(:green).italic
        self.race_preference_prompt
    end

    #Prompts the user to select three preferred, fictional races to filter their matches into a smaller, customized list.
    def race_preference_prompt
        puts ""
        puts "Please input the three fictional races that most interest you.".colorize(:green)
        puts ""
        puts "Your choices: Human, Elf, Hobbit, Dwarf, Orc, Maiar, Ent".colorize(:blue)
        puts ""
        puts "Please input your first race.".colorize(:blue)
        puts ""
        input_1 = input_validator("first")
        puts ""
        puts "Please input your second race.".colorize(:blue)
        puts ""
        input_2 = input_validator("second")
        puts ""
        puts "Please input your third race.".colorize(:blue)
        puts ""
        input_3 = input_validator("third")
        character_preferences = Lotr_api.get_characters_by_race(input_1, input_2, input_3)
        puts ""
        puts "You have #{character_preferences.length} potential matches to choose from. Happy hunting!".colorize(:green)
        puts ""
        sleep 2
        self.character_viewer(character_preferences)
    end

    #validates the user's input to match the case-sensitive keys from the API
    def input_validator(number)
        input = gets.strip 
        while input != "Human" && input != "Elf" && input != "Hobbit" && input != "Dwarf" && input != "Orc" && input != "Maiar" && input != "Ent"
            self.input_error_message(number)
            input = gets.strip
        end
        input
    end


    #An error message that will be returned if the user enters the wrong input.
    def input_error_message(number)
        puts ""
        puts "**Error** - Please enter a valid race. Your choices are: Human, Elf, Hobbit, Dwarf, Orc, Maiar, or Ent.".colorize(:red)
        puts "Please note that these values are case sensitive!".colorize(:red).bold
        puts "You may repeat races, but be aware that this will significantly limit your pool of potential matches.".colorize(:red)
        puts ""
        puts "Please input your #{number} race.".colorize(:blue)
        puts ""
    end

    #Validates user's input for the 'swipe right' and 'swipe left' frunctionality.
    def swipe_validator
        input = gets.strip
        while input != "swipe right" && input != "Swipe right" && input != "swipe left" && input != "Swipe left"
            self.swipe_error_message(input)
            input = gets.strip
        end
        input
    end

    #An error message that will be returned if the user enters the wrong input.
    def swipe_error_message(input)
        puts ""
        puts "Invalid input. Please type 'swipe right' to match and begin a conversation, or type 'swipe left' to see your next potential match.".colorize(:red)
        puts ""
        input
    end

    #Takes in an array of characters based on the user's fictional race preferences and allows them to view more information about a particular character, and to start a conversation, if desired.
    #If a characters decides to 'match' and start a conversation, this method will call on the quote getter method in the API class to pull a random movie quote from their matched character.
    #It should be noted that due to the nature of the API, there are many typos in said movie quotes, and not every character has assigned values for certain characteristics.
    def character_viewer(character_preferences)
        count = 0
        while count < character_preferences.length
            puts ""
            puts "Your next potential match is: #{character_preferences [count].name}. Would you like to know more about them?".colorize(:green)
            puts ""
            puts "Type 'yes' to learn more, or type 'no' see your next potential match!".colorize(:blue)
            puts ""
            puts ""
            input = gets.strip
                if input == "yes" || input == "Yes"
                    puts ""
                    puts "#{character_preferences[count].name}".colorize(:yellow)
                    puts "Race = #{character_preferences[count].race}".colorize(:yellow)
                    puts "Gender = #{character_preferences[count].gender}".colorize(:yellow)
                    puts "Birthday = #{character_preferences[count].birth}".colorize(:yellow)
                    puts "Realm = #{character_preferences[count].realm}".colorize(:yellow)
                    puts "Height = #{character_preferences[count].height}".colorize(:yellow)
                    puts "Hair color = #{character_preferences[count].hair}".colorize(:yellow)
                    puts ""
                    puts "Type 'swipe right' to match and to start a conversation. Otherwise, type 'swipe left' to see your next potential match!".colorize(:blue)
                    puts ""
                    input = self.swipe_validator
                        if input == "swipe right" || input == "Swipe right"
                            quote = Lotr_api.quote_getter(character_preferences[count]._id)
                                puts ""
                                puts "You succesfully matched with #{character_preferences [count].name}. Beginning conversation...".colorize(:green)
                                puts ""
                                puts "#{character_preferences [count].name} says: #{quote}".colorize(:magenta)
                                puts ""
                                sleep 3
                                count += 1
                        elsif input =="swipe left" || input == "Swipe right"
                            count += 1
                        else 

                        end
                elsif input ==  "no" || input == "No"
                    count += 1
                else
                    puts ""
                    puts "Invalid input. Please enter either 'yes' or 'no' to continue.".colorize(:red)
                end
        end
        puts ""
        puts "Thank you for using Tolkien Tinder!".colorize(:green)
        puts ""
        puts "Would you like to look for love in Middle Earth again?".colorize(:green)
        puts ""
        puts "Type 'yes' to restart Tolkien Tinder, otherwise type 'no' to exit the program.".colorize(:blue)
        puts ""

        #Allows the character to restart the program, if desired. Otherwise, ends the program.
            loop do
                input = gets.strip
                if input == "yes" || input == "Yes"
                Tinder_cli.new.welcome
                elsif input ==  "no" || input == "No"
                    puts""
                    puts "Farewell!".colorize(:green)
                    break
                else
                    puts ""
                    puts "Invalid input. Type 'yes' to restart Tolkien Tinder, otherwise type 'no' to exit the program.".colorize(:red)
                end
            end
        
    end
    
end





