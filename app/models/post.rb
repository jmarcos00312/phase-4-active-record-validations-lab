class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250}
    validates :summary, length: { maximum: 250}
    validates :category, inclusion: ["Fiction", "Non-Fiction"]
    validate :clickbait?

    CLICKBAIT_PATTERN = [
    /Won't Believe/i,
    /Secret/i,
    /Top \d/i,
    /Guess/i
    ]

    def clickbait?
        if CLICKBAIT_PATTERN.none? { |a| a.match title}
            errors.add(:title, "must be a clickbait")
        end
    end
end
