crumb :root do
  link "Home", root_path
end

# マイページ関連
crumb :mypage do |user|
  link "@#{user.name}", mypage_path(user)
  parent :root
end

crumb :edit_mypage do |user|
  link 'プロフィール編集', edit_mypage_path(user)
  parent :mypage, user
end

# レビュー関連
# review#index
crumb :review do
  link "みんなのレビュー一覧", reviews_path
end

# review#show
crumb :review_show do |review|
  link "#{review.name}", review_path(review)
  parent :review
end

# review#new
crumb :review_new do
  link "新規レビュー作成", new_review_path
end

# review#edit
crumb :review_edit do |review|
  link 'レビュー編集', edit_review_path(review)
  parent :review_show, review
end

# skinual#question
crumb :question do
  link "肌質診断テスト", question_path
end

# Ranking
crumb :ranking do
  link "レビューランキング", ranking_path
end

# Privacy_policy
crumb :privacy do
  link "プライバシーポリシー", privacy_policy_path
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).