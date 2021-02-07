require 'httparty'
require 'pry'
class Lotr_api

#Setting class variables equal to a list of quotes and characters. The character list contains every character in the Tolkien-verse, and needs to be cut down 
#so that it only includes characters with quotes in the final cli app.
@@character_hash = HTTParty.get('https://the-one-api.dev/v2/character', headers: {"Authorization" => "Bearer Bw68B-g1vre-EFiDydiG"})
@@quote_hash = HTTParty.get('https://the-one-api.dev/v2/quote', headers: {"Authorization" => "Bearer Bw68B-g1vre-EFiDydiG"})

binding.pry
#Creates a list of character IDs from a very large list of movie quotes. Repeated character IDs will not be included because we will be building our character list 
#with these values.
def self.unique_characters_with_quotes
  quote_array = [] 
  @@quote_hash.each do |key, value|
    if value.class != Integer
    value.collect do |quote| 
       quote_array <<  quote["character"] unless quote_array.include? quote["character"]
      end
    end
  end
  quote_array
end

#Builds a list of characters based on the character IDs returned by the unique_characters_with_quotes stats, which match up with each character hash in the character_hash class variable.
#This eliminates a large percentage of characters without any attributes or quotes, increasing the functionality of our app.
def self.character_list_with_stats
  character_array =[]
  @@character_hash.each do |key, value|
    if value.class != Integer
    value.each do |character_stats|
      if self.unique_characters_with_quotes.include? character_stats["_id"]
          character_array << character_stats
        end
      end
    end
  end
  character_array
end

  #Creates a custom list of potential matches (characters and attributes) based on the user's fictional race preferences.
  def self.get_characters_by_race(input_1, input_2, input_3)
    arr =[]
    arr += [input_1, input_2, input_3]
    requested_characters = []
    character_list = self.character_list_with_stats
    character_list.each do |character|
      if character["race"] == input_1
        requested_characters << character
      elsif character["race"] == input_2
        requested_characters << character
      elsif character["race"] == input_3
        requested_characters << character
      end
    end
    chr_obj_arr = []
    requested_characters.each do |character|
      chr_obj_arr << Character.new(character)
    end
      chr_obj_arr.shuffle #shuffles the returned characters for variety when a user goes uses the app more than once.
  end

  #Requests a random movie quote based on the character that the user chooses to 'swipe right' and start a conversation with.
  def self.quote_getter(character_id)
    quote_obj_array = []
    @@quote_hash.each do |key, value|
      if value.class != Integer
        value.each do |quote|
          if quote["character"] == character_id
            quote["character"].chomp(",")
            quote_obj_array << quote["dialog"].split.join(" ") #The quotes provided through the API often have some grammatical issues, including a tendency to have large sections of whitespace. This addresses that (to some extent).
            quote_obj_array
          end
        end
      end
    end
    quote_obj_array.sample
  end

end