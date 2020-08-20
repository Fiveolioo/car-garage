require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end
use Rack::MethodOverride
use GaragesController
use CarsController
use UsersController
use RackSessionAccess::Middleware if ENV['SINATRA_ENV'] == 'test'
run ApplicationController