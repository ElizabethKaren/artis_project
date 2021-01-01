class Heartbeat < ApplicationRecord
    
    belongs_to :device

    validates :is_device_disabled, presence: { message: "invalid phone number" }

    private 

    def is_device_disabled
        self.device_id != nil  && self.device.disabled_at == nil	
    end	

end
