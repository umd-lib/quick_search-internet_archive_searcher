require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)
require 'quick_search'
require 'quick_search/internet_archive_searcher'

module Dummy
  class Application < Rails::Application
    config.load_defaults 5.2
    config.cache_classes = true
    config.eager_load = false
    config.consider_all_requests_local       = true
    config.action_controller.perform_caching = false
    config.action_controller.allow_forgery_protection = false
    config.action_mailer.delivery_method = :test
  end
end
