require 'serverspec'

# Required by serverspec
set :backend, :exec

describe command('gcloud --version') do
  its(:exit_status) { should eq 0 }
  its(:stdout) { should match /Google Cloud SDK 136\.0\.0/ }
end