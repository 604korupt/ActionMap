require 'rails_helper'
require 'spec_helper'

describe 'Searching for representatives should not add duplicates to database' do
  context 'refreshes search many times' do
      it 'returns an array of representatives' do
          sample_info = double('Google::Apis::CivicinfoV2::RepresentativeInfoResponse')
          stub_official = [double('Google::Apis::CivicinfoV2::Official', name: 'Joseph R. Biden', address: nil,
                          party: 'Democratic Party', photo_url: '')]

          allow(stub_official[0]).to receive_message_chain(:address, nil?: true)
          allow(sample_info).to receive_messages(officials: stub_official)

          stub_offices = [double('Google::Apis::CivicinfoV2::Office')]
          allow(stub_offices[0]).to receive_messages(official_indices: double('indicies', include?: true))
          allow(stub_offices[0]).to receive_messages(name: 'Joseph R. Biden')
          allow(stub_offices[0]).to receive_messages(division_id: 'ocd-division/country:us')

          allow(sample_info).to receive_messages(offices: stub_offices)

          result = Representative.civic_api_to_representative_params(sample_info)
          expect(result.size).to be >= 1
          total = Representative.count
          Representative.civic_api_to_representative_params(sample_info)
          expect(Representative.count).to eq(total)
      end
  end
end
