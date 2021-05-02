class User < ApplicationRecord
  has_many :user_stocks
  has_many :broker_stocks, class_name: "Stock", through: :user_stocks, source: :stock

  has_many :transactions
  has_many :buyer_stocks, class_name: "Stock", through: :transactions
    
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :email, presence: true

                      
  belongs_to :role

  before_create :set_status
  after_create :welcome_email


  def set_status
    if self.role_id == 2
      self.approved = false
    else 
      self.approved = true
    end
  end

  def welcome_email
    if self.role_id == 3
      UserMailer.welcome_email(self).deliver
    elsif self.role_id == 2
      UserMailer.pending_email(self).deliver
    end
  end

  # def approve_application
   # self.toggle(:approved).save
  # end
  
  def active_for_authentication?
     super && approved?
  end

  def inactive_message
     approved? ? super : :not_approved
  end
  


  def stock_tracked(ticker_symbol)
    stock = Stock.check_db(ticker_symbol)
    return false unless stock
    broker_stocks.where(id: stock.id).exists?
  end

end
