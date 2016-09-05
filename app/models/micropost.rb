class Micropost < ActiveRecord::Base
  # belongs_toは参照先のクラス型を示す？:userの参照先クラスはUserクラスなので、class_name: が不要。
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
end
