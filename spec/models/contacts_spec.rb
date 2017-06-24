require 'rails_helper'

describe Contact do

  it "タイトル, email, 内容が入っていれば妥当と判断" do
    contact = Contact.new(title: '宮岡', email: 'skykataoka@dic.com', content: '暑いです')
    expect(contact).to be_valid
  end

  it "タイトル, email, 内容が入っていなければ無効と判断" do
    contact = Contact.new
    expect(contact).not_to be_valid
  end

  it "タイトル, email, 内容が入っていない時エラーが表示されていれば妥当と判断" do
    contact = Contact.new
    contact.valid?
    expect(contact.errors[:title]).to include("を入力してください")
    expect(contact.errors[:email]).to include("を入力してください")
    expect(contact.errors[:content]).to include("を入力してください")
  end
end
