import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:fpdart/fpdart.dart';
import 'package:simplegit/src/bindings/simplegit.dart';
import 'package:simplegit/src/error.dart';
import 'package:simplegit/src/repo.dart';
import 'package:simplegit/src/sys.dart';

class GitCommit {
  LocalRepository repo;
  String message;
  String authorName;
  String authorEmail;

  GitCommit({
    required this.repo,
    required this.message,
    required this.authorName,
    required this.authorEmail,
  });

  TaskEither<GitError, String> perform() => TaskEither(() async {
    final indexOut = calloc<Pointer<git_index>>();
    final treeOut = calloc<Pointer<git_tree>>();
    final headOut = calloc<Pointer<git_reference>>();
    final parentObjOut = calloc<Pointer<git_object>>();
    final parentCommitOut = calloc<Pointer<git_commit>>();
    final oidOut = calloc<git_oid>();

    final authorNamePtr = authorName.toNativeUtf8().cast<Char>();
    final authorEmailPtr = authorEmail.toNativeUtf8().cast<Char>();
    final messagePtr = message.toNativeUtf8().cast<Char>();

    final sigOut = calloc<Pointer<git_signature>>();

    try {
      final idxRes = gitSys.git_repository_index(indexOut, repo.inner);
      if (idxRes != 0) {
        return Left(GitError(kind: GitErrorKind.indexError));
      }

      final index = indexOut.value;

      final writeRes = gitSys.git_index_write_tree(oidOut, index);
      if (writeRes != 0) {
        return Left(GitError(kind: GitErrorKind.treeWriteError));
      }

      final treeRes = gitSys.git_tree_lookup(treeOut, repo.inner, oidOut);
      if (treeRes != 0) {
        return Left(GitError(kind: GitErrorKind.treeLookupError));
      }

      final tree = treeOut.value;

      bool hasParent = true;

      final headRes = gitSys.git_repository_head(headOut, repo.inner);
      if (headRes != 0) {
        hasParent = false;
      }

      if (hasParent) {
        final ref = headOut.value;

        final peelRes = gitSys.git_reference_peel(
          parentObjOut,
          ref,
          git_object_t.GIT_OBJECT_COMMIT,
        );

        if (peelRes != 0) {
          return Left(GitError(kind: GitErrorKind.parentLookupError));
        }
      }

      final sigRes = gitSys.git_signature_now(
        sigOut,
        authorNamePtr,
        authorEmailPtr,
      );
      if (sigRes != 0) {
        return Left(GitError(kind: GitErrorKind.signatureError));
      }

      final signature = sigOut.value;

      parentCommitOut.value = parentObjOut.value.cast<git_commit>();

      final commitRes = gitSys.git_commit_create(
        oidOut,
        repo.inner,
        "HEAD".toNativeUtf8().cast<Char>(),
        signature,
        signature,
        nullptr,
        messagePtr,
        tree,
        hasParent ? 1 : 0,
        hasParent ? parentCommitOut.cast() : nullptr,
      );

      if (commitRes != 0) {
        return Left(GitError(kind: GitErrorKind.commitError));
      }

      final buf = calloc<Char>(41);
      gitSys.git_oid_tostr(buf, 41, oidOut);
      final oidString = buf.cast<Utf8>().toDartString();

      calloc.free(buf);

      return Right(oidString);
    } finally {
      calloc.free(indexOut);
      calloc.free(treeOut);
      calloc.free(headOut);
      calloc.free(parentObjOut);
      calloc.free(parentCommitOut);
      calloc.free(oidOut);
      calloc.free(sigOut);
      malloc.free(authorNamePtr);
      malloc.free(authorEmailPtr);
      malloc.free(messagePtr);
    }
  });
}