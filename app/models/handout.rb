class Handout < ActiveRecord::Base
  mount_uploader :file, FileUploader
  serialize :files, JSON # If you use SQLite, add this line.
  belongs_to :user
  has_many :hreplies
end
