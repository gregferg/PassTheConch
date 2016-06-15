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
  validates :sentences_left, inclusion: { in: 0..10 }, presence: true
  validates :status, inclusion: { in: ['Pending', 'In Progress', 'Complete']}
  validates :current_user_id, :prompt, :title, presence: true

  has_one :current_user
   class_name: "User",
   foreign_key: :current_user_id

end
