class Person < ApplicationRecord
	belongs_to :customer, optional: true
	has_many :books, :dependent => :nullify
  has_many :portraits
  has_many :creations
  has_one :tag, :dependent => :nullify
  	validates :name, presence:true
  	validates :name_kana,format: {
                   with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
                   message: "全角カタカナのみで入力して下さい"
                 }
    validates :birth, numericality: { only_integer: true }, allow_blank: true
    validates :death, numericality: { only_integer: true }, allow_blank: true
end
