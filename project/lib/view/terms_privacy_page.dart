import 'package:flutter/material.dart';

class TermsAndPrivacyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Termos e Privacidade'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Termos de Serviço',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Bem-vindo ao SalaConnect!',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Por favor, leia estes Termos de Serviço cuidadosamente antes de usar o SalaConnect operado por nós.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Text(
                'Condições de Uso',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              const Text(
                'Ao acessar ou usar o Serviço, você concorda em cumprir e estar sujeito a estes Termos. Se você discordar de qualquer parte dos termos, não poderá acessar o Serviço.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Text(
                'Contas',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              const Text(
                'Ao criar uma conta conosco, você deve fornecer informações precisas, completas e atualizadas. O não cumprimento constitui uma violação dos Termos, o que pode resultar no encerramento imediato da sua conta em nosso Serviço.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Text(
                'Propriedade Intelectual',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              const Text(
                'O Serviço e todo o seu conteúdo, incluindo, sem limitação, texto, gráficos, imagens, logotipos e software, são de propriedade da [Seu Nome ou Nome da Empresa] e estão protegidos por leis de direitos autorais, marcas comerciais e outras leis de propriedade intelectual.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Text(
                'Links para Outros Sites',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              const Text(
                'Nosso Serviço pode conter links para sites ou serviços de terceiros que não são de nossa propriedade ou controlados por nós. Não temos controle e não assumimos responsabilidade pelo conteúdo, políticas de privacidade ou práticas de quaisquer sites ou serviços de terceiros.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Text(
                'Rescisão',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              const Text(
                'Podemos rescindir ou suspender o acesso ao nosso Serviço imediatamente, sem aviso prévio ou responsabilidade, por qualquer motivo, incluindo, sem limitação, se você violar os Termos.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Text(
                'Limitação de Responsabilidade',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              const Text(
                'Em nenhum caso a [Seu Nome ou Nome da Empresa], nem seus diretores, funcionários, parceiros, agentes, fornecedores ou afiliados, serão responsáveis por quaisquer danos indiretos, incidentais, especiais, consequenciais ou punitivos, incluindo, sem limitação, perda de lucros, dados, uso, fundo de comércio ou outras perdas intangíveis, resultantes (i) do seu acesso, uso ou incapacidade de acessar ou usar o Serviço; (ii) de qualquer conduta ou conteúdo de terceiros no Serviço; (iii) de qualquer conteúdo obtido do Serviço; e (iv) do acesso, uso ou alteração não autorizada de suas transmissões ou conteúdo, seja com base em garantia, contrato, delito (incluindo negligência) ou qualquer outra teoria legal, independentemente de termos sido informados ou não da possibilidade de tais danos, e mesmo se um remédio aqui estabelecido falhar em seu propósito essencial.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Text(
                'Alterações',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              const Text(
                'Reservamo-nos o direito, a nosso exclusivo critério, de modificar ou substituir estes Termos a qualquer momento. Se uma revisão for material, tentaremos fornecer um aviso com pelo menos 30 dias de antecedência antes de quaisquer novos termos entrarem em vigor. O que constitui uma mudança material será determinado a nosso exclusivo critério.',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Text(
                'Contato',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              const Text(
                'Se você tiver alguma dúvida sobre estes Termos, entre em contato conosco em [email@example.com].',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: Text('Fechar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(0, 51, 102, 1),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
