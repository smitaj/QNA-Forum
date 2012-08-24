ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  unless html_tag =~ /^<label/
    %{
<p class="field_with_errors">#{html_tag}<br /><label class="message" for="#{instance.send(:tag_id)}">#{instance.error_message.first}</label></p>
}.html_safe
  else
    %{
<p class="field_with_errors">#{html_tag}</p>
}.html_safe
  end
end
