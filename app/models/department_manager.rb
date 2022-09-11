class Department_manager
    has_many :employees, through: :depatment
    belongs_to :department, :class_name => 'Department', :foreign_key => 'department_id'
end  