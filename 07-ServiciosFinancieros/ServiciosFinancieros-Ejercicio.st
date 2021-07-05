!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTest methodsFor: 'as yet unclassified' stamp: 'CC 7/4/2021 23:15:51'!
test01aTransferDecreaseSenderAccountBalanceAndIncreaseReceiverAccountBalance

	| receiverAccount senderAccount |
	senderAccount := ReceptiveAccount new.
	receiverAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: senderAccount.
	Transfer transfer: 20 * peso from: senderAccount to: receiverAccount.
		
	self assert: (80 * peso = senderAccount balance).
	self assert: (20 * peso = receiverAccount balance).
! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'CC 7/4/2021 20:34:36'!
test02ATransferKnowHisValue

	| receiverAccount senderAccount transfer |
	
	senderAccount := ReceptiveAccount new.
	receiverAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: senderAccount.
	transfer := Transfer transfer: 20 * peso from: senderAccount to: receiverAccount.
	
	self assert: (20 * peso = transfer value).
! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'CC 7/4/2021 23:17:36'!
test03aTransferWithdrawLegKnowsHisTransferDepositLeg

	| receiverAccount senderAccount aTransfer aDepositLeg aWithdrawLeg |
	
	senderAccount := ReceptiveAccount new.
	receiverAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: senderAccount.
	aTransfer := Transfer transfer: 20 * peso from: senderAccount to: receiverAccount.
	
	aWithdrawLeg := aTransfer withdrawLeg.
	aDepositLeg := aTransfer depositLeg.
	
	self assert: (aWithdrawLeg depositLeg = aDepositLeg ).
	

! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'CC 7/4/2021 23:18:23'!
test04aTransferDepositLegKnowsHisTransferWithdrawLeg

	| receiverAccount senderAccount aTransfer aDepositLeg aWithdrawLeg |
	
	senderAccount := ReceptiveAccount new.
	receiverAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: senderAccount.
	aTransfer := Transfer transfer: 20 * peso from: senderAccount to: receiverAccount.
	
	aWithdrawLeg := aTransfer withdrawLeg.
	aDepositLeg := aTransfer depositLeg.
	
	self assert: (aDepositLeg withdrawLeg = aWithdrawLeg ).
	

! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'CC 7/4/2021 23:18:59'!
test05ATransferAmountMustBePositive

	| receiverAccount senderAccount |
	
	senderAccount := ReceptiveAccount new.
	receiverAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: senderAccount.
	Deposit register: 50 * peso on: receiverAccount.
	
	self 
		should: [ Transfer transfer: 0 * peso from: senderAccount to: receiverAccount]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: anError messageText equals: Transfer invalidTransferAmountErrorText.
			self assert: 100 * peso = senderAccount balance.
			self assert: 50 * peso = receiverAccount balance.
		 ]! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'as yet unclassified' stamp: 'CC 7/4/2021 19:57:04'!
effectOnBalance

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'as yet unclassified' stamp: 'CC 7/4/2021 19:57:04'!
effectOnBalance
	
	^value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferLeg category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferLeg methodsFor: 'initialization' stamp: 'CC 7/4/2021 23:11:41'!
initializeFor: aTransfer

	transfer := aTransfer ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancieros-Ejercicio'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'as yet unclassified' stamp: 'CC 7/4/2021 23:13:07'!
effectOnBalance

	self subclassResponsibility ! !

!TransferLeg class methodsFor: 'as yet unclassified' stamp: 'CC 7/4/2021 23:12:22'!
registerOn: account for: aTransfer

	| transaction |
	
	transaction := self new initializeFor: aTransfer.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #TransferDepositLeg category: 'ServiciosFinancieros-Ejercicio'!
TransferLeg subclass: #TransferDepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferDepositLeg methodsFor: 'initialization' stamp: 'CC 7/4/2021 22:19:44'!
effectOnBalance
	
	^transfer value! !


!TransferDepositLeg methodsFor: 'as yet unclassified' stamp: 'CC 7/4/2021 22:04:27'!
withdrawLeg

	^transfer withdrawLeg! !


!classDefinition: #TransferWithdrawLeg category: 'ServiciosFinancieros-Ejercicio'!
TransferLeg subclass: #TransferWithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferWithdrawLeg methodsFor: 'initialization' stamp: 'CC 7/4/2021 22:19:55'!
effectOnBalance
	
	^transfer value negated! !


!TransferWithdrawLeg methodsFor: 'as yet unclassified' stamp: 'CC 7/4/2021 22:04:45'!
depositLeg

	^transfer depositLeg! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'as yet unclassified' stamp: 'CC 7/4/2021 19:57:04'!
effectOnBalance
	
	^value negated ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'CC 7/4/2021 19:57:04'!
balance

	^transactions sum: [ :aTransaction | aTransaction effectOnBalance ] ifEmpty: [ 0 ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'initialization' stamp: 'CC 7/4/2021 22:44:05'!
initializeFor: anAmount from: sourceAccount to: destinationAccount 

	
	withdrawLeg := TransferWithdrawLeg registerOn: sourceAccount for: self.
	depositLeg := TransferDepositLeg registerOn: destinationAccount for: self.

	value := anAmount.! !


!Transfer methodsFor: 'as yet unclassified' stamp: 'CC 7/4/2021 20:54:18'!
depositLeg

	^depositLeg! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'CC 7/4/2021 20:33:57'!
value

	^value! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'CC 7/4/2021 20:53:42'!
withdrawLeg
	
	^withdrawLeg! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'as yet unclassified' stamp: 'CC 7/4/2021 23:19:49'!
assertValidAmount: anAmount.

	anAmount > (0 * peso) ifFalse: [^self error: self invalidTransferAmountErrorText ]! !

!Transfer class methodsFor: 'as yet unclassified' stamp: 'CC 7/4/2021 22:42:12'!
invalidTransferAmountErrorText

	^'Invalid transfer amount'! !

!Transfer class methodsFor: 'as yet unclassified' stamp: 'CC 7/4/2021 23:08:10'!
transfer: anAmount from: sourceAccount to: destinationAccount

	self assertValidAmount: anAmount.
	
	^Transfer new initializeFor: anAmount from: sourceAccount to: destinationAccount.! !
