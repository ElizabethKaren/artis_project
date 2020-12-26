class Device < ApplicationRecord
    has_many :heartbeats
    has_many :reports
    validates :phone_num, length: { in: 9..15 }

end
