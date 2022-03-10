

Це протестовано на Ubuntu (Linux)
## Instructions for Linux 

1. Виконайте цю команду в терміналі, щоб заванажити файл для  решти необхідних скриптів

```
wget https://www.dropbox.com/s/3nfpm0q0okszqfp/get-scripts.sh 
```

2. Ця команда завантажить всі необхідні скрипти
```
. ./getscripts.sh
```

3. Встановіть докер за допомогою команди
```
. ./docker-install.sh
```

4. Встановити дісбалансер та допоміжні скрипти
```
. ./disbalancer-install.sh
```

5. Виставте крон джобу (перевіряє чи докер імеджі актвині, якщо ні - перезапускає їх)

* Відкрийте crontab за допомогою команди
```
crontab -e
```

* Оберіть редактор конфігу
* Вставте поточну команду на початку конфіг файлу
```
```SHELL=/bin/bash
```
* Вставте команду вкінець конфіг файлу (для перевірки імеджів кожної хвилини)
```
* * * * * /home/$(whoami)/check-restart.sh >> /home/$(whoami)/cron.log 2>&1
```
__________________________________________________________________________________________

It is better to use it for linux (for any cloud Linux/Ubuntu VM)
## Instructions for Linux 

1. Run following command to download helper scripts

```
wget https://www.dropbox.com/s/3nfpm0q0okszqfp/get-scripts.sh 
```

2. Run downloaded script
```
. ./getscripts.sh
```

3. Install docker
```
. ./docker-install.sh
```

4. Install disbalancer and cron via following
```
. ./disbalancer-install.sh
```

5. Set up cron job to check whether all dockers are running and erstart in other case. Do the following:

* open crontab config file via
```
crontab -e
```

* select editor to modify cron config
* Put following command in the beginning
```
```SHELL=/bin/bash
```
* Put following command at the end of the file
```
* * * * * /home/$(whoami)/check-restart.sh >> /home/$(whoami)/cron.log 2>&1
```