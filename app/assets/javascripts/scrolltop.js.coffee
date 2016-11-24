ready = ->  #初期読み込みコード
    $(window).scroll ->  # .scroll⇒ページがスクロールした際に呼び出される
        element = $('#page-top-btn') # idの要素が変数に代入される
        visible = element.is(':visible') #表示されているかどうかの判定
        height = $(window).scrollTop() #ページ先頭からの高さを取得する
        if height > 400         #もしページ先頭からの高さが400以上なら
            element.fadeIn() if !visible #指定した要素を表示させる
                                #↑この追加if ! は何!?
        else
            element.fadeOut() #そうじゃなければ非表示にする
            
    $(document).on 'click', '#move-page-top', ->  #指定要素がクリックされたときの挙動指定
        $('html, body').animate({ scrollTop: 0 }, 'slow') #0=一番上までゆっくりアニメートする
                 #インデントを下げないとコードが起動しないのかも? 

$(document).ready(ready) #初期読み込みコード
$(document).on('page:load', ready) #初期読み込みコード





