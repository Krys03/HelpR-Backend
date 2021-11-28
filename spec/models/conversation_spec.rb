require 'rails_helper'

RSpec.describe Conversation, type: :model do

  context 'validation test' do

    it 'is valid with required data' do
    conv = Conversation.new(subject: "Dog walking").save
    expect(conv).to eq(true)

  
    end
  

  end
end
