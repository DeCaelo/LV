class Book < ApplicationRecord
  searchkick
  belongs_to :user
  belongs_to :category
  has_many :reviews
  validates :state, inclusion: { in: %w(lu pas_lu_pas_aimé à_lire_acheté à_lire_emprunté_biblio à_lire_emprunté_caro à_lire_non_acheté à_reprendre),
    message: "%{value} is not a valid category" }
  validates :who, inclusion: { in: %w(Biblio Caroline Mdu),
    message: "%{value} is not a valid category" }

  has_attached_file :book_img, styles: { book_index: "250x350>", book_show: "325x475>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :book_img, content_type: /\Aimage\/.*\z/
end
