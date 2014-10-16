class Post < ActiveRecord::Base
    has_many :comments, dependent: :destroy
        has_many :votes, dependent: :destroy
    mount_uploader :post_image, PostImageUploader
    belongs_to :user
        belongs_to :topic

    def up_votes
        votes.where(value: 1).count
    end

    def down_votes
        votes.where(value: -1).count
    end

    def points
        Vote.sum(:value)
    end

    default_scope { order('created_at DESC') }

    validates :title, length: {minimum: 5 }, presence: true
    validates :body, length: {minimum: 20 }, presence: true
   # validates :topic, presence: true
    #validates :user, presence: true

    
end
