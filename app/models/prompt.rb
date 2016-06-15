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
  validates :part_of_speech, presence: true, inclusion: {in: ['Person', 'Occupation', 'Place', 'Object', 'Adjective', 'Event']}
end
