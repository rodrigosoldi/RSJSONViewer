//
//  ContentView.swift
//  RSJSONViewerExample
//
//  Created by Rodrigo Soldi on 28/09/24.
//

import SwiftUI
import RSJSONViewer

let json = """
{
  "name": "John Doe",
  "age": 30,
  "isEmployed": true,
  "salary": 55000.75,
  "hobbies": ["reading", "traveling", "swimming"],
  "address": {
    "street": "123 Main St",
    "city": "Anytown",
    "state": "CA",
    "postalCode": 12345
  },
  "previousJobs": [
    {
      "title": "Software Developer",
      "years": 2,
      "company": "Tech Corp",
      "isRemote": false
    },
    {
      "title": "Web Designer",
      "years": 1,
      "company": "Design Studio",
      "isRemote": true
    }
  ],
  "certifications": null,
  "languages": ["English", "Spanish"],
  "metadata": {
    "createdDate": "2024-09-27T10:00:00Z",
    "updatedDate": null,
    "isVerified": true
  },
  "scores": [99, 87, 92.5, 88],
  "preferences": {
    "notifications": {
      "email": true,
      "sms": false,
      "push": true
    },
    "theme": "dark",
    "fontSize": 14
  }
}
"""

//let json = """
//{
//    "id": 0,
//    "title": "Santa Zélia e São Luís Martin",
//      "description": "",
//      "prayers": {
//        "paiNosso": {
//          "title": "Pai Nosso",
//          "text": "Pai-Nosso que estais nos céus, santificado seja vosso nome, venha a nós o vosso reino, seja feita a vossa vontade assim na terra como no céu. \n\nO pão nosso de cada dia nos dai hoje, perdoai-nos as nossas ofensas assim como nós perdoamos a quem nos tem ofendido, e não nos deixeis cair em tentação, mas livrai-nos do mal.\n\nAmém."
//        },
//        "aveMaria": {
//          "title": "Ave Maria",
//          "text": "Ave Maria, cheia de graça, o Senhor é convosco, bendita sois vós entre as mulheres, e bendito é o fruto do vosso ventre, Jesus.\n\nSanta Maria, Mãe de Deus, rogai por nós, pecadores, agora e na hora da nossa morte.\n\nAmém."
//        },
//        "oracao": {
//          "title": "Oração",
//          "text": "Santos Luís e Zélia Martin, após sentirdes o desejo de vida religiosa, ouvistes o chamado do Senhor para a vocação do casamento. Sois os “pais sem igual” de quem vossa filha Santa Teresinha do Menino Jesus fala; os afortunados pais de Leônia, a Serva de Deus, Irmã Francisca Teresa; de Maria, Paulina e Celina, transplantadas para o Monte Carmelo; e dos quatro filhos tirados de vosso afeto na juventude: Helena, José, João Batista e Melânia Teresa.\n\nDestes toda a glória a Deus através de vosso trabalho humilde e paciente, do compromisso com os pobres e de vossa vida familiar, onde reinava a felicidade de amar e ser amado. Vivestes a vida cotidiana concretamente através das alegrias e tristezas de vossa existência. Amai-nos como a vossos próprios filhos, com o coração de um pai e o coração de uma mãe, porque sois amigos de Deus. Ouvi nossa oração e nosso pedido <<!(fazer o pedido)!>> e intercedei por nós junto a Deus Pai, através de Jesus Cristo, Nosso Senhor, a graça do Espírito Santo. Amém."
//        }
//      },
//      "meditations": {
//        "dia_1": {
//          "title": "",
//          "text": "",
//          "desc": "Luís e Zélia Martin, trazei-nos o dom de sermos receptivos ao Espírito de Deus. Luís e Zélia Martin, ensinai-nos a lembrar do dom do Espírito."
//        },
//        "dia_2": {
//          "title": "",
//          "text": "",
//          "desc": "Luís e Zélia Martin, na essência de vosso amor confirmastes o desejo pela concepção de cada um de vossos filhos. Em nossas vidas dadas pelo Pai, ajudai-nos a obter a graça da paz. Que possamos consagrar todas as nossas ações a Ele e dar a Ele todo o nosso amor."
//        },
//        "dia_3": {
//          "title": "",
//          "text": "",
//          "desc": "Luís e Zélia Martin nos ensinam uma compreensão do amor a partir de nossas provações e doenças. Os Santos Luís e Zélia intercedem por nós para que, em nossa verdadeira oferta, possamos nos tornar portadores de água para limpar as feridas d’Aquele que deu tudo por amor."
//        },
//        "dia_4": {
//          "title": "",
//          "text": "",
//          "desc": "Luís e Zélia Martin, ensinai-nos a trilhar caminhos de cura em nossas famílias adoentadas. Luís e Zélia Martin, ensinai-nos a dizer “sim” ou “não”. Que possamos testemunhar os acontecimentos de nossas vidas à luz da verdade e da caridade."
//        },
//        "dia_5": {
//          "title": "",
//          "text": "",
//          "desc": "Santos Luís e Zélia Martin, ensinai-nos todos os dias a descobrir ne reconhecer o triunfo do amor sobre o sofrimento, encorajado por Teresa. Tal como aceitastes o sofrimento, fazei-nos aceitá-lo igualmente, confiando-nos, para nossa cura, à Virgem Maria e a São José. Obrigado, Luís e Zélia Martin, por mostrar-nos o caminho para escolher e aceitar nossa vocação de filhos e filhas, que vivem em Nazaré tal como vivíeis em Les Buissonnets com vossa família."
//        },
//        "dia_6": {
//          "title": "",
//          "text": "",
//          "desc": "Santos Luís e Zélia Martin, ensinai-nos a ser simples e pobres de espírito como instrumentos de Deus. Assim como Santa Teresinha preparou o altar para cada Eucaristia, que possamos convidar nosso Deus para nossa mesa; que possamos nos tornar Seus servos enquanto esperamos pela Sua presença."
//        },
//        "dia_7": {
//          "title": "",
//          "text": "",
//          "desc": "Santa Zélia Martin, mostrai-nos o caminho de Maria, o grande caminho da infância profetizado por Santa Teresinha. Renasçamos no coração de Maria em confiança, abandonando nossa própria força. Luís e Zélia Martin, ensinai-nos a abandonar-nos ao tempo e às graças do Pai, pelo poder do Espírito Santo."
//        },
//        "dia_8": {
//          "title": "",
//          "text": "",
//          "desc": "Santos Luís e Zélia Martin, ensinai-nos o caminho da infância, o caminho da pureza, que nos leva de volta à Casa do Pai. Vossa família pode nos levar ao mistério de um Deus tão terno quanto uma mãe."
//        },
//        "dia_9": {
//          "title": "",
//          "text": "",
//          "desc": "Santos Luís e Zélia Martin, consagrados no coração da família de Nazaré, ensinai-nos o desejo de consagração. Amém.\n\nSantos Luís e Zélia Martin, vos pedimos a consagração, para nós mesmos, nossas famílias e todas as famílias do mundo. Amém.\n\nSanta Zélia Martin, através de Santa Teresinha, dai-nos o amor da vida. Amém.\n\nSão Luís Martin, rei de tua família, através de Santa Teresinha, ensinai-nos a liturgia da família, onde podemos ser chamados de sacerdotes, profetas e reis.\n\nAmém."
//        },
//        "introducao": {
//          "title": "",
//          "text": "",
//          "desc": "“Deus criou o homem à sua imagem; criou-o à imagem de Deus, criou o homem e a mulher. (Gênesis 1,27)\n\nQue alegria é experimentar a criação diária de Deus em torno de nós. Não hesitemos em cantar o hino: “Vós todas, obras do Senhor, bendizei o Senhor: cantai-o e exaltai-o para sempre!” (Daniel 3,57). Nossos caminhos na terra sobem e descem, são claros e escuros, úmidos e secos, de névoa e fogo. Tudo tem por objetivo manifestar um hino à criação. Luís Martin descreveu para seus filhos os profundos vales e os picos majestosos das paisagens que amava. Junto de sua pequena rainha, Teresa, contemplou toda a Criação, incluindo os ciprestes e o céu italiano.\n\nComo bom pai, ainda nos leva a ouvir o murmurar dos rios e o canto dos pássaros que falam acerca da terra. Luís Martin leva-nos à beira do mar e do céu, sentindo com alegria a água do mar e a espuma das ondas. Em companhia de Teresa, leu nas estrelas o brilho de Deus; conhecia os pardais e as águias, a neve tal qual pólen nas pedras do Coliseu, as cores da terra e seus pomares. Assim, nos crepúsculos e manhãs da Normandia, Luís Martin orquestrou sua música familiar: uma ode a Deus. Cantava todas as noites e recitava um poema sobre o Criador de sua família; e Zélia Martin, que entendia a beleza secreta do cristal de neve, reproduzia esta beleza em rendas, criando adornos para festas e lembrancinhas.\n\nPor sua vez, tenhamos em conta o ritmo dos nossos filhos, o tempo das estações e os tempos de vida e suas pequenas mortes. Que possamos levantar nossas mãos para louvar a Deus na criação e agradecer-Lhe. Junto de Luís e Zélia Martin vamos redescobrir o profundo significado da vida no Espírito Divino. Sim, vamos encontrar o desejo da nossa vida. “Santo Imortal, tenha misericórdia de nós. Tu és Deus, o doador da vida. Purifica-nos de todo pecado, pois Tu és totalmente bom.” (Liturgia das Vésperas)."
//        }
//      },
//      "novena": [
//        {
//          "type": "meditation",
//          "ref": "introducao"
//        },
//        {
//          "type": "sequence",
//          "title": "1º Dia",
//          "steps": [
//            {
//              "type": "meditation",
//              "ref": "dia_1"
//            },
//            {
//              "type": "prayer",
//              "ref": "paiNosso"
//            },
//            {
//              "type": "prayer",
//              "ref": "aveMaria"
//            },
//            {
//              "type": "prayer",
//              "ref": "oracao"
//            }
//          ]
//        },
//        {
//          "type": "sequence",
//          "title": "2º Dia",
//          "steps": [
//            {
//              "type": "meditation",
//              "ref": "dia_2"
//            },
//            {
//              "type": "prayer",
//              "ref": "paiNosso"
//            },
//            {
//              "type": "prayer",
//              "ref": "aveMaria"
//            },
//            {
//              "type": "prayer",
//              "ref": "oracao"
//            }
//          ]
//        },
//        {
//          "type": "sequence",
//          "title": "3º Dia",
//          "steps": [
//            {
//              "type": "meditation",
//              "ref": "dia_3"
//            },
//            {
//              "type": "prayer",
//              "ref": "paiNosso"
//            },
//            {
//              "type": "prayer",
//              "ref": "aveMaria"
//            },
//            {
//              "type": "prayer",
//              "ref": "oracao"
//            }
//          ]
//        },
//        {
//          "type": "sequence",
//          "title": "4º Dia",
//          "steps": [
//            {
//              "type": "meditation",
//              "ref": "dia_4"
//            },
//            {
//              "type": "prayer",
//              "ref": "paiNosso"
//            },
//            {
//              "type": "prayer",
//              "ref": "aveMaria"
//            },
//            {
//              "type": "prayer",
//              "ref": "oracao"
//            }
//          ]
//        },
//        {
//          "type": "sequence",
//          "title": "5º Dia",
//          "steps": [
//            {
//              "type": "meditation",
//              "ref": "dia_5"
//            },
//            {
//              "type": "prayer",
//              "ref": "paiNosso"
//            },
//            {
//              "type": "prayer",
//              "ref": "aveMaria"
//            },
//            {
//              "type": "prayer",
//              "ref": "oracao"
//            }
//          ]
//        },
//        {
//          "type": "sequence",
//          "title": "6º Dia",
//          "steps": [
//            {
//              "type": "meditation",
//              "ref": "dia_6"
//            },
//            {
//              "type": "prayer",
//              "ref": "paiNosso"
//            },
//            {
//              "type": "prayer",
//              "ref": "aveMaria"
//            },
//            {
//              "type": "prayer",
//              "ref": "oracao"
//            }
//          ]
//        },
//        {
//          "type": "sequence",
//          "title": "7º Dia",
//          "steps": [
//            {
//              "type": "meditation",
//              "ref": "dia_7"
//            },
//            {
//              "type": "prayer",
//              "ref": "paiNosso"
//            },
//            {
//              "type": "prayer",
//              "ref": "aveMaria"
//            },
//            {
//              "type": "prayer",
//              "ref": "oracao"
//            }
//          ]
//        },
//        {
//          "type": "sequence",
//          "title": "8º Dia",
//          "steps": [
//            {
//              "type": "meditation",
//              "ref": "dia_8"
//            },
//            {
//              "type": "prayer",
//              "ref": "paiNosso"
//            },
//            {
//              "type": "prayer",
//              "ref": "aveMaria"
//            },
//            {
//              "type": "prayer",
//              "ref": "oracao"
//            }
//          ]
//        },
//        {
//          "type": "sequence",
//          "title": "9º Dia",
//          "steps": [
//            {
//              "type": "meditation",
//              "ref": "dia_9"
//            },
//            {
//              "type": "prayer",
//              "ref": "paiNosso"
//            },
//            {
//              "type": "prayer",
//              "ref": "aveMaria"
//            },
//            {
//              "type": "prayer",
//              "ref": "oracao"
//            }
//          ]
//        }
//      ]
//}
//"""

struct ContentView: View {
    var body: some View {
        RSJSONViewer(json: json)
    }
}

#Preview {
    ContentView()
}
