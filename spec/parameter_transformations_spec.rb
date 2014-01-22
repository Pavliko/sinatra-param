require 'spec_helper'

describe 'Parameter Transformations' do
  describe 'default' do
    it 'sets a default value when none is given' do
      get('/default') do |response|
        response.status.should == 200
        JSON.parse(response.body)['sort'].should == 'title'
      end
    end
  end

  describe 'transform' do
    it 'simple transforms the input using send' do
      get('/transform/simple', order: 'asc') do |response|
        response.status.should == 200
        JSON.parse(response.body)['order'].should == 'ASC'
      end
    end

    it 'simple transforms the input using send' do
      get('/transform/with_params', month: '2014-01-20') do |response|
        response.status.should == 200
        JSON.parse(response.body)['month'].should == '2014-01-01'
      end
    end
  end
end
