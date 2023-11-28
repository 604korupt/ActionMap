require 'faraday'
require 'json'

class Campaign < ActiveRecord::Base
  
  def self.find_candidates(url_params, api_key='9lcjslvwVjbqtX0KcQQ3W9rFm316caQQ2T89n4xA')
    category = Campaign.categories
    url = "https://api.propublica.org/campaign-finance/v1/#{url_params[:cycle]}/candidates/leaders/#{category[url_params[:categories]]}"
    string_json = Faraday.get(url, params=nil, headers={'X-API-Key': api_key})
    #parse Json
    response = JSON.parse(string_json.body)
    new_array = Array.new
    for i in 0...response["results"].length()
      name = response["results"][i]["name"]
      new_array.append(name)
    end
    new_array
  end

  def self.cycle
    [2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020]
  end
  
  def self.categories
    {'Candidate Loan' => 'candidate-loan.json',
     'Contribution Total' => 'contribution-total.json',
     'Debts Owed' => 'debts-owed.json',
     'Disbursements Total' => 'disbursements-total.json',
     'End Cash' => 'end-cash.json',
     'Individual Total' => 'individual-total.json',
     'PAC Total' => 'pac-total.json',
     'Receipts Total' => 'receipts-total.json',
     'Refund Total' => 'refund-total.json'}
  end
end