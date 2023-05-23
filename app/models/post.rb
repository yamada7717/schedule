class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 20 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_after_start_date
  validates :introduction, length: { maximum: 500 }

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?
  end
end
