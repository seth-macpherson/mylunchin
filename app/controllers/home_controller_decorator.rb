HomeController.class_eval do
  before_filter :fetch_feed_entries

  FEED_ENTRIES = Feedzirra::Feed.fetch_and_parse("http://norastable.wordpress.com/feed/")

  def fetch_feed_entries
    @blog_feed = FEED_ENTRIES
  end

end