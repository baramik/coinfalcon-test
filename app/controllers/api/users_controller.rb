class Api::UsersController < ApiController
  before_action :authenticate_user_from_token!

  def create_address
    AssignAddress.call(current_user) do
      on(:success) { |address_descriptor| render json: { address: address_descriptor } }
      on(:error) { |error| render json: { error: error }, status: :unprocessable_entity }
    end
  end

  def view_address
    render json: { address: current_user.address_descriptor }
  end
end