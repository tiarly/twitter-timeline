RSpec.configure do |config|
  config.before(:suite) { DatabaseCleaner.clean_with(:truncation) }
  config.after(:each) { DatabaseCleaner.clean }
end
