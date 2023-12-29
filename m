Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77730820249
	for <lists+freedreno@lfdr.de>; Fri, 29 Dec 2023 23:56:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D52A10E2D6;
	Fri, 29 Dec 2023 22:56:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD32C10E2D8
 for <freedreno@lists.freedesktop.org>; Fri, 29 Dec 2023 22:56:53 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-50e7aed08f4so3994765e87.0
 for <freedreno@lists.freedesktop.org>; Fri, 29 Dec 2023 14:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703890612; x=1704495412; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nRcyBHrlzE99VWMlLh6k7iUhBndwKxnf4JL9l9A4LA8=;
 b=qtyxqJK1/JdgdpzACfRBqVpy8Y1wt0aAMJp79ojDL/SQENO1yWBwKxArhdWD/Tyugp
 y+c8PvRRayw4tYLMLtEZst7/lhtB5M2DQQUWF9+x0WwH2mk9gVdZqJNJGoObl7hJE8g5
 CJpCndH76IsvShdTAy+PWXCDYzDJbEmfzkBpWi5KbsEHpGnruNpnKtQD1hYtNNe4PJFl
 USR21Te79w9XruhGMw2TNL+cneKKNhV/Q+OCYI4u6aC2SMOW0V8Msju0xoPzHSXtmidE
 tczK87vYBVcI5YP3isYKw09w38tpt0HlwN4DUfMEqaNUXR3XjFqm+BSsC+D4lMGhU2H6
 xToQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703890612; x=1704495412;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nRcyBHrlzE99VWMlLh6k7iUhBndwKxnf4JL9l9A4LA8=;
 b=C9vxCfJN224rxssRcTCHo+Sgbpse+uZr4IEIdcc6lCSkzc4SBi4CTtyM+ya62/JsNR
 By4ZOWwlYGX2FXldwEC5N7gY/nl2IGhpM2e2q7sygmKVl2b5AM7fwtqW7pI42Zi8KUAM
 t+WhNx8hPzYkLstv0RZ7LUC2raVwyJJ757389MY86Oi/jx+C/r5RSY90kwoovZm+Xmo1
 mXBL3yPnmfrvmf5jwm8wgumqwVD4cXltDZl6mViM/bIZ9RceVL6Pg4T5UBG6V0UrnAMB
 GwX2cIvKecssS4u0YlyWHenB+tUA+NNqreJARBgx7evRLyKH34V2eFAbkpqyW4XLam3o
 ZhMA==
X-Gm-Message-State: AOJu0YytGbtmYb6XtPnSgHNMUSXasTPqin1rCSdjEN335ev3f07PMK4n
 JkmV+UxwcXgNRUaBa2Jg8Kv1iQU/dMXSNA==
X-Google-Smtp-Source: AGHT+IE9F/wnuDMCjrAAp9h/hllAKH6e69+4qUx/Tl3C7H6RKkHc0hwikgHy32cSHlQkgL6n23JE0w==
X-Received: by 2002:a05:6512:23a2:b0:50b:f231:d444 with SMTP id
 c34-20020a05651223a200b0050bf231d444mr9132601lfv.7.1703890611714; 
 Fri, 29 Dec 2023 14:56:51 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j26-20020ac2455a000000b0050e7f5794cbsm1326952lfm.309.2023.12.29.14.56.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Dec 2023 14:56:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Subject: [PATCH 00/14] drm/msm/dp: clear power and parser submodules away
Date: Sat, 30 Dec 2023 00:56:36 +0200
Message-Id: <20231229225650.912751-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Reshuffle code in the DP driver, cleaning up clocks and DT parsing and
dropping the dp_power and dp_parser submodules.

Initially I started by looking onto stream_pixel clock handling only to
find several wrapping layers around a single clocks. After inlining
and/or dropping them (and thus dp_power submodule), it was more or less
natural to continue cleaning up the dp_parser until it got removed
completely.

Dmitry Baryshkov (14):
  drm/msm/dp: drop unused parser definitions
  drm/msm/dp: drop unused fields from dp_power_private
  drm/msm/dp: parse DT from dp_parser_get
  drm/msm/dp: inline dp_power_(de)init
  drm/msm/dp: fold dp_power into dp_ctrl module
  drm/msm/dp: simplify stream clocks handling
  drm/msm/dp: stop parsing clock names from DT
  drm/msm/dp: move phy_configure_opts to dp_ctrl
  drm/msm/dp: remove PHY handling from dp_catalog.c
  drm/msm/dp: handle PHY directly in dp_ctrl
  drm/msm/dp: move all IO handling to dp_catalog
  drm/msm/dp: move link property handling to dp_panel
  drm/msm/dp: move next_bridge handling to dp_display
  drm/msm/dp: drop dp_parser

 drivers/gpu/drm/msm/Makefile        |   2 -
 drivers/gpu/drm/msm/dp/dp_aux.c     |   9 +-
 drivers/gpu/drm/msm/dp/dp_aux.h     |   2 +
 drivers/gpu/drm/msm/dp/dp_catalog.c | 156 ++++++++-----
 drivers/gpu/drm/msm/dp/dp_catalog.h |   6 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 317 +++++++++++++++++++--------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  28 ++-
 drivers/gpu/drm/msm/dp/dp_debug.c   |   1 -
 drivers/gpu/drm/msm/dp/dp_display.c | 101 +++------
 drivers/gpu/drm/msm/dp/dp_display.h |   3 +-
 drivers/gpu/drm/msm/dp/dp_panel.c   |  63 ++++++
 drivers/gpu/drm/msm/dp/dp_parser.c  | 327 ----------------------------
 drivers/gpu/drm/msm/dp/dp_parser.h  | 155 -------------
 drivers/gpu/drm/msm/dp/dp_power.c   | 183 ----------------
 drivers/gpu/drm/msm/dp/dp_power.h   |  95 --------
 15 files changed, 463 insertions(+), 985 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_parser.c
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_parser.h
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_power.c
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_power.h

-- 
2.39.2

