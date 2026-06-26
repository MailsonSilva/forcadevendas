// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// DSL struct ClienteResult
class ClienteResultStruct extends BaseStruct {
  ClienteResultStruct({
    /// ClienteResult.success
    bool? success,

    /// ClienteResult.message
    String? message,

    /// ClienteResult.codigo
    String? codigo,

    /// ClienteResult.nome
    String? nome,

    /// ClienteResult.cpfCnpj
    String? cpfCnpj,

    /// ClienteResult.ie
    String? ie,

    /// ClienteResult.rg
    String? rg,

    /// ClienteResult.email
    String? email,

    /// ClienteResult.endereco
    String? endereco,

    /// ClienteResult.numero
    String? numero,

    /// ClienteResult.bairro
    String? bairro,

    /// ClienteResult.cidade
    String? cidade,

    /// ClienteResult.uf
    String? uf,

    /// ClienteResult.cep
    String? cep,

    /// ClienteResult.telefone
    String? telefone,

    /// ClienteResult.tipo
    String? tipo,
  })  : _success = success,
        _message = message,
        _codigo = codigo,
        _nome = nome,
        _cpfCnpj = cpfCnpj,
        _ie = ie,
        _rg = rg,
        _email = email,
        _endereco = endereco,
        _numero = numero,
        _bairro = bairro,
        _cidade = cidade,
        _uf = uf,
        _cep = cep,
        _telefone = telefone,
        _tipo = tipo;

  // "success" field.
  bool? _success;
  bool get success => _success ?? false;
  set success(bool? val) => _success = val;

  bool hasSuccess() => _success != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  set message(String? val) => _message = val;

  bool hasMessage() => _message != null;

  // "codigo" field.
  String? _codigo;
  String get codigo => _codigo ?? '';
  set codigo(String? val) => _codigo = val;

  bool hasCodigo() => _codigo != null;

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  set nome(String? val) => _nome = val;

  bool hasNome() => _nome != null;

  // "cpfCnpj" field.
  String? _cpfCnpj;
  String get cpfCnpj => _cpfCnpj ?? '';
  set cpfCnpj(String? val) => _cpfCnpj = val;

  bool hasCpfCnpj() => _cpfCnpj != null;

  // "ie" field.
  String? _ie;
  String get ie => _ie ?? '';
  set ie(String? val) => _ie = val;

  bool hasIe() => _ie != null;

  // "rg" field.
  String? _rg;
  String get rg => _rg ?? '';
  set rg(String? val) => _rg = val;

  bool hasRg() => _rg != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "endereco" field.
  String? _endereco;
  String get endereco => _endereco ?? '';
  set endereco(String? val) => _endereco = val;

  bool hasEndereco() => _endereco != null;

  // "numero" field.
  String? _numero;
  String get numero => _numero ?? '';
  set numero(String? val) => _numero = val;

  bool hasNumero() => _numero != null;

  // "bairro" field.
  String? _bairro;
  String get bairro => _bairro ?? '';
  set bairro(String? val) => _bairro = val;

  bool hasBairro() => _bairro != null;

  // "cidade" field.
  String? _cidade;
  String get cidade => _cidade ?? '';
  set cidade(String? val) => _cidade = val;

  bool hasCidade() => _cidade != null;

  // "uf" field.
  String? _uf;
  String get uf => _uf ?? '';
  set uf(String? val) => _uf = val;

  bool hasUf() => _uf != null;

  // "cep" field.
  String? _cep;
  String get cep => _cep ?? '';
  set cep(String? val) => _cep = val;

  bool hasCep() => _cep != null;

  // "telefone" field.
  String? _telefone;
  String get telefone => _telefone ?? '';
  set telefone(String? val) => _telefone = val;

  bool hasTelefone() => _telefone != null;

  // "tipo" field.
  String? _tipo;
  String get tipo => _tipo ?? '';
  set tipo(String? val) => _tipo = val;

  bool hasTipo() => _tipo != null;

  static ClienteResultStruct fromMap(Map<String, dynamic> data) =>
      ClienteResultStruct(
        success: data['success'] as bool?,
        message: data['message'] as String?,
        codigo: data['codigo'] as String?,
        nome: data['nome'] as String?,
        cpfCnpj: data['cpfCnpj'] as String?,
        ie: data['ie'] as String?,
        rg: data['rg'] as String?,
        email: data['email'] as String?,
        endereco: data['endereco'] as String?,
        numero: data['numero'] as String?,
        bairro: data['bairro'] as String?,
        cidade: data['cidade'] as String?,
        uf: data['uf'] as String?,
        cep: data['cep'] as String?,
        telefone: data['telefone'] as String?,
        tipo: data['tipo'] as String?,
      );

