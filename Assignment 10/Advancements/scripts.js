function addautocomplete(identifier, tablename, columnname){
    var tags = [];
    $(identifier).autocomplete({
    source: function (request, response) {
        var matcher = new RegExp("^" + $.ui.autocomplete.escapeRegex(request.term), "i");
        response($.grep(tags, function (item) {
            return matcher.test(item);
        }));
        }
    });
    document.querySelector(identifier).onkeyup = function () {
        var xhr = new XMLHttpRequest();
        var url = `/CLAMV/autocomplete/auto_complete.php?table=${tablename}&column=${columnname}&like=` + document.querySelector(identifier).value;
        xhr.open('GET', url, true);
        xhr.onload = function(){
            if(this.status === 200){
                tags = [];
                var possibilities = JSON.parse(this.responseText);
                for(var members of possibilities){
                    tags.push(members[columnname]);
                }
            }else{
                console.log("Unable to retrieve data. Status:",this.status);
            }
        }
        xhr.send();
    };
    }   