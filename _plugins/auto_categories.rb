module Jekyll
  class CategoryGenerator < Generator
    safe true
    priority :highest

    def generate(site)
      site.posts.docs.each do |post|
        # Skip if categories are already set in front matter
        next if post.data['categories'] && post.data['categories'].any?

        # Get the relative path from _posts directory
        relative_path = post.relative_path

        # Extract folder structure from path
        # Example: _posts/Ai/basics/2025-12-04-file.md
        path_parts = relative_path.split('/')

        # Remove _posts and filename
        path_parts.shift # Remove "_posts"
        path_parts.pop   # Remove filename

        # Set categories from folder structure
        if path_parts.any?
          post.data['categories'] = path_parts

          # Also set 'category' for backward compatibility (first category)
          post.data['category'] = path_parts.first

          # Log for debugging
          Jekyll.logger.info "Auto-categories:", "#{post.data['title']} => #{path_parts.join(' > ')}"
        end
      end
    end
  end
end
