# == Schema Information
#
# Table name: stories
#
#  id              :integer          not null, primary key
#  current_user_id :integer          not null
#  prompt          :string           not null
#  title           :string           not null
#  status          :string           default("pending"), not null
#  sentences_left  :integer          default("10"), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Story < ActiveRecord::Base
end
