$(document).ready(function(){

    $(".my_question").toggle();

    $("#question_toggle").click(function(){
        $(".my_question").toggle();
    });

    $(".my_answer").toggle();

    $("#answer_toggle").click(function(){
        $(".my_answer").toggle();
    });
});
