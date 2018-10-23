class PoolUpdaterService
  def initialize(pool, max_pool_size = 10)
    @pool = pool
    @max_pool_size = max_pool_size
  end 

  attr_reader :max_pool_size,
              :pool

  def call
    generate_pool_addresses
  end

  private

  

  def generate_pool_addresses
    count_to_generate.times { pool.addresses.create! }
  end
  
  def count_to_generate
    max_pool_size - current_unassigned_pool_size
  end
  
  def current_unassigned_pool_size
    @_current_unassigned_pool_size ||= pool.unassigned_address_count
  end 
end