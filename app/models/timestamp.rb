class Timestamp < ActiveRecord::Base
    belongs_to :employee, :class_name => 'Employee', :foreign_key => 'employee_id'
 end