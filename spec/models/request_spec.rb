require 'rails_helper'

RSpec.describe Request, type: :model do

  context 'validation test' do

    it 'ensure all field presence' do
      request = Request.new(title: "Dog Walking", user_id: '1', location: "Tower Bridge, London", latitude: 51.505484, longitude: -0.075337,  description: "Please Walk my Retriever, it smells", category: 'service').save
      expect(request).to eq(true)

    end

    it 'is invalid with description over 300 characters' do
      request = Request.new(title: "Dog Walking", user_id: '1', location: "Tower Bridge, London", latitude: 51.505484, longitude: -0.075337,  description: "Please Walk my Retriever, it smells so baaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaad", category: 'service').save
      expect(request).to eq(false)

    end


    it 'is invalid without title' do
      request = Request.new(user_id: '1', location: "Tower Bridge, London", latitude: 51.505484, longitude: -0.075337, description: "Please Walk my Retriever, it smells", category: 'service').save
      expect(request).to eq(false)

    end

    it 'is invalid without location coordinate' do
      request = Request.new(title: "Dog Walking",location: "Tower Bridge, London", user_id: '1', description: "Please Walk my Retriever, it smells", category: 'service').save
      expect(request).to eq(false)

    end

    it 'is invalid without category' do
      request = Request.new( title: "Dog Walking", location: "Tower Bridge, London", user_id: '1', latitude: 51.505484, longitude: -0.075337, description: "Please Walk my Retriever, it smells").save
      expect(request).to eq(false)

    end


    









  end

end
