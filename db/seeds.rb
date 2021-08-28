# frozen_string_literal: true

(1..10).each do |i|
  user = User.find_or_create_by!(name: "User#{i}")
  (1..2).each do |j|
    user.posts.find_or_create_by!(body: "Post#{j} by #{user.name}")
  end
end

