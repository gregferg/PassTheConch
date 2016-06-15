# == Schema Information
#
# Table name: user_games
#
#  id         :integer          not null, primary key
#  story_id   :integer          not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class UserGameTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
