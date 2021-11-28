require 'rails_helper'

RSpec.describe Message, type: :model do

  context 'validation test' do


  it 'is invalid without message body' do
  mess = Message.new(conversation_id: 1, to_id: 1, from_id: 2).save
  expect(mess).to eq(false)

  
  end



  end
end
