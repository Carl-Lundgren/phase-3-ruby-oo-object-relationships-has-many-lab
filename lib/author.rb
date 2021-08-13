class Artist
    attr_accessor :name

    def initialize(name)
        @name = name
    end

    def posts
        Post.all.filter do |song|
            self == post.author
        end
    end

    def add_post(post)
        post.author = self
    end

    def add_post_by_title(post_title)
        new_post = Post.new(post_title)
        add_post(new_post)
    end

    def self.post_count
        post_with_author = Post.all.filter do |post|
            post.author
        end
        post_with_author.length
    end
end