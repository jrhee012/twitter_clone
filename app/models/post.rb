class Post < ApplicationRecord
  # Limit the maximum length of the content of the post to 140 characters.
  validates :content,
            presence: true,
            length: { maximum: 140 },
            on: :create,
            allow_nil: false
end
