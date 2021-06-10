!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'CC 6/10/2021 14:43:14'!
test11ExtraCanNotAddMoreElementsOnAFullLimitedStack

	| stack |
	
	stack := OOStackLimited withMaxSize: 5.
	stack push: 'something'.
	stack push: 'something'.
	stack push: 'something'.
	stack push: 'something'.
	stack push: 'something'.

	self
		should: [ stack push: 'something' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStackLimited stackFullErrorDescription ]
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'aSentenceFinderByPrefix'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'CC 6/10/2021 13:18:54'!
test01DoesNotGetResultsWhenFindAPrefixOnAnEmptyFinder

	|  filteredSentences |
	
	filteredSentences := aSentenceFinderByPrefix find: 'Wint'.

	self assert: filteredSentences size = 0.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'CC 6/10/2021 13:19:10'!
test02CanFindAPrefixCorrectlyOnAFinderWithOneSentence

	|  filteredSentences |
	
	aSentenceFinderByPrefix addSentence: 'Winter is comming'.
	
	filteredSentences := aSentenceFinderByPrefix find: 'Wint'.


	self assert: filteredSentences size = 1.
	self assert: filteredSentences  includes: 'Winter is comming' ! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'CC 6/10/2021 13:29:25'!
test03CanFindAPrefixCorrectlyOnAFinderWhenThePrefixIsInMultipleSentencesOnAFinder

	| filteredSentences |
		
	aSentenceFinderByPrefix addSentence: 'Winter is comming'.
	aSentenceFinderByPrefix addSentence: 'winter is comming'.
	aSentenceFinderByPrefix addSentence: 'Winter is over'.
	
	filteredSentences := aSentenceFinderByPrefix find: 'Wint'.

	self assert: filteredSentences size = 2.
	self assert: filteredSentences includes: 'Winter is comming'.
	self assert: filteredSentences includes: 'Winter is over'! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'CC 6/10/2021 13:31:32'!
test04CanFindAPrefixCorrectlyOnAFinderWhenThePrefixIsOnlyInOneSentences

	| filteredSentences |
		
	aSentenceFinderByPrefix addSentence: 'Winter is comming'.
	aSentenceFinderByPrefix addSentence: 'winter is comming'.
	aSentenceFinderByPrefix addSentence: 'Winter is over'.
	
	filteredSentences := aSentenceFinderByPrefix find: 'winter'.

	self assert: filteredSentences size = 1.
	self assert: filteredSentences includes: 'winter is comming'.
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'CC 6/10/2021 13:19:35'!
test05DoesNotGetResultsIfPrefixIsNotIncludedOnFinderWithOneSentence


	| filteredSentences |
	
	aSentenceFinderByPrefix addSentence: 'Winter is comming'.
	
	filteredSentences := aSentenceFinderByPrefix find: 'cat'.


	self assert: filteredSentences size = 0.
! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'CC 6/10/2021 13:20:03'!
test06DoesNotGetResultsIfPrefixIsNotIncludedOnFinderWithMoreThanOneSentences

	| filteredSentences |
	
	aSentenceFinderByPrefix addSentence: 'Winter is comming'.
	aSentenceFinderByPrefix addSentence: 'winter is comming'.
	aSentenceFinderByPrefix addSentence: 'Winter is over'.
	
	filteredSentences := aSentenceFinderByPrefix find: 'cat'.

	self assert: filteredSentences size = 0.
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'CC 6/10/2021 13:20:15'!
test07CanNotFindWithAnEmptyPrefixOnAFinder

	self 
		should: [ aSentenceFinderByPrefix find: '' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix nonValidPrefixErrorDescription ]	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'CC 6/10/2021 13:20:23'!
test08CanNotFindWithPrefixContentsSpaceCharOnAFinder


	self 
		should: [ aSentenceFinderByPrefix find: 'Winter is' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix nonValidPrefixErrorDescription ]	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'CC 6/10/2021 13:21:07'!
test09AFindDoesNotModifyTheOriginalOrderOnAFinder

	aSentenceFinderByPrefix addSentence: 'Winter is comming'.
	aSentenceFinderByPrefix addSentence: 'winter is comming'.
	aSentenceFinderByPrefix addSentence: 'Winter is over'.
	aSentenceFinderByPrefix find: 'Wint'.
	
	self assert: aSentenceFinderByPrefix popSentence = 'Winter is over'.
	self assert: aSentenceFinderByPrefix popSentence = 'winter is comming'.
	self assert: aSentenceFinderByPrefix popSentence =  'Winter is comming'.
	self assert: aSentenceFinderByPrefix isEmpty.! !


!SentenceFinderByPrefixTest methodsFor: 'setup' stamp: 'CC 6/10/2021 13:09:50'!
setUp

	aSentenceFinderByPrefix := SentenceFinderByPrefix new.
! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'elements'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'initialization' stamp: 'CC 6/6/2021 23:36:27'!
initialize
	
	elements  := EmptyStackElement new.
! !


!OOStack methodsFor: 'accessing' stamp: 'HJH 6/7/2021 00:10:44'!
pop

	| topElement |
	
	topElement := elements top.
	elements := elements elements.

	^topElement! !

!OOStack methodsFor: 'accessing' stamp: 'CC 6/6/2021 22:33:38'!
size

	^elements size.! !

!OOStack methodsFor: 'accessing' stamp: 'CC 6/6/2021 23:51:45'!
top

	^elements top.! !


!OOStack methodsFor: 'testing' stamp: 'CC 6/6/2021 22:23:39'!
isEmpty

	^elements isEmpty ! !


