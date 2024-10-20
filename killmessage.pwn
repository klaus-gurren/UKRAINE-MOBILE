/*
	{F81414} - червоний
	{FFFFFF} -  білий, -1
	{FFFF00} - жовтий 
*/ 
new const killreason[][] = {
    "Кулаків", "Кастета", "Клюшки для гольфа", "Поліцейської дубинки", 
    "Ножа", "Бейсбольної бити", "Лопати", "Більярдного кия", 
    "Катани", "Бензопили", "Великого дилдо", "Малого дилдо", 
    "Великого вібратора", "Малого вібратора", "Квітів", "Тростя", 
    "Гранати", "Сльозоточивого газу", "", "", 
    "", "Коктеля молотова", "Кольта.45", "Кольта.45 з глушителем", 
    "Desert Eagle", "Дробовика", "Обріза", "Дробовика SPAS-12", 
    "Микро-Узи", "MP5", "АК-47", "M4", 
    "TEC-9", "Гвинтівки", "Снайперскої гвинтівки", "Гранатомета",
    "Самонаводящого гранатомета", "Вогнемета", "Мінігана", "Взривчатки",
    "Детонатора", "Балончика з краскою", "Вогнетушителя"};

public OnPlayerDeath(playerid, killerid, reason) //В калбек який викликається після смерті персонажа
{
	if(killerid != INVALID_PLAYER_ID) //перевірка щоб не спрацьовувало якщо гравець вбив сам себе.
	{
   	    new nick[MAX_PLAYER_NAME +1];
  	    GetPlayerName(killerid, nick, sizeof(nick));
  
  	    new year, month, day, hour, minuite; //створюємо відмінні для зберігання дати та часу
            getdate(year, month, day); //дізнаємось дату та записуємо в змінні
  	    gettime(hour, minuite); //дізнаємось час та записуємо
 
 	    new gun = GetPlayerWeapon(killerid);
            new string[62+(-6+MAX_PLAYER_NAME +3 +27)+1]; //створюємо відмінні для зберігання текста, для мінімального споживання памяті підрахував макс.розмір символів
  	    format(string, sizeof(string), "Ви були вбиті гравцем {F81414}%s[%d]. {FFFFFF}За допомогою: %s", nick, killerid, killreason[gun]); //форматуємо сам текст
	    SendClientMessage(playerid, -1, string); //Відправляємо текст в чат playerid
		
 	    format(string, sizeof(string), "Час смерті {FFFF00}%02d:%02d | {FFFFFF}Дата: {FFFF00}%02d.%02d.%d", hour, minuite, day, month, year);
	    SendClientMessage(playerid, -1, string);
	}
    return 1;
}
