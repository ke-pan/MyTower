include FactoryGirl::Syntax::Methods

team = create :team, slug: 'abc'
project = create :project, team: team
tom = create :user, name: 'Tom'
jerry = create :user, name: 'Jerry'
todo = Todo.create title: '买奶酪', project: project
create :event, description: '创建了任务', resource: todo, team: team, user: tom, project: project
