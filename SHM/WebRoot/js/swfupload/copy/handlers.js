/* Demo Note:  This demo uses a FileProgress class that handles the UI for displaying the file name and percent complete.
The FileProgress class is not part of SWFUpload.
*/


/* **********************
   Event Handlers
   These are my custom event handlers to make my
   web application behave the way I went when SWFUpload
   completes different tasks.  These aren't part of the SWFUpload
   package.  They are part of my application.  Without these none
   of the actions SWFUpload makes will show up in my application.
   ********************** */
function preLoad() {
	if (!this.support.loading) {
		alert("You need the Flash Player 9.028 or above to use SWFUpload.");
		return false;
	}
}

function loadFailed() {
	loading("插件加载失败",4);
}

function fileQueued(file) {
	try {
		this.customSettings.tdFilesQueued.innerHTML = this.getStats().files_queued;
	} catch (ex) {
		this.debug(ex);
	}
}

function fileDialogComplete() {
	this.startUpload();
}

function uploadStart(file) {
	try {
		this.customSettings.tdCountSize.innerHTML = SWFUpload.speed.formatBytes(file.size);
		this.customSettings.progressCount = 0;
		this.customSettings.uploadFileName.innerHTML = file.name;
		updateDisplay.call(this, file);
	}
	catch (ex) {
		this.debug(ex);
	}
}

function uploadProgress(file, bytesLoaded, bytesTotal) {
	try {
		this.customSettings.progressCount++;
		updateDisplay.call(this, file);
	} catch (ex) {
		this.debug(ex);
	}
}

//function uploadSuccess(file, serverData) {
//	try {
//		updateDisplay.call(this, file);
//	} catch (ex) {
//		this.debug(ex);
//	}
//}


function uploadComplete(file) {
	this.customSettings.tdFilesQueued.innerHTML = this.getStats().files_queued;
	this.customSettings.tdFilesUploaded.innerHTML = this.getStats().successful_uploads;
	this.customSettings.tdErrors.innerHTML = this.getStats().upload_errors;
}

function updateDisplay(file) {
	//loading(SWFUpload.speed.formatPercent(file.percentUploaded));
	this.customSettings.percentMark.style.width =  SWFUpload.speed.formatPercent(file.percentUploaded);
	this.customSettings.tdPercentUploaded.style.left =  SWFUpload.speed.formatPercent(file.percentUploaded-11);
	this.customSettings.tdSizeRemained.innerHTML = SWFUpload.speed.formatBytes(file.size -file.sizeUploaded); 
	this.customSettings.tdCurrentSpeed.innerHTML = SWFUpload.speed.formatBPS(file.currentSpeed);
	this.customSettings.tdAverageSpeed.innerHTML = SWFUpload.speed.formatBPS(file.averageSpeed);
	this.customSettings.tdMovingAverageSpeed.innerHTML = SWFUpload.speed.formatBPS(file.movingAverageSpeed);
	this.customSettings.tdTimeRemaining.innerHTML = SWFUpload.speed.formatTime(file.timeRemaining);
	this.customSettings.tdTimeElapsed.innerHTML = SWFUpload.speed.formatTime(file.timeElapsed);
	this.customSettings.tdPercentUploaded.innerHTML = SWFUpload.speed.formatPercent(file.percentUploaded);
	this.customSettings.tdSizeUploaded.innerHTML = SWFUpload.speed.formatBytes(file.sizeUploaded);
	this.customSettings.tdProgressEventCount.innerHTML = this.customSettings.progressCount;
};







