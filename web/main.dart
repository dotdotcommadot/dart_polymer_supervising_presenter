import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:dart_polymer_supervising_presenter/dart_polymer_supervising_presenter.dart';

void main() 
{
	AlbumBrowserPresenter albumBrowserPresenter;
	
	initPolymer().run(() => Polymer.onReady.then((_) {
		albumBrowserPresenter = new AlbumBrowserPresenter(querySelector("#album-browser"));
	}));
}