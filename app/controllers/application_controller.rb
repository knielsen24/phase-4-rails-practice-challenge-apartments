class ApplicationController < ActionController::API

rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
rescue_from ActiveRecord::RecordInvalid, with: :request_not_valid


private

def record_not_found(exception)
   render json: { error: "#{exception.model} not found"}, status: :not_found
end

def request_not_valid(exception)
  render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
end

end
