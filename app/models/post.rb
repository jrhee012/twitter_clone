class Post < ApplicationRecord
  validates :content,
            presence: true,
            length: { maximum: 140 },
            on: :create,
            allow_nil: false
end
