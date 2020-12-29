class Heartbeat < ApplicationRecord
    belongs_to :device 
    validates :device_id, presence: true 
end
