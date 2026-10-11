# Лабораторна робота 3

База правил експертної системи.

## Файли

- `task1.clp`
- `task2.clp`

## Запуск

Відкрийте CLIPS із робочою папкою цієї лабораторної або вкажіть повні шляхи до файлів.

```clips
(clear)
(load "task1.clp")
(reset)
(run)
```
Для експертної системи рослин окремо:
```clips
(clear)
(load "task2.clp")
(reset)
(assert (symptom (plant plant1) (kind stunted-root-growth)))
(assert (symptom (plant plant1) (kind purplish)))
(run)
(facts)
```
