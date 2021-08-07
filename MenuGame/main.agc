
// Project: MenuGame 
// Created: 2021-08-06

// show all errors
SetErrorMode(2)

// set window properties
SetWindowTitle( "MenuGame" )
SetWindowSize( 1024, 768, 0 )
SetWindowAllowResize( 1 ) // allow the user to resize the window

// set display properties
SetVirtualResolution( 1024, 768 ) // doesn't have to match the window
SetOrientationAllowed( 1, 1, 1, 1 ) // allow both portrait and landscape on mobile devices
SetSyncRate( 30, 0 ) // 30fps instead of 60 to save battery
SetScissor( 0,0,0,0 ) // use the maximum available screen space, no black borders
UseNewDefaultFonts( 1 ) // since version 2.0.22 we can use nicer default fonts


loadimage(1,"telamenu.png")
CreateSprite(1,1)
SetSpriteSize(1,GetVirtualWidth(),GetVirtualHeight())



LoadImage(2,"menusprites.png")
CreateSprite(2,2)
SetSpriteSize(2,364/1.5,71/1.5)
SetSpritePosition(2,(GetVirtualWidth()/2-GetSpriteWidth(2)/2),550)




do
    verificarClicks()
	
	
    Print( ScreenFPS() )
    Sync()
loop

function verificarClicks()
	x = GetPointerX()
	y = GetPointerY()
	
	if GetSpriteHitTest(2,GetPointerX(),GetPointerY())
		//print("BOTÃO SPRITE PRESSIONADO")
			if GetRawMouseLeftPressed()
				exibirConteudo()
			endif

		endif
		
		
	
endfunction


function exibirConteudo()
	
	/*DeleteSprite(1)
	DeleteSprite(2)
	DeleteImage(1)
	DeleteImage(2)*/
	
	//CARREGA IMAGES DA PERSONAGEM
	//PULANDO
	LoadImage(3,"jump/jump-1.png")
	LoadImage(4,"jump/jump-2.png")
	LoadImage(5,"jump/jump-3.png")
	LoadImage(6,"jump/jump-4.png")
	//CORRENDO
	LoadImage(7,"run/run-1.png")
	LoadImage(8,"run/run-2.png")
	LoadImage(9,"run/run-3.png")
	LoadImage(10,"run/run-4.png")
	LoadImage(11,"run/run-5.png")
	LoadImage(12,"run/run-6.png")
	LoadImage(13,"run/run-7.png")
	LoadImage(14,"run/run-8.png")
	
	
	//CARREGA IMAGENS DE OUTROS SPRITES
	LoadImage(15,"vehicles/v-police.png")
	LoadImage(16,"fundocompleto.png")
	
	
	//CRIA SPRITES DA PERSONAGEM
	CreateSprite(3,3) //pulando
	CreateSprite(4,7) //correndo
		
	
	//CRIA OUTROS SPRITES
	CreateSprite(5,15)
	createsprite(6,16)
	
		
	//adiciona animações
	//adicionar animações do personagem pulando
	AddSpriteAnimationFrame(3,4) 
	AddSpriteAnimationFrame(3,5) 
	AddSpriteAnimationFrame(3,6) 
	//adicionar animações do personagem correndo
	for i=6 to 14
		AddSpriteAnimationFrame(4,i) 
	next i
	
	//INICIA ANIMAÇÕES
	PlaySprite(3)
	PlaySprite(4)
	
	//SETA POSIÇÃO DOS SPRITES
	SetSpritePosition(3,100,100)
	SetSpritePosition(4,200,100)
	SetSpritePosition(5,300,100)
	SetSpritePosition(6,100,550)
	
	//ADICIONA E INICIA MUSIC
	LoadMusicOGG(1,"musica1.ogg")
	PlayMusicOGG(1)
	
	do 
		print(ScreenFPS())
		sync()
	loop
	
endfunction
