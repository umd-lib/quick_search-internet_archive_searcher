# frozen_string_literal: true

require 'uri'
require 'json'

module QuickSearch
  # QuickSearch seacher for DrUM
  class InternetArchiveSearcher < QuickSearch::Searcher
    def search
      @response = @http.get(uri, follow_redirect: true)
      @results = JSON.parse @response.body
      @total = @results.dig('response', 'numFound')
    end

    def results
      return @results_list if @results_list
      @results_list = @results.dig('response', 'docs').map do |entry|
        OpenStruct.new(
          link: get_hyperlink(entry),
          title: get_title(entry),
          description: get_description(entry)
        )
      end
      @results_list
    end

    # API use 'q' but UI uses 'query'
    def loaded_link
      base = URI.parse config['loaded_link']
      query = Rack::Utils.parse_nested_query(uri.query)
      query['query'] = query.delete('q')
      base.query = query.to_query
      base.to_s
    end

    private

      def config
        QuickSearch::Engine::INTERNET_ARCHIVE_CONFIG.dup
      end

      def base_query_params
        config['query_params'].dup
      end

      def host
        config['search_url']
      end

      def uri
        base = URI.parse host
        params = base_query_params
        params['q'] = (params['q'] +
                         ["(#{http_request_queries['uri_escaped']})" || ''])
                      .join(' AND ')
        base.query = params.to_query
        base
      end

      # Returns the hyperlink to use
      def get_hyperlink(entry)
        "#{uri.scheme}://#{uri.hostname}/details/#{entry.dig('identifier')}"
      end

      # Returns the string to use for the result title
      def get_title(entry)
        entry.dig('title')
      end

      # Returns the string to use for the result description
      def get_description(entry)
        entry.dig('description')
      end
  end
end
