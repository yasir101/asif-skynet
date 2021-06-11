class TestWorker
  include Sidekiq::Worker
  # sidekiq_options queue: :low, retry: false, backtrace: true

  def perform(*args)
    # Do something
  end
end
