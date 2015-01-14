library dart_polymer_supervising_presenter.view.album_form;
		
import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:dart_polymer_supervising_presenter/vo/album.dart';

@CustomTag('album-form')
class AlbumForm extends PolymerElement
{
	//-----------------------------------
	//
	// Public Properties
	//
	//-----------------------------------
  
	//-----------------------------------
	// Album
	//-----------------------------------
	
  /* 
   * Includes hack to convert two-way binding to one-way binding
   */
  Album albumOriginal;
  @observable Album albumDuplicate;
  @published Album get album => albumOriginal;
  
  set album(Album value) {
  	albumOriginal = value;
  	
  	if (value != null)
    	albumDuplicate = value.clone();
  	else
  		albumDuplicate = null;
  }
  
	//-----------------------------------
	// HTML Elements
	//-----------------------------------
	
	FormElement get albumForm 			=> shadowRoot.querySelector('#album-form');

	InputElement get artistInput 		=> shadowRoot.querySelector('#artist-input');

	InputElement get titleInput 		=> shadowRoot.querySelector('#title-input');

	CheckboxInputElement get isclassicalBox	=> shadowRoot.querySelector('#isclassical-box');

	InputElement get composerInput 	=> shadowRoot.querySelector('#composer-input');
	
	InputElement get submitButton		=> shadowRoot.querySelector('#submit-button');
	
	InputElement get cancelButton		=> shadowRoot.querySelector('#cancel-button');
	
	//-----------------------------------
  //
  // Constructor
  //
  //-----------------------------------
 	
  AlbumForm.created() : super.created();
}