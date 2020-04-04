require 'rails_helper'

RSpec.describe Project, type: :model do
  # ユーザー単位では重複したプロジェクト名を許可しない
  it "does not allow duplicate project names per user" do
    user = User.create(
      first_name: "Aaron",
      last_name: "Sumner",
      email: "tester@example.com",
      password: "dottle-nouveau-pavilion-tights-furze"
    )
    
    user.projects.create(
      name: "Test Project"
    )
    new_project = user.projects.build(
      name: "Test Project"
    )
    new_project.valid?
    expect(new_project.errors[:name]).to include("has already been taken")
  end

  # 二人のユーザーが同じ名前を使うことは許可する
  it "allow two users to share a project name" do
    user = User.create(
      first_name: "Aaron",
      last_name: "Sumner",
      email: "tester@example.com",
      password: "dottle-nouveau-pavilion-tights-furze"
    )

    other_user = User.create(
      first_name: "Agent",
      last_name: "Maximum",
      email: "test@example.com",
      password: "password"
    )

    user.projects.create(
      name: "Test Project"
    )
    new_project = other_user.projects.build(
      name: "Test Project"
    )
    expect(new_project).to be_valid
  end
end
