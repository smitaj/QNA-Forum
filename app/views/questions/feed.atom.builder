atom_feed :language => 'en-US' do |feed|
  feed.title @title
  feed.updated @updated
   
  @questions.each do |question|
    next if question.updated_at.blank?
     
    feed.entry(question) do |entry|
      entry.url question_url(question)
      entry.title question.question
      entry.updated(question.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ"))
    end
  end
end
