// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require jquery3
//= require popper
//= require bootstrap-sprockets

// 診断テストのjavascript //
$(function() {
  load();
  $(window).on("load resize", function() {load();});
  $(".questions > li:not(:first-child)").css({display: "none"});
  $(".questions li").addClass("opas");

	// 診断テストページで、部品を追加
  var num_bar;
  var num_barNum = ["0%"];
  var q_list = $(".questions li");

	// プログレスバーを追加
	if($(".questions").length){
    $('body').prepend('<div class="progress-bar"><span></span></div>');
  }

  q_list.each(function(i) {
    q_list.eq(i).find(".select").addClass("s-" + i);
    // 型を変更する「String()」について https://hajimete.org/jquery-string-from-number
    num_barNum.push(100 / (q_list.length-1) * (String(i+1)) + "%");
		if(i != q_list.length-1) {

			// 問題の数「Q,1、Q,2、Q,3、Q,4、Q,5....」を追加
      q_list.eq(i).prepend('<p>Q,' + String(i+1) + '</p>');

      // 各問題に[Yes]、[No]ボタンを追加
      q_list.eq(i).append('<div class="select"><p>Yes</p><p>No</p></div>');

    }
    if(i != 0) {
      q_list.eq(i).addClass("right");

			// 2問目以降の「←戻る」ボタンを追加
      q_list.eq(i).append('<div class="back-list">&#x2B05; 戻る</div>');
    }
  });


	// 診断テストページで、「Yes」または「No」を押した時
  var num = 0;
  $(".select p").on("click", function() {
    var btn = $(this);
    localStorage.setItem(num, $(".questions li:eq("+num+") .select p").index(this)+1);
    $(".progress-bar > span").css({width: num_barNum[num+1]});
    btn.addClass("click");
    setTimeout(function() {
      q_list.eq(num).addClass("left");
      setTimeout(function() {
        q_list.eq(num).hide();
        q_list.eq(num + 1).show();
        btn.removeClass("click");
        setTimeout(function() {
          q_list.eq(num + 1).removeClass("right");
          num++
        },40);
      },360);
    },260);
  });


	// 診断テストページで、「←戻る」を押した時
  $(".back-list").on("click", function() {
    $(".progress-bar > span").css({width: num_barNum[num-1]});
    q_list.eq(num).addClass("right");
    setTimeout(function() {
      q_list.eq(num).hide();
      num = num-1;
      q_list.eq(num).show();
      setTimeout(function() {
        q_list.eq(num).removeClass("left");
      },40);
    },360);
  });


	// 診断テストページで、Yesの数をローカルストレージに追加
  // ローカルストレージについて https://hajimete.org/jquery-save-to-local-storage
  if($(".questions").length) {
    localStorage.setItem("q-length", $(".questions li").length-1);
  }

	// 診断結果ページで、Yesの数をローカルストレージから取り出して変数に格納
  if($(".ansewer").length) {
    var yes = [];
    for(var i=1;i<=localStorage.getItem("q-length");i++) {
      if(localStorage.getItem(i-1) == 1) {
        yes.push(0);
      }
    }

    // 診断テスト結果
    if(yes.length == 0) {
      // Yesの数が、0個の時
      $(".ansewer__title").text("Yesの数が０個の時のあなたは〇〇〇タイプです！");
      $(".ansewer__txt").html("〇〇〇タイプの方は、テキストテキストテキストテキスト。<br>テキストテキストテキストテキストテキストテキスト。");
    } else if(yes.length == 1) {
			// Yesの数が、1個の時
			$(".ansewer__title").text("Yesの数が１個の時のあなたは〇〇〇タイプです！");
			$(".ansewer__txt").html("〇〇〇タイプの方は、テキストテキストテキストテキスト。<br>テキストテキストテキストテキストテキストテキスト。");
    } else if(yes.length == 2) {
			// Yesの数が、2個の時
			$(".ansewer__title").text("Yesの数が２個の時のあなたは〇〇〇タイプです！");
			$(".ansewer__txt").html("〇〇〇タイプの方は、テキストテキストテキストテキスト。<br>テキストテキストテキストテキストテキストテキスト。");
    } else if(yes.length == 3) {
			// Yesの数が、3個の時
			$(".ansewer__title").text("Yesの数が３個の時のあなたは〇〇〇タイプです！");
			$(".ansewer__txt").html("〇〇〇タイプの方は、テキストテキストテキストテキスト。<br>テキストテキストテキストテキストテキストテキスト。");
    } else if(yes.length == 4) {
			// Yesの数が、4個の時
			$(".ansewer__title").text("Yesの数が４個の時のあなたは〇〇〇タイプです！");
			$(".ansewer__txt").html("〇〇〇タイプの方は、テキストテキストテキストテキスト。<br>テキストテキストテキストテキストテキストテキスト。");
    } else if(yes.length == 5) {
			// Yesの数が、5個の時
			$(".ansewer__title").text("Yesの数が５個の時のあなたは〇〇〇タイプです！");
			$(".ansewer__txt").html("〇〇〇タイプの方は、テキストテキストテキストテキスト。<br>テキストテキストテキストテキストテキストテキスト。");
    }
  }

});


function load() {
	// 初回読み込み時と読み込み完了後、ウィンドウサイズの変更の時
  var q_height = [];
  $(".questions li").each(function(i){
    q_height.push(Number($(".questions li").eq(i).css('height').slice(0,-2)) + 54);
  });
	// 質問全体で一番高さの有るコンテンツに合わせて高さ調整
  // 最大数を取得する「Math.max.apply(null,value)」について https://hajimete.org/jquery-get-the-maximum-and-minimum-values
  $(".questions").css({height: Math.max.apply(null,q_height)});
}

// レビューの新規投稿のjavescript //
$(function(){
  function appendOption(category){
    var html = `<option value="${category.id}">${category.name}</option>`;
    return html;
  }
  function appendChildrenBox(insertHTML){
    var childSelectHtml = "";
    childSelectHtml = `<div class="category__child" id="children_wrapper">
                        <select id="child__category" name="post[category_id]" class="serect_field">
                          <option value="">---</option>
                          ${insertHTML}
                        </select>
                      </div>`;
    $('.append__category').append(childSelectHtml);
  }
  
  $('#item_category_id').on('change',function(){
    var parentId = document.getElementById('item_category_id').value;
    if (parentId != ""){
      $.ajax({
        url: '/reviews/get_category_children/',
        type: 'GET',
        data: { parent_id: parentId },
        dataType: 'json'
      })
      .done(function(children){
        $('#children_wrapper').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChildrenBox(insertHTML);
        if (insertHTML == "") {
          $('#children_wrapper').remove();
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#children_wrapper').remove();
    }});
})