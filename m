Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 059D3B00886
	for <lists+freedreno@lfdr.de>; Thu, 10 Jul 2025 18:28:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86DBD10E925;
	Thu, 10 Jul 2025 16:27:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="i6gAcOrG";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A2DF10E925
 for <freedreno@lists.freedesktop.org>; Thu, 10 Jul 2025 16:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752164869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3sO2/JwLoOB0WH2WCnvOSV6HSLemFLUS8qLx2PjBI2A=;
 b=i6gAcOrGJPGc3MIOSZhyCLlH0bUc8pdQkmxjN1aGKOvLTV+jP6qerNFoYimpA5LmU6xqll
 JBweLErIIliKhD94OjIEOfdrlnyk6gwQvid2gEvwKHbFYndY1fvNZritbWIXw7i/nh/5P9
 JZvo538GqL8GfDmCMpGGK1ixXR4/hhI=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-33-tLDCVq95NfmFocOq9AgDhQ-1; Thu, 10 Jul 2025 12:27:48 -0400
X-MC-Unique: tLDCVq95NfmFocOq9AgDhQ-1
X-Mimecast-MFC-AGG-ID: tLDCVq95NfmFocOq9AgDhQ_1752164868
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7d15c975968so179281885a.2
 for <freedreno@lists.freedesktop.org>; Thu, 10 Jul 2025 09:27:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752164868; x=1752769668;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3sO2/JwLoOB0WH2WCnvOSV6HSLemFLUS8qLx2PjBI2A=;
 b=FtHHy50yHjEb65XbnELUBSgMZClfZMi/bUZwd5s4VCTFyFZ+YC5mnvRXTSUXy/lcj7
 UpvHlzP3TGisKJ28lQphd/g3f0iXAfSHKmnOoQSdzwr6rsNpgrtbIFgaaoBKX1TDvlul
 oniSteXG4Q1WhEVeC+192TxQbXcCW5cwfxoDgL8dpre3G3XdXUb2TxIjYVKfS9NqqUpj
 FxamCirqAiDMMdUalQV6KipzEtzXQYqc/c6yMAJ9V32CEO6EedvhZ4Kt/P/+URjuz5FP
 pubW0uN1bp7v91LuyHXy6VJFr3L3d8rt1tz/RcYSlf1t3d+ZeqrsriFtXAjL00HxvLCp
 nagw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkVt7LbMYxXYxAxdFbRt9Kj3i0+bZbMoJ2ZisCKj7K7lF9hoZqGdjlZJI+f0TAWxL768QtU69OSk0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyenkUEJCwT2ht27hgnByaBSUroVWH5pGpmIy1frBdnfxCPprpE
 QjSPwt+ws8u776eQzyzH6sRFo4kmFTNpdKjk8ntqUoH0FyPq2LUTFmkZ6vyPO+SCaRjzaOqXQ50
 cTOKRauBIT741V9YVyDvZI4GVYwqTxuN+qcW6WEUlnloDwi9r8EEOivkhiYcmgYtE/OcSNw==
X-Gm-Gg: ASbGncuumSHT1ACFerIBa6YoqTfitTJoTvsaI+sz/+HD1TCZhrHSaBoKEBYZnJoahWn
 JaDTUfitD/3XytpgnrnfMMkc7vaqG/Q724VfW+Sbt1Vb0yjOd43fWN0fTbtSHJdULRPGTSNaZxw
 IBhpbWE4zzHt32LFfi/kfaraAa8vT7PQzGjFBJDjjgP1i/x3Pq7KYXfoFcs4mlp0jWbq9bmlXwk
 hmWSXt78r6LqiMguPWESRgL53LhJpaSRmNBbpf36qOoFFX4KVYv4rDPyCjM/S4Xym/43WbcT3Xe
 CauUQqA3NI/zcuNy7GQLTrvKYoOnK89pGnM4reQWPqDwgVxZRUH3X6Nt+27k
X-Received: by 2002:a05:620a:24d6:b0:7d3:dbed:869b with SMTP id
 af79cd13be357-7ddecc1d5a2mr17536185a.42.1752164866489; 
 Thu, 10 Jul 2025 09:27:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE27LfFDrGnMnfhyfHCbnzrSuLJo3IShFntK9oUyUSQ7N0TE7WAmGfbfKdAyUi+8fKCbP099g==
X-Received: by 2002:a05:620a:24d6:b0:7d3:dbed:869b with SMTP id
 af79cd13be357-7ddecc1d5a2mr17531485a.42.1752164866037; 
 Thu, 10 Jul 2025 09:27:46 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net.
 [73.183.52.120]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7dcdc5df99asm113487685a.49.2025.07.10.09.27.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 09:27:45 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 0/7] drm/msm/dsi/phy: convert from clk round_rate() to
 determine_rate()
