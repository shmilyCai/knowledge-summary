var min = function(str1){
    var temp = 1;
    var k =0;
    var test = [];
    var str =  str1.split('');
    console.log(str);

    for(var i = 0; i < str.length; i++){
        console.log(str.length);
        if(str[i] === str[i +1]){
            temp++;
        }else{
            if(temp !== 1){
                j = temp + '0';
            }
            test.push(str[i]);
            test.push(temp);
        }
    }

    console.log(test.join(''));
   
}

min('aabccccaaa');