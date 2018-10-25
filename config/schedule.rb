every 12.minutes do
  runner "PoolUpdaterWorker.perform_async"
end