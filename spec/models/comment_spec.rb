require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "必須入力チェック" do
    context "必須入力項目が入力されている場合" do
      it "コメントが入力されていると有効" do
        comment = FactoryBot.build(:comment)
        expect(comment).to be_valid
      end
    end

    context "必須入力項目が空欄の場合" do
      it "コメントが空欄だと無効" do
        comment = FactoryBot.build(:comment, comment: nil)
        expect(comment).not_to be_valid
      end
    end
  end
end
