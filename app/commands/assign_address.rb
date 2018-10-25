class AssignAddress < Rectify::Command
  def initialize(user)
    @user = user
  end

  def call
    unbind_address if user_address
    assign_new_address
  end

  private

  attr_reader :user

  def unassigned_address
    default_pool.addresses.find_by(user: nil)
  end

  def assign_new_address
    return broadcast(:error, "Address Pool empty, please try again in #{ address_will_generate_in_minutes } Minutes") unless unassigned_address
    user.address = unassigned_address
    broadcast(:success, user.address_descriptor)
  end

  def unbind_address
    user.address.destroy!
  end

  def user_address
    user.address
  end 

  def last_address_in_pool
    default_pool.addresses.last
  end

  def address_will_generate_in_minutes
    return pool_update_interval_in_minues unless latest_address_pool_log
    TimeDifference.between(latest_address_pool_log.last_run + 12.minutes, Time.now).in_minutes
  end

  def pool_update_interval_in_minues
    12.minutes.round / 1.minute
  end

  def latest_address_pool_log
    @_latest_address_pool_log ||= AddressPoolLog.last
  end 

  def default_pool
    @_pool ||= AddressPool.find_by(name: 'main')
  end
end