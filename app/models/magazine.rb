require_relative 'article'
class Magazine
    attr_accessor :name, :category
    @@all = []

    def initialize(name, category)
      @name = name
      @category = category
      @@all << self

    end

    def self.all
      @@all
    end

    def contributors
      Article.all.select { |article| article.magazine == self }.map { |article| article.author }
    end

    def self.find_by_name(name)
      @@all.find { |magazine| magazine.name == name }
    end

    def article_titles
      Article.all.select { |article| article.magazine == self }.map { |article| article.title }
    end

    def contributing_authors
      authors = contributors.uniq
      contributing_authors = []
    
      authors.each do |author|
        articles_count = 0
    
        contributors.each do |contributor|
          if contributor == author
            articles_count += 1
          end
        end
    
        if articles_count > 2
          contributing_authors << author
        end
      end
    
      contributing_authors
    end

end
