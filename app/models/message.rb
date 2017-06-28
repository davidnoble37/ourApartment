class Message < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  has_many :replies, :dependent => :destroy

end
