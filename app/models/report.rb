class Report < ApplicationRecord

    belongs_to :device 

    validates :message, presence: true 
    validates :sender, presence: true
    validates :device_id, presence: true

    private 

    # def code_message
    #     self.message && self.message = self.message.encode("UTF-8", "Windows-1252")
    # end 
    
end
