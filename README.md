# monitoring-docker-project
Данный мониторинг используется на проектах, где сбор, хранение и вычисление данных происходит на нескольких нодах. Так же можно подключить мониторинг комплексов, откуда эти данные собираются.<br>
Деплой осуществляется с помощью данной  <a href="https://github.com/issekel/ansible_roles/tree/main/docker-compose-run">ansible role</a><br>
Все prometheus rules переработы по severity, изменены warning и critical. Алерты с critical отправляются с помощью webhook в мессенджер zulip, warning отправляются в slack. Ко всем алертам будет добавлен label с именем проекта и ссылка на prometheus.<br>
Отслеживаются все показатели hardware node, containers, сбора логов. В качестве источника данных для prometheus используется consul, для loki используется fluent-bit с методом tail, при изменении стандартного пути записи логов (/var/lib/docker/containers) создайте символическую ссылку.
