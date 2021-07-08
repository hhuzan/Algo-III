!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'testing' stamp: 'CC 7/7/2021 21:35:24'!
test01anEmptyPortfolioHasZeroAsBalance 

	| aPortfolio |
	
	aPortfolio := PortfolioAccount new.
	
	self assert: (0 * peso = aPortfolio balance )

! !

!PortfolioTest methodsFor: 'testing' stamp: 'CC 7/7/2021 21:35:24'!
test02aNewPortfolioWithOneAccountKnowsHisBalance

	| anAccount aPortfolio |

	anAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: anAccount.
	
	aPortfolio := PortfolioAccount new add: anAccount.
	
	self assert: (100 * peso = aPortfolio balance )

! !

!PortfolioTest methodsFor: 'testing' stamp: 'CC 7/7/2021 21:35:24'!
test03aPortfolioWithMultipleAccountsKnowsHisBalance

	| anAccount aPortfolio anotherAccount |

	anAccount := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: anAccount.	
	Deposit register: 100 * peso on: anotherAccount.
	
	aPortfolio := (PortfolioAccount new add: anAccount )add: anotherAccount.
	
	self assert: (200 * peso = aPortfolio balance )

! !

!PortfolioTest methodsFor: 'testing' stamp: 'CC 7/7/2021 21:35:24'!
test04aPortfolioKnowsRegisteredTransactions

	| anAccount aPortfolio aDeposit |

	anAccount := ReceptiveAccount new.
	aDeposit := Deposit register: 100 * peso on: anAccount.	
	
	aPortfolio := PortfolioAccount new add: anAccount.
	
	self assert: ( aPortfolio hasRegistered: aDeposit )

! !

!PortfolioTest methodsFor: 'testing' stamp: 'CC 7/7/2021 21:35:24'!
test05aPortfolioDoNotKnowNotRegiteredTransactions

	| anAccount aPortfolio aDeposit anotherAccount |

	anAccount := ReceptiveAccount new.
	anotherAccount :=  ReceptiveAccount new.
	aDeposit := Deposit register: 100 * peso on: anotherAccount.	
	
	aPortfolio := PortfolioAccount new add: anAccount.
	
	self deny: ( aPortfolio hasRegistered: aDeposit )
	

! !

!PortfolioTest methodsFor: 'testing' stamp: 'CC 7/7/2021 23:10:31'!
test06aPortfolioWithOneAccountKnowsItsTransactions

	| anAccount aPortfolio aDeposit |

	anAccount := ReceptiveAccount new.
	aDeposit := Deposit register: 100 * peso on: anAccount.	
	
	aPortfolio := PortfolioAccount new add: anAccount.

	
	self assert: ( aPortfolio transactions includes: aDeposit ).
	self assert: 1 equals: aPortfolio transactions size.
	

! !

!PortfolioTest methodsFor: 'testing' stamp: 'CC 7/7/2021 23:10:45'!
test07aPortfolioWithMultipleAccountsKnowsItsTransactions

	| anAccount anotherAccount aPortfolio aDeposit aWithdraw |

	anAccount := ReceptiveAccount new.
	anotherAccount := ReceptiveAccount new.
	aDeposit := Deposit register: 100 * peso on: anAccount.	
	aWithdraw := Withdraw register: 50 * peso on: anotherAccount.
	
	aPortfolio := ( PortfolioAccount new add: anAccount ) add: anotherAccount.

	self assert: ( aPortfolio transactions includes: aDeposit ).
	self assert: ( aPortfolio transactions includes: aWithdraw ).
	self assert: 2 equals: aPortfolio transactions size.
	
	
	

! !

