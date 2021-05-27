require 'rails_helper'

RSpec.describe User, type: :model do
  describe "必須入力チェック" do
    context "必須入力項目が入力されている場合" do
      it "すべての項目が入力されていると有効" do
        user = FactoryBot.build(:user)
        expect(user).to be_valid
      end

      it "画像と自己紹介は空欄でも有効" do
        user = FactoryBot.build(:user, image: nil, introduce: nil)
        expect(user).to be_valid
      end
    end

    context "必須入力項目が空欄の場合" do
      it "名前が空欄だと無効" do
        user = FactoryBot.build(:user, name: nil)
        expect(user).to_not be_valid
      end

      it "アドレスが空欄だと無効" do
        user = FactoryBot.build(:user, email: nil)
        expect(user).to_not be_valid
      end

      it "パスワードが空欄だと無効" do
        user = FactoryBot.build(:user, password: nil)
        expect(user).to_not be_valid
      end
    end
  end

  describe "その他のチェック" do
    context "論理チェック" do
      it "パスワードと確認用パスワードが不一致だと無効" do
        user = FactoryBot.build(:user, password: "test", password_confirmation: "testtest")
        expect(user).to_not be_valid
      end
    end
  end
end
