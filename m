Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F2254FE79
	for <lists+freedreno@lfdr.de>; Fri, 17 Jun 2022 22:47:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C78AC10FB57;
	Fri, 17 Jun 2022 20:47:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6EF610FB57
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jun 2022 20:47:52 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id 184so4957243pga.12
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jun 2022 13:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cthRoKdZynlo7BCJhn2Mvx9FZ9+o8uogeaq20GblQQw=;
 b=nFsBmKmNn+/h8yDv9MpPAjH4ATR3q3Bz0cTI1gh6q7RWGlJq4k9RjlPLJhAYwTAS7p
 fH5Fgfn9tn1XPnw9u35HLDbshjkuLhEvjrdZr3iu2LgriDyOCphiKdNeMNC7ODk7XZo4
 IhYcHQs0mlvPPg1IIzhMtZVfOcaenKJqoL5ZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cthRoKdZynlo7BCJhn2Mvx9FZ9+o8uogeaq20GblQQw=;
 b=BKj2PgJritJ32od7QvwKig1xyRcNi/BbHVZ1H0yR+dH7jfFhdBB7yGfGk30DBj9SYQ
 VZ6jVDeO0WRABjeZFFftKGUDn8M4i052EEpIItI0YThkgTxNbcmTU3bKEn1zEgTA1s+W
 sHZokRXhNCWYADnzRVXKYoX6nncdCfDlqkNnzvjGNxyta4xTQ4vReKRYomhIhBNIJpMd
 xkZys8d7tpIDcncb3lr5L6U/nMzpzvtCLpdIT6y81p5btzgpKBjLQmt+3QrEz+U3m5HN
 Azi4lz4rLG6pcNpQfksmtJuxqFRhpkMaSQHoBz0J8sC6gNoGn+etQ4ayDmWBz3gXP/fJ
 HsLw==
X-Gm-Message-State: AJIora8d0dbtvVkEXcoSX8xef2MhXSXyfFuddmxmwh41frm7oO311W9a
 +I7rtQM1j9DTKBlNvhVTAGhbHw==
X-Google-Smtp-Source: AGRyM1s2KT9lZnLB+hTEDMQKftAyY/9OYB52Ihl7t/kjRy+fLlR2MbQtggQk9rA7rcrF+PobFUc2tg==
X-Received: by 2002:a63:6f8d:0:b0:408:c049:aaf1 with SMTP id
 k135-20020a636f8d000000b00408c049aaf1mr10554739pgc.199.1655498872314; 
 Fri, 17 Jun 2022 13:47:52 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:52e2:7dc8:1e20:f870])
 by smtp.gmail.com with ESMTPSA id
 z12-20020aa79f8c000000b0052089e1b88esm4098325pfr.192.2022.06.17.13.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 13:47:51 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 17 Jun 2022 13:47:47 -0700
Message-Id: <20220617204750.2347797-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 0/3] drm/msm/dp: More cleanups for force link
 train
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
Cc: Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 patches@lists.linux.dev, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

These patches do a little cleanup on the v9 patch from Kuogee.

Stephen Boyd (3):
  drm/msm/dp: Reorganize code to avoid forward declaration
  drm/msm/dp: Remove pixel_rate from struct dp_ctrl
  drm/msm/dp: Get rid of dp_ctrl_on_stream_phy_test_report()

 drivers/gpu/drm/msm/dp/dp_ctrl.c | 145 ++++++++++++++-----------------
 drivers/gpu/drm/msm/dp/dp_ctrl.h |   1 -
 2 files changed, 65 insertions(+), 81 deletions(-)

[1] https://lore.kernel.org/r/1655411200-7255-1-git-send-email-quic_khsieh@quicinc.com

base-commit: 9639746eebb13068dc9de6f436151bd88da2b827
prerequisite-patch-id: 2fc33a2830ec84d922023fddb585728c48a59525
-- 
https://chromeos.dev

