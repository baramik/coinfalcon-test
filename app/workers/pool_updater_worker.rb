class PoolUpdaterWorker
  include Sidekiq::Worker

  def perform
    # For now we have just one address pool this could be extended
    address_pool = AddressPool.find_by(name: 'main')
    PoolUpdate.call(address_pool) do 
      on(:success) { |last_run_time|  AddressPoolLog.create!(status: 'success', last_run: last_run_time) }
    end
  end
end
