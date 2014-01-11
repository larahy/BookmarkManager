require 'bcrypt'
class User

  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :password_digest, Text

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def password
    BCrypt::Password.new(password_digest)
  end
  
end

