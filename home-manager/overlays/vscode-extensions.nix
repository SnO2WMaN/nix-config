final: prev: {
  vscode-extensions = with final.vscode-utils; prev.vscode-extensions // {
    ahmadalli.vscode-nginx-conf = extensionFromVscodeMarketplace {
      name = "vscode-nginx-conf";
      publisher = "ahmadalli";
      version = "0.1.3";
      sha256 = "10z0him4kl9q6h1nip7d3dp9nv0a1dkh3x6zqc6nilfw959v3358";
    };
    alefragnani.Bookmarks = extensionFromVscodeMarketplace {
      publisher = "alefragnani";
      name = "Bookmarks";
      version = "13.2.4";
      sha256 = "0376hs09wypn781s4cz3qb74qvsxck0nw1s39bfsgpqi0rgvwa9f";
    };
    EditorConfig.EditorConfig = extensionFromVscodeMarketplace {
      publisher = "EditorConfig";
      name = "Bookmarks";
      version = "0.16.4";
      sha256 = "0fa4h9hk1xq6j3zfxvf483sbb4bd17fjl5cdm3rll7z9kaigdqwg";
    };
    richie5um2.vscode-sort-json = extensionFromVscodeMarketplace {
      name = "vscode-sort-json";
      publisher = "richie5um2";
      version = "1.20.0";
      sha256 = "1zcbdzsv6vv3zwx5ddbarqizs8s9s57dnf328waq8jgqyzjg31i6";
    };
    denoland.vscode-deno = extensionFromVscodeMarketplace {
      name = "vscode-deno";
      publisher = "denoland";
      version = "3.12.0";
      sha256 = "1si1w1rcrb5zhzw0ffrq753wbw85k6yx793vcwfsjh241dcw5hb6";
    };
    exiasr.hadolint = extensionFromVscodeMarketplace {
      publisher = "exiasr";
      name = "hadolint";
      version = "1.1.1";
      sha256 = "0ls604nkahasny0kzh7677nr7mk9akcnljf4g41j0k47avza1hig";
    };
    johnsoncodehk.volar = extensionFromVscodeMarketplace {
      name = "volar";
      publisher = "johnsoncodehk";
      version = "0.34.11";
      sha256 = "1r558gb7kswjdzqzz37k7ggdqshlv4v12371g0vgwcbq8g2lnb7q";
    };
    Prisma.prisma = extensionFromVscodeMarketplace {
      publisher = "Prisma";
      name = "prisma";
      version = "3.13.0";
      sha256 = "0wjikwxawgvh4d2nwq8f1q2xm3bm4l90s2qdfdfymb9c75slmr0z";
    };
    GraphQL.vscode-graphql = extensionFromVscodeMarketplace {
      publisher = "GraphQL";
      name = "vscode-graphql";
      version = "0.4.4";
      sha256 = "1cj8c8pccn53ivk2hx59vpw4xw3y54vf5bflzsljnm5dl48biz6g";
    };
    dprint.dprint = extensionFromVscodeMarketplace {
      publisher = "dprint";
      name = "dprint";
      version = "0.11.0";
      sha256 = "0k69cvg9qz2pi387zg467vk80wv9kwgza2z4jj1kpxqmd7v4a7p6";
    };
    ms-toolsai.jupyter-keymap = extensionFromVscodeMarketplace {
      publisher = "ms-toolsai";
      name = "jupyter-keymap";
      version = "1.0.0";
      sha256 = "0wkwllghadil9hk6zamh9brhgn539yhz6dlr97bzf9szyd36dzv8";
    };
    ms-toolsai.jupyter-renderers = extensionFromVscodeMarketplace {
      publisher = "ms-toolsai";
      name = "jupyter-renderers";
      version = "1.0.6";
      sha256 = "0sb3ngpl4skylbmz7zbj7s79xala29wrgn1c3m4agp00ixz451fq";
    };
    GitHub.vscode-pull-request-github = extensionFromVscodeMarketplace {
      publisher = "GitHub";
      name = "vscode-pull-request-github";
      version = "0.41.2022042909";
      sha256 = "0y4nsgf6chlflds36008ff60h2f4ppb5zp0gki396091n2rq84ps";
    };
    styled-components.vscode-styled-components = extensionFromVscodeMarketplace {
      name = "vscode-styled-components";
      publisher = "styled-components";
      version = "1.7.4";
      sha256 = "0qx1mvvw0bqa0psm35yxv9lvzw40bp8syjx4sp13502hg63r4h7n";
    };
    timonwong.shellcheck = extensionFromVscodeMarketplace {
      name = "shellcheck";
      publisher = "timonwong";
      version = "0.19.2";
      sha256 = "0fsf9nvwlgyx57w6q67pk4j5rndp8x0b5i0w0w69s3abn9sx54h9";
    };
    James-Yu.latex-workshop = extensionFromVscodeMarketplace {
      name = "latex-workshop";
      publisher = "James-Yu";
      version = "8.25.0";
      sha256 = "1nnxdzwmamyv4lbxmm1wn3fijlpacfcxwvkxqlfy28xw27xbn9a0";
    };
    redhat.vscode-yaml = extensionFromVscodeMarketplace {
      name = "vscode-yaml";
      publisher = "redhat";
      version = "1.7.0";
      sha256 = "1bbjpaypp0mq5akww5f0pkpq01j0xhhvkfr44f4lb2rdhr5nmnvc";
    };
    redhat.vscode-xml = extensionFromVscodeMarketplace {
      name = "vscode-xml";
      publisher = "redhat";
      version = "0.20.0";
      sha256 = "1l073hqdivzyadjg8cn68wrmvbcrhc67yll4sypvb7rwvdznp80q";
    };
    ms-vscode-remote.remote-ssh-edit = extensionFromVscodeMarketplace {
      name = "remote-ssh-edit";
      publisher = "ms-vscode-remote";
      version = "0.50.0";
      sha256 = "1b2lqd89vnynbzd3rss1jahc1zxs769s921rclgy1v7z1sd1kqxy";
    };
    # VisualStudioExptTeam.vscodeintellicode = extensionFromVscodeMarketplace {
    #   publisher = "VisualStudioExptTeam";
    #   name = "vscodeintellicode";
    #   version = "v1.20.0";
    # };
    # ms-vscode-remote.remote-containers = extensionFromVscodeMarketplace {
    #   publisher = "ms-vscode-remote";
    #   name = "remote-containers";
    #   version = "0.231.6";
    # };
    # ms-vscode-remote.remote-ssh = extensionFromVscodeMarketplace {
    #   publisher = "ms-vscode-remote";
    #   name = "remote-ssh";
    #   version = "v0.78.0";
    # };
    # ms-vscode-remote.remote-ssh-edit = extensionFromVscodeMarketplace {
    #   publisher = "ms-vscode-remote";
    #   name = "remote-ssh-edit";
    #   version = "v0.80.0";
    # };
  };
}
