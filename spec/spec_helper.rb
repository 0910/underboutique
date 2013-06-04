require 'rubygems'
require 'spork'
#uncomment the following line to use spork with the debugger
#require 'spork/ext/ruby-debug'

Spork.prefork do
    # Loading more in this block will cause your tests to run faster. However,
    # if you change any configuration or code from libraries loaded here, you'll
    # need to restart spork for it take effect.
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'email_spec'
  require 'rspec/autorun'
  require 'factory_girl_rails'
  require 'capybara-webkit'
  require 'capybara/rspec'
  require 'capybara/rails'
  require 'rack_session_access/capybara'

  Capybara.register_driver :webkit_no_stdout do |app|
    Capybara::Driver::Webkit.new(app, stdout: nil)
  end
  Capybara.default_wait_time = [ENV['CAPYBARA_TIMEOUT'].to_i, 10].max
  Capybara.ignore_hidden_elements = true

  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  #Capybara.javascript_driver = :selenium
  Capybara.javascript_driver = :webkit_no_stdout
   
  RSpec.configure do |config|
    config.include EmailSpec::Helpers
    config.include EmailSpec::Matchers
    config.include FactoryGirl::Syntax::Methods
    config.include Devise::TestHelpers, :type => :controller
    config.include CartHelper
    config.use_transactional_fixtures = true
    config.infer_base_class_for_anonymous_controllers = false
    config.order = "random"
  end

end

Spork.each_run do
  # This code will be run each time you run your specs.
  class ActiveRecord::Base
    mattr_accessor :shared_connection
    @@shared_connection = nil

    def self.connection
      @@shared_connection || retrieve_connection
    end
  end
  # Forces all threads to share the same connection. This works on
  # Capybara because it starts the web server in a thread.
  ActiveRecord::Base.shared_connection = ActiveRecord::Base.connection
end
