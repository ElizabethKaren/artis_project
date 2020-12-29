Device.destroy_all
Heartbeat.destroy_all
Report.destroy_all

phone_companies = ['T-Mobile', 'Verizon', 'AT&T', 'Visible', 'Metro by T-Mobile', 'Google Fi', 'Mint Mobile', 'Consumer Cellular', 'Boost Mobile', 'Xfinity Mobile', 'Cricket Wireless', 'Straight Talk']

10.times do
    device = Device.create(phone_num: Faker::PhoneNumber.cell_phone_in_e164, carrier: phone_companies.sample )
    Heartbeat.create(device_id: device.id)
end

5.times do
    device = Device.create(disabled_at: DateTime.new, phone_num: Faker::PhoneNumber.cell_phone_in_e164, carrier: phone_companies.sample )
    Heartbeat.create(device_id: device.id)
end

Device.create(phone_num: '609 558-1491', carrier: 'Verizon' )


50.times do
    Report.create(sender: Faker::TvShows::TheFreshPrinceOfBelAir.character, message: Faker::TvShows::TheFreshPrinceOfBelAir.quote, device_id: Device.all.sample.id )
end 
