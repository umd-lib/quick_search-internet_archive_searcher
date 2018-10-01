# frozen_string_literal: true

require 'test_helper'

module QuickSearch
  # Tests for InternetArchiveSearcher
  class InternetArchiveSearcher::Test < ActiveSupport::TestCase # rubocop:disable Style/ClassAndModuleChildren
    def setup
      @searcher = QuickSearch::InternetArchiveSearcher.new(nil, nil, nil)
    end

    test 'truth' do
      assert_kind_of Module, QuickSearch::InternetArchiveSearcher
    end

    test 'get_description should be a missing description' do
      entry = {}
      result = @searcher.send(:get_description, entry)

      assert_equal '', result
    end

    test 'get_description should be able to handle strings' do
      entry = { 'description' => 'A simple string' }
      result = @searcher.send(:get_description, entry)

      assert_equal 'A simple string', result
    end

    test 'get_description should be able to handle arrays of strings' do
      entry = { 'description' => ['String 1', 'String 2'] }
      result = @searcher.send(:get_description, entry)

      assert_equal 'String 1 String 2', result
    end
  end
end
