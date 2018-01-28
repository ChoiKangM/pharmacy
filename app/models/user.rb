class User < ActiveRecord::Base
  mount_uploader :user_face, UserFaceUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
         
  
  has_many :notices
  has_many :nreplies
  has_many :handouts
  has_many :hreplies
  
  # User Face Validation
  validates_integrity_of  :user_face
  validates_processing_of :user_face
  validates :nickname, presence: true
  # Omniauth 2.0
  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
    unless user
        user = User.create(name: data['name'],
            email: data['email'],
            password: Devise.friendly_token[0,20]
        )
    end
    user
  end
  private
    def user_face_size_validation
      errors[:user_face] << "should be less than 500KB" if user_face.size > 0.5.megabytes
    end
end
