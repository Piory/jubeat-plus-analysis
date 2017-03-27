# ユーザー関係のクラス
#
# @author Pinky
class User < ApplicationRecord
  enum provider: { google: 'google_oauth2', twitter: 'twitter' }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2]

  # DB から User を検索する
  # User が見つからなかった場合は User を新規作成する
  #
  # @param auth [Array] google_oauth
  # @return [User] 検索結果のユーザーデータ
  def self.find_for_google_oauth2(auth)
    user = User.find_by(email: auth.info.email)

    unless user
      user = User.create(email: auth.info.email,
                         name: auth.info.name,
                         provider: auth.provider,
                         uid: auth.uid,
                         token: auth.credentials.token,
                         password: Devise.friendly_token[0, 20])
    end
    user
  end
end