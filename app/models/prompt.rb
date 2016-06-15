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

  def random_prompt(all_words)
    words_hash = Hash.new([])
    all_words.each do |word|
      words_hash[part_of_speech] << word
    end

    prompt = "Your story begins with "
    part1 = words_hash['occupation'].sample + words_hash['adjective'].sample
    part2 = words_hash['noun'].sample
    partfinal = words_hash['adjective'].sample + words_hash['event'].sample
    if rand > 0.5
      prompt += (part1 + part2 + partfinal)
    else
      prompt += (part2 + part1 + partfinal)
    end
    prompt
  end
end
