Device.destroy_all
Heartbeat.destroy_all
Report.destroy_all

phone_companies = ['T-Mobile', 'Verizon', 'Metro by T-Mobile', 'Boost Mobile', 'Xfinity Mobile']

10.times do
    device = Device.create(phone_num: Faker::PhoneNumber.cell_phone_in_e164, carrier: phone_companies.sample )
    Heartbeat.create(device_id: device.id)
end

puts 'Devices created'

5.times do
    device = Device.create(disabled_at: DateTime.new, phone_num: Faker::PhoneNumber.cell_phone_in_e164, carrier: phone_companies.sample )
    Heartbeat.create(device_id: device.id)
end

puts 'Heartbeats created'

Device.create(phone_num: '609 558-1491', carrier: phone_companies.sample )

puts 'my device made'

50.times do
    Report.create(sender: Faker::TvShows::TheFreshPrinceOfBelAir.character, message: Faker::TvShows::TheFreshPrinceOfBelAir.quote, device_id: Device.all.sample.id )
end 
