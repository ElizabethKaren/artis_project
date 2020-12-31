Device.destroy_all
Heartbeat.destroy_all
Report.destroy_all

phone_companies = ['T-Mobile', 'Verizon', 'Metro by T-Mobile', 'Boost Mobile', 'Xfinity Mobile']

10.times do
    Device.create(phone_num: Faker::PhoneNumber.cell_phone, carrier: phone_companies.sample )
end

puts 'Devices created'

15.times do 
    Heartbeat.create(device_id: Device.all.sample.id )
end 

puts 'Heartbeats created'

5.times do
    device = Device.create(disabled_at: DateTime.new, phone_num: Faker::PhoneNumber.cell_phone, carrier: phone_companies.sample )
end

Device.create(phone_num: '609 558-1491', carrier: phone_companies.sample )

puts 'my device made'

50.times do
    Report.create(sender: Faker::TvShows::TheFreshPrinceOfBelAir.character, message: Faker::TvShows::TheFreshPrinceOfBelAir.quote, device_id: Device.all.sample.id )
end 