  static ClienteResultStruct? maybeFromMap(dynamic data) => data is Map
      ? ClienteResultStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'success': _success,
        'message': _message,
        'codigo': _codigo,
        'nome': _nome,
        'cpfCnpj': _cpfCnpj,
        'ie': _ie,
        'rg': _rg,
        'email': _email,
        'endereco': _endereco,
        'numero': _numero,
        'bairro': _bairro,
        'cidade': _cidade,
        'uf': _uf,
        'cep': _cep,
        'telefone': _telefone,
        'tipo': _tipo,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'success': serializeParam(
          _success,
          ParamType.bool,
        ),
        'message': serializeParam(
          _message,
          ParamType.String,
        ),
        'codigo': serializeParam(
          _codigo,
          ParamType.String,
        ),
        'nome': serializeParam(
          _nome,
          ParamType.String,
        ),
        'cpfCnpj': serializeParam(
          _cpfCnpj,
          ParamType.String,
        ),
        'ie': serializeParam(
          _ie,
          ParamType.String,
        ),
        'rg': serializeParam(
          _rg,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'endereco': serializeParam(
          _endereco,
          ParamType.String,
        ),
        'numero': serializeParam(
          _numero,
          ParamType.String,
        ),
        'bairro': serializeParam(
          _bairro,
          ParamType.String,
        ),
        'cidade': serializeParam(
          _cidade,
          ParamType.String,
        ),
        'uf': serializeParam(
          _uf,
          ParamType.String,
        ),
        'cep': serializeParam(
          _cep,
          ParamType.String,
        ),
        'telefone': serializeParam(
          _telefone,
          ParamType.String,
        ),
        'tipo': serializeParam(
          _tipo,
          ParamType.String,
        ),
      }.withoutNulls;

  static ClienteResultStruct fromSerializableMap(Map<String, dynamic> data) =>
      ClienteResultStruct(
        success: deserializeParam(
          data['success'],
          ParamType.bool,
          false,
        ),
        message: deserializeParam(
          data['message'],
          ParamType.String,
          false,
        ),
        codigo: deserializeParam(
          data['codigo'],
          ParamType.String,
          false,
        ),
        nome: deserializeParam(
          data['nome'],
          ParamType.String,
          false,
        ),
        cpfCnpj: deserializeParam(
          data['cpfCnpj'],
          ParamType.String,
          false,
        ),
        ie: deserializeParam(
          data['ie'],
          ParamType.String,
          false,
        ),
        rg: deserializeParam(
          data['rg'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        endereco: deserializeParam(
          data['endereco'],
          ParamType.String,
          false,
        ),
        numero: deserializeParam(
          data['numero'],
          ParamType.String,
          false,
        ),
        bairro: deserializeParam(
          data['bairro'],
          ParamType.String,
          false,
        ),
        cidade: deserializeParam(
          data['cidade'],
          ParamType.String,
          false,
        ),
        uf: deserializeParam(
          data['uf'],
          ParamType.String,
          false,
        ),
        cep: deserializeParam(
          data['cep'],
          ParamType.String,
          false,
        ),
        telefone: deserializeParam(
          data['telefone'],
          ParamType.String,
          false,
        ),
        tipo: deserializeParam(
          data['tipo'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ClienteResultStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ClienteResultStruct &&
        success == other.success &&
        message == other.message &&
        codigo == other.codigo &&
        nome == other.nome &&
        cpfCnpj == other.cpfCnpj &&
        ie == other.ie &&
        rg == other.rg &&
        email == other.email &&
        endereco == other.endereco &&
        numero == other.numero &&
        bairro == other.bairro &&
        cidade == other.cidade &&
        uf == other.uf &&
        cep == other.cep &&
        telefone == other.telefone &&
        tipo == other.tipo;
  }

  @override
  int get hashCode => const ListEquality().hash([
        success,
        message,
        codigo,
        nome,
        cpfCnpj,
        ie,
        rg,
        email,
        endereco,
        numero,
        bairro,
        cidade,
        uf,
        cep,
        telefone,
        tipo
      ]);
}

ClienteResultStruct createClienteResultStruct({
  bool? success,
  String? message,
  String? codigo,
  String? nome,
  String? cpfCnpj,
  String? ie,
  String? rg,
  String? email,
  String? endereco,
  String? numero,
  String? bairro,
  String? cidade,
  String? uf,
  String? cep,
  String? telefone,
  String? tipo,
}) =>
    ClienteResultStruct(
      success: success,
      message: message,
      codigo: codigo,
      nome: nome,
      cpfCnpj: cpfCnpj,
      ie: ie,
      rg: rg,
      email: email,
      endereco: endereco,
      numero: numero,
      bairro: bairro,
      cidade: cidade,
      uf: uf,
      cep: cep,
      telefone: telefone,
      tipo: tipo,
    );
