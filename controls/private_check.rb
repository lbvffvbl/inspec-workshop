control "Private net check" do
  title "test private net"
  describe "private net"
  describe interface('eth1') do
    it { should be_up }
  end
  describe command("IP=$(ifconfig eth1 | awk '/inet addr/{print substr($2,6)}');timeout 10 tcpdump -v arp -i eth1 dst  $IP") do
    its('stderr') {should_not match '0 packets captured'} 
  end
end
