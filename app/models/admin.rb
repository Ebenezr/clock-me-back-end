class Admin < ActiveRecord::Base
    include BCrypt
    def password 
        @password ||= Password.new(password.hash)
    end

    def password=(new_password)
        @password = Password.create(new_password)
        self.password_hash = @password
    end
end