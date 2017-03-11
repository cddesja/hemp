#' WISC-R scores on 175 children
#'
#' The WISC-R subscale data from Tabacknick & Fidell, 3rd ed "Using Multivariate Statistics". The suscale scores come for the second version of the Wechsler Intelligence Test for Children. The students were school-aged children previously diagnosed as learning-disabled. The data were collected between 1972 and 1984.
#'
#' @docType data
#' @keywords dataset
#' @format A data frame with 175 rows and 13 variables:
#' \describe{
#'   \item{info}{Information}
#'   \item{comp}{Comprehension}
#'   \item{arith}{Arithmetic knowledge}
#'   \item{simil}{Similarities}
#'   \item{vocab}{Vocabulary}
#'   \item{digit}{Digit span}
#'   \item{pictcomp}{Picture comprehension}
#'   \item{parang}{Picture arrangement}
#'   \item{block}{Block design}
#'   \item{object}{Object assembly}
#'   \item{coding}{Coding}
#' }
#' @source \url{http://psych.colorado.edu/~carey/Courses/PSYC7291/ClassDataSets.htm}
"wiscsem"

#' Fabricated cognitive, personality, and vocational interest inventory
#'
#' The data come from a fabricated cognitive, personality, and vocational interested inventory. This data set can be used to demonstrate regression and structural equation modeling.
#'
#' @docType data
#' @keywords dataset
#' @format A data frame with 250 rows and 33 variables:
#' \describe{
#'  \item{gender}{1 is female and 2 is male}
#'  \item{educ}{Years of education}
#'  \item{age}{Age, in years}
#'  \item{vocab}{Vocabulary test}
#'  \item{reading}{Reading comprehension}
#'  \item{sentcomp}{Sentence completion}
#'  \item{mathmtcs}{Mathematics}
#'  \item{geometry}{Geometry}
#'  \item{analyrea}{Analytical reasoning}
#'  \item{socdom}{Social dominance}
#'  \item{sociabty}{Sociability}
#'  \item{stress}{Stress reaction}
#'  \item{worry}{Worry scale}
#'  \item{impulsve}{Impulsivity}
#'  \item{thrillsk}{Thrill-seeking}
#'  \item{carpentr}{Carpentry}
#'  \item{forestr}{Forest ranger}
#'  \item{morticin}{Mortician}
#'  \item{policemn}{Police}
#'  \item{fireman}{Fireman}
#'  \item{salesrep}{Sales representative}
#'  \item{teacher}{Teacher}
#'  \item{busexec}{Business executive}
#'  \item{stockbrk}{Stock broker}
#'  \item{artist}{Artist}
#'  \item{socworkr}{Social worker}
#'  \item{truckdvr}{Truck driver}
#'  \item{doctor}{Doctor}
#'  \item{clergymn}{Clergyman}
#'  \item{lawyer}{Lawyer}
#'  \item{actor}{Actor}
#'  \item{archtct}{Architect}
#'  \item{landscpr}{Landscaper}
#' }
#' @source \url{http://psych.colorado.edu/~carey/Courses/PSYC7291/ClassDataSets.htm}
"interest"


