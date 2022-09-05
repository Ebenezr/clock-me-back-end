class Department_manager < ActiveRecord::Base
    has_many :employees
    belongs_to :depatment
end  