require 'rails_helper'

RSpec.describe Video, type: :model do
  describe 'Videoモデル' do
    it 'バリデーションが発生していないこと' do
      video = build(:video)
      expect(video).to be_valid
    end
  end
end