#' Synthetic Aperture Personality Assessment
#'
#' SAPA is a dataset borrowed from the psych package (Revelle, 2015). SAPA was taken from  the Synthetic Aperture Personality Assessment (SAPA), which is a web based personality assessment project. SAPA consists of 16 multiple-choice items responded by 1525 examinees. All the items are scored dichotomously.
#' @docType data
#' @format  A data frame with 1525 examinees on the following 16 multiple-choice items.The number following the name is the item number from SAPA:
#' \describe{
#' \item{reason.4}{Basic reasoning question}
#' \item{reason.16}{Basic reasoning question}
#' \item{reason.17}{Basic reasoning question}
#' \item{reason.19}{Basic reasoning question }
#' \item{letter.7}{In the following alphanumeric series, what letter comes next?}
#' \item{letter.33}{In the following alphanumeric series, what letter comes next?}
#' \item{letter.34}{In the following alphanumeric series, what letter comes next}
#' \item{letter.58}{In the following alphanumeric series, what letter comes next?}
#' \item{matrix.45}{A matrix reasoning task}
#' \item{matrix.46}{A matrix reasoning task}
#' \item{matrix.47}{A matrix reasoning task}
#' \item{matrix.55}{A matrix reasoning task}
#' \item{rotate.3}{Spatial Rotation of type 1.2}
#' \item{rotate.4}{Spatial Rotation of type 1.2}
#' \item{rotate.6}{Spatial Rotation of type 1.1}
#' \item{rotate.8}{Spatial Rotation of type 2.3}
#' }
#' @details 16 items were sampled from 80 items given as part of the SAPA (\url{http://sapa-project.org}) project  (Condon and Revelle, 2014; Revelle, Wilt and Rosenthal, 2009) to develop online measures of ability. These 16 items reflect four lower order factors (verbal reasoning, letter series, matrix reasoning, and spatial rotations.  These lower level factors all share a higher level factor ('g'). This data set is a good example of doing item analysis to examine the empirical response probabilities of each item alternative as a function of the underlying latent trait. When doing this, it appears that two of the matrix reasoning problems do not have monotonically increasing trace lines for the probability correct.  At moderately high ability (theta = 1), there is a decrease in the probability correct from theta = 0 and theta = 2.
#' @source The example data set is taken from the Synthetic Aperture Personality Assessment personality and ability test at \url{http://sapa-project.org}. The data were collected with David Condon from 8/08/12 to 8/31/12.
#' @references Condon, David and Revelle, William, (2014) The International Cognitive Ability Resource:  Development and initial validation of a public-domain measure. Intelligence, 43, 52-64.
#' @references  Revelle, W. (2015) psych: Procedures for Personality and Psychological Research, Northwestern University, Evanston, Illinois, USA, http://CRAN.R-project.org/package=psych Version = 1.5.8.
#' @references  Revelle, William, Wilt, Joshua,  and Rosenthal, Allen (2010)  Personality and Cognition: The Personality-Cognition Link. In Gruszka, Alexandra  and Matthews, Gerald   and Szymura, Blazej (Eds.) Handbook of Individual Differences in Cognition: Attention, Memory and Executive Control, Springer.
#'
"SAPA"



