# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

require 'google/apis/civicinfo_v2'

RSpec.describe Representative, type: :model do
  before do
    service = Google::Apis::CivicinfoV2::CivicInfoService.new
    service.key = Rails.application.credentials[:GOOGLE_API_KEY]
    @rep_info = service.representative_info_by_address(address: 'California')
    described_class.civic_api_to_representative_params(@rep_info)
  end

  context 'when the API is called' do
    it 'updates the database given the address' do
      @president = described_class.find_by(name: 'Joseph R. Biden')
      expect(@president.name).to eq 'Joseph R. Biden'
      expect(@president.title).to eq 'President of the United States'
      expect(@president.address).to eq '1600 Pennsylvania Avenue Northwest, Washington, DC 20500'
      expect(@president.party).to eq 'Democratic Party'
    end

    it 'does not create duplicates to the database' do
      # since this should not create duplicates, let's call the api again
      described_class.civic_api_to_representative_params(@rep_info)
      @multiple_presidents = described_class.where({ name: 'Joseph R. Biden' })
      expect(@multiple_presidents.length).to eq 1
    end
  end

  context 'when there are multiple representatives on the search page' do
    it 'shows a profile page of the vice president' do
      @vice_pres = described_class.find_by(name: 'Kamala D. Harris')
      expect(@vice_pres.title).to eq 'Vice President of the United States'
      expect(@vice_pres.ocdid).to eq 'ocd-division/country:us'
      expect(@vice_pres.address).to eq '1600 Pennsylvania Avenue Northwest, Washington, DC 20500'
      expect(@vice_pres.party).to eq 'Democratic Party'
    end

    it 'shows a profile page of the govenernor of California' do
      @govenernor = described_class.find_by(name: 'Gavin Newsom')
      expect(@govenernor.title).to eq 'Governor of California'
      expect(@govenernor.ocdid).to eq 'ocd-division/country:us/state:ca'
      expect(@govenernor.party).to eq 'Democratic Party'
    end
  end

  context 'when there is an unknown representative' do
    it 'returns nil' do
      @unknown = described_class.find_by(name: 'Super Idol')
      expect(@unknown).to be_nil
    end
  end
end
