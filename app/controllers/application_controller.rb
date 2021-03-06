class ApplicationController < ActionController::API

	require 'jsonwebtoken'

	protected

	def getUserFullName(user_ids, modelObjects)
		users = User.select('id, first_name, last_name').find(user_ids).uniq

    	modelObjects = modelObjects.as_json
    	modelObjects.each_with_index do |object, index|
      		users.each do |user|
        		if object["to_id"] == user.id
          			modelObjects[index]["to_full_name"] = user.first_name + ' ' + user.last_name
        		end
        		if object["from_id"] == user.id
          			modelObjects[index]["from_full_name"] = user.first_name + ' ' + user.last_name
        		end
        		if object["user_id"] == user.id
          			modelObjects[index]["user_full_name"] = user.first_name + ' ' + user.last_name
        		end
      		end
    	end
    	return modelObjects
	end

	def invalid_authentication(val)
		render json: { error: 'Invalid Request: ' + val.to_s }, status: :unauthorized
	end

	def authenticate_request!
		if !payload || !JsonWebToken.valid_payload(payload.first)
			return invalid_authentication('Invalid token or token expired')
		end

		load_current_user!
		invalid_authentication('this user doesn\'t exist') unless @current_user

	end
	
	private

	def payload
		auth_header = request.headers['Authorization']
		token = auth_header.split(' ').last
		JsonWebToken.decode(token)
	rescue
		nil
	end

	def load_current_user!
		@current_user = User.find_by(id: payload[0]['user_id'])
	end

end
