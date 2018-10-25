namespace :pool do
  desc "Generates default address pool"
  task generate: :environment do
    AddressPool.find_or_create_by(name: 'main')
  end
end
