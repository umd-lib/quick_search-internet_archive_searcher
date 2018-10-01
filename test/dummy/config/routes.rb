Rails.application.routes.draw do
  mount QuickSearchInternetArchiveSearcher::Engine => "/quick_search-internet_archive_searcher"
end
