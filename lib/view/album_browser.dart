library dart_polymer_supervising_presenter.view.album_browser;

import 'package:polymer/polymer.dart';
import 'package:dart_polymer_supervising_presenter/vo/album.dart';
import 'package:dart_polymer_supervising_presenter/view/album_form.dart';
import 'package:core_elements/core_list_dart.dart';
  
@CustomTag('album-browser')
class AlbumBrowser extends PolymerElement
{
	//-----------------------------------
  //
  // Public Properties
  //
  //-----------------------------------

  @observable Album album;
  
  @observable ObservableList<Album> albums = new ObservableList();
		
	//-----------------------------------
	// HTML Elements
	//-----------------------------------
			
	CoreList get albumsList => shadowRoot.querySelector("#albums-list");

	AlbumForm get albumForm => shadowRoot.querySelector("#album-form");
		
  //-----------------------------------
  //
  // Constructor
  //
  //-----------------------------------

  AlbumBrowser.created() : super.created();
}