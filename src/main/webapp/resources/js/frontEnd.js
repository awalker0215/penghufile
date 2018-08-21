$(document).on('click', '.number-spinner button', function () {    
	var btn = $(this),
		oldValue = btn.closest('.number-spinner').find('input').val().trim(),
		newVal = 0;
	
	if (btn.attr('data-dir') == 'up') {
		newVal = parseInt(oldValue) + 1;
	} else {
		if (oldValue > 0) {
			newVal = parseInt(oldValue) - 1;
		} else {
			newVal = 0;
		}
	}
	btn.closest('.number-spinner').find('input').val(newVal);
});

$('#other').change( function () {
	if ($(this).is(':checked'))
    {
		$("#inputOther").attr('style','display:block');
		$("#inputContent").attr('style','display:none');
		$("#inputAppendix").attr('style','display:none');
		$("#inputEbookURL").attr('style','display:none');
		$("#inputDiskURL").attr('style','display:none');
		$("#publicationDetail").attr('style','display:none');
    }
});
$('#content').change( function () {
	if ($(this).is(':checked'))
    {
		$("#inputOther").attr('style','display:none');
		$("#inputContent").attr('style','display:block');
		$("#inputAppendix").attr('style','display:none');
		$("#inputEbookURL").attr('style','display:none');
		$("#inputDiskURL").attr('style','display:none');
		$("#publicationDetail").attr('style','display:block');
	}
});
$('#appendix').change( function () {
	if ($(this).is(':checked'))
    {
       	$("#inputOther").attr('style','display:none');
		$("#inputContent").attr('style','display:none');
		$("#inputAppendix").attr('style','display:block');
		$("#inputEbookURL").attr('style','display:none');
		$("#inputDiskURL").attr('style','display:none');
		$("#publicationDetail").attr('style','display:block');
    }
});
$('#paper').change( function () {
	if ($(this).is(':checked'))
    {
       	$("#inputOther").attr('style','display:none');
		$("#inputContent").attr('style','display:none');
		$("#inputAppendix").attr('style','display:none');
		$("#inputEbookURL").attr('style','display:none');
		$("#inputDiskURL").attr('style','display:none');
		$("#publicationDetail").attr('style','display:block');
    }
});
$('#Ebook').change( function () {
	if ($(this).is(':checked'))
    {
		$("#inputOther").attr('style','display:none');
		$("#inputContent").attr('style','display:none');
		$("#inputAppendix").attr('style','display:none');
		$("#inputEbookURL").attr('style','display:block');
		$("#inputDiskURL").attr('style','display:none');
		$("#publicationDetail").attr('style','display:block');
    }
});
$('#disk').change( function () {
	if ($(this).is(':checked'))
    {
		$("#inputOther").attr('style','display:none');
		$("#inputContent").attr('style','display:none');
		$("#inputAppendix").attr('style','display:none');
		$("#inputEbookURL").attr('style','display:none');
		$("#inputDiskURL").attr('style','display:block');
		$("#publicationDetail").attr('style','display:block');
    }
});

var startDate = new Date();

$('#datepicker').datepicker({
    autoclose: true,
    minViewMode: 1,
    format: 'yyyy年 mm月'
}).on('changeDate', function(selected){
        startDate = new Date(selected.date.valueOf());
        startDate.setDate(startDate.getDate(new Date(selected.date.valueOf())));
    }); 



