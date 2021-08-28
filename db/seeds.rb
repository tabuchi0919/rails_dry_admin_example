# frozen_string_literal: true

(1..10).each { |i| User.find_or_create_by!(name: "User#{i}") }
