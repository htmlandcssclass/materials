var PropertyControl = function(property, controlEl, displayEl, _options){
    
    _options = _options ? _options : {};
    var options = {
        initialValue: _options.initialValue ? _options.initialValue : 0,
        disabledValue: _options.disabledValue ? _options.disabledValue : 'initial'
    }
    
    var enabledInput = controlEl.find('[name='+ property +'-enabled]');
    var valueInput = controlEl.find('[name='+ property +'-value]');
    var valueOutput = controlEl.find('.value');
    var value = options.initialValue;

    var showValue = function(value){
        valueOutput.text(formattedValue(value));
        displayEl.css(property, formattedValue(value));
    };
    
    var formattedValue = function(value){
        var isANumber = value > 0 || value < 0;
        return isANumber ? value+'px' : value;
    };
    
    var enableOrDisable = function(){
        var disabled = !enabledInput.is(':checked');
        controlEl.toggleClass('disabled', disabled);
        valueInput.prop('disabled', disabled);
        if (disabled){
            showValue(options.disabledValue);
        } else {
            showValue(value);
        }
        
    };
    
    enabledInput.on('change', enableOrDisable);
    valueInput.on('change', function(){
        value = valueInput.val();
        showValue(value);
    });
    enableOrDisable();
};