require 'rails_helper'

RSpec.describe ConversationsRequest, type: :model do

  context 'validation test' do
   
    it 'is valid with required data' do
    conv = ConversationsRequest.new(conversation_id: 1, request_id: 1).save
    expect(conv).to eq(true)


    end


  end
end
