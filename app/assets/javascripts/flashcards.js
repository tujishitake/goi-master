$(document).on('turbolinks:load', function() {
  function speak() {
    var text = $(this).data("text");
    var lang = $(this).data("lang");
    var uttr = new SpeechSynthesisUtterance();
    uttr.text = text;
    uttr.lang = lang;
    
    speechSynthesis.speak(uttr);
    console.log(uttr.lang);
  }
  $(".text").on("click", speak);
});