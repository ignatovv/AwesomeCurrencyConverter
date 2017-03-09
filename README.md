# AwesomeCurrencyConverter
##Demo currency conversion app with tier 1 architecture. 
##[SOLID](https://en.wikipedia.org/wiki/SOLID_(object-oriented_design)) driven application with [VIPER](https://www.objc.io/issues/13-architecture/viper/) architecture and [Typhoon](http://typhoonframework.org/) DI  😱😱😱
### 

Реализовать приложение для конвертации валют по курсу ECB
(http://www.ecb.europa.eu/stats/eurofxref/eurofxref-daily.xml)
Частота обновления курса валют 30 сек.
Конвертировать 3 валюты EUR, USD, GBP.
На экране одновременно отображаются только 2 валюты. Переключение между валютами - циклическая карусель.Пользователь может редактировать любую из валют, при этом производится пересчет второй валюты. При переключении валюты - производится пересчет.
Отображать курс конвертируемой валюты.
По клику "Exchange" произвести конвертацию.
У пользователя после запуска приложения по 100 единиц каждой доступной валюты, необходимо отслеживать и уведомлять пользователя о нехватке средств до конвертации. 

TODO:
* comments
* test 
* server response validation
* some UI tweaks
* error handling
* core data
* naming

FIXME:
* UI-bug appeares in iPhone 7 when calling becomeFirstResponder in viewWillAppear:
