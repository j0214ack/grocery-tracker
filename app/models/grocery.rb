class Grocery < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id
  validates_presence_of :name
  validates_presence_of :count
  validates_presence_of :exp_date

  def quantity
    "#{count} #{unit}"
  end

  def show_exp_date
    exp_date.to_s[5..-1].sub('-','/')
  end
end