Date: Thu, 10 Jul 2025 12:27:26 -0400
Message-Id: <20250710-drm-msm-phy-clk-round-rate-v1-0-364b1d9ee3f8@redhat.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAO7pb2gC/x3MwQqDMAwA0F8pOS+QiuLwV8YOtc00zFZJVRTx3
 1d2fJd3QWYVztCZC5R3yTKnAvsw4EeXBkYJxVBR1VBrCYNGjDniMp7opy/qvKWA6lZG73tLoan
 5STWUYFH+yPHPX+/7/gEq7Uv9bAAAAA==
X-Change-ID: 20250710-drm-msm-phy-clk-round-rate-ccb10d54e804
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752164864; l=5373;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=uByNPn2hW31VVNIAVITQmiBwDw9ZQzuzCS+fE0hn1Ds=;
 b=IyDjRecZ8lmUveDSl1A/ekKcgnVDZWOm0cbVtunJ0Yg60K87JgqJbB99cAFDWIE1Ws5cFuS4G
 SGQmD+wl6KeCcggSryEiIu7SICeBclsasH4oDapkP9eAZ8fGGn/ww3M
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8x_pGHnFPNngeR50itwjc5bD99dheBAKJrq_jBaMBvY_1752164868
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The round_rate() clk ops is deprecated in the clk framework in favor
of the determine_rate() clk ops, so let's go ahead and convert the
drivers in the drm/msm/dsi/phy subsystem using the Coccinelle semantic
patch posted below. I did a few minor cosmetic cleanups of the code in a
few cases.

Coccinelle semantic patch:

    virtual patch

    // Look up the current name of the round_rate function
    @ has_round_rate @
    identifier round_rate_name =~ ".*_round_rate";
    identifier hw_param, rate_param, parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    	...
    }

    // Rename the route_rate function name to determine_rate()
    @ script:python generate_name depends on has_round_rate @
    round_rate_name << has_round_rate.round_rate_name;
    new_name;
    @@

    coccinelle.new_name = round_rate_name.replace("_round_rate", "_determine_rate")

    // Change rate to req->rate; also change occurrences of 'return XXX'.
    @ chg_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier ERR =~ "E.*";
    expression E;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    -return -ERR;
    +return -ERR;
    |
    - return rate_param;
    + return 0;
    |
    - return E;
    + req->rate = E;
    +
    + return 0;
    |
    - rate_param
    + req->rate
    )
    ...>
    }

    // Coccinelle only transforms the first occurrence of the rate parameter
    // Run a second time. FIXME: Is there a better way to do this?
    @ chg_rate2 depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    - rate_param
    + req->rate
    ...>
    }

    // Change parent_rate to req->best_parent_rate
    @ chg_parent_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    - *parent_rate_param
    + req->best_parent_rate
    |
    - parent_rate_param
    + &req->best_parent_rate
    )
    ...>
    }

    // Convert the function definition from round_rate() to determine_rate()
    @ func_definition depends on chg_rate @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier generate_name.new_name;
    @@

    - long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
    -               unsigned long *parent_rate_param)
    + int new_name(struct clk_hw *hw, struct clk_rate_request *req)
    {
        ...
    }

    // Update the ops from round_rate() to determine_rate()
    @ ops depends on func_definition @
    identifier has_round_rate.round_rate_name;
    identifier generate_name.new_name;
    @@

    {
        ...,
    -   .round_rate = round_rate_name,
    +   .determine_rate = new_name,
        ...,
    }

Note that I used coccinelle 1.2 instead of 1.3 since the newer version
adds unnecessary braces as described in this post.
https://lore.kernel.org/cocci/67642477-5f3e-4b2a-914d-579a54f48cbd@intel.com/

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (7):
      drm/msm/dsi_phy_10nm: convert from round_rate() to determine_rate()
      drm/msm/dsi_phy_14nm: convert from round_rate() to determine_rate()
      drm/msm/dsi_phy_28nm_8960: convert from round_rate() to determine_rate()
      drm/msm/dsi_phy_28nm: convert from round_rate() to determine_rate()
      drm/msm/dsi_phy_7nm: convert from round_rate() to determine_rate()
      drm/msm/hdmi_phy_8996: convert from round_rate() to determine_rate()
      drm/msm/hdmi_phy_8998: convert from round_rate() to determine_rate()

 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c      | 18 ++++++-------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c      | 36 +++++++++++++------------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c      | 22 +++++++--------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c | 34 ++++++++++++-----------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c       | 18 ++++++-------
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c        | 19 +++++++------
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c        | 19 +++++++------
 7 files changed, 84 insertions(+), 82 deletions(-)
---
base-commit: b551c4e2a98a177a06148cf16505643cd2108386
change-id: 20250710-drm-msm-phy-clk-round-rate-ccb10d54e804

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

