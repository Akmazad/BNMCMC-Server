var OperationCanceled = false;
var MH_running = false;
var NS_running = false;
var HAR_running = false;

var MH_finished = false;
var NS_finished = false;
var HAR_finished = false;

function TerminateLongProcess() {
    OperationCanceled = true;
}
//Create progress bar each time is valid response is received from the server using xmlhttprequest
function GetProgressbar(resp, tr_id) {
    var percent = parseInt(resp[0], 10);
    var tr = document.getElementById(tr_id);
    while (tr.cells.length > 0) {
        tr.deleteCell(tr.cells.length - 1);
    }
    var colorCellWidth = percent * 2; // Since Table width = 200 and total percentage value = 100, so we 1% complete = 2px cell width
    var whiteCellWidth = 200 - colorCellWidth; //Table width = 200
    var nextIndex = 0;
    if (colorCellWidth > 0) {
        var td1 = tr.insertCell(nextIndex);
        nextIndex++; ;
        td1.setAttribute('style', 'width:' + colorCellWidth + 'px;height:13px; background-color:lightgreen; border-width:0px');
        tr.appendChild(td1);
    }
    if (whiteCellWidth > 0) {
        var td2 = tr.insertCell(nextIndex);
        td2.setAttribute('style', 'width:' + whiteCellWidth + 'px;height:13px; background-color:white; border-width:0px');
        tr.appendChild(td2);
    }
}
function GetStatus_1() {

    if (!MH_running) {
        document.getElementById("dvStatus_MH").style.display = "block";
        document.getElementById("dv_MH_gap1").style.display = "block";
        document.getElementById("dvTest_MH").style.display = "block";
        document.getElementById("dv_MH_gap2").style.display = "block";

        var _height = document.getElementById("dvProgressBar").clientHeight + 70;
        //document.getElementById("dvProgressBar").setAttribute("style", "height:" + _height.toString() + "px");
        document.getElementById("dvProgressBar").style.height = _height.toString() + "px";
        document.getElementById("dvProgressBar").style.display = "block";
    }
    MH_running = true;

    //make ajax call
    var xmlHttp = GetXMLHTTPObject();

    xmlHttp.open("GET", "ProcessMonitor.aspx?cancel=" + OperationCanceled + "&method=MH", true);

    xmlHttp.onreadystatechange = function () {
        if (xmlHttp.readyState == 4) {
            var msg = '';
            var percentage = '';
            if (xmlHttp.responseText == '') {
                //document.getElementById('dvStatus').innerHTML = 'Waiting for server response....';
            }
            else {
                var resp = xmlHttp.responseText.split('$');
                if (resp.length > 1) {
                    if (resp[1].startsWith('MH')) {
                        document.getElementById('dvStatus_MH').innerHTML = resp[1];
                        GetProgressbar(resp, 'trMain_MH');

                    }
                    //Generate progress bar.
                    //alert(resp[0]);
                    if ((resp[0] == '111' || resp[1].endsWith('100%') ) && (resp[1].startsWith('MH'))) {
                        MH_finished = true;
                    }

                    var MH_check = MH_finished ^ MH_running;
                    var NS_check = NS_finished ^ NS_running;
                    var HAR_check = HAR_finished ^ HAR_running;

                    if (!MH_check && !NS_check && !HAR_check) {
                        //if ((MH_finished ^ MH_running) && (NS_finished ^ NS_running) && (HAR_finished ^ HAR_running)) {
                        LoadResultPage();
                    }
                    else if (resp[0] == '-1') {
                        setTimeout('ReloadPage()', 1000);
                    }
                    else {
                        setTimeout('GetStatus_1()', 1000);
                    }
                }
            }
        }
    }
    xmlHttp.send(null);
}
function GetStatus_2() {
    if (!NS_running) {
        document.getElementById("dvStatus_NS").style.display = "block";
        document.getElementById("dv_NS_gap1").style.display = "block";
        document.getElementById("dvTest_NS").style.display = "block";
        document.getElementById("dv_NS_gap2").style.display = "block";

        var _height = document.getElementById("dvProgressBar").clientHeight + 70;
        //document.getElementById("dvProgressBar").setAttribute("style", "height:" + _height.toString() + "px");
        document.getElementById("dvProgressBar").style.height = _height.toString() + "px";
        document.getElementById("dvProgressBar").style.display = "block";
    }
    NS_running = true;

    
    //make ajax call
    var xmlHttp = GetXMLHTTPObject();

    xmlHttp.open("GET", "ProcessMonitor.aspx?cancel=" + OperationCanceled + "&method=NS", true);

    xmlHttp.onreadystatechange = function () {
        if (xmlHttp.readyState == 4) {
            var msg = '';
            var percentage = '';
            if (xmlHttp.responseText == '') {
                //document.getElementById('dvStatus').innerHTML = 'Waiting for server response....';
            }
            else {
                var resp = xmlHttp.responseText.split('$');
                if (resp.length > 1) {
                    if (resp[1].startsWith('NS')) {
                        document.getElementById('dvStatus_NS').innerHTML = resp[1];
                        GetProgressbar(resp, 'trMain_NS');

                    }

                    if ((resp[0] == '111' || resp[1].endsWith('100%')) && (resp[1].startsWith('NS'))) {
                        NS_finished = true;
                    }


                    var MH_check = MH_finished ^ MH_running;
                    var NS_check = NS_finished ^ NS_running;
                    var HAR_check = HAR_finished ^ HAR_running;

                    if (!MH_check && !NS_check && !HAR_check) {
                        //if ((MH_finished ^ MH_running) && (NS_finished ^ NS_running) && (HAR_finished ^ HAR_running)) {
                        LoadResultPage();
                    }
                    else if (resp[0] == '-1') {
                        setTimeout('ReloadPage()', 1000);
                    }
                    else {
                        setTimeout('GetStatus_2()', 1000);
                    }
                }
            }
        }
    }
    xmlHttp.send(null);
}
function GetStatus_3() {
    if (!HAR_running) {
        document.getElementById("dvStatus_HAR").style.display = "block";
        document.getElementById("dv_HAR_gap1").style.display = "block";
        document.getElementById("dvTest_HAR").style.display = "block";
        document.getElementById("dv_HAR_gap2").style.display = "block";

        var _height = document.getElementById("dvProgressBar").clientHeight + 70;
        //document.getElementById("dvProgressBar").setAttribute("style", "height:" + _height.toString() + "px");
        document.getElementById("dvProgressBar").style.height = _height.toString() + "px";
        document.getElementById("dvProgressBar").style.display = "block";
    }
    HAR_running = true;

    //make ajax call
    var xmlHttp = GetXMLHTTPObject();

    xmlHttp.open("GET", "ProcessMonitor.aspx?cancel=" + OperationCanceled + "&method=HAR", true);

    xmlHttp.onreadystatechange = function () {
        if (xmlHttp.readyState == 4) {
            var msg = '';
            var percentage = '';
            if (xmlHttp.responseText == '') {
                //document.getElementById('dvStatus').innerHTML = 'Waiting for server response....';
            }
            else {
                var resp = xmlHttp.responseText.split('$');
                if (resp.length > 1) {
                    if (resp[1].startsWith('HAR')) {
                        document.getElementById('dvStatus_HAR').innerHTML = resp[1];
                        GetProgressbar(resp, 'trMain_HAR');

                    }
                    //Generate progress bar.
                    //alert(resp[0]);
                    if ((resp[0] == '111' || resp[1].endsWith('100%')) && (resp[1].startsWith('HAR'))) {
                        HAR_finished = true;
                    }

                    var MH_check = MH_finished ^ MH_running;
                    var NS_check = NS_finished ^ NS_running;
                    var HAR_check = HAR_finished ^ HAR_running;

                    if (!MH_check && !NS_check && !HAR_check) {
                    //if ((MH_finished ^ MH_running) && (NS_finished ^ NS_running) && (HAR_finished ^ HAR_running)) {
                        LoadResultPage();
                    }
                    else if (resp[0] == '-1') {
                        setTimeout('ReloadPage()', 1000);
                    }
                    else {
                        setTimeout('GetStatus_3()', 1000);
                    }
                }
            }
        }
    }
    xmlHttp.send(null);
}
function ShowProgressbar() {
    //document.getElementById('dvReport').innerHTML = "";
    document.getElementById("dvOverlay").style.display = "block";
    document.getElementById("dvProgressBar").style.display = "block";
    //GetStatus(method)
}

function ReloadPage() {
    window.location = "Default.aspx";
    HideLoadingPanel();
}

function LoadResultPage() {
    window.location = "Results.aspx";
    HideLoadingPanel();
}

function HideLoadingPanel() {
    OperationCanceled = false;
    document.getElementById("dvOverlay").style.display = "none";
    document.getElementById("dvProgressBar").style.display = "none";
    var tr = document.getElementById('trMain');
    while (tr.cells.length > 0) {
        tr.deleteCell(tr.cells.length - 1);
    }
    document.getElementById('dvStatus').innerHTML = 'Waiting for server response....';
}

function GetXMLHTTPObject() {
    var xmlHttp;
    try {
        // Firefox, Opera 8.0+, Safari
        xmlHttp = new XMLHttpRequest();
    }
    catch (e) {
        // Internet Explorer
        try {
            xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
        }
        catch (e) {
            try {
                xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            catch (e) {
                alert("Your browser does not support AJAX!");
                return false;
            }
        }
    }
    return xmlHttp;
}