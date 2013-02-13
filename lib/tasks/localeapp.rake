# lib/tasks/localeapp.rake
namespace :localeapp do
  desc "Fetch the latest translations from localeapp.com"
  task :fetch_latest_translations => [:environment] do
    if Rails.env.production? || Rails.env.staging?
      Localeapp::CLI::Pull.new.execute
    end
  end
end

Rake::Task['assets:precompile'].enhance ['localeapp:fetch_latest_translations']