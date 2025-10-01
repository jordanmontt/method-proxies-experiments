Class {
	#name : 'BencherTest',
	#superclass : 'TestCase',
	#instVars : [
		'bencher'
	],
	#category : 'MpPerfEx-Bencher-New-Benchmarks',
	#package : 'MpPerfEx-Bencher',
	#tag : 'New-Benchmarks'
}

{ #category : 'running' }
BencherTest >> setUp [

    super setUp.

    bencher := Bencher new
]

{ #category : 'tests' }
BencherTest >> testFormatTime [

	self assert: (bencher formatTime: 60.5 milliSecond) equals: 0.0605.
	self assert: (bencher formatTime: 60 milliSecond) equals: 0.060.
	self assert: (bencher formatTime: 4 seconds) equals: 4.
	self assert: (bencher formatTime: (4 seconds + 33 milliSecond)) equals: 4.033.
	self assert: (bencher formatTime: (1 minute + 4 seconds + 33 milliSecond)) equals: 64.033.
	self assert: (bencher formatTime: (1 minute + 4.5 seconds + 33.5 milliSecond)) equals: 64.5335.
]
