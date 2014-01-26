Given 'I have 1 block' do
  @block = Fabricate(:block, page: @page, header: 'header',
            subheader: 'subheader', text: 'text', image_align: 'right')
end

When(/^I make changes to my first block$/) do
  within ".block" do
    fill_in 'Header:', with: 'My Header'
    fill_in 'Subheader:', with: 'My Subheader'
    fill_in 'Text:', with: 'My Text'
    select 'left', from: 'Image alignment:'
  end
  submit_form
end

Then(/^those changes to my block should be persisted$/) do
  @block = @block.reload
  @block.header.should == 'My Header'
  @block.subheader.should == 'My Subheader'
  @block.text.should == 'My Text'
  @block.image_align.should == 'left'
end
