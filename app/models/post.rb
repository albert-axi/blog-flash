class Post < ApplicationRecord
  belongs_to :author, optional: true
  has_many :posts_categories
  has_many :categories, through: :posts_categories, dependent: :destroy
  
  validates :title, presence: true, uniqueness: true
  validates :content, presence: true, length: { in: 6..20 }

  include ActiveModel::Validations
  validates_with TitleValidator 

  scope :by_author, ->(author_id) { where(author_id: author_id) } 
  scope :from_today, -> {where("created_at >=?", Time.zone.today.beginning_of_day)}
  scope :old_news, -> {where("created_at <?", Time.zone.today.beginning_of_day)}

  # accepts_nested_attributes_for :categories

  def categories_attributes=(categories)
    categories.each do |value|
        self.categories << Category.find_or_create_by(value)
    end
  end

  # def self.posts_by_author(author_id)
  #   Post.where(author_id: author_id)
  # end

end
