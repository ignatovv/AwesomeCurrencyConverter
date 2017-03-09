# AwesomeCurrencyConverter
##Demo currency conversion app with tier 1 architecture. 
##[SOLID](https://en.wikipedia.org/wiki/SOLID_(object-oriented_design)) driven application with [VIPER](https://www.objc.io/issues/13-architecture/viper/) architecture and [Typhoon](http://typhoonframework.org/) DI  😱😱😱
### 

The application for currency conversion at the [ECB](http://www.ecb.europa.eu/stats/eurofxref/eurofxref-daily.xml) exchange rate
The rate of currency rate updates is 30 seconds.
Converts 3 currencies: EUR, USD, GBP.
Only 2 currencies are displayed on the screen at a time. Uses cyclic carousel for switching between currencies. Editon of the currency cases a recalculation of the second currency.
User starts the application with 100 units of each available currency, app monitors and resolves the problems of funds shortage before conversion.

TODO:
* test 
* server response validation
* some UI tweaks
* error handling
* core data
* naming inconsistency

FIXME:
* UI-bug appeares in iPhone 7 when calling becomeFirstResponder in viewWillAppear:
