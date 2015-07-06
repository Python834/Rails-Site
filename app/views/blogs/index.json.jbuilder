json.array!(@blogs) do |blog|
  json.extract! blog, :id, :title, :published_date, :author, :content
  json.url blog_url(blog, format: :json)
end
