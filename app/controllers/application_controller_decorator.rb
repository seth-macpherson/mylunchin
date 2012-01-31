class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :fetch_feed_entries

  def fetch_feed_entries
    session.reset
    session[:feed_entries] ||= Feedzirra::Feed.fetch_and_parse("http://norastable.wordpress.com/feed/")
    @blog_feed = session[:feed_entries]
  end


end
