library dart_polymer_supervising_presenter.delegate.album_form_presenter;

import 'dart:html';
import 'package:dart_polymer_supervising_presenter/view/album_form.dart';

class AlbumFormPresenter
{
	//-----------------------------------
	//
	// Public Properties
	//
	//-----------------------------------
	
	bool get albumChanged => _albumForm.album != null && _canCancel();
	
  //-----------------------------------
  //
  // Private Properties
  //
  //-----------------------------------
	
	AlbumForm _albumForm;
	
  //-----------------------------------
  //
  // Constructor
  //
  //-----------------------------------
	
	AlbumFormPresenter(this._albumForm)
	{
		_albumForm.artistInput
			..onInput.listen((_) => _updateButtons())
			..onChange.listen((_) => _updateButtons());
		
		_albumForm.titleInput
		  ..onInput.listen((_) => _updateButtons())
			..onChange.listen((_) => _updateButtons());

		_albumForm.isclassicalBox
			..onChange.listen((_) => _changeClassical());

		_albumForm.composerInput
		  ..onInput.listen((_) => _changeComposer());
		
		_albumForm.albumForm
  		..onSubmit.listen(_applyChanges);
		
		_albumForm.cancelButton
			..onClick.listen((_) => _cancelChanges());
		
		_resetForm();
	}
	
	//-----------------------------------
	//
	// Private Methods
	//
	//-----------------------------------
	
	void _changeClassical()
	{
		if (_albumForm.isclassicalBox.checked)
			_albumForm.albumDuplicate.composer = _albumForm.albumOriginal.composer;
		else
			_albumForm.albumDuplicate.composer = '';
		
		_updateButtons();
	}
	
	void _changeComposer()
	{
		_updateButtons();
	}
	
	void _updateButtons()
	{
		_albumForm.cancelButton.disabled = !_canCancel();
		_albumForm.submitButton.disabled = !_canSubmit();
	}
	
	bool _canCancel()
	{
		if (_albumForm.albumOriginal.artist != _albumForm.albumDuplicate.artist ||
				_albumForm.albumOriginal.title != _albumForm.albumDuplicate.title ||
				_albumForm.albumOriginal.composer != _albumForm.albumDuplicate.composer ||
				_albumForm.albumOriginal.isClassical != _albumForm.albumDuplicate.isClassical)
		{
			return true;
		}
		
		return false;
	}
	
	bool _canSubmit()
	{
		bool result = !_albumForm.cancelButton.disabled;
		result = result && _albumForm.artistInput.validity.valid;
		result = result && _albumForm.titleInput.validity.valid;
		
		if (_albumForm.isclassicalBox.checked == true)
		{
			result = result && _albumForm.composerInput.validity.valid;
			result = result && _albumForm.composerInput.value != "";
		}
		
		return result;
	}
	
	void _applyChanges(Event event)
	{
		_albumForm.albumOriginal.artist = _albumForm.albumDuplicate.artist;
		_albumForm.albumOriginal.title = _albumForm.albumDuplicate.title;
		_albumForm.albumOriginal.isClassical = _albumForm.albumDuplicate.isClassical;
		_albumForm.albumOriginal.composer = _albumForm.albumDuplicate.composer;
	
		event.preventDefault();
		event.stopPropagation();
		
		_updateButtons();
	}
	
	void _cancelChanges()
	{				
		_albumForm.albumDuplicate = _albumForm.albumOriginal.clone();
		
		_updateButtons();
	}
	
	void _resetForm()
	{
		_albumForm.cancelButton.disabled = true;
		_albumForm.submitButton.disabled = true;
	}
}