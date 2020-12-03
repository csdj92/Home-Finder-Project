class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable,
         :omniauthable, omniauth_providers: [:github, :google_oauth2]

         has_many :properties,through: :companies
         has_many :companies 
         
       
 
         def self.create_from_provider_data(provider_data)
          where(provider: provider_data.provider, uid: provider_data.uid).first_or_create do |acct|
           acct.email = provider_data.info.email
           acct.image = provider_data.info.image
           acct.password = Devise.friendly_token[0,20]  
            end
         end

         
         private

          
         
         
end
