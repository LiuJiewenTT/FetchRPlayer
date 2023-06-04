Jekyll::Hooks.register :pages, :post_write do |page|
  all_existing_tags = Dir.entries("tags")
    .map { |t| t.match(/(.*).md/) }
    .compact.map { |m| m[1] }

  # tags = page['tags'].reject { |t| t.empty? }
  # tags = page["tags"]
  tags = page['tags'].reject { |t| t.empty? }
  tags.each do |tag|
    generate_tag_file(tag) if !all_existing_tags.include?(tag)
  end
end

def generate_tag_file(tag)
  File.open("tags/#{tag}.md", "wb") do |file|
    file << "---\ntag-name: #{tag}\n---\n"
  end
end