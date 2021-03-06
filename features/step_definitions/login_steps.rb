Given(/^I am a registered user with the username "([^"]*)" and password "([^"]*)"$/) do |name, password|
  @user = User.new(id: 500, name: name, email: 'any_name@gmail.com', password: password) 
  @user.save  
  @user.confirmed_email = true
  @user.save
  @ingredient = Ingredient.new(name: "Cebola", unit_of_measure: "Unidade")
  @ingredient.save
  @ingredients = IngredientsUser.new(user_id: @user.id, ingredient_id: @ingredient.id, quantity: 20)
  @ingredients.save
end

Given(/^I am on "([^"]*)"$/) do |location|
  visit (location)
end

Given(/^I fill in user_name with "([^"]*)"$/) do |user_name|
  fill_in "user[name]", :with => user_name  
end

Given(/^I fill in user_password with "([^"]*)"$/) do |user_password|
  fill_in "user[password]", :with => user_password  
end

Then(/^I should be on "([^"]*)"$/) do |location| 
  expect(page).to have_current_path("/"+location)
end