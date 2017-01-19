require 'json'
Facter.add(:netdata_charts) do
  setcode do
    charts_json = Facter::Core::Execution.exec('/usr/bin/curl -X GET http://localhost:19999/api/v1/charts | tr -d \'\\040\\011\\012\\015\'')
    charts_hash = JSON.parse(charts_json)
  end
end