class Contact < ActiveRecord::Base
    # 複数項目をまとめてバリデーション設定するのは下記標記でOK??
    validates :title,:email,:content, presence: true
end
