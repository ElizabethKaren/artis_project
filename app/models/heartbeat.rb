class Heartbeat < ApplicationRecord
    belongs_to :device 
    validates :device_id, presence: true
    before_validation :is_device_disabled, on: [ :create, :update ]

    private 

    def is_device_disabled
        self.device.disabled_at != nil 
    end 
end
