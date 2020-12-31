class Heartbeat < ApplicationRecord
    belongs_to :device 

    validates :device_id, presence: { message: "invalid phone number" }

    validates :is_device_disabled, presence: { message: "invalid phone number" }

    private 

    def is_device_disabled
        # self.device.disabled_at == nil
        Devices.active_devices.include?(self.device)
    end

end
