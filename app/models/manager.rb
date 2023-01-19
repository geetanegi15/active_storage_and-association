class Manager < ApplicationRecord
  belongs_to :department
  has_one :manager_history
end
