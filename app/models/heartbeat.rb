class Heartbeat < ApplicationRecord
    validates :device_id, presence: true 
end