!PortfolioTest methodsFor: 'testing' stamp: 'CC 7/7/2021 23:10:53'!
test08aComposedPortfolioKnowsItsTransactionsAndBalance

	"Este test pasaba pero lo dejamos para testear funcionalidad de portfolios compuestos "

	| anAccount aPortfolio composedPortfolio aDeposit |

	anAccount := ReceptiveAccount new.
	aDeposit := Deposit register: 100 * peso on: anAccount.	
	
	aPortfolio := PortfolioAccount new add: anAccount.
	composedPortfolio :=  PortfolioAccount new add: aPortfolio.

	self assert: ( composedPortfolio transactions includes: aDeposit ).
	self assert: (100 * peso = composedPortfolio balance ).
	self assert: 1 equals: composedPortfolio transactions size.
	
	
	

! !


!classDefinition: #PortfolioTestExtra category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTestExtra
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTestExtra methodsFor: 'testing' stamp: 'CC 7/8/2021 00:42:58'!
test01PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| anAccount aPortfolio |

	anAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: anAccount.
	
	aPortfolio := PortfolioAccount new add: anAccount.
	
	self 
		should: [ aPortfolio add: anAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: anError messageText equals: PortfolioAccount duplicateAccountErrorText.
			self assert: (100 * peso = aPortfolio balance )
		 ]	
	
	



! !

!PortfolioTestExtra methodsFor: 'testing' stamp: 'CC 7/8/2021 00:44:27'!
test02ComposedPortfolioCanNotIncludeTheSameAccountMoreThanOnce


	| anAccount aPortfolio aComposedPortfolio |

	anAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: anAccount.
	
	aPortfolio := PortfolioAccount new add: anAccount.
	aComposedPortfolio := PortfolioAccount new add: aPortfolio. 
	
	self 
		should: [ aComposedPortfolio add: anAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: anError messageText equals: PortfolioAccount duplicateAccountErrorText.
			self assert: (100 * peso = aComposedPortfolio balance )
		 ]	
	
	



! !

!PortfolioTestExtra methodsFor: 'testing' stamp: 'CC 7/8/2021 00:45:54'!
test03PortfolioCanNotIncludesItsSelf

	| aPortfolio  |

	aPortfolio := PortfolioAccount new.
	
	self 
		should: [ aPortfolio add: aPortfolio. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: anError messageText equals: PortfolioAccount duplicateAccountErrorText.
			self assert: (0 * peso = aPortfolio balance )
		 ]	
! !

!PortfolioTestExtra methodsFor: 'testing' stamp: 'CC 7/8/2021 00:47:04'!
test04ComposedPortfolioCanNotHaveParentPortfolioAccount

	| anAccount sonPortfolio fatherPortfolio |

	anAccount := ReceptiveAccount new.
	
	fatherPortfolio := PortfolioAccount new add: anAccount.
	sonPortfolio := PortfolioAccount new.
	fatherPortfolio add: sonPortfolio. 
	
	self 
		should: [ sonPortfolio add: anAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: anError messageText equals: PortfolioAccount duplicateAccountErrorText.
		 ]	
	
	



! !

!PortfolioTestExtra methodsFor: 'testing' stamp: 'CC 7/8/2021 00:49:10'!
test05ComposedPortfolioCanNotAddAPortfolioWithAccountAlreadyInclude

	| anAccount sonPortfolio fatherPortfolio |

	anAccount := ReceptiveAccount new.
	
	fatherPortfolio := PortfolioAccount new add: anAccount.
	sonPortfolio := PortfolioAccount new add: anAccount.
	
	self 
		should: [ 	fatherPortfolio add: sonPortfolio.  ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: anError messageText equals: PortfolioAccount duplicateAccountErrorText.
		 ]	
	
	



! !


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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'CC 7/7/2021 23:11:26'!
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

!TransferTest methodsFor: 'testing' stamp: 'CC 7/4/2021 23:15:51'!
test01aTransferDecreaseSenderAccountBalanceAndIncreaseReceiverAccountBalance

	| receiverAccount senderAccount |
	senderAccount := ReceptiveAccount new.
	receiverAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: senderAccount.
	Transfer transfer: 20 * peso from: senderAccount to: receiverAccount.
		
	self assert: (80 * peso = senderAccount balance).
	self assert: (20 * peso = receiverAccount balance).
