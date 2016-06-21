include FactoryGirl::Syntax::Methods

Timecop.travel(1.month.ago)
team = create :team, slug: 'abc'
project = create :project, team: team
tom = create :user, name: 'Tom'
jerry = create :user, name: 'Jerry'
todo = Todo.create title: '买奶酪', project: project
create :event, description: '创建了任务', resource: todo, team: team, user: tom, project: project
Timecop.travel(1.hour.from_now)
todo.update(assignee: jerry)
create :event, description: '给 Jerry指派了任务', resource: todo, team: team, user: tom, project: project
Timecop.travel(1.hour.from_now)
todo.update(status: Todo.statuses[:run])
create :event, description: '开始处理这条任务', resource: todo, team: team, user: jerry, project: project
Timecop.travel(1.hour.from_now)
todo.update(status: Todo.statuses[:paused])
create :event, description: '暂停处理这条任务', resource: todo, team: team, user: jerry, project: project
Timecop.travel(1.hour.from_now)
todo.update(status: Todo.statuses[:finished])
create :event, description: '完成了任务', resource: todo, team: team, user: jerry, project: project
Timecop.travel(1.hour.from_now)
todo.update(status: Todo.statuses[:paused])
create :event, description: '重新打开了任务', resource: todo, team: team, user: jerry, project: project
Timecop.travel(1.hour.from_now)
todo.update(assignee: tom)
create :event, description: '把 Jerry 的任务指派给 Tom', resource: todo, team: team, user: jerry, project: project
Timecop.travel(1.hour.from_now)
todo.destroy
create :event, description: '删除了任务', resource: todo, team: team, user: tom, project: project
Timecop.travel(1.hour.from_now)
todo.restore
create :event, description: '恢复了任务', resource: todo, team: team, user: tom, project: project
Timecop.travel(40.minutes.from_now)
comment = create :comment, content: '奶酪花费 2 元', todo: todo
create :event, description: '回复了任务', resource: todo, team: team, user: tom,
               project: project, comment: comment


Timecop.return
