uses crt;

const
  MAX_SIZE = 100;

type
  Deck = record
    data: array[0..MAX_SIZE] of Integer;
    size: Integer;
  end;

procedure Init(var deck: Deck);
begin
  deck.size := 0;
end;

procedure Push(var deck: Deck; element: Integer);
begin
  if deck.size < MAX_SIZE then
  begin
    deck.data[deck.size] := element;
    inc(deck.size);
  end
  else
    print('Ошибка: ДЕК заполнен!');
end;

procedure InsertFirst(var deck: Deck; element: Integer);
begin
  if deck.size = MAX_SIZE then 
    println('Дек переполнен!')
  else
  begin
    for var i := deck.size - 1 downto 0 do
      deck.data[i + 1] := deck.data[i];
    deck.data[0] := element;
    inc(deck.size)
  end;
end;

procedure Pop(var deck: Deck);
begin
  if deck.size > 0 then
    dec(deck.size)
  else
    println('Ошибка: ДЕК пустой!');
end;

procedure DeleteFirst(var deck: Deck);
begin
  if deck.size = 0 then 
    println('Дек пуст!')
  else
  begin
    for var i := 0 to deck.size - 1 do 
      deck.data[i] := deck.data[i + 1];
    deck.size := deck.size - 1;
  end;
end;

procedure Clear(var deck: Deck);
begin
  deck.size := 0;
  println('Дек очищен')
end;

procedure Print(const deck: Deck);
begin
  if deck.size <> 0 then begin
    print('ДЕК: ');
    for var i := 0 to deck.size - 1 do
      print(deck.data[i], ' ');
    println
  end;
  if deck.size = 0 then println('ДЕК пуст!')
end;

var
  d: Deck;
  choice: integer;

begin
  Init(d);
  
  repeat
    println();
    println('1. Добавить элемент в конец');
    println('2. Добавить элемент в начало');
    println('3. Удалить последний элемент');
    println('4. Удалить первый элемент');
    println('5. Вывести ДЕК');
    println('6. Очистить ДЕК');
    println('7. Выход');
    choice := ReadInteger('Ваш выбор:');
    
    case choice of
      1:
        begin
          var element := ReadlnInteger('Введите элемент для добавления: ');
          Push(d, element);
        end;
      2:
        begin
          var element := ReadlnInteger('Введите элемент для добавления: ');
          InsertFirst(d, element);
        end;
      3: Pop(d);
      4: DeleteFirst(d);
      5: Print(d);
      6: Clear(d);
    end;
  until choice = 7;
end.