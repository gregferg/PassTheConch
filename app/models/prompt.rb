# == Schema Information
#
# Table name: prompts
#
#  id             :integer          not null, primary key
#  word           :string           not null
#  part_of_speech :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Prompt < ActiveRecord::Base
  validates :word, presence: true, uniqueness: true
  validates :part_of_speech, presence: true, inclusion: {in: ['occupation', 'noun', 'adjective', 'event']}

  def is_vowel(let)
    ["a", "e", "i", "o", "u"].include?(let)
  end

  def random_prompt(all_words)
    # Put words into a hash, where keys are part of speech. Single O(n) operation allows for constant random sampling.
    words_hash = Hash.new([])
    all_words.each do |word|
      words_hash[part_of_speech] << word
    end

    # Generate prompt
    prompt = "Your story begins with "

    part1 = words_hash['adjective'].sample + words_hash['occupation'].sample
    part1 = is_vowel(part1[0]) ? "an" + part1 : "a" + part1

    part2 = words_hash['noun'].sample
    part2 = is_vowel(part2[0]) ? "an" + part2 : "a" + part2

    partfinal = words_hash['adjective'].sample + words_hash['event'].sample
    partfinal = is_vowel(part2[0]) ? "an" + part2 : "a" + part2

    if rand > 0.5
      prompt += (part1 + "," + part2 + "," + partfinal)
    else
      prompt += (part2 + "," + part1 + "," + partfinal)
    end
    prompt
  end
end
