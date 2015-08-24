class Goal < ActiveRecord::Base
  validates :body, presence: true
  validates :goal_type, inclusion: { in: ["private", "public"],
            message: "Goal must be public or private."}
  after_initialize :set_default_status

  belongs_to :user, inverse_of: :goals

  def set_default_status
    self.is_completed = false
  end

end
