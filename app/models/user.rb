# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts

  validates :name, presence: true

  class << self
    def selections
      all.map { |user| [user.display_name, user.id] }
    end
  end

  def display_name
    "ID: #{id}, 名前: #{name}"
  end
end
