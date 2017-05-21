class Train < ApplicationRecord
  validates_presence_of :number
  has_many :reservations
  SEATS = begin
    (1..6).to_a.map do |series|
      ["A", "B", "C"].map do |letter|
        "#{series}#{letter}"
      end
    end
  end.flatten
  def available_seats
  #  ["1A", "1B", "1C", "1D", "1F"]
  # TODO: 回传有空的座位，这里先暂时固定回传一个数组，等会再来处理
  # 所有 SEATS 扣掉已经订位的资料
  return SEATS - self.reservations.pluck(:seat_number)
  end
  mount_uploader :train_logo, TrainLogoUploader
end
