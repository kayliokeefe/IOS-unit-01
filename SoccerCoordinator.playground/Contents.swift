
/*
    --------------------
        PLAYER DATA
    --------------------
 */
let player1: [String: Any] = ["name": "Joe Smith",
                              "height": 42,
                              "experience": true,
                              "guardians":"Jim and Jan Smith"]
let player2: [String: Any] = ["name": "Jill Tanner",
                              "height": 36,
                              "experience": true,
                              "guardians": "Clara Tanner"]
let player3: [String: Any] = ["name": "Bill Bon",
                              "height": 43,
                              "experience": true,
                              "guardians": "Sara and Jenny Bon"]
let player4: [String: Any] = ["name": "Eva Gordan",
                              "height": 45,
                              "experience": false, "guardians": "Wendy and Mike Gordan"]
let player5: [String: Any] = ["name": "Matt Gill",
                              "height": 40,
                              "experience": false,
                              "guardians": "Charles and Sylvia Gill"]
let player6: [String: Any] = ["name": "Kimmy Stein",
                              "height": 41 ,
                              "experience": false,
                              "guardians": "Bill and Hillary Stein"]
let player7: [String: Any] = ["name": "Sammy Adams",
                              "height": 45,
                              "experience": false,
                              "guardians": "Jeff Adams"]
let player8: [String: Any] = ["name": "Karl Saygan",
                              "height" :42 ,
                              "experience":true,
                              "guardians": "Heather Bledsoe"]
let player9: [String: Any] = ["name": "Suzane Greenberg",
                              "height": 44 ,
                              "experience": true,
                              "guardians": "Henrietta Dumas"]
let player10: [String: Any] = ["name": "Sal Dali",
                               "height": 41,
                               "experience": false,
                               "guardians": "Gala Dali"]
let player11: [String: Any] = ["name": "Joe Kavalier",
                               "height": 39,
                               "experience": false,
                               "guardians": "Sam and Elaine Kavalier"]
let player12: [String: Any] = ["name": "Ben Finkelstein",
                               "height": 44,
                               "experience": false,
                               "guardians": "Aaron and Jill Finkelstein"]
let player13: [String: Any] = ["name": "Diego Soto",
                               "height": 41,
                               "experience": true,
                               "guardians": "Robin and Sarika Soto"]
let player14: [String: Any] = ["name": "Chloe Alaska",
                               "height": 47,
                               "experience": false,
                               "guardians": "David and Jamie Alaska"]
let player15: [String: Any] = ["name": "Arnold Willis",
                               "height": 43,
                               "experience":false,
                               "guardians": "Claire Willis"]
let player16: [String: Any] = ["name": "Phillip Helm",
                               "height": 44,
                               "experience": true,
                               "guardians": "Thomas Helm and Eva Jones"]
let player17: [String: Any] = ["name": "Les Clay",
                               "height":42 ,
                               "experience":true ,
                               "guardians": "Wynonna Brown"]
let player18: [String: Any] = ["name": "Herschel Krustofski",
                               "height":45 , "experience":true,
                               "guardians": "Hyman and Rachel Krustofski"]



/*
    Function to iterate through array containing data for ALL players. Return two arrays, one consisting of experienced players, one consisting of inexperienced players
 
 */

func experienceOrInexperienced(players: [[String: Any]]) -> (experienced: [[String: Any]], inexperienced: [[String: Any]]) {
    var exper: [[String: Any]] = [[:]]
    var inExper: [[String: Any]] = [[:]]
    for player in players{
        if(player["experience"] as? Bool == true){
            exper.append(player)
        }
        else{
            inExper.append(player)
        }
    }
    return (exper, inExper)

}


/*
    Function to iterate through an array of players and divide them into 3 teams. Arguement will be either the array of experienced players or the array of inexperienced players
 */
func dividePlayers(players: [[String: Any]]) -> (teamOne: [[String: Any]], teamTwo: [[String: Any]], teamThree: [[String: Any]]){
    var teamOne: [[String: Any]] = [[:]]
    var teamTwo: [[String: Any]] = [[:]]
    var teamThree: [[String: Any]] = [[:]]

    // index to keep track of alternating players in  array
    var idx = 0;
    // Assign players to one of 3 teams alternating
    while idx < players.count{
        if(idx % 3 == 0){
            teamOne.append(players[idx])
        }else if(idx % 3 == 1){
           teamTwo.append(players[idx])
        }else{
            teamThree.append(players[idx])
        }
        // don't forget to incrememnt the index!
        idx+=1
    }
    // return teams as a tuple
    return (teamOne, teamTwo, teamThree)
}


/*
    Generate all player letters for an individual team
 
 */
func generateLetters(team: (name: String, players: [[String: Any]], dateOfPractice: String, timeOfPractice: String)) -> [String]{
    
    let teamName = team.name
    let practiceTime = team.timeOfPractice
    let practiceDate = team.dateOfPractice
   // let teamPlayers = team.players
    var letters: [String] = []
    for player in team.players{
        if let name = player["name"], let guardians = player["guardians"]{
            let playerLetter =   """
                Dear \(guardians),
                We are happy to inform you that \(name) has been selected for the \(teamName)
                Youth Soccer Team! We will see you at the first practice on \(practiceDate) at \(practiceTime). See you then!
                """
            
            letters.append(playerLetter)
            
        }
  
    }
    
    return letters
  
}

/*
 Function to print all letters to the console
 */
func printLetters(letters: [String]) -> Void{
    for letter in letters{
        print(letter)
    }
}


/*
 ----------------------
    END OF FUNCTIONS
 ----------------------
 
 */



// Create an array containing all players
let allPlayers = [player1, player2, player3, player4, player5, player6, player7, player8, player9, player10, player11, player12, player13, player14, player15, player16, player17, player18]




// array of experienced players
var hasExperience = experienceOrInexperienced(players: allPlayers).experienced

// array of inexperienced players
var noExperience = experienceOrInexperienced(players: allPlayers).inexperienced

// divide experienced players equally among three teams
var teamsFromExperienced = dividePlayers(players: hasExperience)

// divide inexperienced players equally among three teams
var teamsFromInexperienced = dividePlayers(players: noExperience)

// for each team, combine the experienced and inexperienced players to get the full team
let teamDragons = teamsFromExperienced.teamOne + teamsFromInexperienced.teamOne
let teamSharks = teamsFromExperienced.teamTwo + teamsFromInexperienced.teamTwo
let teamRaptors = teamsFromExperienced.teamThree + teamsFromInexperienced.teamThree

// generate letters for each team
let dragonLetters = generateLetters(team: (name: "Dragons", players: teamDragons, dateOfPractice: "March 17", timeOfPractice: "1pm"))
let sharkLetters = generateLetters(team: (name: "Sharks", players: teamSharks, dateOfPractice: "March 17", timeOfPractice: "3pm"))
let raptorLetters = generateLetters(team: (name: "Raptors", players: teamRaptors, dateOfPractice: "March 18", timeOfPractice: "1pm"))


// Save all player letters to a collection called letters
let letters: [String] = dragonLetters + sharkLetters + raptorLetters


// print letters for each team to the console
printLetters(letters: letters)













