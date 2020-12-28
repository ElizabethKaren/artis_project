class Report < ApplicationRecord
    validates :sender, presence: true 
    validates :message, presence: true 
    validates :device_id, presence: true 
end
