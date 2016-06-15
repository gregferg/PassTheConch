# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  session_token   :string           not null
#  password_digest :string           not null
#  first_name      :string           not null
#  last_name       :string           not null
#  dob             :date             not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  validates :first_name, :last_name, :dob, presence: true
  validates :session_token, :password_digest, :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  attr_reader :password

  has_many :user_games

  has_many :stories,
   through: :user_games,
   source: :story
end
