# == Schema Information
# Schema version: 20110903115101
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  attr_accessor :password #virtual attribute: not corresponding to a column in database
                          #cuz pw not stored in database -- only encrypted
  attr_accessible :name, :email, :password, :password_confirmation

  EmailRegex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates_presence_of :name, :email
  validates_length_of :name, :maximum => 100
  validates_format_of :email, :with => EmailRegex
  validates_uniqueness_of :email, :case_sensitive => false

  # automatically create the virtual attribute 'password_confirmation'
  validates_confirmation_of :password
  
  #password validations
  validates_presence_of :password
  validates_length_of :password, :within => 6..70

  before_save :encrypt_password #pass the method name "encrypt password" to the method
                                # "before_save" to "register the callback" ... so 
                                # Active Record will auto call encry_pw b4 saving record

  def has_password?(submitted_password) #for logging in
    #compare encrypted_password with the encrypted version of submitted_pw
    encrypted_password == encrypt(submitted_password)
  end

  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil if user.nil?
    return user if user.has_password?(submitted_password)
    #pw mismatch gets handled implicitly: end of method returns nil
  end

  private #used internally. not intended for public use. will raise NoMethodError
    
    def encrypt_password
      self.salt = make_salt
      self.encrypted_password = encrypt(password)  #sets attribute of encrypted_pw
               #but "password" already exists so you don't have to say self.password
    end

    def encrypt(string)
      secure_hash("#{salt}#{string}") #we're in user class, so it's user's salt attribute
    end

    def make_salt
      secure_hash("#{Time.now.utc}#{password}")
    end

    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
end
