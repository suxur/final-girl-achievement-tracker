require "simplecov"

SimpleCov.start("rails") do
  add_filter "/channels/"
  add_filter "/mailers/"
  add_filter "/config/"
  add_filter "/job/application_job/"
  add_filter "/lib/tests/"
  add_filter "/helpers/"
  add_filter "/form_builders/"

  add_group "Facades", "app/facades"
  add_group "Policies", "app/policies"
end

class ActiveSupport::TestCase
  parallelize_setup do |worker|
    SimpleCov.command_name "#{SimpleCov.command_name}-#{worker}"
  end

  parallelize_teardown { |worker| SimpleCov.result }
end
