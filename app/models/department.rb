class Department < ActiveRecord::Base
 has_many :employees
 belongs_to :company
end    