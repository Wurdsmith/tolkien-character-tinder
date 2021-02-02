require 'httparty'
require 'pry'
class Lotr_api
    
#@@character_hash = HTTParty.get('https://the-one-api.dev/v2/character', headers: {"Authorization" => "Bearer Bw68B-g1vre-EFiDydiG"})
@@query = HTTParty.get('https://the-one-api.dev/v2/character/5cd99d4bde30eff6ebccfe9e/quote', headers: {"Authorization" => "Bearer Bw68B-g1vre-EFiDydiG"})







unique_characters_with_quotes = []

@@query.find do |key, value|
    value.collect do |quote| 
        binding.pry
        if quote["character"] == String
       unique_characters_with_quotes << quote["character"]
     end
    end
end

end
