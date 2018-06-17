class Parent < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable,
         :rememberable, :trackable, :validatable

  has_many :tasks
  has_many :users


  def create_task(title, description, reward)
    Task.create(title: title, description: description, reward: reward,
                 parent_id: self.id, status: 'open')
  end

  def create_user(email, password, full_name)
    User.create!(email: email, password: password, parent_id: self.id,
                 full_name: full_name, balance: 0)
  end

  def task_assign_to(task, user)
    Task.find(task).update(user_id: user)
  end

  def task_amount
    task_amount = []
    Parent.last.users.each do |user|
      task_amount << [user: user.full_name]
      task_amount << [open: user.tasks.where(status: 'open').count]
      task_amount << [in_progress: user.tasks.where(status: 'in_progress').count]
      task_amount << [done: user.tasks.where(status: 'done').count]
      task_amount << [verified: user.tasks.where(status: 'verified').count]
      task_amount << [failed: user.tasks.where(status: 'failed').count]
    end
    task_amount
  end
end