#' Humor Styles Questionnaire
#'
#' The Humor Styles Questionnaire (HSQ) data set comes from an interactive online version of the Humor Styles Questionnaire (Martin, Puhlik-Doris, Larsen, Gray, & Weir, 2003).
#' @docType data
#' @format  A data frame with 1070 participants who answered 32 items about their humor styles. The variables Q1 through Q32 were statements rated on a five point scale where 1=Never or very rarely true, 2=Rarely true, 3= Sometimes true, 4= Often true, 5=Very often or always true. The following are the items in HSQ:
#' \describe{
#' \item{Q1}{I usually don't laugh or joke around much with other people.}
#' \item{Q2}{If I am feeling depressed, I can usually cheer myself up with humor.}
#' \item{Q3}{If someone makes a mistake, I will often tease them about it.}
#' \item{Q4}{I let people laugh at me or make fun at my expense more than I should.}
#' \item{Q5}{I don't have to work very hard at making other people laugh-I seem to be a naturally humorous person.}
#' \item{Q6}{Even when I'm by myself, I'm often amused by the absurdities of life.}
#' \item{Q7}{People are never offended or hurt by my sense of humor.}
#' \item{Q8}{I will often get carried away in putting myself down if it makes my family or friends laugh.}
#' \item{Q9}{I rarely make other people laugh by telling funny stories about myself.}
#' \item{Q10}{If I am feeling upset or unhappy I usually try to think of something funny about the situation to make myself feel better.}
#' \item{Q11}{When telling jokes or saying funny things, I am usually not very concerned about how other people are taking it.}
#' \item{Q12}{I often try to make people like or accept me more by saying something funny about my own weaknesses, blunders, or faults.}
#' \item{Q13}{I laugh and joke a lot with my closest friends.}
#' \item{Q14}{My humorous outlook on life keeps me from getting overly upset or depressed about things.}
#' \item{Q15}{I do not like it when people use humor as a way of criticizing or putting someone down.}
#' \item{Q16}{I don't often say funny things to put myself down.}
#' \item{Q17}{I usually don't like to tell jokes or amuse people.}
#' \item{Q18}{If I'm by myself and I'm feeling unhappy, I make an effort to think of something funny to cheer myself up.}
#' \item{Q19}{Sometimes I think of something that is so funny that I can't stop myself from saying it, even if it is not appropriate for the situation.}
#' \item{Q20}{I often go overboard in putting myself down when I am making jokes or trying to be funny.}
#' \item{Q21}{I enjoy making people laugh.}
#' \item{Q22}{If I am feeling sad or upset, I usually lose my sense of humor.}
#' \item{Q23}{I never participate in laughing at others even if all my friends are doing it.}
#' \item{Q24}{When I am with friends or family, I often seem to be the one that other people make fun of or joke about.}
#' \item{Q25}{I don't often joke around with my friends.}
#' \item{Q26}{It is my experience that thinking about some amusing aspect of a situation is often a very effective way of coping with problems.}
#' \item{Q27}{If I don't like someone, I often use humor or teasing to put them down.}
#' \item{Q28}{If I am having problems or feeling unhappy, I often cover it up by joking around, so that even my closest friends don't know how I really feel.}
#' \item{Q29}{I usually can't think of witty things to say when I'm with other people.}
#' \item{Q30}{I don't need to be with other people to feel amused - I can usually find things to laugh about even when I'm by myself.}
#' \item{Q31}{Even if something is really funny to me, I will not laugh or joke about it if someone will be offended.}
#' \item{Q32}{Letting others laugh at me is my way of keeping my friends and family in good spirits.}
#' }
#' @details Responses for negatively worded statements (Q1, Q7, Q9, Q15, Q16, Q17, Q22, Q23, Q25, Q29, Q31) have been reverse-coded (i.e., 1=Very often or always true, 2=Often true, 3= Sometimes true, 4=Rarely true, 5=Never or very rarely true) in order to have the same direction (i.e., high values indicate more humorous personality) in all items.
#' @source \url{http://personality-testing.info/_rawdata/HSQ.zip}
#' @references Martin, R. A., Puhlik-Doris, P., Larsen, G., Gray, J., & Weir, K. (2003). Individual differences in uses of humor and their relation to psychological well-being: Development of the Humor Styles Questionnaire. Journal of Research in Personality, 37, 48-75.
#'
"HSQ"


#' Item Scores on Eight Items from the CTBS Science Achievement Test
#'
#' This is the data set presented in Table 1.1 in Shavelson & Webb (1991).
#'
#' @docType data
#' @keywords dataset
#' @format A data frame with 160 rows and 3 variables:
#' \describe{
#'   \item{person}{The person identifier}
#'   \item{score}{Whether a person got the item correct (1) or incorrect (0)}
#'   \item{item}{The item. There were 8 different items: i1 though i8.}
#' }
#' @source Shavelson & Webb (1991). Generalizability Theory: A Primer
"swtable11"

#' Item Scores on Eight Items from the CTBS Science Achievement Test
#'
#' The participants of this study were 50 eighth-grade students and 17 math teachers. The sample of teachers was selected to represent a range of experiences. Years of experience as a teacher ranged from one year to 26 years in the sample. Students, teachers, and performance tasks were fully crossed facets. All students in the sample responded to the same questions in a performance assessment. The responses of all the students were graded by each of the seventeen teachers.
#'
#' @docType data
#' @keywords dataset
#' @format A data frame with 13600 rows and 6 variables:
#' \describe{
#'   \item{person}{The student identifier}
#'   \item{item}{Whether a person got the item correct (1) or incorrect (0)}
#'   \item{rater}{The four teachers in the study}
#'   \item{occasion}{Occassions 1 through 4}
#'   \item{rubric}{Whether a rubric was used or not.}
#'   \item{score}{Student score on the math problem. Ranged from 0 - 25}
#' }
#' @source Kan, A., & Bulut, O. (2014). Crossed random-effect modeling: examining the effects of teacher experience and rubric use in performance assessments. Eurasian Journal of Educational Research, 57, 1-28. doi: dx.doi.org/10.14689/ejer.2014.57.4.
"teacher"

