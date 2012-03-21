Spree::BaseHelper.class_eval do

  def flash_messages
    [:notice, :error].map do |msg_type|
      if flash[msg_type]
	  	@errors_exist = true
        content_tag :div, flash[msg_type], :class => "flash #{msg_type}"
      else
        ''
      end
    end.join("\n").html_safe
  end

end