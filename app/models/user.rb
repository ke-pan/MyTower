# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  slug            :string           not null
#
# Indexes
#
#  index_users_on_name  (name) UNIQUE
#  index_users_on_slug  (slug) UNIQUE
#

class User < ActiveRecord::Base
  include HexedSlugable

  has_secure_password

  has_many :team_memberships
  has_many :teams, through: :team_memberships
  has_many :events

  validates :name, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :password, length: { minimum: 6 }, on: :create
end
