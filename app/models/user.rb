class User < ActiveRecord::Base
  mount_uploader :user_face, UserFaceUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  
  has_many :notices
  has_many :nreplies
  has_many :handouts
  has_many :hreplies
  
  # User Face Validation
  validates_integrity_of  :user_face
  validates_processing_of :user_face
  validates :nickname, presence: true
  private
    def user_face_size_validation
      errors[:user_face] << "should be less than 500KB" if user_face.size > 0.5.megabytes
    end
end
