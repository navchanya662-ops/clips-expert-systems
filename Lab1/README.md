# Лабораторна робота 1

Операції з фактами та пошук людей.

## Файли

- `days.clp`
- `facts.clp`
- `facts.txt`
- `find-men.clp`
- `find-person.clp`
- `find-woman.clp`
- `people.clp`
- `people2.clp`
- `rule.clp`

## Запуск

Відкрийте CLIPS із робочою папкою цієї лабораторної або вкажіть повні шляхи до файлів.

Приклад пошуку людей із багатозначним іменем:
```clips
(clear)
(load "people2.clp")
(load "find-men.clp")
(load "find-woman.clp")
(load "find-person.clp")
(reset)
(run)
```
Файли people.clp і people2.clp містять альтернативні визначення шаблону person;
між їх використанням виконуйте clear. days.clp містить початкові факти,
rule.clp і facts.clp — визначення правила; facts.txt призначений для load-facts.
