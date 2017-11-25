Rails.application.routes.draw do
  get '/competitive/codechef' => 'competitives#codechef'
  get '/competitive/spoj' => 'competitives#spoj'
  get '/competitive/hackerearth' => 'competitives#hackerearth'
end
