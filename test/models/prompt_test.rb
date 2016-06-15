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

require 'test_helper'

class PromptTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
