class UserComment < ActiveRecord::Base
  validates :comment, presence: true

  belongs_to :user

  belongs_to :author,
    class_name: "User",
    foreign_key: :author_id
end
