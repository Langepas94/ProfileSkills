<!DOCTYPE html>
<html>
<head>

</head>
<body>

<h1>-Мое резюме-</h1>
<h2>ТЗ тестового задания:</h2>
<ul>
  <li>Заголовок “Профиль”.</li>
  <li>Фотография пользователя (хардкод).</li>
  <li>Девиз пользователя, краткая информация. Лейбл ограничен двумя строчками, длинный текст обрезается троеточием. Значение - хардкод.</li>
  <li>Место жительства пользователя. Ограничен одной строкой, длинный текст обрезается троеточием. Значение - хардкод.</li>
  <li>Заголовок “Мои навыки” и кнопка режима редактирования. Иконка “карандашика” для входа в режим редактирования, иконка “галочки” для сохранения изменений.</li>
  <li>Блок мои навыки. Может редактироваться пользователем.</li>
  <li>Ограничение высоты ячейки одной строкой. Максимальная ширина ячейки ограничена шириной экрана минус боковые отступы. Количество ячеек (навыков) в разделе не ограничено. Если текст не помещается, сокращать троеточием.</li>
  <li>В режиме редактирования на каждую ячейку с навыком добавляется крестик, по нажатию на который, навык удаляется. Также добавляется ячейка с плюсиком, по нажатию на которую, добавляется новый навык. Навык вводится через нативную Alert View.</li>
  <li>О себе. Текстовый блок. Количество строк не ограничено. Значение - хардкод.</li>
</ul>

<table>
  <tr>
    <th>Режим редактирования</th>
    <th>Добавление элемента</th>
    <th>Скролл, если не помещается</th>
    <th>Удаление элементов из UserDefaults</th>
  </tr>
  <tr>
    <td style="text-align: center; padding: 10px; border: 1px solid black; width: 25%;">
      <img src="https://user-images.githubusercontent.com/108129792/259515224-91a36008-f6d2-4726-979e-aef22084f9f8.gif" alt="Гифка 1" style="width: 100%; height: auto;">
    </td>
    <td style="text-align: center; padding: 10px; border: 1px solid black; width: 25%;">
      <img src="https://user-images.githubusercontent.com/108129792/259515236-c996e734-d500-472f-9053-7d763b4daabf.gif" alt="Гифка 2" style="width: 100%; height: auto;">
    </td>
   <td style="text-align: center; padding: 10px; border: 1px solid black; width: 25%;">
      <img src="https://user-images.githubusercontent.com/108129792/259515241-2308e65b-8839-4acd-830a-4b1d4f76c7e4.gif" alt="Гифка 3" style="width: 100%; height: auto;">
    </td>
   <td style="text-align: center; padding: 10px; border: 1px solid black; width: 25%;">
      <img src="https://user-images.githubusercontent.com/108129792/259515245-8e450cd9-a34c-49d1-9702-4e609fa2baaf.gif" alt="Гифка 4" style="width: 100%; height: auto;">
    </td>
  </tr>
</table>

<h2>СТЕК:</h2>
<ul>
  <li>UIcollectionViewLayout</li>
  <li>DiffableDataSource</li>
  <li>UserDefaults (propertyWrapper)</li>
  <li>MVVM + AssemblyBuilder</li>
</ul>

</body>
</html>
