class Company < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  include Devise::JWT::RevocationStrategies::JTIMatcher
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :jwt_authenticatable, jwt_revocation_strategy: self

  attr_accessor :current_token

  def jwt_payload
    super.merge('secret key' => 'key secret')
  end

  def on_jwt_dispatch(token, _payload)
    self.current_token = token
  end
end
