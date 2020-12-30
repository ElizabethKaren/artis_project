class Heartbeat < ApplicationRecord
    belongs_to :device 

    validates :device_id, presence: true

    validate :is_device_disabled

    def is_device_disabled
        self.device.disabled_at == nil
    end

end
