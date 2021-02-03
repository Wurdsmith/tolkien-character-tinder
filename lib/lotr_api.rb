require 'httparty'
require 'pry'
class Lotr_api

#Setting class variables equal to a list of quotes and characters, each of which needs to be cut down so that I can only include characters with quotes in the final cli app.
@@character_hash = HTTParty.get('https://the-one-api.dev/v2/character', headers: {"Authorization" => "Bearer Bw68B-g1vre-EFiDydiG"})
@@quote_hash = HTTParty.get('https://the-one-api.dev/v2/quote', headers: {"Authorization" => "Bearer Bw68B-g1vre-EFiDydiG"})
@@unique_characters_with_quotes = []
@@character_list_with_stats = []

#Creates a list of unique character IDs from a very large list of movie quotes. Repeated character IDs will not be included because we will be building our character list with these values.
@@quote_hash.each do |key, value|
    if value.class != Integer
    value.collect do |quote| 
       @@unique_characters_with_quotes << quote["character"] unless @@unique_characters_with_quotes.include? quote["character"]
      end
    end
  end

@@character_hash.each do |key, value|
  if value.class != Integer
    value.each do |character_stats|
      if @@unique_characters_with_quotes.include? character_stats["_id"]
          @@character_list_with_stats << character_stats
        end
      end
    end
  end

  def self.get_characters_by_race(input_1, input_2, input_3)
    arr =[]
    arr += [input_1, input_2, input_3]
    requested_characters = []
    character_list = @@character_list_with_stats
    character_list.each do |character|
      if character["race"] == input_1
        requested_characters << character
      elsif character["race"] == input_2
        requested_characters << character
      elsif character["race"] == input_3
        requested_characters << character
      end
    end
    binding.pry
  end
end
