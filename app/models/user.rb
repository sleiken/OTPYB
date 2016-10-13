class User < ActiveRecord::Base
  has_many :visits
  has_many :places, through: :visits

 include BCrypt

 def password
    @password ||= Password.new(password_hash)
 end

 def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
 end
end
