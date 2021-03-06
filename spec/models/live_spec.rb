require 'rails_helper'

RSpec.describe Live, type: :model do
  let(:band) {FactoryBot.create(:devise_band)}
  let(:live) {FactoryBot.create(:live, band: FactoryBot.create(:devise_band))}
  let(:place) {FactoryBot.create(:place, live: FactoryBot.create(:live, band: FactoryBot.create(:devise_band)))}
  let(:act) {FactoryBot.create(:act, live: FactoryBot.create(:live, band: FactoryBot.create(:devise_band)))}

  describe 'バリデーションチェック' do

    it 'Titleが空だと失敗すること' do
      live.title = ''
      live.valid?
      expect(live.errors[:title]).to include('を入力してください')
    end

    it 'Titleが31文字以上だと失敗すること' do
      live.title = ('a' * 101)
      live.valid?
      expect(live.errors[:title]).to include('は100文字以内で入力してください')
    end

    it 'Dateが空だと失敗すること' do
      live.date = ''
      live.valid?
      expect(live.errors[:date]).to include('を入力してください')
    end

    it 'Actが空だと失敗すること' do
      act.name = ''
      act.valid?
      expect(act.errors[:name]).to include('を入力してください')
    end

    it 'Placeが空だと失敗すること' do
      place.name = ''
      place.valid?
      expect(place.errors[:name]).to include('を入力してください')
    end

    it '全て正しく登録されてれば成功すること' do
      expect(live).to be_valid
    end

  end
end