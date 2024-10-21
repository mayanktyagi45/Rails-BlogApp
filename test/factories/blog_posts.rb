FactoryBot.define do
  factory :blog_post do
    title { "Sample Blog Post Title" }
    body  { "This is a sample blog post body content." }
    category { "LLD" }
  end
end
