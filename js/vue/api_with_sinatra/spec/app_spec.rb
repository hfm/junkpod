describe "My Sinatra Application" do
  before :all do
    get '/'
  end

  it 'should allow accessing the homepage' do
    expect(last_response).to be_ok
  end

  it 'should describe message' do
    expect(last_response.body).to include('This is MyApp')
  end
end
