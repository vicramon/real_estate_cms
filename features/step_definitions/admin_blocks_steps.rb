Given 'I have 1 block' do
  @block = Fabricate(:block, page: @page, header: 'header',
            subheader: 'subheader', text: 'text', image_align: 'right',
            image_url: 'https://www.filepicker.io/api/file/Vp4Zf9FJQrG9r2C0E8pq/convert?')
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

Then(/^I should see that my block is deleted$/) do
  page.should_not have_css '.block'
  Block.all.count.should == 0
end

When 'I click to delete the block' do
  click_link "Delete this block"
  have_css_wait
end

When(/^I fill out the block form$/) do
  fill_in "Header:", with: 'sup header'
  fill_in "Subheader:", with: 'sup subheader'
  fill_in "Text:", with: 'sup text'
  select 'right', from: 'Image alignment:'
  submit_form
end

Then(/^I should see that my block is persisted$/) do
  @block = Block.last
  @block.header.should == 'sup header'
  @block.subheader.should == 'sup subheader'
  @block.text.should == 'sup text'
  @block.image_align.should == 'right'
end

Given(/^I have 3 blocks$/) do
  @block1 = Fabricate(:block, header: 'Header 1', page: @page, position: 0)
  @block2 = Fabricate(:block, header: 'Header 2', page: @page, position: 1)
  @block3 = Fabricate(:block, header: 'Header 3', page: @page, position: 2)
end

When(/^I reorder my blocks$/) do
  @block3.update_attribute(:position, 0)
  @block1.update_attribute(:position, 2)
end

Then(/^I should see that my blocks are reordered$/) do
  visit edit_admin_page_path(@page)
  all('.block').first.all('input').first.value.should == 'Header 3'
end
