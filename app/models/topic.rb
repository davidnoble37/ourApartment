class Topic < ApplicationRecord
  belongs_to :user
  has_many :messages, :dependent => :destroy
  has_many :replies, :dependent => :destroy

end
