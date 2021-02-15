class Lotr_api

#Setting class variables equal to a list of quotes and characters. The character list contains every character in the Tolkien unverse, and needs to be cut down so that it only includes characters with quotes in the final CLI app.
@@character_hash = HTTParty.get('https://the-one-api.dev/v2/character', headers: {"Authorization" => "Bearer Bw68B-g1vre-EFiDydiG"})
@@quote_hash = HTTParty.get('https://the-one-api.dev/v2/quote', headers: {"Authorization" => "Bearer Bw68B-g1vre-EFiDydiG"})

#Creates a list of character IDs from a very large list of movie quotes. Repeated character IDs will not be included because we will be building our character list with these values.
def self.unique_characters_with_quotes
  quote_array = [] 
  @@quote_hash.each do |key, value|
    if value.class != Integer
    value.each do |quote| 
       quote_array <<  quote["character"] unless quote_array.include? quote["character"] # This value matches to the "_id" value in the character hash.
      end
    end
  end
  quote_array
end

#Builds a list of characters based on the character IDs returned by the unique_characters_with_quotes method, which match up with each character hash in the @@character_hash class variable.
#This eliminates a large percentage of characters without any attributes or quotes, increasing the functionality of the app.
def self.character_list_with_stats
  character_array =[]
  @@character_hash.each do |key, value|
    if value.class != Integer
    value.each do |character_stats| #Character_stats is a hash containing keys that point to character attributes.
      if self.unique_characters_with_quotes.include? character_stats["_id"]
          character_array << character_stats
            character_array.each do |character_stats|
              character_stats.each do |key, attribute| #This sets the character's attributes to 'not provided' if the API (or Tolkien himself) didn't supply a value.
                if attribute == ""
                  character_stats[key] = "Not provided"
                end
              end
            end
        end
      end
    end
  end
  character_array
end

  #Creates a custom list of potential matches (characters and attributes) based on the user's fictional race preferences.
  def self.get_characters
    character_list = self.character_list_with_stats #This ensures that only races with quotes are returned by calling on the character_list_with_stats method.
    character_list.each do |character|
    Character.new(character)
    end
  end

  #Requests a random movie quote based on the character that the user chooses to 'swipe right' and start a conversation with.
  def self.quote_getter(character_id)
    quote_obj_array = []
    @@quote_hash.each do |key, value|
      if value.class != Integer
        value.each do |quote|
          if quote["character"] == character_id
            quote["character"].chomp(",")
            quote_obj_array << quote["dialog"].split.join(" ") #The quotes provided through the API often have some grammatical issues, these methods (somewhat) improve the readability of these quotes.
            quote_obj_array
          end
        end
      end
    end
    quote_obj_array.sample #This will return a random quote that matches the character ID sent from the CLI.
  end

end