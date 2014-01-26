require 'spec_helper'

describe User do

  describe '#admin_for' do
    let(:site) { Fabricate(:site) }

    context 'user is an admin of that site' do
      let(:user) { Fabricate(:user, site: site, admin: true) }
      it 'returns true' do
        user.admin_for(site).should == true
      end
    end

    context 'user is an admin of another site' do
      let(:user) { Fabricate(:user, site: Fabricate(:site), admin: true) }
      it 'returns false' do
        user.admin_for(site).should == false
      end
    end

    context 'user belongs to site but is not an admin' do
      let(:user) { Fabricate(:user, site: site, admin: false) }
      it 'returns false' do
        user.admin_for(site).should == false
      end
    end

    context 'user is a super admin' do
      let(:user) { Fabricate(:user, admin: false, super_admin: true) }
      it 'returns true' do
        user.admin_for(site).should == true
      end
    end

  end
end
