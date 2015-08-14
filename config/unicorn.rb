worker_processes Integer(ENV['WEB_CONCURRENCY'] || 3)
timeout 30
preload_app true
@sidekiq_pid = nil

before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!

  puts 'starting Sidekiq w/ unicorn'
  @sidekiq_pid ||= spawn('bundle exec sidekiq')
  Rails.logger.info("Spawned sidekiq #{@sidekiq_pid}")
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end
