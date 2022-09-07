class Employee < ActiveRecord::Base
   belongs_to :department
   has_one :timestamp
end