ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'capybara/rspec'
require 'database_cleaner'
# Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f}
ActiveRecord::Migration.maintain_test_schema!
RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or
  # ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  # This block takes a snapshot of the page you are testing.
  # See capybara docs for more on this.
  # The snapshots are saved by default in tmp/capybara.
  config.after do |example|
    if example.metadata[:type] == :feature
      # save_and_open_page
      # save_and_open_screenshot
    end
  end
  # This block must be here, do not combine with the other
  # This makes it so Capybara can see the database.
  # config.before(:each) do
  #     DatabaseCleaner.start
  # ends
  # This block makes sure that tests start on a clean slate
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end
  # This block configures Caypbara's driver to use Selenium
  # It makes it use the chrome browser, but can also be
  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, browser: :chrome)
  end
  # Uncomment to use capybara-webkit driver for headless testing
  # Capybara.javascript_driver = :webkit
  # Capybara.run_server = false
  # Capybara.app_host = "https://my-website.mysite.com"
  Capybara.configure do |confi|
    confi.default_max_wait_time = 10 # seconds
    confi.default_driver = :selenium
    # config.always_include_port = true
  end
  Shoulda::Matchers.configure do |confi|
    confi.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end
end
