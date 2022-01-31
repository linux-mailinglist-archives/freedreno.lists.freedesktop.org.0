Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD3F4A50B9
	for <lists+freedreno@lfdr.de>; Mon, 31 Jan 2022 22:05:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B363E10E451;
	Mon, 31 Jan 2022 21:05:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 738C710E337
 for <freedreno@lists.freedesktop.org>; Mon, 31 Jan 2022 21:05:17 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id z4so29541090lft.3
 for <freedreno@lists.freedesktop.org>; Mon, 31 Jan 2022 13:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vThlvEmvp/6FBsR0reDfoEC2yRp4jMGo+thDfo0ZGZ8=;
 b=wEm14HJQFhoMXlPM74AVZSRNXm4lL1H4VaVe/aGOQKqmaDrT7c50hAMsniEWf0IEpT
 8pUKh4uIMtf9e9VTiNClQ/rU81KZvmbZYNEI2JnVY79k39uyolei7JuXYehDta/Jg8Rt
 SQTnvJLYT58wOgGtggNV1mePq9AVbYyRGWUnMKkgf0QAitc0BY89TA7ZVroPF5Qb1lnU
 C5LA4a32rJVBNN9XcQFmOSc05hbaNVzSoy7P3JPsQZ6nGTgy2DZdKooEM6DViCROr9WJ
 Svh1o/cYSB543IYdqiUOuPeY7WP3mCdVzzx6ZguNwrpaf0Ng+l6bqYrtM+IKufFZNnx5
 Yarg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vThlvEmvp/6FBsR0reDfoEC2yRp4jMGo+thDfo0ZGZ8=;
 b=abNJz4vbDAB8dV6iLWE8yJR2pScxkn7GzGZaT87dIEsIXc3Xk6dd97W59mF7vvyOJl
 NqRv4pCGOi/hXk0rWHGcsjdTUuvWxIWydhHFdktbHg6lr56ZWUfWLYAa35e91SWRt+me
 871x4hjATJCLOuA6atuIGDeZB1vAGl2T2NLv0cJP0uINz7Vmxv/YscsyxgO5IUGnp96H
 nxR617Jpt6PYOy5YrPOC8E1ecxeq9aETLNqmNwX9mKVPkIA4tJYa0I47jdZt8L+w0Wdo
 06IcYf+uad2YdcT2abimctuWZPwOUgNz3Ps6eWTb3y0w3fwnjbcVb7uk5i0KK6n3IoUF
 HxrA==
X-Gm-Message-State: AOAM530mxIk2N9+rPmhciFvw664+2hmIu8TNBP2VRQg7LameKyuCTKXm
 KtdfAB4M0CsAF34NG+2d/sPSWg==
X-Google-Smtp-Source: ABdhPJz/4U5stnoc0BfXhZs50Xa6qriT84hflYtyMKASEeBwIFKW7MOD7rD3QgTmpERFwr2RngtkcQ==
X-Received: by 2002:a05:6512:3341:: with SMTP id
 y1mr16505203lfd.58.1643663115603; 
 Mon, 31 Jan 2022 13:05:15 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id y13sm2575910lfl.263.2022.01.31.13.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 13:05:15 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue,  1 Feb 2022 00:05:11 +0300
Message-Id: <20220131210513.2177652-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 0/2] drm/msm: rework clock handling
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

msm_dss_clk_*() functions significantly duplicate clk_bulk_* family of
functions. Drop custom code and use bulk clocks directly. This also
removes dependency of DP driver on the DPU driver internals.

Changes since v3:
 - Switched to devm_clk_bulk_get_all() per Stephen's suggestion.
 - Removed a call to of_clk_set_defaults() (per Stephen's suggestion
   again). It duplicates a call in platform_probe().
 - Split the first patch (moving helpers to msm_io_utils.c), it's unused
   now.

Changes since v2:
 - Retain conditional code/prints in DP code to ease debugging
 - Rebase on top of msm-next and [1]
 - Split helper functions to msm_io_utils.c as suggested by Jessica

Changes since v1:
 - Rebase on top of current tree to fix conflicts

Dmitry Baryshkov (2):
  drm/msm/dpu: simplify clocks handling
  drm/msm/dp: rewrite dss_module_power to use bulk clock functions

 drivers/gpu/drm/msm/Makefile                  |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c |  24 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c   | 187 ------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.h   |  40 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  46 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c      |  26 +--
 drivers/gpu/drm/msm/dp/dp_ctrl.c              |  19 +-
 drivers/gpu/drm/msm/dp/dp_parser.c            |  21 +-
 drivers/gpu/drm/msm/dp/dp_parser.h            |  17 +-
 drivers/gpu/drm/msm/dp/dp_power.c             |  91 +++++----
 12 files changed, 131 insertions(+), 351 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.h

-- 
2.34.1

