# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_name  (name) UNIQUE
#

class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name

  has_secure_password

  has_many :team_memberships
  has_many :teams, through: :team_memberships

  validates :name, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :password, length: { minimum: 6 }, on: :create
end
