Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FABE78CC58
	for <lists+freedreno@lfdr.de>; Tue, 29 Aug 2023 20:47:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA65910E47F;
	Tue, 29 Aug 2023 18:47:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE20B10E11F
 for <freedreno@lists.freedesktop.org>; Tue, 29 Aug 2023 18:47:39 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1c0d5b16aacso27958495ad.1
 for <freedreno@lists.freedesktop.org>; Tue, 29 Aug 2023 11:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693334859; x=1693939659;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dx+edCyWT7zKxIInG8qNdrcdM7Jww6Q6gVOtGT7ALUw=;
 b=NXBOd2mkw+gBkwUStDBV8PaGrgZhqCKwaBrY9Usk61+UBBtfDS7Uj7teurMoc22HQb
 3V5SHImgrwViJcGhvlCFMtXqOLx3dqfDPhULkiewQIPMxijOSEnXsKzFpiSIxv02jyRE
 +Jf3CDHT970kefX0aposB1huf8Yi6tErzFupQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693334859; x=1693939659;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dx+edCyWT7zKxIInG8qNdrcdM7Jww6Q6gVOtGT7ALUw=;
 b=TtCY87plJt6NxpUOI0Qp8tCTpAcyyIresZC1S0sD0stKIYd9Mj+M5rGSzGq9OVFkF6
 6glsgjqPRjOdWV2Y4oS7H8dhPfi8sGmwT33bL2u2RShrcbhj8Mfif1rmlE/+VgXYZe7g
 eYh7lOhdCGNVdC9vNhsqNXGJowzmpwT0EK8X/I9NbRhRhpFcjZd30Hu20IueT7DO+Oe0
 BCXh+SnNMWqjDwKBagiTOsG541k+qovtS5hc+/kNKPKMrvUkIsHI8CoKBsfG6tDeEr0U
 ew/Mw27z2MokxPiNu1ku1WN6+0j7wJK1xLYA69HyAIV2r8G5TitoFyxDQGc93nz+NIEH
 sVGw==
X-Gm-Message-State: AOJu0YyT5BQXmlyx5RPJueJpTl4XdQqamlRibI8lPrEnyVnEdTjIdoHu
 iorPhWbwZarPW/7vLJKr1aUvgA==
X-Google-Smtp-Source: AGHT+IES+SJEkk4EUF9mvR0kkp/iKD9S9fLPoptNHth9XsbuVQ5O48L+bHDHC/h6NFzIK11AbzCyfA==
X-Received: by 2002:a17:903:1205:b0:1c2:54c:8beb with SMTP id
 l5-20020a170903120500b001c2054c8bebmr1955615plh.31.1693334858992; 
 Tue, 29 Aug 2023 11:47:38 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:11a:201:d603:22a7:5e5e:d239])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a170902d4cf00b001b9e86e05b7sm9697953plg.0.2023.08.29.11.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 11:47:38 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 29 Aug 2023 11:47:25 -0700
Message-ID: <20230829184735.2841739-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.42.0.rc2.253.gd59a3bf2b4-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 0/7] drm/msm/dp: Simplify DPCD related code with
 helpers
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
 dri-devel@lists.freedesktop.org, Vinod Polimera <quic_vpolimer@quicinc.com>,
 patches@lists.linux.dev, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This driver open-codes a few of the DPCD register reads when it can be
simplified by using the helpers instead. This series reworks the MSM DP
driver to use the DPCD helpers and removes some dead code along the way.
There's the potential for even more code reduction around the test
registers, but I haven't tried to do that yet.

Stephen Boyd (7):
  drm/msm/dp: Replace open-coded drm_dp_read_dpcd_caps()
  drm/msm/dp: Use drm_dp_read_sink_count() helper
  drm/msm/dp: Remove dead code related to downstream cap info
  drm/msm/dp: Remove aux_cfg_update_done and related code
  drm/msm/dp: Simplify with drm_dp_{max_link_rate,max_lane_count}()
  drm/msm/dp: Inline dp_link_parse_sink_count()
  drm/msm/dp: Remove dp_display_is_ds_bridge()

Cc: Vinod Polimera <quic_vpolimer@quicinc.com>
Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>

 drivers/gpu/drm/msm/dp/dp_display.c |   9 +--
 drivers/gpu/drm/msm/dp/dp_link.c    |  38 +---------
 drivers/gpu/drm/msm/dp/dp_panel.c   | 105 +++++-----------------------
 drivers/gpu/drm/msm/dp/dp_panel.h   |  10 +--
 4 files changed, 22 insertions(+), 140 deletions(-)


base-commit: 2dde18cd1d8fac735875f2e4987f11817cc0bc2c
-- 
https://chromeos.dev

