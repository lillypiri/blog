class AddSlugToArticles < ActiveRecord::Migration
  def up
    add_column :articles, :slug, :string
    add_index :articles, :slug

    Article.reset_column_information

    Article.all.each do |article|
      article.update slug: article.title.downcase.gsub(' ', '-').gsub(/[^a-zA-Z\-]+/, '')
    end
  end

  def down
    remove_column :articles, :slug
  end

end
