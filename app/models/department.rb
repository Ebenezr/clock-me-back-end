class Department < ActiveRecord::Base
 has_many :employees
 belongs_to :company
 has_one :department_manager
end    