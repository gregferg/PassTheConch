class Api::StoriesController < ApplicationController
  def index
    # Return json object of active / completed stories
  end

  def create
    # persist a story to the db. some ideas...

    # Just find aany story where the status is "pending". If we find a story, add this user to the story and switch the status to "in progress". If not, create a new story.

    # Given that there are only two players, this method guarantees that any story with status "pending" will need one more user.

    # Think about how to scale this for 3, 4, 5 users. The first idea that comes to mind: Have the stories table hold columns for (a) the # of users the game wants and (b) the number of users currently in the game. Increment the latter until the two are equal, then switch the game to "in progress" as before. Alternatively, we could potentially ditch the "status" column and directly query for games where `capacity != #_current_players.

    # Premature optimization thoughts (for down the road): it may make sense to have a separate table for pending games; there are only so many at a given time, and it seems wasteful that, when we're trying to add a user to a game, we need to look through ALL the stories (even completed ones). We could instead query only the pending games, add the user, and (once the game is full) move the game over to a separate table for in-progress and complete games. A step further would be to do the same for complete games, essentially creating an "archive" for games that aren't accessed too often.

    prompt = random_prompt(Prompt.all)
    # story.create()
    # user_stories.create()
  end

  def show
    # show an individual story.

  end

  # A "fill" story action?

  def update
    # Check whether current user is a member of this story, then persist changes to the DB.
  end
end