! !

!TransferTest methodsFor: 'testing' stamp: 'CC 7/4/2021 20:34:36'!
test02ATransferKnowHisValue

	| receiverAccount senderAccount transfer |
	
	senderAccount := ReceptiveAccount new.
	receiverAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: senderAccount.
	transfer := Transfer transfer: 20 * peso from: senderAccount to: receiverAccount.
	
	self assert: (20 * peso = transfer value).
! !

!TransferTest methodsFor: 'testing' stamp: 'CC 7/4/2021 23:17:36'!
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

!TransferTest methodsFor: 'testing' stamp: 'CC 7/4/2021 23:18:23'!
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

!TransferTest methodsFor: 'testing' stamp: 'CC 7/4/2021 23:18:59'!
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


!classDefinition: #Account category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Account methodsFor: 'accesing' stamp: 'CC 7/7/2021 21:36:17'!
balance

	self subclassResponsibility ! !

!Account methodsFor: 'accesing' stamp: 'CC 7/7/2021 21:37:09'!
transactions 

	self subclassResponsibility ! !


!Account methodsFor: 'private' stamp: 'CC 7/7/2021 23:13:42'!
verifyDuplicity: anAccount 

	self subclassResponsibility ! !

!Account methodsFor: 'private' stamp: 'CC 7/8/2021 00:19:52'!
verifySonsAreNotIn: aPortfolioAccount

	self subclassResponsibility ! !


!Account methodsFor: 'comparing' stamp: 'CC 7/7/2021 21:36:54'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Account class' category: 'ServiciosFinancieros-Ejercicio'!
Account class
	instanceVariableNames: ''!

!Account class methodsFor: 'error' stamp: 'CC 7/7/2021 23:04:31'!
duplicateAccountErrorText

	^'Error cuenta duplicada'! !


!classDefinition: #PortfolioAccount category: 'ServiciosFinancieros-Ejercicio'!
Account subclass: #PortfolioAccount
	instanceVariableNames: 'accounts root'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioAccount methodsFor: 'initialization' stamp: 'CC 7/7/2021 23:39:04'!
initialize

	accounts := OrderedCollection new.
	root := self! !


!PortfolioAccount methodsFor: 'comparing' stamp: 'CC 7/5/2021 21:19:03'!
hasRegistered: aTransaction

	accounts detect: [:anAccount | anAccount hasRegistered: aTransaction ] ifNone: [^false].
	
	^true! !


!PortfolioAccount methodsFor: 'accesing' stamp: 'CC 7/7/2021 21:16:05'!
balance

	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 ]! !

!PortfolioAccount methodsFor: 'accesing' stamp: 'CC 7/7/2021 20:58:29'!
transactions

	| allTransactions |
	allTransactions := OrderedCollection new.
	accounts do: [:account | allTransactions addAll: account transactions].

	^allTransactions 
	
! !


!PortfolioAccount methodsFor: 'private' stamp: 'CC 7/7/2021 23:40:02'!
root

	^root! !

!PortfolioAccount methodsFor: 'private' stamp: 'CC 7/7/2021 23:42:41'!
root: aPortfolioAccount

	root := aPortfolioAccount! !

!PortfolioAccount methodsFor: 'private' stamp: 'CC 7/7/2021 23:13:42'!
verifyDuplicity: anAccount

	(self = anAccount) ifTrue: [^self error: self class duplicateAccountErrorText].
	
	accounts do: [ :account | (account verifyDuplicity: anAccount)].
	
	
! !

!PortfolioAccount methodsFor: 'private' stamp: 'CC 7/8/2021 00:19:39'!
verifySonsAreNotIn: aPortfolioAccount

	accounts do: [ :account | (account verifySonsAreNotIn: aPortfolioAccount)].
	
		
	
