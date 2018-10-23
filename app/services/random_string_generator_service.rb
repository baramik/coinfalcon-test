class RandomStringGeneratorService
    def initialize(string_length = 32, ambiguous = false)
      @string_length = string_length
      @ambiguous = ambiguous
    end

    def call
      ambiguous_chars.each{ |char| characters.delete(char) } unless ambiguous

      (0...string_length).map{ characters[SecureRandom.random_number(characters.size)]}.join
    end 

    private

    attr_reader :string_length, 
                :ambiguous

    def characters
      @_characters ||= ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
    end 

    def ambiguous_chars
      @_ambiguous_chars ||= %w{I O l 0 1}
    end
end 