#' Hypothetical writing prompt example
#'
#' This is a hypothetical data set to demonstrate a two facet cross design for generalizability theory. The design is an S X W X R design, a student by writing prompt by rater design. See chapter 3 of "Using R for Educational and Psychological Measurement" for more details.
#'
#' @docType data
#' @keywords dataset
#' @format A data frame with 100 rows and 4 variables:
#' \describe{
#'   \item{student}{The student identifier}
#'   \item{prompt}{The writing prompt identifier. There were five prompts}
#'   \item{rater}{The rater identifier. There were two raters.}
#'   \item{score}{Student score on the writing prompt. Ranged from 4 - 100, with a maximum score of 100.}
#' }
#' @source Desjardins, C. D. & Bulut, O. (2017). Using R for Educational and Psychological Measurement.
#' @examples
#' library(lme4)
#' two.facet <- lmer(scores ~ (1 | students) + (1  | prompt) + (1 | rater) + (1 | students:prompt) + (1 | students:rater) + (1 | prompt:rater), data = writing.data)
#' vc <- as.data.frame(VarCorr(two.facet))
#' data.frame(vc$grp, vc$vcov/sum(vc$vcov))
"writing.data"


#' The Rosenberg Self-Esteem Scale
#'
#' The RSE data set was obtained via online with an interactive version of the Rosenberg Self-Esteem Scale (Rosenberg, 1965). Individuals were informed at the start of the test that their data would be saved. When they completed the scale, they were asked to confirm that the responses they had given were accurate and could be used for research, only those who confirmed are included in this dataset. A random sample of 1000 participants who completed all of the items in the scale were included in the RSE data set. All of the 10 rating scale items were rated on a 4-point scale (i.e., 1=strongly disagree, 2=disagree, 3=agree, and 4=strongly agree). Items 3, 5, 8, 9 and 10 were reversed-coded in order to place all the items in the same direction. That is, higher scores indicate higher self-esteem.
#'
#' @docType data
#' @keywords dataset
#' @format  A data frame with 1000 participants who responded to 10 rating scale items in an interactive version of the Rosenberg Self-Esteem Scale (Rosenberg, 1965). There are also additional demographic items about the participants:
#' \describe{
#' \item{Q1}{I feel that I am a person of worth, at least on an equal plane with others.}
#' \item{Q2}{I feel that I have a number of good qualities.}
#' \item{Q3}{All in all, I am inclined to feel that I am a failure.}
#' \item{Q4}{I am able to do things as well as most other people.}
#' \item{Q5}{I feel I do not have much to be proud of.}
#' \item{Q6}{I take a positive attitude toward myself.}
#' \item{Q7}{On the whole, I am satisfied with myself.}
#' \item{Q8}{I wish I could have more respect for myself.}
#' \item{Q9}{I certainly feel useless at times.}
#' \item{Q10}{At times, I think I am no good at all.}
#' \item{gender}{Chosen from a drop down list (1=male, 2=female, 3=other; 0=none was chosen)}
#' \item{age}{Entered as a free response. (0=response that could not be converted to integer)}
#' \item{source}{How the user came to the web page of the RSE scale (1=Front page of personality website, 2=Google search, 3=other)}
#' \item{country}{Inferred from technical information using MaxMind GeoLite}
#' \item{person}{Participant identifier}
#' }
#' @source The The Rosenberg Self-Esteem Scale is available at \url{http://personality-testing.info/tests/RSE.php}.
#' @references Rosenberg, M. (1965). Society and the adolescent self-image. Princeton, NJ: Princeton University Press.
#'
"rse"


