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
        expect(user).not_to be_valid
      end

      it "アドレスが空欄だと無効" do
        user = FactoryBot.build(:user, email: nil)
        expect(user).not_to be_valid
      end

      it "パスワードが空欄だと無効" do
        user = FactoryBot.build(:user, password: nil)
        expect(user).not_to be_valid
      end
    end
  end

  describe "重複チェック" do
    context "重複可能な情報が重複している場合" do
      it "パスワード、アイコン、自己紹介が重複していても有効" do
        user1 = FactoryBot.build(:user, name: "test1", email: "test1")
        user2 = FactoryBot.build(:user, name: "test2", email: "test2")
        expect(user1).to be_valid
        expect(user2).to be_valid
      end
    end

    context "重複不可の情報が重複している場合" do
      it "名前が重複していると無効" do
        user1 = FactoryBot.create(:user, name: "tester", email: "test1")
        user2 = FactoryBot.build(:user, name: "tester", email: "test2")
        expect(user1).to be_valid
        expect(user2).not_to be_valid
      end

      it "メールアドレスが重複していると無効" do
        user1 = FactoryBot.create(:user, name: "test1", email: "tester")
        user2 = FactoryBot.build(:user, name: "test2", email: "tester")
        expect(user1).to be_valid
        expect(user2).not_to be_valid
      end
    end
  end

  describe "文字数チェック" do
    context "文字数が十分な場合" do
      it "パスワードが8文字以上だと有効" do
        user = FactoryBot.build(:user, password: "testtest")
        expect(user).to be_valid
      end
    end

    context "文字数が不十分な場合" do
      it "パスワードが8文字未満だと無効" do
        user = FactoryBot.build(:user, password: "testtes")
        expect(user).not_to be_valid
      end
    end
  end

  describe "その他のチェック" do
    context "論理チェック" do
      it "パスワードと確認用パスワードが不一致だと無効" do
        user = FactoryBot.build(:user, password: "test", password_confirmation: "testtest")
        expect(user).not_to be_valid
      end
    end
  end
end
