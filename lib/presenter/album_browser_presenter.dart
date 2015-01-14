library dart_polymer_supervising_presenter.delegate.album_browser_presenter;

import 'dart:html';
import 'package:core_elements/core_list_dart.dart';
import 'package:dart_polymer_supervising_presenter/vo/album.dart';
import 'package:dart_polymer_supervising_presenter/view/album_browser.dart';
import 'package:dart_polymer_supervising_presenter/delegate/album_delegate.dart';
import 'package:dart_polymer_supervising_presenter/presenter/album_form_presenter.dart';

class AlbumBrowserPresenter
{
  //-----------------------------------
  //
  // Private Properties
  //
  //-----------------------------------
	
	AlbumBrowser _albumBrowser;
	
	AlbumFormPresenter _albumFormPresenter;
	
  //-----------------------------------
  //
  // Constructor
  //
  //-----------------------------------
	
	AlbumBrowserPresenter(this._albumBrowser)
	{
		_albumBrowser.albums.addAll(new AlbumDelegate().getAlbums());
		_albumBrowser.albums.sort((a, b) => a.artist.compareTo(b.artist));
		
		_albumFormPresenter = new AlbumFormPresenter(_albumBrowser.albumForm);
		
		_albumBrowser.albumsList.on['core-activate'].listen(_onSelectionChanged);
	}
	
  //-----------------------------------
  //
  // Private Methods
  //
  //-----------------------------------

	void _onSelectionChanged(CustomEvent event)
	{
		bool ignoreChanges = true;
		
		if (_albumFormPresenter.albumChanged)
			ignoreChanges = window.confirm("Do you wish to discard your changes?");
		
		if (ignoreChanges)
			_albumBrowser.album = (event.detail as CoreActivateEvent).data as Album;
  }
}