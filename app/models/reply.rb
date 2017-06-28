class Reply < ApplicationRecord
  belongs_to :message
  belongs_to :topic
  belongs_to :user

  
end