!OOStack methodsFor: 'adding' stamp: 'CC 6/6/2021 23:50:18'!
push: anElement
	
	elements := FilledStackElement withElements: elements andTop: anElement
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #OOStackLimited category: 'Stack-Exercise'!
OOStack subclass: #OOStackLimited
	instanceVariableNames: 'maxSize'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackLimited methodsFor: 'adding' stamp: 'CC 6/10/2021 14:39:29'!
push: anElement
	
	(self size = maxSize) ifTrue: [self error: self class stackFullErrorDescription].
	
	super push: anElement 
	
! !


!OOStackLimited methodsFor: 'initialization' stamp: 'CC 6/10/2021 14:31:27'!
initializeWithMaxSize: aSize
	
	maxSize := aSize 
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackLimited class' category: 'Stack-Exercise'!
OOStackLimited class
	instanceVariableNames: ''!

!OOStackLimited class methodsFor: 'as yet unclassified' stamp: 'CC 6/10/2021 14:29:11'!
stackFullErrorDescription
	
	^ 'Stack is full'! !

!OOStackLimited class methodsFor: 'as yet unclassified' stamp: 'CC 6/10/2021 14:33:29'!
withMaxSize: aSize.

	^OOStackLimited new initializeWithMaxSize: aSize.! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'sentences'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'CC 6/9/2021 23:47:54'!
prefixIsValid: aPrefix


	^(aPrefix = '') not and: [(aPrefix findString: ' ') = 0]
! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'CC 6/9/2021 23:29:35'!
reorderOriginalStackWith: tempStack

	[ tempStack isEmpty ] whileFalse: [
		sentences push: tempStack pop
	]! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'CC 6/9/2021 23:47:32'!
validatePrefix: aPrefix

	(self prefixIsValid: aPrefix) ifFalse: [^self error: self class nonValidPrefixErrorDescription].

! !


!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'HJH 6/8/2021 10:55:21'!
initialize

	sentences := OOStack new! !


!SentenceFinderByPrefix methodsFor: 'comparing' stamp: 'CC 6/9/2021 22:44:43'!
find: aPrefix

	| finded tempStack |

	self validatePrefix: aPrefix.
	
	finded := OrderedCollection new.
	tempStack := OOStack new.
	
	[ sentences isEmpty ] whileFalse: [
		(sentences top beginsWith: aPrefix) ifTrue: [ finded add: sentences top ].
		tempStack push: sentences pop
	].

	self reorderOriginalStackWith: tempStack.

	^finded! !

!SentenceFinderByPrefix methodsFor: 'comparing' stamp: 'CC 6/10/2021 12:57:02'!
isEmpty

	^sentences isEmpty ! !


!SentenceFinderByPrefix methodsFor: 'accessing' stamp: 'CC 6/10/2021 12:50:17'!
popSentence
	
	^sentences pop! !


!SentenceFinderByPrefix methodsFor: 'adding' stamp: 'HJH 6/8/2021 12:29:05'!
addSentence: aSentence

	sentences push: aSentence	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'CC 6/9/2021 22:12:14'!
nonValidPrefixErrorDescription
	
	^ 'Prefix is not valid'! !


!classDefinition: #StackElement category: 'Stack-Exercise'!
Object subclass: #StackElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackElement methodsFor: 'private' stamp: 'CC 6/6/2021 23:30:08'!
isEmpty

	self subclassResponsibility ! !

!StackElement methodsFor: 'private' stamp: 'CC 6/6/2021 23:30:22'!
size

	self subclassResponsibility ! !

!StackElement methodsFor: 'private' stamp: 'CC 6/6/2021 23:51:45'!
top

	self subclassResponsibility ! !


!classDefinition: #EmptyStackElement category: 'Stack-Exercise'!
StackElement subclass: #EmptyStackElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!EmptyStackElement methodsFor: 'accessing' stamp: 'CC 6/6/2021 23:51:45'!
top

	^self error: OOStack stackEmptyErrorDescription! !


!EmptyStackElement methodsFor: 'comparing' stamp: 'CC 6/6/2021 22:54:37'!
isEmpty

	^true! !

!EmptyStackElement methodsFor: 'comparing' stamp: 'CC 6/6/2021 23:16:20'!
size
	
	^0! !


!classDefinition: #FilledStackElement category: 'Stack-Exercise'!
StackElement subclass: #FilledStackElement
	instanceVariableNames: 'elements topElement'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!FilledStackElement methodsFor: 'initialization' stamp: 'HJH 6/7/2021 00:13:57'!
initializeWithElements: innerElements andTop: aTopElement

	elements := innerElements.
	topElement := aTopElement.! !


!FilledStackElement methodsFor: 'comparing' stamp: 'CC 6/6/2021 23:05:05'!
isEmpty

	^false! !

!FilledStackElement methodsFor: 'comparing' stamp: 'HJH 6/7/2021 00:14:19'!
size

	^1 + elements size.! !


!FilledStackElement methodsFor: 'accessing' stamp: 'CC 6/6/2021 23:32:13'!
elements
	
	^elements! !

!FilledStackElement methodsFor: 'accessing' stamp: 'CC 6/6/2021 23:51:45'!
top
	
	^topElement! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'FilledStackElement class' category: 'Stack-Exercise'!
FilledStackElement class
	instanceVariableNames: ''!

!FilledStackElement class methodsFor: 'as yet unclassified' stamp: 'HJH 6/7/2021 00:09:06'!
withElements: actualElements andTop: aNewElement
	
	| newStackElements |
	
	newStackElements := FilledStackElement new.
	newStackElements initializeWithElements: actualElements andTop: aNewElement.
	
	^newStackElements ! !
