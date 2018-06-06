--[[
    komutEkle(komut,komut tipi,komut parametresi)

    komut: Örneğin "discord" yazarsanız chatte yazının başına discord yazdığınızda komut etkinleşir. 
    Eğer aşağıdaki komut prefiksi kısmına bir şey koyarsınız komutlardan önce onu prefixi yazmanız gerekir.

    komut tipi: Gösterme amaçlı ben bir tane komut tipi hazırladım o da "urlActirma". Parametre kısmındaki url'yi
    kullanarak fonksiyonu çalıştırıyor. Parametre kısmına istediğinizi koyabilirsiniz ( tablolar ve metalar dahil ). Lütfen meta koymayın... aptallık olur.
    Ayrıca özel yazarak parametreye direk bir fonksiyon yazabilirsiniz ( örneği aşağıda bulabilir ).

    komut parametresi: Kendini açıklıyor bence.
]]

--[[
	komutTipleri tablosuna aşağıda gösterildiği gibi komut tipi eklenebilir. Fonksiyon şu şekilde olmalıdır.

	function(oyuncu,parametre)

	oyuncu komutu kullanan oyuncu ve parametre de komutEkle kısmında kullanılan parametre ( örneğin bir url )

	NOT: komutTipleri en basit fonksiyonellikte komutlar oluşturmak içindir, eğer daha komplex tipler yapmak istiyorsanız 
	birazcık düzenleme yapmanız gerekli
]]

komutPrefiksi = "!" -- Bütün komutlarınız herhangi bir kelime veya noktalama işaretiyle başlayacaksa burayı değiştirin, aksi taktirde sadece içindeki !'i silebilirsiniz.

komutEkle("discord","urlActirma","https://discord.gg/PRFw27k") -- Bu bir URL açtırma komutu ekler. 

komutEkle("ozeltest","ozel",function(ply,msg,team) -- Ozel fonksiyonlu bir komut örneği
    ply:Kill()
end)


komutTipleri["urlActirma"] = function(ply,url) -- URL açtırma komut tipi örneği
    ply:SendLua( "gui.OpenURL(".. url ..")" )
end