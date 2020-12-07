class Payment < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '月末締め翌月末支払い' }, { id: 3, name: '現場終了後' },
    { id: 4, name: '応相談' }, { id: 5, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :orders
end
