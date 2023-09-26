namespace :test do
  desc "Run tests with coverage"
  task :coverage do
    ENV["COVERAGE"] = "true"
    Rake::Task["test"].invoke
  end
end
