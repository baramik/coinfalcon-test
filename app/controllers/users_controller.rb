class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def my_address  
    @current_assigned_address = current_user.address_descriptor
  end

  def assign_address
    AssignAddress.call(current_user) do
      on(:success) { |address_descriptor| render json: { address: address_descriptor } }
      on(:error) { |error| render json: { error: error }, status: :unprocessable_entity }
    end
  end

  private

  def assign_user_service
    @_assign_user_service ||= Service.new(current_user)
  end
end