! !


!PortfolioAccount methodsFor: 'adding' stamp: 'CC 7/8/2021 00:07:57'!
add: anAccount 

	root verifyDuplicity: anAccount.
	anAccount verifySonsAreNotIn: root.
	
	accounts add: anAccount.
	anAccount root: self root.! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Account subclass: #ReceptiveAccount
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

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'CC 7/7/2021 23:08:38'!
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


!ReceptiveAccount methodsFor: 'private' stamp: 'CC 7/7/2021 23:41:15'!
root: aPortfolioAccount 

! !

!ReceptiveAccount methodsFor: 'private' stamp: 'CC 7/7/2021 23:13:42'!
verifyDuplicity: anAccount

	(self = anAccount) ifTrue: [^self error: self class duplicateAccountErrorText].
! !

!ReceptiveAccount methodsFor: 'private' stamp: 'CC 7/8/2021 00:16:04'!
verifySonsAreNotIn: aPortfolioAccount

	aPortfolioAccount verifyDuplicity: self.! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'private' stamp: 'CC 7/4/2021 19:57:04'!
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


!Deposit methodsFor: 'private' stamp: 'CC 7/4/2021 19:57:04'!
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


!TransferLeg methodsFor: 'accesing' stamp: 'CC 7/7/2021 21:42:08'!
counterPart

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancieros-Ejercicio'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'registering' stamp: 'CC 7/4/2021 23:12:22'!
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

!TransferDepositLeg methodsFor: 'private' stamp: 'CC 7/4/2021 22:19:44'!
effectOnBalance
	
	^transfer value! !


!TransferDepositLeg methodsFor: 'accesing' stamp: 'CC 7/7/2021 21:42:35'!
counterPart

	^self withdrawLeg ! !

!TransferDepositLeg methodsFor: 'accesing' stamp: 'CC 7/4/2021 22:04:27'!
withdrawLeg

	^transfer withdrawLeg! !


!classDefinition: #TransferWithdrawLeg category: 'ServiciosFinancieros-Ejercicio'!
TransferLeg subclass: #TransferWithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferWithdrawLeg methodsFor: 'private' stamp: 'CC 7/4/2021 22:19:55'!
effectOnBalance
	
	^transfer value negated! !


!TransferWithdrawLeg methodsFor: 'accesing' stamp: 'CC 7/7/2021 21:43:13'!
counterPart

	^self depositLeg ! !

!TransferWithdrawLeg methodsFor: 'accesing' stamp: 'CC 7/4/2021 22:04:45'!
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


!Withdraw methodsFor: 'private' stamp: 'CC 7/4/2021 19:57:04'!
effectOnBalance
	
	^value negated ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


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


!Transfer methodsFor: 'accesing' stamp: 'CC 7/4/2021 20:54:18'!
depositLeg

	^depositLeg! !

!Transfer methodsFor: 'accesing' stamp: 'CC 7/4/2021 20:33:57'!
value

	^value! !

!Transfer methodsFor: 'accesing' stamp: 'CC 7/4/2021 20:53:42'!
withdrawLeg
	
	^withdrawLeg! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'error' stamp: 'CC 7/4/2021 22:42:12'!
invalidTransferAmountErrorText

	^'Invalid transfer amount'! !


!Transfer class methodsFor: 'private' stamp: 'CC 7/8/2021 00:38:07'!
validateAmount: anAmount.

	anAmount > (0 * peso) ifFalse: [^self error: self invalidTransferAmountErrorText ]! !


!Transfer class methodsFor: 'main protocol' stamp: 'CC 7/8/2021 00:38:07'!
transfer: anAmount from: sourceAccount to: destinationAccount

	self validateAmount: anAmount.
	
	^Transfer new initializeFor: anAmount from: sourceAccount to: destinationAccount.! !
