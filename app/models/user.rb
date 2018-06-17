class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable,
         :rememberable, :trackable, :validatable

has_many :tasks

  def all_tasks
    self.tasks + Parent.find(self.parent_id).tasks.where(user_id: nil)
  end

  def free_tasks
    Parent.find(self.parent_id).tasks.where(user_id: nil)
  end

  def task_status(task, status)
    Task.find(task).update(status: status) if (status == 'in progress' || status == 'done')
  end

  def progress
    task_amount = []
    task_amount << [balance: self.balance]
    task_amount << [open: self.tasks.where(status: 'open').count]
    task_amount << [in_progress: self.tasks.where(status: 'in_progress').count]
    task_amount << [done: self.tasks.where(status: 'done').count]
    task_amount << [verified: self.tasks.where(status: 'verified').count]
    task_amount << [failed: self.tasks.where(status: 'failed').count]
    task_amount
  end
end
