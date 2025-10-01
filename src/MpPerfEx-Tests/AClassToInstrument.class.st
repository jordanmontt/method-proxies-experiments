Class {
	#name : 'AClassToInstrument',
	#superclass : 'Object',
	#category : 'MpPerfEx-Tests-SourceCodeModificator',
	#package : 'MpPerfEx-Tests',
	#tag : 'SourceCodeModificator'
}

{ #category : 'accessing' }
AClassToInstrument >> bar [

	SingletonClasToTest current increment
]

{ #category : 'accessing' }
AClassToInstrument >> foo [

	SingletonClasToTest current increment
]

{ #category : 'accessing' }
AClassToInstrument >> fooWithException [

	Error signal.
	SingletonClasToTest current increment
]

{ #category : 'accessing' }
AClassToInstrument >> methodWithPragma [

	<primitive: 'prim' module: 'InstrumentationProfilers' error: error>
	| var1 var2 |
	var1 := 4.
	var2 := 5.
	self doSomething: error.
	^ 6
]

{ #category : 'accessing' }
AClassToInstrument >> poo [

	SingletonClasToTest current increment
]

{ #category : 'accessing' }
AClassToInstrument >> prototypeTrap [

	#originalCodeMethod
]

{ #category : 'accessing' }
AClassToInstrument >> prototypeTrap: arg1 arg2: arg2 [

	#originalCodeMethod
]

{ #category : 'accessing' }
AClassToInstrument >> tempy [

	| var1 var2 var3 |
	var1 := SingletonClasToTest current increment.
	var2 := nil.
	var3 := 0
]
