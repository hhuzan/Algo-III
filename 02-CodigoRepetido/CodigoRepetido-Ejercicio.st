!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: 'customerBook'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'tests' stamp: 'HJH 5/14/2021 17:07:50'!
setUp

	customerBook := CustomerBook new.
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'HJH 5/19/2021 21:13:07'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	self assert: [customerBook addCustomerNamed: 'Jhon Lennon'.] timeToRun < (50 * millisecond).
.! !

!CustomerBookTest methodsFor: 'tests' stamp: 'HJH 5/16/2021 17:56:30'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| paulMcCartney |
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	
	self assert: [	customerBook removeCustomerNamed: paulMcCartney.] timeToRun < (100 * millisecond)
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'HJH 5/20/2021 15:58:13'!
test03CanNotAddACustomerWithEmptyName 

	|blockToFail blockToRunWhenFail|
	
	blockToFail := [ customerBook addCustomerNamed: '' ].

	blockToRunWhenFail := [	 :anError |
		self assert: anError messageText = CustomerBook
		customerCanNotBeEmptyErrorMessage.
		self assert: customerBook isEmpty
		].

	self failBlock: blockToFail ifError: Error thenShouldDo: blockToRunWhenFail ! !

!CustomerBookTest methodsFor: 'tests' stamp: 'HJH 5/20/2021 15:58:13'!
test04CanNotRemoveAnInvalidCustomer
	
	| johnLennon blockToFail blockToRunWhenFail|

	johnLennon := 'John Lennon'.

	customerBook addCustomerNamed: johnLennon.
		
	blockToFail := [ customerBook removeCustomerNamed: 'Paul McCartney' ].
	
	blockToRunWhenFail := [ :anError |
			self assertTherIsOnlyOneCustomerNamed: johnLennon ].

	self failBlock: blockToFail ifError: Error thenShouldDo: blockToRunWhenFail 
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'HJH 5/19/2021 22:37:10'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| paulMcCartney |

	paulMcCartney := 'Paul McCartney'.
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self assertNumberOfActive: 0 andNumberOfSuspended: 1 andNumberOfCustomers: 1.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'HJH 5/19/2021 22:36:13'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	|paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assertNumberOfActive: 0 andNumberOfSuspended: 0 andNumberOfCustomers: 0. 

	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'HJH 5/20/2021 15:58:13'!
test07CanNotSuspendAnInvalidCustomer
	
	| johnLennon blockToFail blockToRunWhenFail |

	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.

	blockToFail := [ customerBook suspendCustomerNamed: 'Ringo Starr' ].
	
	blockToRunWhenFail := [ :anError | 			self assertTherIsOnlyOneCustomerNamed: johnLennon ].

	self failBlock: blockToFail ifError: CantSuspend thenShouldDo: blockToRunWhenFail ! !

!CustomerBookTest methodsFor: 'tests' stamp: 'HJH 5/20/2021 15:58:13'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| johnLennon blockToFail blockToRunWhenFail |

	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.

	blockToFail := [ customerBook suspendCustomerNamed: johnLennon ].
	
	blockToRunWhenFail := [ :anError | 			self assertTherIsOnlyOneCustomerNamed: johnLennon ].

	self failBlock: blockToFail ifError: CantSuspend thenShouldDo: blockToRunWhenFail ! !


!CustomerBookTest methodsFor: 'as yet unclassified' stamp: 'HJH 5/19/2021 21:24:08'!
assertNumberOfActive: anActiveCount andNumberOfSuspended: aSuspendedCount andNumberOfCustomers: aCustomersCount 

	self assert: anActiveCount equals: customerBook numberOfActiveCustomers.
	self assert: aSuspendedCount equals: customerBook numberOfSuspendedCustomers.
	self assert: aCustomersCount equals: customerBook numberOfCustomers.! !

!CustomerBookTest methodsFor: 'as yet unclassified' stamp: 'HJH 5/19/2021 22:32:11'!
assertTherIsOnlyOneCustomerNamed: aCustomer 

	self assert: customerBook numberOfCustomers = 1.
	self assert: (customerBook includesCustomerNamed: aCustomer)
! !

!CustomerBookTest methodsFor: 'as yet unclassified' stamp: 'HJH 5/20/2021 15:58:13'!
failBlock: aBlock ifError: anError thenShouldDo: blockWhenFail  

	[ aBlock value.
	self fail ]
		on: anError 
		do: blockWhenFail! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'initialization' stamp: 'LL 10/30/2020 12:22:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'HJH 5/19/2021 20:43:30'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'HJH 5/14/2021 16:46:05'!
removeCustomerNamed: aName 

	active remove: aName ifAbsent:
		[suspended remove: aName ifAbsent:
			[^ NotFound signal.]
		].! !

!CustomerBook methodsFor: 'customer management' stamp: 'HJH 5/14/2021 16:49:53'!
suspendCustomerNamed: aName 
	
	active remove: aName ifAbsent: [^CantSuspend signal].
	
	suspended add: aName
! !


!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'accessing' stamp: 'HJH 5/19/2021 20:47:28'!
numberOfCustomers
	
	^self numberOfActiveCustomers + self numberOfSuspendedCustomers! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !


!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
