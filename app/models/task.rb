class Task < ApplicationRecord
  belongs_to :user
  validates :task_name,
          presence: true
  validates :task_descption,
          presence: true
  validates :start_date,
          presence: true
  validates :due_date,
          presence: true
  validates :estimate_time,
          presence: true       
  validates :priority_scale,
            presence: true

end
