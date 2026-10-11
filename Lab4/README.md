# Лабораторна робота 4

Функції експертної системи.

## Файли

- `plants.clp`
- `test-input.clp`

## Запуск

Відкрийте CLIPS із робочою папкою цієї лабораторної або вкажіть повні шляхи до файлів.

```clips
(clear)
(load "plants.clp")
(reset)
(add-symptoms plant1 stunted-root-growth purplish)
(run)
(facts)
```
test-input.clp — альтернативні початкові факти; завантажте його перед reset,
якщо не вводите симптоми функцією add-symptoms.
