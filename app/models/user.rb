class User < ActiveRecord::Base

  has_many(
    :bands,
    :class_name => "Band",
    :foreign_key => :owner_id,
    :primary_key => :id
  )
  
  has_many :albums, through: :bands, source: :albums

  
  after_initialize :ensure_session_token
  
  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)
    return nil if user.nil? 
    user.is_password?(password) ? user : nil
  end
  
  def self.generate_session_token
    SecureRandom::urlsafe_base64
  end
  
  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end
  
  def is_password?(password)
    bcrypt_object = BCrypt::Password.new(self.password_digest)
    bcrypt_object.is_password? password
  end
  
  private
  
  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end
  
end
