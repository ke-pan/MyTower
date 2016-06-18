require 'active_support/concern'
module HexedSlugable
  extend ActiveSupport::Concern

  included do
    extend FriendlyId
    friendly_id :generated_slug, use: :slugged
  end

  def generated_slug
    require 'securerandom'
    SecureRandom.hex(16)
  end
end
