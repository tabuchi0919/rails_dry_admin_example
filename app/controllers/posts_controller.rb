# frozen_string_literal: true

class PostsController < ApplicationController
  private

  def model
    Post
  end

  def includes_associations
    [:user]
  end
end
