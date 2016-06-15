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

class UserGame < ActiveRecord::Base
  belongs_to :user
  belongs_to :story
end
