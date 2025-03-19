### **Default (Starting) Farcaster Table Overview**
A **concise schema reference** including tables, columns, descriptions, and relationships.

---

| **Table Name**                  | **Column Name**          | **Description & Relations** |
|---------------------------------|-------------------------|----------------------------|
| **casts**                      | `hash`                  | Primary key, unique ID for each cast. |
|                                 | `fid`                   | Foreign key to `fids.fid`, author of the cast. |
|                                 | `timestamp`             | Creation time on Farcaster. |
|                                 | `text`                  | Content of the cast. |
|                                 | `parent_hash`           | If a reply, links to `casts.hash`. |
|                                 | `parent_fid`            | If a reply, links to `fids.fid` of parent author. |
|                                 | `embeds`                | JSON array of media, links, etc. |
|                                 | `mentions`              | Array of mentioned `fids`. |
|                                 | `mentions_positions`    | Index positions of mentions in `text`. |
| **fids**                        | `fid`                   | Primary key, unique user ID. |
|                                 | `created_at`            | Time when user joined Farcaster. |
|                                 | `custody_address`       | Web3 address storing user profile. |
| **fnames**                      | `fid`                   | Foreign key to `fids.fid`, owner of the username. |
|                                 | `fname`                 | Unique username for a user. |
|                                 | `expires_at`            | Expiry time of the username. |
| **links**                       | `fid`                   | Follower’s `fid`. |
|                                 | `target_fid`            | Followed user’s `fid`. |
|                                 | `type`                  | Relationship type (currently always "follow"). |
|                                 | `deleted_at`            | If unfollowed, the timestamp of removal. |
| **profile_with_addresses**      | `fid`                   | Foreign key to `fids.fid`. |
|                                 | `fname`                 | User’s primary username. |
|                                 | `display_name`          | Display name set by user. |
|                                 | `avatar_url`            | Profile picture URL. |
|                                 | `bio`                   | User bio text. |
|                                 | `verified_addresses`    | JSON array of linked Web3 addresses. |
| **reactions**                   | `hash`                  | Primary key, unique ID for each reaction. |
|                                 | `fid`                   | Foreign key to `fids.fid`, user who reacted. |
|                                 | `reaction_type`         | 1 = like, 2 = recast. |
|                                 | `target_hash`           | Foreign key to `casts.hash`, the reacted cast. |
|                                 | `target_fid`            | Author of the cast being reacted to. |
| **signers**                     | `fid`                   | Foreign key to `fids.fid`. |
|                                 | `signer`                | Web3 wallet address used as a signer. |
| **storage**                     | `fid`                   | Foreign key to `fids.fid`. |
|                                 | `units`                 | Number of storage units allocated to user. |
|                                 | `expiry`                | Time when storage expires. |
| **user_data**                   | `fid`                   | Foreign key to `fids.fid`. |
|                                 | `type`                  | Type of data (e.g., avatar, display name, bio). |
|                                 | `value`                 | Actual stored value. |
| **verifications**               | `fid`                   | Foreign key to `fids.fid`. |
|                                 | `claim`                 | JSON object with connected wallet details. |
| **channel_data**                | `parent_url`            | Identifier of the channel. |
|                                 | `name`                  | Display name of the channel. |
|                                 | `image`                 | Channel image URL. |
|                                 | `channel_id`            | Unique ID of the channel. |
| **channels**                    | `channel_id`            | Primary key, unique channel identifier. |
|                                 | `description`           | Description of the channel. |
|                                 | `created_at`            | Time when channel was created. |
|                                 | `updated_at`            | Time when channel was last updated. |
| **channel_follows**             | `fid`                   | Foreign key to `fids.fid`, follower. |
|                                 | `channel_id`            | ID of the channel being followed. |
|                                 | `timestamp`             | When the follow occurred. |
| **channel_members**             | `fid`                   | Foreign key to `fids.fid`, member. |
|                                 | `channel_id`            | ID of the channel. |
|                                 | `role`                  | Member's role in the channel. |
|                                 | `timestamp`             | When they became a member. |
| **blocks**                      | `blocker_fid`           | FID of user doing the blocking. |
|                                 | `blocked_fid`           | FID of blocked user. |
|                                 | `timestamp`             | When the block occurred. |
| **power_users**                 | `fid`                   | Foreign key to `fids.fid`. |
|                                 | `is_power_user`         | Boolean indicating power user status. |
| **user_labels**                 | `fid`                   | Foreign key to `fids.fid`. |
|                                 | `label`                 | User classification label. |
|                                 | `timestamp`             | When label was assigned. |
| **parquet_import_tracking**     | `table_name`            | Name of the table being tracked. |
|                                 | `last_imported_at`      | Last time data was imported. |
|                                 | `last_imported_file`    | Name of last imported file. |
|                                 | `status`                | Status of the import process. |

---

### **Relationships Overview**
- **Users (`fids`) are central**: Many tables reference `fid` (e.g., `casts`, `links`, `reactions`, `profile_with_addresses`, `follow_counts`).
- **Casts (`casts.hash`) are referenced by**:  
  - `reactions.target_hash` (for likes/recasts).  
  - `casts.parent_hash` (for replies).  
- **Followers (`links`) connect users**: `fid → target_fid` represents follows.  
- **Profiles (`profile_with_addresses`) store metadata**: Joins on `fids.fid`.  
- **Reactions (`reactions`) connect users and casts**: `fid` is the reactor, `target_hash` is the cast.  
- **Signers (`signers`) and verifications (`verifications`) store Web3 wallet data** for `fids.fid`.  
- **Channels (`channels`) link with**:  
  - `channel_follows` (followers of a channel).  
  - `channel_members` (members of a channel).  
- **Blocking system**: `blocks` tracks who blocked whom.  
- **Analytics/Scoring**:  
  - `neynar_user_scores` tracks engagement scores.  
  - `follow_counts` stores follower/following numbers.  
  - `power_users` flags high-activity users.  
  - `user_labels` classifies users.  
- **Data import tracking**: `parquet_import_tracking` logs data imports.  

# Labels

Warpcast produces [labels](https://github.com/farcasterxyz/labels) to categorize Farcaster accounts which are made public here.

## [Spam](https://github.com/warpcast/labels/blob/main/spam.jsonl)

Warpcast's spam models predict the probability that an account might exhibit spammy behavior. Spam is defined as behavior that intentionally generates notifications for other users in a way that benefits the author and annoys users who receieve them. Some examples include replying with generic llm generated responses, bulk following accounts, posting irrelevant or generally offensive responses to other people's posts. Spamminess is not related to whether an account is being controlled by a human. There are many bots that are not spammy and many humans that are.

Our models make these predictions based on the combination of a number of factors including the account's historical activity, social graph, message content and the moderation actions that other users have taken on their account. No single factor will get an account labelled as spam. If you notice any obvious mislabelling, you can report them to @v on Warpcast DMs

Our dataset for spam has the label_type column is set to spam and the values can be one of:

| Value | Description                            |
|-------|----------------------------------------|
| 0     | Likely to engage in spammy behavior.   |
| 1     | Might engage in spammy behavior.       |
| 2     | Unlikely to engage in spammy behavior. |

Spam labels are updated weekly. Accounts that are not present are "unknown" either because there isn't enough data or because the account hasn't been active recently. 