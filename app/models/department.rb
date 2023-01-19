class Department < ApplicationRecord
    has_one :manager
    has_one :manager_history , through: :manager

    def readonly? 
        !new_record?
    end
end
