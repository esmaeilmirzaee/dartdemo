import 'dart:convert';

List<Account> accountFromJson(String str) =>
    List<Account>.from(json.decode(str).map((x) => Account.fromJson(x)));

String accountToJson(List<Account> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Account {
  String id;
  AccountType type;
  Actor actor;
  Repo repo;
  Payload payload;
  bool public;
  DateTime createdAt;
  Actor? org;

  Account({
    required this.id,
    required this.type,
    required this.actor,
    required this.repo,
    required this.payload,
    required this.public,
    required this.createdAt,
    this.org,
  });

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        id: json["id"],
        type: accountTypeValues.map[json["type"]]!,
        actor: Actor.fromJson(json["actor"]),
        repo: Repo.fromJson(json["repo"]),
        payload: Payload.fromJson(json["payload"]),
        public: json["public"],
        createdAt: DateTime.parse(json["created_at"]),
        org: json["org"] == null ? null : Actor.fromJson(json["org"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": accountTypeValues.reverse[type],
        "actor": actor.toJson(),
        "repo": repo.toJson(),
        "payload": payload.toJson(),
        "public": public,
        "created_at": createdAt.toIso8601String(),
        "org": org?.toJson(),
      };
}

class Actor {
  int id;
  String login;
  String gravatarId;
  String url;
  String avatarUrl;

  Actor({
    required this.id,
    required this.login,
    required this.gravatarId,
    required this.url,
    required this.avatarUrl,
  });

  factory Actor.fromJson(Map<String, dynamic> json) => Actor(
        id: json["id"],
        login: json["login"],
        gravatarId: json["gravatar_id"],
        url: json["url"],
        avatarUrl: json["avatar_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "login": login,
        "gravatar_id": gravatarId,
        "url": url,
        "avatar_url": avatarUrl,
      };
}

class Author {
  String email;
  String name;

  Author({
    required this.email,
    required this.name,
  });

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        email: json["email"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "name": name,
      };
}

class Repo {
  int id;
  String name;
  String url;

  Repo({
    required this.id,
    required this.name,
    required this.url,
  });

  factory Repo.fromJson(Map<String, dynamic> json) => Repo(
        id: json["id"],
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url": url,
      };
}

class Payload {
  String? ref;
  RefType? refType;
  MasterBranch? masterBranch;
  String? description;
  PusherType? pusherType;
  int? pushId;
  int? size;
  int? distinctSize;
  String? head;
  String? before;
  List<Commit>? commits;
  PayloadAction? action;
  Release? release;
  int? number;
  PayloadPullRequest? pullRequest;
  Issue? issue;
  Forkee? forkee;
  List<Page>? pages;
  Comment? comment;
  Member? member;

  Payload({
    this.ref,
    this.refType,
    this.masterBranch,
    this.description,
    this.pusherType,
    this.pushId,
    this.size,
    this.distinctSize,
    this.head,
    this.before,
    this.commits,
    this.action,
    this.release,
    this.number,
    this.pullRequest,
    this.issue,
    this.forkee,
    this.pages,
    this.comment,
    this.member,
  });

  factory Payload.fromJson(Map<String, dynamic> json) {
    return Payload(
      ref: json["ref"],
      refType: json["ref_type"] == null
          ? null
          : refTypeValues.map[json["ref_type"]]!,
      masterBranch: json["master_branch"] == null
          ? null
          : masterBranchValues.map[json["master_branch"]]!,
      description: json["description"],
      pusherType: json["pusher_type"] == null
          ? null
          : pusherTypeValues.map[json["pusher_type"]]!,
      pushId: json["push_id"],
      size: json["size"],
      distinctSize: json["distinct_size"],
      head: json["head"],
      before: json["before"],
      commits: json["commits"] == null
          ? []
          : List<Commit>.from(json["commits"]!.map((x) => Commit.fromJson(x))),
      action: json["action"] == null
          ? null
          : payloadActionValues.map[json["action"]]!,
      release:
          json["release"] == null ? null : Release.fromJson(json["release"]),
      number: json["number"],
      pullRequest: json["pull_request"] == null
          ? null
          : PayloadPullRequest.fromJson(json["pull_request"]),
      issue: json["issue"] == null ? null : Issue.fromJson(json["issue"]),
      forkee: json["forkee"] == null ? null : Forkee.fromJson(json["forkee"]),
      pages: json["pages"] == null
          ? []
          : List<Page>.from(json["pages"]!.map((x) => Page.fromJson(x))),
      comment:
          json["comment"] == null ? null : Comment.fromJson(json["comment"]),
      member: json["member"] == null ? null : Member.fromJson(json["member"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "ref": ref,
        "ref_type": refTypeValues.reverse[refType],
        "master_branch": masterBranchValues.reverse[masterBranch],
        "description": description,
        "pusher_type": pusherTypeValues.reverse[pusherType],
        "push_id": pushId,
        "size": size,
        "distinct_size": distinctSize,
        "head": head,
        "before": before,
        "commits": commits == null
            ? []
            : List<dynamic>.from(commits!.map((x) => x.toJson())),
        "action": payloadActionValues.reverse[action],
        "release": release?.toJson(),
        "number": number,
        "pull_request": pullRequest?.toJson(),
        "issue": issue?.toJson(),
        "forkee": forkee?.toJson(),
        "pages": pages == null
            ? []
            : List<dynamic>.from(pages!.map((x) => x.toJson())),
        "comment": comment?.toJson(),
        "member": member?.toJson(),
      };
}

enum PayloadAction {
  started,
  published,
  opened,
  closed,
  created,
  reopened,
  added
}

final payloadActionValues = EnumValues({
  "added": PayloadAction.added,
  "closed": PayloadAction.closed,
  "created": PayloadAction.created,
  "opened": PayloadAction.opened,
  "published": PayloadAction.published,
  "reopened": PayloadAction.reopened,
  "started": PayloadAction.started
});

class Comment {
  String url;
  String htmlUrl;
  String? issueUrl;
  int id;
  Member user;
  DateTime createdAt;
  DateTime updatedAt;
  String body;
  String? diffHunk;
  String? path;
  int? position;
  int? originalPosition;
  String? commitId;
  String? originalCommitId;
  String? pullRequestUrl;
  CommentLinks? links;
  int? line;

  Comment({
    required this.url,
    required this.htmlUrl,
    this.issueUrl,
    required this.id,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
    required this.body,
    this.diffHunk,
    this.path,
    this.position,
    this.originalPosition,
    this.commitId,
    this.originalCommitId,
    this.pullRequestUrl,
    this.links,
    this.line,
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        url: json["url"],
        htmlUrl: json["html_url"],
        issueUrl: json["issue_url"],
        id: json["id"],
        user: Member.fromJson(json["user"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        body: json["body"],
        diffHunk: json["diff_hunk"],
        path: json["path"],
        position: json["position"],
        originalPosition: json["original_position"],
        commitId: json["commit_id"],
        originalCommitId: json["original_commit_id"],
        pullRequestUrl: json["pull_request_url"],
        links: json["_links"] == null
            ? null
            : CommentLinks.fromJson(json["_links"]),
        line: json["line"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "html_url": htmlUrl,
        "issue_url": issueUrl,
        "id": id,
        "user": user.toJson(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "body": body,
        "diff_hunk": diffHunk,
        "path": path,
        "position": position,
        "original_position": originalPosition,
        "commit_id": commitId,
        "original_commit_id": originalCommitId,
        "pull_request_url": pullRequestUrl,
        "_links": links?.toJson(),
        "line": line,
      };
}

class CommentLinks {
  Comments self;
  Comments html;
  Comments pullRequest;

  CommentLinks({
    required this.self,
    required this.html,
    required this.pullRequest,
  });

  factory CommentLinks.fromJson(Map<String, dynamic> json) => CommentLinks(
        self: Comments.fromJson(json["self"]),
        html: Comments.fromJson(json["html"]),
        pullRequest: Comments.fromJson(json["pull_request"]),
      );

  Map<String, dynamic> toJson() => {
        "self": self.toJson(),
        "html": html.toJson(),
        "pull_request": pullRequest.toJson(),
      };
}

class Comments {
  String href;

  Comments({
    required this.href,
  });

  factory Comments.fromJson(Map<String, dynamic> json) => Comments(
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
      };
}

class Member {
  String login;
  int id;
  String avatarUrl;
  String gravatarId;
  String url;
  String htmlUrl;
  String followersUrl;
  String followingUrl;
  String gistsUrl;
  String starredUrl;
  String subscriptionsUrl;
  String organizationsUrl;
  String reposUrl;
  String eventsUrl;
  String receivedEventsUrl;
  MemberType type;
  bool siteAdmin;

  Member({
    required this.login,
    required this.id,
    required this.avatarUrl,
    required this.gravatarId,
    required this.url,
    required this.htmlUrl,
    required this.followersUrl,
    required this.followingUrl,
    required this.gistsUrl,
    required this.starredUrl,
    required this.subscriptionsUrl,
    required this.organizationsUrl,
    required this.reposUrl,
    required this.eventsUrl,
    required this.receivedEventsUrl,
    required this.type,
    required this.siteAdmin,
  });

  factory Member.fromJson(Map<String, dynamic> json) => Member(
        login: json["login"],
        id: json["id"],
        avatarUrl: json["avatar_url"],
        gravatarId: json["gravatar_id"],
        url: json["url"],
        htmlUrl: json["html_url"],
        followersUrl: json["followers_url"],
        followingUrl: json["following_url"],
        gistsUrl: json["gists_url"],
        starredUrl: json["starred_url"],
        subscriptionsUrl: json["subscriptions_url"],
        organizationsUrl: json["organizations_url"],
        reposUrl: json["repos_url"],
        eventsUrl: json["events_url"],
        receivedEventsUrl: json["received_events_url"],
        type: memberTypeValues.map[json["type"]]!,
        siteAdmin: json["site_admin"],
      );

  Map<String, dynamic> toJson() => {
        "login": login,
        "id": id,
        "avatar_url": avatarUrl,
        "gravatar_id": gravatarId,
        "url": url,
        "html_url": htmlUrl,
        "followers_url": followersUrl,
        "following_url": followingUrl,
        "gists_url": gistsUrl,
        "starred_url": starredUrl,
        "subscriptions_url": subscriptionsUrl,
        "organizations_url": organizationsUrl,
        "repos_url": reposUrl,
        "events_url": eventsUrl,
        "received_events_url": receivedEventsUrl,
        "type": memberTypeValues.reverse[type],
        "site_admin": siteAdmin,
      };
}

enum MemberType { user, organization }

final memberTypeValues = EnumValues(
    {"Organization": MemberType.organization, "User": MemberType.user});

class Commit {
  String sha;
  Author author;
  String message;
  bool distinct;
  String url;

  Commit({
    required this.sha,
    required this.author,
    required this.message,
    required this.distinct,
    required this.url,
  });

  factory Commit.fromJson(Map<String, dynamic> json) => Commit(
        sha: json["sha"],
        author: Author.fromJson(json["author"]),
        message: json["message"],
        distinct: json["distinct"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "sha": sha,
        "author": author.toJson(),
        "message": message,
        "distinct": distinct,
        "url": url,
      };
}

class Forkee {
  int id;
  String name;
  String fullName;
  Member owner;
  bool private;
  String htmlUrl;
  String? description;
  bool fork;
  String url;
  String forksUrl;
  String keysUrl;
  String collaboratorsUrl;
  String teamsUrl;
  String hooksUrl;
  String issueEventsUrl;
  String eventsUrl;
  String assigneesUrl;
  String branchesUrl;
  String tagsUrl;
  String blobsUrl;
  String gitTagsUrl;
  String gitRefsUrl;
  String treesUrl;
  String statusesUrl;
  String languagesUrl;
  String stargazersUrl;
  String contributorsUrl;
  String subscribersUrl;
  String subscriptionUrl;
  String commitsUrl;
  String gitCommitsUrl;
  String commentsUrl;
  String issueCommentUrl;
  String contentsUrl;
  String compareUrl;
  String mergesUrl;
  String archiveUrl;
  String downloadsUrl;
  String issuesUrl;
  String pullsUrl;
  String milestonesUrl;
  String notificationsUrl;
  String labelsUrl;
  String releasesUrl;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime pushedAt;
  String gitUrl;
  String sshUrl;
  String cloneUrl;
  String svnUrl;
  String? homepage;
  int size;
  int stargazersCount;
  int watchersCount;
  String? language;
  bool hasIssues;
  bool hasDownloads;
  bool hasWiki;
  bool hasPages;
  int forksCount;
  String? mirrorUrl;
  int openIssuesCount;
  int forks;
  int openIssues;
  int watchers;
  DefaultBranch defaultBranch;
  bool? public;

  Forkee({
    required this.id,
    required this.name,
    required this.fullName,
    required this.owner,
    required this.private,
    required this.htmlUrl,
    this.description,
    required this.fork,
    required this.url,
    required this.forksUrl,
    required this.keysUrl,
    required this.collaboratorsUrl,
    required this.teamsUrl,
    required this.hooksUrl,
    required this.issueEventsUrl,
    required this.eventsUrl,
    required this.assigneesUrl,
    required this.branchesUrl,
    required this.tagsUrl,
    required this.blobsUrl,
    required this.gitTagsUrl,
    required this.gitRefsUrl,
    required this.treesUrl,
    required this.statusesUrl,
    required this.languagesUrl,
    required this.stargazersUrl,
    required this.contributorsUrl,
    required this.subscribersUrl,
    required this.subscriptionUrl,
    required this.commitsUrl,
    required this.gitCommitsUrl,
    required this.commentsUrl,
    required this.issueCommentUrl,
    required this.contentsUrl,
    required this.compareUrl,
    required this.mergesUrl,
    required this.archiveUrl,
    required this.downloadsUrl,
    required this.issuesUrl,
    required this.pullsUrl,
    required this.milestonesUrl,
    required this.notificationsUrl,
    required this.labelsUrl,
    required this.releasesUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.pushedAt,
    required this.gitUrl,
    required this.sshUrl,
    required this.cloneUrl,
    required this.svnUrl,
    this.homepage,
    required this.size,
    required this.stargazersCount,
    required this.watchersCount,
    this.language,
    required this.hasIssues,
    required this.hasDownloads,
    required this.hasWiki,
    required this.hasPages,
    required this.forksCount,
    this.mirrorUrl,
    required this.openIssuesCount,
    required this.forks,
    required this.openIssues,
    required this.watchers,
    required this.defaultBranch,
    this.public,
  });

  factory Forkee.fromJson(Map<String, dynamic> json) => Forkee(
        id: json["id"],
        name: json["name"],
        fullName: json["full_name"],
        owner: Member.fromJson(json["owner"]),
        private: json["private"],
        htmlUrl: json["html_url"],
        description: json["description"],
        fork: json["fork"],
        url: json["url"],
        forksUrl: json["forks_url"],
        keysUrl: json["keys_url"],
        collaboratorsUrl: json["collaborators_url"],
        teamsUrl: json["teams_url"],
        hooksUrl: json["hooks_url"],
        issueEventsUrl: json["issue_events_url"],
        eventsUrl: json["events_url"],
        assigneesUrl: json["assignees_url"],
        branchesUrl: json["branches_url"],
        tagsUrl: json["tags_url"],
        blobsUrl: json["blobs_url"],
        gitTagsUrl: json["git_tags_url"],
        gitRefsUrl: json["git_refs_url"],
        treesUrl: json["trees_url"],
        statusesUrl: json["statuses_url"],
        languagesUrl: json["languages_url"],
        stargazersUrl: json["stargazers_url"],
        contributorsUrl: json["contributors_url"],
        subscribersUrl: json["subscribers_url"],
        subscriptionUrl: json["subscription_url"],
        commitsUrl: json["commits_url"],
        gitCommitsUrl: json["git_commits_url"],
        commentsUrl: json["comments_url"],
        issueCommentUrl: json["issue_comment_url"],
        contentsUrl: json["contents_url"],
        compareUrl: json["compare_url"],
        mergesUrl: json["merges_url"],
        archiveUrl: json["archive_url"],
        downloadsUrl: json["downloads_url"],
        issuesUrl: json["issues_url"],
        pullsUrl: json["pulls_url"],
        milestonesUrl: json["milestones_url"],
        notificationsUrl: json["notifications_url"],
        labelsUrl: json["labels_url"],
        releasesUrl: json["releases_url"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        pushedAt: DateTime.parse(json["pushed_at"]),
        gitUrl: json["git_url"],
        sshUrl: json["ssh_url"],
        cloneUrl: json["clone_url"],
        svnUrl: json["svn_url"],
        homepage: json["homepage"],
        size: json["size"],
        stargazersCount: json["stargazers_count"],
        watchersCount: json["watchers_count"],
        language: json["language"],
        hasIssues: json["has_issues"],
        hasDownloads: json["has_downloads"],
        hasWiki: json["has_wiki"],
        hasPages: json["has_pages"],
        forksCount: json["forks_count"],
        mirrorUrl: json["mirror_url"],
        openIssuesCount: json["open_issues_count"],
        forks: json["forks"],
        openIssues: json["open_issues"],
        watchers: json["watchers"],
        defaultBranch: defaultBranchValues.map[json["default_branch"]]!,
        public: json["public"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "full_name": fullName,
        "owner": owner.toJson(),
        "private": private,
        "html_url": htmlUrl,
        "description": description,
        "fork": fork,
        "url": url,
        "forks_url": forksUrl,
        "keys_url": keysUrl,
        "collaborators_url": collaboratorsUrl,
        "teams_url": teamsUrl,
        "hooks_url": hooksUrl,
        "issue_events_url": issueEventsUrl,
        "events_url": eventsUrl,
        "assignees_url": assigneesUrl,
        "branches_url": branchesUrl,
        "tags_url": tagsUrl,
        "blobs_url": blobsUrl,
        "git_tags_url": gitTagsUrl,
        "git_refs_url": gitRefsUrl,
        "trees_url": treesUrl,
        "statuses_url": statusesUrl,
        "languages_url": languagesUrl,
        "stargazers_url": stargazersUrl,
        "contributors_url": contributorsUrl,
        "subscribers_url": subscribersUrl,
        "subscription_url": subscriptionUrl,
        "commits_url": commitsUrl,
        "git_commits_url": gitCommitsUrl,
        "comments_url": commentsUrl,
        "issue_comment_url": issueCommentUrl,
        "contents_url": contentsUrl,
        "compare_url": compareUrl,
        "merges_url": mergesUrl,
        "archive_url": archiveUrl,
        "downloads_url": downloadsUrl,
        "issues_url": issuesUrl,
        "pulls_url": pullsUrl,
        "milestones_url": milestonesUrl,
        "notifications_url": notificationsUrl,
        "labels_url": labelsUrl,
        "releases_url": releasesUrl,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "pushed_at": pushedAt.toIso8601String(),
        "git_url": gitUrl,
        "ssh_url": sshUrl,
        "clone_url": cloneUrl,
        "svn_url": svnUrl,
        "homepage": homepage,
        "size": size,
        "stargazers_count": stargazersCount,
        "watchers_count": watchersCount,
        "language": language,
        "has_issues": hasIssues,
        "has_downloads": hasDownloads,
        "has_wiki": hasWiki,
        "has_pages": hasPages,
        "forks_count": forksCount,
        "mirror_url": mirrorUrl,
        "open_issues_count": openIssuesCount,
        "forks": forks,
        "open_issues": openIssues,
        "watchers": watchers,
        "default_branch": defaultBranchValues.reverse[defaultBranch],
        "public": public,
      };
}

enum DefaultBranch {
  master,
  develop,
  devel,
  bleed,
  ghPages,
  kkMr2,
  v3,
  cm_110,
  trunk,
  next,
  lollipop,
  sunxi_34,
  sunxi,
  android_44,
  r3P0_04Rel0,
  lib,
  highSpeedTruckSunxi_34V2,
  mpng_301R4,
  the_314,
  jupiter_1020,
  the_17Update,
  hydroDevel,
  staging,
  metadataV2,
  dev,
  androidMsm_34Kk,
  the_000000Dev,
  release,
  v0_10,
  the_16,
  test,
  l5,
  development,
  v2,
  the_04Fixes
}

final defaultBranchValues = EnumValues({
  "android-4.4": DefaultBranch.android_44,
  "android-msm-3.4-kk": DefaultBranch.androidMsm_34Kk,
  "bleed": DefaultBranch.bleed,
  "cm-11.0": DefaultBranch.cm_110,
  "dev": DefaultBranch.dev,
  "devel": DefaultBranch.devel,
  "develop": DefaultBranch.develop,
  "development": DefaultBranch.development,
  "gh-pages": DefaultBranch.ghPages,
  "highspeedtruck-sunxi-3.4-v2": DefaultBranch.highSpeedTruckSunxi_34V2,
  "hydro-devel": DefaultBranch.hydroDevel,
  "Jupiter-10.2.0": DefaultBranch.jupiter_1020,
  "kk_mr2": DefaultBranch.kkMr2,
  "L5": DefaultBranch.l5,
  "lib": DefaultBranch.lib,
  "lollipop": DefaultBranch.lollipop,
  "master": DefaultBranch.master,
  "metadata-v2": DefaultBranch.metadataV2,
  "mpng-3.0.1-r4": DefaultBranch.mpng_301R4,
  "next": DefaultBranch.next,
  "r3p0-04rel0": DefaultBranch.r3P0_04Rel0,
  "release": DefaultBranch.release,
  "staging": DefaultBranch.staging,
  "sunxi": DefaultBranch.sunxi,
  "sunxi-3.4": DefaultBranch.sunxi_34,
  "test": DefaultBranch.test,
  "000000-dev": DefaultBranch.the_000000Dev,
  "0.4_fixes": DefaultBranch.the_04Fixes,
  "1.6": DefaultBranch.the_16,
  "1.7-update": DefaultBranch.the_17Update,
  "3.14": DefaultBranch.the_314,
  "trunk": DefaultBranch.trunk,
  "v0.1.0": DefaultBranch.v0_10,
  "v2": DefaultBranch.v2,
  "v3": DefaultBranch.v3
});

class Issue {
  String url;
  String labelsUrl;
  String commentsUrl;
  String eventsUrl;
  String htmlUrl;
  int id;
  int number;
  String title;
  Member user;
  List<Label> labels;
  MilestoneState state;
  bool locked;
  Member? assignee;
  Milestone? milestone;
  int comments;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? closedAt;
  String? body;
  IssuePullRequest? pullRequest;

  Issue({
    required this.url,
    required this.labelsUrl,
    required this.commentsUrl,
    required this.eventsUrl,
    required this.htmlUrl,
    required this.id,
    required this.number,
    required this.title,
    required this.user,
    required this.labels,
    required this.state,
    required this.locked,
    this.assignee,
    this.milestone,
    required this.comments,
    required this.createdAt,
    required this.updatedAt,
    this.closedAt,
    this.body,
    this.pullRequest,
  });

  factory Issue.fromJson(Map<String, dynamic> json) => Issue(
        url: json["url"],
        labelsUrl: json["labels_url"],
        commentsUrl: json["comments_url"],
        eventsUrl: json["events_url"],
        htmlUrl: json["html_url"],
        id: json["id"],
        number: json["number"],
        title: json["title"],
        user: Member.fromJson(json["user"]),
        labels: List<Label>.from(json["labels"].map((x) => Label.fromJson(x))),
        state: milestoneStateValues.map[json["state"]]!,
        locked: json["locked"],
        assignee:
            json["assignee"] == null ? null : Member.fromJson(json["assignee"]),
        milestone: json["milestone"] == null
            ? null
            : Milestone.fromJson(json["milestone"]),
        comments: json["comments"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        closedAt: json["closed_at"] == null
            ? null
            : DateTime.parse(json["closed_at"]),
        body: json["body"],
        pullRequest: json["pull_request"] == null
            ? null
            : IssuePullRequest.fromJson(json["pull_request"]),
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "labels_url": labelsUrl,
        "comments_url": commentsUrl,
        "events_url": eventsUrl,
        "html_url": htmlUrl,
        "id": id,
        "number": number,
        "title": title,
        "user": user.toJson(),
        "labels": List<dynamic>.from(labels.map((x) => x.toJson())),
        "state": milestoneStateValues.reverse[state],
        "locked": locked,
        "assignee": assignee?.toJson(),
        "milestone": milestone?.toJson(),
        "comments": comments,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "closed_at": closedAt?.toIso8601String(),
        "body": body,
        "pull_request": pullRequest?.toJson(),
      };
}

class Label {
  String url;
  String name;
  String color;

  Label({
    required this.url,
    required this.name,
    required this.color,
  });

  factory Label.fromJson(Map<String, dynamic> json) => Label(
        url: json["url"],
        name: json["name"],
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "name": name,
        "color": color,
      };
}

class Milestone {
  String url;
  String labelsUrl;
  int id;
  int number;
  String title;
  String? description;
  Member creator;
  int openIssues;
  int closedIssues;
  MilestoneState state;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? dueOn;
  DateTime? closedAt;

  Milestone({
    required this.url,
    required this.labelsUrl,
    required this.id,
    required this.number,
    required this.title,
    this.description,
    required this.creator,
    required this.openIssues,
    required this.closedIssues,
    required this.state,
    required this.createdAt,
    required this.updatedAt,
    this.dueOn,
    this.closedAt,
  });

  factory Milestone.fromJson(Map<String, dynamic> json) => Milestone(
        url: json["url"],
        labelsUrl: json["labels_url"],
        id: json["id"],
        number: json["number"],
        title: json["title"],
        description: json["description"],
        creator: Member.fromJson(json["creator"]),
        openIssues: json["open_issues"],
        closedIssues: json["closed_issues"],
        state: milestoneStateValues.map[json["state"]]!,
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        dueOn: json["due_on"] == null ? null : DateTime.parse(json["due_on"]),
        closedAt: json["closed_at"] == null
            ? null
            : DateTime.parse(json["closed_at"]),
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "labels_url": labelsUrl,
        "id": id,
        "number": number,
        "title": title,
        "description": description,
        "creator": creator.toJson(),
        "open_issues": openIssues,
        "closed_issues": closedIssues,
        "state": milestoneStateValues.reverse[state],
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "due_on": dueOn?.toIso8601String(),
        "closed_at": closedAt?.toIso8601String(),
      };
}

enum MilestoneState { open, closed }

final milestoneStateValues =
    EnumValues({"closed": MilestoneState.closed, "open": MilestoneState.open});

class IssuePullRequest {
  String url;
  String htmlUrl;
  String diffUrl;
  String patchUrl;

  IssuePullRequest({
    required this.url,
    required this.htmlUrl,
    required this.diffUrl,
    required this.patchUrl,
  });

  factory IssuePullRequest.fromJson(Map<String, dynamic> json) =>
      IssuePullRequest(
        url: json["url"],
        htmlUrl: json["html_url"],
        diffUrl: json["diff_url"],
        patchUrl: json["patch_url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "html_url": htmlUrl,
        "diff_url": diffUrl,
        "patch_url": patchUrl,
      };
}

enum MasterBranch {
  master,
  the_01,
  jupiter_1020,
  cm_120,
  featureTwitterPlayGeohashGeohash,
  permacoin,
  m,
  hydroDevel,
  develop,
  ghPages,
  lollipop,
  mahdiKk_443,
  autobuild,
  the_525,
  kitkat,
  v0_10,
  dev,
  patch_1,
  android_44,
  frank,
  development,
  bleed,
  masterBranchMaster
}

final masterBranchValues = EnumValues({
  "android-4.4": MasterBranch.android_44,
  "autobuild": MasterBranch.autobuild,
  "bleed": MasterBranch.bleed,
  "cm-12.0": MasterBranch.cm_120,
  "dev": MasterBranch.dev,
  "develop": MasterBranch.develop,
  "development": MasterBranch.development,
  "feature/twitter-play-geohash-geohash":
      MasterBranch.featureTwitterPlayGeohashGeohash,
  "frank": MasterBranch.frank,
  "gh-pages": MasterBranch.ghPages,
  "hydro-devel": MasterBranch.hydroDevel,
  "Jupiter-10.2.0": MasterBranch.jupiter_1020,
  "kitkat": MasterBranch.kitkat,
  "lollipop": MasterBranch.lollipop,
  "m": MasterBranch.m,
  "Mahdi-kk-4.4.3": MasterBranch.mahdiKk_443,
  "master": MasterBranch.master,
  "Master": MasterBranch.masterBranchMaster,
  "patch-1": MasterBranch.patch_1,
  "permacoin": MasterBranch.permacoin,
  "0.1": MasterBranch.the_01,
  "5.25": MasterBranch.the_525,
  "v0.1.0": MasterBranch.v0_10
});

class Page {
  String pageName;
  String title;
  dynamic summary;
  PageAction action;
  String sha;
  String htmlUrl;

  Page({
    required this.pageName,
    required this.title,
    this.summary,
    required this.action,
    required this.sha,
    required this.htmlUrl,
  });

  factory Page.fromJson(Map<String, dynamic> json) => Page(
        pageName: json["page_name"],
        title: json["title"],
        summary: json["summary"],
        action: pageActionValues.map[json["action"]]!,
        sha: json["sha"],
        htmlUrl: json["html_url"],
      );

  Map<String, dynamic> toJson() => {
        "page_name": pageName,
        "title": title,
        "summary": summary,
        "action": pageActionValues.reverse[action],
        "sha": sha,
        "html_url": htmlUrl,
      };
}

enum PageAction { edited, created }

final pageActionValues =
    EnumValues({"created": PageAction.created, "edited": PageAction.edited});

class PayloadPullRequest {
  String url;
  int id;
  String htmlUrl;
  String diffUrl;
  String patchUrl;
  String issueUrl;
  int number;
  MilestoneState state;
  bool locked;
  String title;
  Member user;
  String? body;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? closedAt;
  DateTime? mergedAt;
  String? mergeCommitSha;
  Member? assignee;
  Milestone? milestone;
  String commitsUrl;
  String reviewCommentsUrl;
  String reviewCommentUrl;
  String commentsUrl;
  String statusesUrl;
  Base head;
  Base base;
  PullRequestLinks links;
  bool? merged;
  bool? mergeable;
  MergeableState? mergeableState;
  Member? mergedBy;
  int? comments;
  int? reviewComments;
  int? commits;
  int? additions;
  int? deletions;
  int? changedFiles;

  PayloadPullRequest({
    required this.url,
    required this.id,
    required this.htmlUrl,
    required this.diffUrl,
    required this.patchUrl,
    required this.issueUrl,
    required this.number,
    required this.state,
    required this.locked,
    required this.title,
    required this.user,
    this.body,
    required this.createdAt,
    required this.updatedAt,
    this.closedAt,
    this.mergedAt,
    this.mergeCommitSha,
    this.assignee,
    this.milestone,
    required this.commitsUrl,
    required this.reviewCommentsUrl,
    required this.reviewCommentUrl,
    required this.commentsUrl,
    required this.statusesUrl,
    required this.head,
    required this.base,
    required this.links,
    this.merged,
    this.mergeable,
    this.mergeableState,
    this.mergedBy,
    this.comments,
    this.reviewComments,
    this.commits,
    this.additions,
    this.deletions,
    this.changedFiles,
  });

  factory PayloadPullRequest.fromJson(Map<String, dynamic> json) =>
      PayloadPullRequest(
        url: json["url"],
        id: json["id"],
        htmlUrl: json["html_url"],
        diffUrl: json["diff_url"],
        patchUrl: json["patch_url"],
        issueUrl: json["issue_url"],
        number: json["number"],
        state: milestoneStateValues.map[json["state"]]!,
        locked: json["locked"],
        title: json["title"],
        user: Member.fromJson(json["user"]),
        body: json["body"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        closedAt: json["closed_at"] == null
            ? null
            : DateTime.parse(json["closed_at"]),
        mergedAt: json["merged_at"] == null
            ? null
            : DateTime.parse(json["merged_at"]),
        mergeCommitSha: json["merge_commit_sha"],
        assignee:
            json["assignee"] == null ? null : Member.fromJson(json["assignee"]),
        milestone: json["milestone"] == null
            ? null
            : Milestone.fromJson(json["milestone"]),
        commitsUrl: json["commits_url"],
        reviewCommentsUrl: json["review_comments_url"],
        reviewCommentUrl: json["review_comment_url"],
        commentsUrl: json["comments_url"],
        statusesUrl: json["statuses_url"],
        head: Base.fromJson(json["head"]),
        base: Base.fromJson(json["base"]),
        links: PullRequestLinks.fromJson(json["_links"]),
        merged: json["merged"],
        mergeable: json["mergeable"],
        mergeableState: json["mergeable_state"] == null
            ? null
            : mergeableStateValues.map[json["mergeable_state"]]!,
        mergedBy: json["merged_by"] == null
            ? null
            : Member.fromJson(json["merged_by"]),
        comments: json["comments"],
        reviewComments: json["review_comments"],
        commits: json["commits"],
        additions: json["additions"],
        deletions: json["deletions"],
        changedFiles: json["changed_files"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "id": id,
        "html_url": htmlUrl,
        "diff_url": diffUrl,
        "patch_url": patchUrl,
        "issue_url": issueUrl,
        "number": number,
        "state": milestoneStateValues.reverse[state],
        "locked": locked,
        "title": title,
        "user": user.toJson(),
        "body": body,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "closed_at": closedAt?.toIso8601String(),
        "merged_at": mergedAt?.toIso8601String(),
        "merge_commit_sha": mergeCommitSha,
        "assignee": assignee?.toJson(),
        "milestone": milestone?.toJson(),
        "commits_url": commitsUrl,
        "review_comments_url": reviewCommentsUrl,
        "review_comment_url": reviewCommentUrl,
        "comments_url": commentsUrl,
        "statuses_url": statusesUrl,
        "head": head.toJson(),
        "base": base.toJson(),
        "_links": links.toJson(),
        "merged": merged,
        "mergeable": mergeable,
        "mergeable_state": mergeableStateValues.reverse[mergeableState],
        "merged_by": mergedBy?.toJson(),
        "comments": comments,
        "review_comments": reviewComments,
        "commits": commits,
        "additions": additions,
        "deletions": deletions,
        "changed_files": changedFiles,
      };
}

class Base {
  String label;
  String ref;
  String sha;
  Member user;
  Forkee? repo;

  Base({
    required this.label,
    required this.ref,
    required this.sha,
    required this.user,
    this.repo,
  });

  factory Base.fromJson(Map<String, dynamic> json) => Base(
        label: json["label"],
        ref: json["ref"],
        sha: json["sha"],
        user: Member.fromJson(json["user"]),
        repo: json["repo"] == null ? null : Forkee.fromJson(json["repo"]),
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "ref": ref,
        "sha": sha,
        "user": user.toJson(),
        "repo": repo?.toJson(),
      };
}

class PullRequestLinks {
  Comments self;
  Comments html;
  Comments issue;
  Comments comments;
  Comments reviewComments;
  Comments reviewComment;
  Comments commits;
  Comments statuses;

  PullRequestLinks({
    required this.self,
    required this.html,
    required this.issue,
    required this.comments,
    required this.reviewComments,
    required this.reviewComment,
    required this.commits,
    required this.statuses,
  });

  factory PullRequestLinks.fromJson(Map<String, dynamic> json) =>
      PullRequestLinks(
        self: Comments.fromJson(json["self"]),
        html: Comments.fromJson(json["html"]),
        issue: Comments.fromJson(json["issue"]),
        comments: Comments.fromJson(json["comments"]),
        reviewComments: Comments.fromJson(json["review_comments"]),
        reviewComment: Comments.fromJson(json["review_comment"]),
        commits: Comments.fromJson(json["commits"]),
        statuses: Comments.fromJson(json["statuses"]),
      );

  Map<String, dynamic> toJson() => {
        "self": self.toJson(),
        "html": html.toJson(),
        "issue": issue.toJson(),
        "comments": comments.toJson(),
        "review_comments": reviewComments.toJson(),
        "review_comment": reviewComment.toJson(),
        "commits": commits.toJson(),
        "statuses": statuses.toJson(),
      };
}

enum MergeableState { unknown, dirty, clean, unstable }

final mergeableStateValues = EnumValues({
  "clean": MergeableState.clean,
  "dirty": MergeableState.dirty,
  "unknown": MergeableState.unknown,
  "unstable": MergeableState.unstable
});

enum PusherType { user }

final pusherTypeValues = EnumValues({"user": PusherType.user});

enum RefType { branch, repository, tag }

final refTypeValues = EnumValues({
  "branch": RefType.branch,
  "repository": RefType.repository,
  "tag": RefType.tag
});

class Release {
  String url;
  String assetsUrl;
  String uploadUrl;
  String htmlUrl;
  int id;
  String tagName;
  DefaultBranch targetCommitish;
  String? name;
  bool draft;
  Member author;
  bool prerelease;
  DateTime createdAt;
  DateTime publishedAt;
  List<Asset> assets;
  String tarballUrl;
  String zipballUrl;
  String? body;

  Release({
    required this.url,
    required this.assetsUrl,
    required this.uploadUrl,
    required this.htmlUrl,
    required this.id,
    required this.tagName,
    required this.targetCommitish,
    this.name,
    required this.draft,
    required this.author,
    required this.prerelease,
    required this.createdAt,
    required this.publishedAt,
    required this.assets,
    required this.tarballUrl,
    required this.zipballUrl,
    this.body,
  });

  factory Release.fromJson(Map<String, dynamic> json) => Release(
        url: json["url"],
        assetsUrl: json["assets_url"],
        uploadUrl: json["upload_url"],
        htmlUrl: json["html_url"],
        id: json["id"],
        tagName: json["tag_name"],
        targetCommitish: defaultBranchValues.map[json["target_commitish"]]!,
        name: json["name"],
        draft: json["draft"],
        author: Member.fromJson(json["author"]),
        prerelease: json["prerelease"],
        createdAt: DateTime.parse(json["created_at"]),
        publishedAt: DateTime.parse(json["published_at"]),
        assets: List<Asset>.from(json["assets"].map((x) => Asset.fromJson(x))),
        tarballUrl: json["tarball_url"],
        zipballUrl: json["zipball_url"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "assets_url": assetsUrl,
        "upload_url": uploadUrl,
        "html_url": htmlUrl,
        "id": id,
        "tag_name": tagName,
        "target_commitish": defaultBranchValues.reverse[targetCommitish],
        "name": name,
        "draft": draft,
        "author": author.toJson(),
        "prerelease": prerelease,
        "created_at": createdAt.toIso8601String(),
        "published_at": publishedAt.toIso8601String(),
        "assets": List<dynamic>.from(assets.map((x) => x.toJson())),
        "tarball_url": tarballUrl,
        "zipball_url": zipballUrl,
        "body": body,
      };
}

class Asset {
  String url;
  int id;
  String name;
  String? label;
  Member uploader;
  String contentType;
  AssetState state;
  int size;
  int downloadCount;
  DateTime createdAt;
  DateTime updatedAt;
  String browserDownloadUrl;

  Asset({
    required this.url,
    required this.id,
    required this.name,
    this.label,
    required this.uploader,
    required this.contentType,
    required this.state,
    required this.size,
    required this.downloadCount,
    required this.createdAt,
    required this.updatedAt,
    required this.browserDownloadUrl,
  });

  factory Asset.fromJson(Map<String, dynamic> json) => Asset(
        url: json["url"],
        id: json["id"],
        name: json["name"],
        label: json["label"],
        uploader: Member.fromJson(json["uploader"]),
        contentType: json["content_type"],
        state: assetStateValues.map[json["state"]]!,
        size: json["size"],
        downloadCount: json["download_count"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        browserDownloadUrl: json["browser_download_url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "id": id,
        "name": name,
        "label": label,
        "uploader": uploader.toJson(),
        "content_type": contentType,
        "state": assetStateValues.reverse[state],
        "size": size,
        "download_count": downloadCount,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "browser_download_url": browserDownloadUrl,
      };
}

enum AssetState { uploaded }

final assetStateValues = EnumValues({"uploaded": AssetState.uploaded});

enum AccountType {
  createEvent,
  pushEvent,
  watchEvent,
  releaseEvent,
  pullRequestEvent,
  issuesEvent,
  forkEvent,
  gollumEvent,
  issueCommentEvent,
  deleteEvent,
  pullRequestReviewCommentEvent,
  commitCommentEvent,
  memberEvent,
  publicEvent
}

final accountTypeValues = EnumValues({
  "CommitCommentEvent": AccountType.commitCommentEvent,
  "CreateEvent": AccountType.createEvent,
  "DeleteEvent": AccountType.deleteEvent,
  "ForkEvent": AccountType.forkEvent,
  "GollumEvent": AccountType.gollumEvent,
  "IssuesEvent": AccountType.issuesEvent,
  "IssueCommentEvent": AccountType.issueCommentEvent,
  "MemberEvent": AccountType.memberEvent,
  "PublicEvent": AccountType.publicEvent,
  "PullRequestEvent": AccountType.pullRequestEvent,
  "PullRequestReviewCommentEvent": AccountType.pullRequestReviewCommentEvent,
  "PushEvent": AccountType.pushEvent,
  "ReleaseEvent": AccountType.releaseEvent,
  "WatchEvent": AccountType.watchEvent
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
