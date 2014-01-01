Given(/^I am in home page$/) do
  visit "http://marketupdate.nl"
end
When(/^I click "(.*?)" item$/) do |news_menu_item|
  within('#menu-hoofdmenu')do
    find('a', :text => news_menu_item).click
  end
  sleep 1.to_i
end

Then(/^am shown "(.*?)"$/) do |news_heading|
  find('h1.postsby',:text => news_heading).text.should == news_heading
end

When(/^I search for a news in market update nl website$/) do
  fill_in 's', :with => 'gould'
  click_on('search-image')
end

Then(/^am shown with news related to my search$/) do
  all('.post excerpt ').each do |element|
    puts "the heading is #{element.text}"
  end
end

Then(/^am shown (\d+) main menus$/) do |main_menu_count|
  within('ul#menu-header-menu') do
    all('a').count.to_i.should == main_menu_count.to_i
  end
end

And(/^am shown (\d+) news menus$/) do |news_menu_count|
  within('ul#menu-hoofdmenu') do
    all('li').count.to_i.should == news_menu_count.to_i
  end
end

And(/^am shown email send option$/) do
  find('.textwidget', :text => 'email:').text.should == 'email:'
  find('h3',:text => 'Twitter').text.should == 'Twitter'
  #within('ul.sidebar_list') do
  #  puts "the value of href is #{all('li.widget.widget-sidebar').count}"
  #  required_element =  all('li.widget.widget-sidebar')[2]
  #  puts "sfdsfsdf#{required_element.find('h3').text}"
  #   #puts "the href value is #{find(  ('a')).inspect}"
  #end
end

And(/^am shown (\d+) youtube videos$/) do |youtube_count|
  actual_count=0
  all('iframe').each do |iframe|
    result =  iframe[:src]
    if(result.include?('youtube.com'))
      actual_count = actual_count+1
    end
  end
  raise "Youtube videos expected is  #{youtube_count} ;actual is  #{actual_count}" if !actual_count == youtube_count.to_i

end
When(/^shown twitter option$/) do
  status = false
  all('iframe').each do |iframe|
    result =  iframe[:id]
    if result.include?("twitter-widget-0")
      status= true
    end
  end
  status.should == true
end

And(/^am shown popular and comments tab$/) do
  number_tabs_shown =0
  within('.sidebar_list') do
    all('.tab-links li').each do |element|
      if(!element.text.nil?)
        number_tabs_shown = number_tabs_shown +1
      end
    end
  end
  number_tabs_shown.should == 2
end
When(/^am shown poll options$/) do
  within('.sidebar_list') do
    find('.pds-question-top').text.should == 'Tapering is begonnen, waar staat QE over een jaar?'
    find('div.pds-vote a.pds-vote-button').text.should == 'Vote'
  end

end
When(/^am shown all ads at the top$/) do
  within('#header') do
    #puts "the number of image is #{('img').count} "
    all('img').each do |element|
      element[:src].should == 'http://marketupdate.nl/wp-content/uploads/2013/08/111.gif'
    end
  end
end