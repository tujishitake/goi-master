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
  
  
  $(".get_images").on("click", function() {
    //[$modal-overlay]をフェードインさせる
    $("#modal-overlay").fadeIn("slow");
    $(this).siblings(".open_modal").fadeIn("slow");
  });
  
  $("#modal-overlay").on("click", function(){
  	//[#modal-overlay]と[#modal-close]をフェードアウトする
    $(".open_modal").fadeOut("slow");
    $("#modal-overlay").fadeOut("slow");
  });
});



// $(function() {

//   $(".get_images").on("click", function() {
//     //[$modal-overlay]をフェードインさせる
//     $("#modal-overlay").fadeIn("slow");
//     $(this).siblings(".open_modal").fadeIn("slow");
//   });
  
//   $("#modal-overlay").on("click", function(){
//   	//[#modal-overlay]と[#modal-close]をフェードアウトする
//     $(".open_modal").fadeOut("slow");
//     $("#modal-overlay").fadeOut("slow");
//   });
    
// });