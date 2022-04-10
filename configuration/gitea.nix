{ config, lib, pkgs, ... }:

{
  services.gitea = {
    settings.repository.DEFAULT_BRANCH = "main";
    settings.repository.ENABLE_PUSH_CREATE_USER = "true";
    settings.repository.ENABLE_PUSH_CREATE_ORG = "true";
    settings.repository.DEFAULT_PUSH_CREATE_PRIVATE = "false";
  };
}
