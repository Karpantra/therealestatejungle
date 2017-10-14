class User < ApplicationRecord
  has_many :demands, dependent: :destroy
  has_many :coworkings, dependent: :destroy
  has_many :briefs, dependent: :destroy
  has_many :contacts, :foreign_key => 'owner_id', dependent: :destroy
  after_create :send_welcome_email
  after_create :subscribe_to_newsletter
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable, :trackable, :validatable, :omniauthable, omniauth_providers: [:linkedin] #add :facebook when ready

  attr_accessor :current_password

  acts_as_messageable

  def mailboxer_name
   self.first_name
  end

  def mailboxer_email(object)
   self.email
  end

  def full_name
    return "#{self.first_name.capitalize} #{self.last_name.first.capitalize}."
  end

  ################# FACEBOOK AUTHENTICATION DO NOT DELETE ######################

    # def self.find_for_facebook_oauth(auth)
    #   user_params = auth.slice(:provider, :uid)
    #   user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    #   user_params[:facebook_picture_url] = auth.info.image
    #   user_params[:token] = auth.credentials.token
    #   user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    #   user_params = user_params.to_h

    #   user = User.find_by(provider: auth.provider, uid: auth.uid)
    #   user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
    #   if user
    #     user.update(user_params)
    #   else
    #     user = User.new(user_params)
    #     user.password = Devise.friendly_token[0,20]  # Fake password for validation
    #     user.save
    #   end

    #   return user
    # end

 ###############################################################################

    def self.find_for_linkedin_oauth(auth)
        user_params = auth.slice(:provider, :uid)
        user_params.merge! auth.info.slice(:email, :first_name, :last_name)
        user_params[:facebook_picture_url] = auth.info.image
        user_params[:token] = auth.credentials.token
        # user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
        user_params = user_params.to_h

        user = User.find_by(provider: auth.provider, uid: auth.uid)
        user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
        if user
          user.update(user_params)
        else
          user = User.new(user_params)
          user.password = Devise.friendly_token[0,20]  # Fake password for validation
          user.owner = false # User is looking for coworkings by default
          user.save
        end

        return user
      end

    private

      def send_welcome_email
        UserMailer.welcome(self).deliver_now
      end

      def subscribe_to_newsletter
        SubscribeToNewsletterService.new(self).call
      end

end
