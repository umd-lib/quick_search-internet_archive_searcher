# Try to load a local version of the config file if it exists -
# expected to be in quicksearch
# _root/config/searchers/<my_searcher_name>_config.yml

config_file = [
  File.join(Rails.root, '/config/searchers/internet_archive_config.yml'),
  File.expand_path('../internet_archive_config.yml', __dir__)
].find { |file| File.exists? file }

QuickSearch::Engine::INTERNET_ARCHIVE_CONFIG =
  YAML.load(ERB.new(IO.read(config_file)).result, aliases: true)[Rails.env]
QuickSearch::Engine::INTERNET_ARCHIVE_CONFIG.freeze
