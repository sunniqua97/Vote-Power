function typewriter(){
  var len = 0;
  var text = "Voting never seemed easier.";
  var speed = 90;
  function typing(){
      if(len < text.length){
          document.getElementById("text").innerHTML += text.charAt(len);
          len++;
          setTimeout(typing, speed);
      }
  }
  typing();
}
