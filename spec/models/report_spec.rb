require 'rails_helper'

RSpec.describe Report, type: :model do
  context 'validation tests' do 
  
  it 'ensures presence of sender' do 
    report_without_sender = Report.new(message: Faker::TvShows::TheFreshPrinceOfBelAir.quote, device_id: Device.all.sample.id ).save
    expect(report_without_sender).to eq(false)
  end 

  it 'ensures presence of message' do 
    report_without_message = Report.new(sender: Faker::TvShows::TheFreshPrinceOfBelAir.character, device_id: Device.all.sample.id  ).save
    expect(report_without_message).to eq(false)
  end 

  it 'ensures presence of device id' do 
    report_without_device_id = Report.new(sender: Faker::TvShows::TheFreshPrinceOfBelAir.character, message: Faker::TvShows::TheFreshPrinceOfBelAir.quote).save
    expect(report_without_device_id).to eq(false)
  end 

 end 
end
