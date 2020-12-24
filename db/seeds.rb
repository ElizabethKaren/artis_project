Device.destroy_all
Heartbeat.destroy_all
Report.destroy_all

10.times do
    device = Device.create(phone_num: Faker::PhoneNumber.cell_phone_in_e164, carrier: Faker::Company.name)
    Heartbeat.create(device_id: device.id)
end


50.times do
    Report.create(sender: Faker::TvShows::TheFreshPrinceOfBelAir.character, message: Faker::TvShows::TheFreshPrinceOfBelAir.quote, device_id: Device.all.sample.id )
end 
