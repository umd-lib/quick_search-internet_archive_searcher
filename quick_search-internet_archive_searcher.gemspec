# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'quick_search/internet_archive_searcher/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'quick_search-internet_archive_searcher'
  s.version     = QuickSearchInternetArchiveSearcher::VERSION
  s.authors     = ['UMD Libraries']
  s.email       = ['lib-ssdr@umd.edu']
  s.homepage    = 'http://umd.edu'
  s.summary     = 'Internet Archive searcher for NCSU Quick Search.'
  s.description = 'Internet Archive searcher for NCSU Quick Search.'
  s.license     = 'Apache 2.0'

  s.files = Dir['{app,config,db,lib}/**/*', 'LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'quick_search-core', '~> 0'
  s.add_development_dependency 'rubocop', '= 0.52.1'
end
