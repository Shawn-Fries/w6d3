class Comment < ApplicationRecord
    validates :user_id, presence: true
    validates :artwork_id, presence: true
    validates :body, presence: true

    belongs_to :author,
        dependent: :destroy,
        foreign_key: :user_id,
        class_name: :User

    belongs_to :artwork,
        dependent: :destroy,
        foreign_key: :artwork_id,
        class_name: :Artwork

end