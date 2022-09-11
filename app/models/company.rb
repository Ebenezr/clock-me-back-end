class Company 
    has_many :departments
    has_many :employees, through: :departments
end    