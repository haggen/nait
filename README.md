# Nait

> Simple task/issue tracker with time sheet.

## Please, note that:

- This is a pet project
- It's at early stages of development
- You're most welcome to test it and send me feedback

## Summary

**Nait** is a simple entry tracker with the ability to log hours.
An entry might be an issue, a task, or a simple topic of discussion.
You can tag it with a status and log time spent. Everything is categorized by a project.

Things will evolve from here. Users will have different roles and permissions, there will be discussion boards, packages to group entries with a same due date, calendar view, activity history, and much more.
But for now, its primary goal is to aid me in my own projects, so the priorities will be set accordingly.

## Tech stuff

- Git
- Rails 4
- PostgreSQL 9

```shell
$ bundle install
$ rake db:setup
$ rails server
```

You may have to create the database manually: `$ createdb nait_development`.
