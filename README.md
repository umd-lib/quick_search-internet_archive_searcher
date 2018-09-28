Internet Archive searcher for NCSU Quick Search
=======

## Internet Archive API documentation

https://archive.org/advancedsearch.php

## Installation
Include the searcher gem in your Gemfile:

```
gem 'quick_search-internet_archive_searcher'

```
And then execute:
```bash
$ bundle install
```

Include in your Search Results page

```
<%= render_module(@internet_archive, 'internet_archive_space') %>
```

## Configuration

The Internet Archive searcher requires configuration, such as specific URL to
use in retrieving search results.
To set the configuration, create a "config/searchers/" directory in your 
application (the "searchers" subdirectory may need to be created), 
and copy the "config/internet_archive_config.yml" file
in this gem into it. Follow the instructions in the file to configure the
searcher.

Additional customizations can be done by editing the "config/locales/en.yml" file.
