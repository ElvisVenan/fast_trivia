import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../feature/domain/entities/questionnaires_entities/questionnaire_entity.dart';
import '../../feature/domain/entities/questionnaires_entities/options_entity.dart';
import '../../feature/domain/entities/questionnaires_entities/questions_enitity.dart';
import '../../feature/domain/params/args_params/change_question_entity.dart';

class DatabaseHelper {
  late Database _database;

  Future<void> initializeDatabase() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'questionnaire.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          CREATE TABLE Questionnaires (
            id INTEGER PRIMARY KEY,
            title TEXT
          )
        ''');
        db.execute('''
          CREATE TABLE Questions (
            id INTEGER PRIMARY KEY,
            title TEXT,
            question TEXT,
            answer INTEGER,
            questionnaireId INTEGER,
            FOREIGN KEY (questionnaireId) REFERENCES Questionnaires (id)
          )
        ''');
        db.execute('''
          CREATE TABLE Options (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            questionId INTEGER,
            FOREIGN KEY (questionId) REFERENCES Questions (id)
          )
        ''');
        db.execute('''
          CREATE TABLE change_question_entities (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            selectedQuestions TEXT
          )
        ''');
      },
    );
  }

  Future<void> saveChangeQuestionEntity(ChangeQuestionEntity changeQuestion) async {
    await _database.insert(
      'change_question_entities',
      {'selectedQuestions': changeQuestion.selectedQuestions?.join(',')},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertQuestionnaire(QuestionnaireEntity questionnaire) async {
    await _database.insert('Questionnaires',
        {'id': questionnaire.id, 'title': questionnaire.title});
    for (final question in questionnaire.questions) {
      await insertQuestion(question, questionnaire.id);
    }
  }

  Future<void> insertQuestion(
      QuestionsEntity question, int questionnaireId) async {
    await _database.insert(
      'Questions',
      {
        'id': question.id,
        'title': question.title,
        'question': question.question,
        'answer': question.answer,
        'questionnaireId': questionnaireId,
      },
    );
    for (final option in question.options) {
      await insertOption(option, question.id);
    }
  }

  Future<void> insertOption(OptionsEntity option, int questionId) async {
    await _database.insert(
      'Options',
      {'title': option.title, 'questionId': questionId},
    );
  }

  Future<List<ChangeQuestionEntity>> getAllChangeQuestionEntities() async {
    final db = _database;
    final List<Map<String, dynamic>> maps = await db.query('change_question_entities');

    return List.generate(maps.length, (index) {
      return ChangeQuestionEntity(
        id: maps[index]['id'],
        selectedQuestions: _parseSelectedQuestions(maps[index]['selectedQuestions']),
      );
    });
  }

  List<int> _parseSelectedQuestions(String selectedQuestionsString) {
    final List<String> questionIds = selectedQuestionsString.split(',');
    return questionIds.map((id) => int.parse(id)).toList();
  }


  Future<List<QuestionnaireEntity>> getQuestionnaires() async {
    final questionnaires = await _database.query('Questionnaires');
    final questionnaireList = <QuestionnaireEntity>[];

    for (final q in questionnaires) {
      final questions = await getQuestions(q['id'] as int);
      questionnaireList.add(QuestionnaireEntity(
          id: q['id'] as int,
          title: q['title'] as String,
          questions: questions));
    }

    return questionnaireList;
  }

  Future<List<int>> getSelectedQuestions() async {
    final List<Map<String, dynamic>> queryResult = await _database.query('SelectedQuestions');

    if (queryResult.isNotEmpty) {
      final String questionsString = queryResult.first['questions'];
      final List<int> selectedQuestions = questionsString.split(',').map(int.parse).toList();
      return selectedQuestions;
    } else {
      return [];
    }
  }


  Future<List<QuestionsEntity>> getQuestions(int questionnaireId) async {
    final questions = await _database.query('Questions',
        where: 'questionnaireId = ?', whereArgs: [questionnaireId]);
    final questionList = <QuestionsEntity>[];

    for (final q in questions) {
      final options = await getOptions(q['id'] as int);
      questionList.add(QuestionsEntity(
        id: q['id'] as int,
        title: q['title'] as String,
        question: q['question'] as String,
        answer: q['answer'] as int,
        options: options,
      ));
    }

    return questionList;
  }

  Future<List<OptionsEntity>> getOptions(int questionId) async {
    final options = await _database
        .query('Options', where: 'questionId = ?', whereArgs: [questionId]);
    final optionsList = <OptionsEntity>[];
    for (final opt in options) {
      optionsList.add(OptionsEntity(
        id: opt['id'] as int,
        title: opt['title'] as String,
      ));
    }
    return optionsList;
  }
}
