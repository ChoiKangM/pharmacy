class Notice < ActiveRecord::Base
  belongs_to :user
  has_many :nreplies
end
