require 'rails_helper'

RSpec.describe Notification, type: :model do
  describe "必須入力チェック" do
    context "必須入力項目が入力されている場合" do
      it "フォロー通知でゴールID、コメントID以外が入力されていると有効" do
        notification = FactoryBot.build(:notification,
                                        goal_id: nil,
                                        comment_id: nil,
                                        action: "follow")
        expect(notification).to be_valid
      end

      it "ブックマーク通知でコメントID以外が入力されていると有効" do
        notification = FactoryBot.build(:notification,
                                        comment_id: nil,
                                        action: "bookmark")
        expect(notification).to be_valid
      end

      it "コメント通知ですべての項目が入力されていると有効" do
        notification = FactoryBot.build(:notification,
                                        action: "comment")
        expect(notification).to be_valid
      end
    end

    context "必須入力項目が空欄の場合" do
      it "訪問者IDが入力されていないと無効" do
        notification = FactoryBot.build(:notification,
                                        visitor_id: nil)
        expect(notification).not_to be_valid
      end

      it "被訪問者IDが入力されていないと無効" do
        notification = FactoryBot.build(:notification,
                                        visited_id: nil)
        expect(notification).not_to be_valid
      end

      it "アクションが入力されていないと無効" do
        notification = FactoryBot.build(:notification,
                                        action: nil)
        expect(notification).not_to be_valid
      end

      it "ブックマーク通知でゴールIDが入力されていないと無効" do
        notification = FactoryBot.build(:notification,
                                        goal_id: nil,
                                        action: "bookmark")
        expect(notification).not_to be_valid
      end

      it "コメント通知でゴールIDが入力されていないと無効" do
        notification = FactoryBot.build(:notification,
                                        goal_id: nil,
                                        action: "comment")
        expect(notification).not_to be_valid
      end

      it "コメント通知でコメントIDが入力されていないと無効" do
        notification = FactoryBot.build(:notification,
                                        comment_id: nil,
                                        action: "comment")
        expect(notification).not_to be_valid
      end
    end
  end
end
