class Report < ApplicationRecord

    belongs_to :device 

    validates :sender, presence: { message: "invalid phone number" }
    validates :message, presence: { message: "invalid phone number" } 
    validates :device_id, presence: { message: "invalid phone number" }
    
end