function fileQueueError(file, errorCode, message) {
	try {
		//file.name file.size.file.type,
//		for(var key in file){
//			alert(key+"===="+file[key]);
//		}
		if (errorCode === SWFUpload.QUEUE_ERROR.QUEUE_LIMIT_EXCEEDED) {
			alert("You have attempted to queue too many files.\n" + (message === 0 ? "You have reached the upload limit." : "You may select " + (message > 1 ? "up to " + message + " files." : "one file.")));
			return;
		}
		
		switch (errorCode) {
		case SWFUpload.QUEUE_ERROR.FILE_EXCEEDS_SIZE_LIMIT:
			this.customSettings.tdErrors.innerHTML = file.name+"文件太大了!(不的超过"+this.settings.file_size_limit+")."+SWFUpload.speed.formatBytes(file.size);
			this.debug("Error Code: File too big, File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
			break;
		case SWFUpload.QUEUE_ERROR.ZERO_BYTE_FILE:
			this.customSettings.tdErrors.innerHTML ="Cannot upload Zero Byte files.";
			this.debug("Error Code: Zero byte file, File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
			break;
		case SWFUpload.QUEUE_ERROR.INVALID_FILETYPE:
			this.customSettings.tdErrors.innerHTML ="Invalid File Type.";
			this.debug("Error Code: Invalid File Type, File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
			break;
		case SWFUpload.QUEUE_ERROR.QUEUE_LIMIT_EXCEEDED:
			alert("You have selected too many files.  " +  (message > 1 ? "You may only add " +  message + " more files" : "You cannot add any more files."));
			break;
		default:
			if (file !== null) {
				this.customSettings.tdErrors.innerHTML ="Unhandled Error";
			}
			this.debug("Error Code: " + errorCode + ", File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
			break;
		}
	} catch (ex) {
        this.debug(ex);
    }
};


function uploadError(file, errorCode, message) {
	try {
		switch (errorCode) {
		case SWFUpload.UPLOAD_ERROR.HTTP_ERROR:
			this.customSettings.tdErrors.innerHTML = "Upload Error: " + message;
			this.debug("Error Code: HTTP Error, File name: " + file.name + ", Message: " + message);
			break;
		case SWFUpload.UPLOAD_ERROR.MISSING_UPLOAD_URL:
			this.customSettings.tdErrors.innerHTML ="Configuration Error";
			this.debug("Error Code: No backend file, File name: " + file.name + ", Message: " + message);
			break;
		case SWFUpload.UPLOAD_ERROR.UPLOAD_FAILED:
			this.customSettings.tdErrors.innerHTML ="Upload Failed.";
			this.debug("Error Code: Upload Failed, File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
			break;
		case SWFUpload.UPLOAD_ERROR.IO_ERROR:
			this.customSettings.tdErrors.innerHTML ="Server (IO) Error";
			this.debug("Error Code: IO Error, File name: " + file.name + ", Message: " + message);
			break;
		case SWFUpload.UPLOAD_ERROR.SECURITY_ERROR:
			this.customSettings.tdErrors.innerHTML ="Security Error";
			this.debug("Error Code: Security Error, File name: " + file.name + ", Message: " + message);
			break;
		case SWFUpload.UPLOAD_ERROR.UPLOAD_LIMIT_EXCEEDED:
			this.customSettings.tdErrors.innerHTML ="Upload limit exceeded.";
			this.debug("Error Code: Upload Limit Exceeded, File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
			break;
		case SWFUpload.UPLOAD_ERROR.SPECIFIED_FILE_ID_NOT_FOUND:
			this.customSettings.tdErrors.innerHTML ="File not found.";
			this.debug("Error Code: The file was not found, File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
			break;
		case SWFUpload.UPLOAD_ERROR.FILE_VALIDATION_FAILED:
			this.customSettings.tdErrors.innerHTML ="Failed Validation.  Upload skipped.";
			this.debug("Error Code: File Validation Failed, File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
			break;
		case SWFUpload.UPLOAD_ERROR.FILE_CANCELLED:
			if (this.getStats().files_queued === 0) {
				document.getElementById(this.customSettings.cancelButtonId).disabled = true;
			}
			this.customSettings.tdErrors.innerHTML ="Cancelled";
			progress.setCancelled();
			break;
		case SWFUpload.UPLOAD_ERROR.UPLOAD_STOPPED:
			this.customSettings.tdErrors.innerHTML ="Stopped";
			break;
		default:
			this.customSettings.tdErrors.innerHTML ="Unhandled Error: " + error_code;
			this.debug("Error Code: " + errorCode + ", File name: " + file.name + ", File size: " + file.size + ", Message: " + message);
			break;
		}
	} catch (ex) {
        this.debug(ex);
    }
}




