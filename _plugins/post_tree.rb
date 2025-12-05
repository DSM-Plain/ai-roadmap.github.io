module Jekyll
  class PostTreeGenerator < Generator
    safe true
    priority :low

    def generate(site)
      # Build hierarchical tree from posts
      tree = build_tree(site.posts.docs)

      # Store tree in site config for access in templates
      site.config['post_tree'] = tree

      Jekyll.logger.info "Post Tree:", "Generated tree with #{tree.keys.size} top-level categories"
    end

    private

    def build_tree(posts)
      tree = {}

      posts.each do |post|
        categories = post.data['categories'] || []
        next if categories.empty?

        # Navigate/create tree structure
        current_level = tree
        categories.each_with_index do |category, index|
          current_level[category] ||= {
            'posts' => [],
            'children' => {}
          }

          # If this is the last category, add the post
          if index == categories.length - 1
            current_level[category]['posts'] << post
          end

          # Move to next level
          current_level = current_level[category]['children']
        end
      end

      # Sort posts by date (newest first) and sort categories alphabetically
      sort_tree(tree)

      tree
    end

    def sort_tree(tree)
      tree.each do |key, value|
        # Sort posts by date (newest first)
        value['posts'].sort_by! { |post| post.data['date'] }.reverse!

        # Recursively sort children
        sort_tree(value['children']) if value['children'].any?
      end

      # Sort the tree hash by keys alphabetically
      tree.sort.to_h
    end
  end
end
