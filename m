Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B6256FC6E
	for <lists+freedreno@lfdr.de>; Mon, 11 Jul 2022 11:43:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 954BF11B3B7;
	Mon, 11 Jul 2022 09:43:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66E5D14A2FB
 for <freedreno@lists.freedesktop.org>; Mon, 11 Jul 2022 09:43:23 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id n18so6056499lfq.1
 for <freedreno@lists.freedesktop.org>; Mon, 11 Jul 2022 02:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iMAIYBpgb7aOPcgX4GrbdMG81I0O+lFkvF+hNUYyX5w=;
 b=ndmyHyZ/kSAe2U7LJS5XP0Trk5YXRYE/M2/ZPFz/p9uV03aXTMcdsekItJMYhM/N5M
 W/nKdhevc37Vp87NqxKbgwMIwS2hK+Qq2dyQoUQ5jgVIMnXiS68H/J0+h862S6k+sCkV
 1VTA6jRPJbndeMqKUARxz0D6R0nT3g8CIzNxmeYCveHmZYQgZLrIq7tatn5ZkcgnqPzY
 NEHpHbTcSO958VViHrslfEQsjgyFubGNLbbbPjOoYeMZULA/GgRjxYGlL0IT3gPaD77B
 AJP6EQqayiVNxXIvDjJf9M6xMpnc7+VWw4r4toOi8EYIOp/YngF77C0WYOd3Rrdgpqnw
 shDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iMAIYBpgb7aOPcgX4GrbdMG81I0O+lFkvF+hNUYyX5w=;
 b=rywoMTPdfT0D4AWYbsiger5udIYjwMsEE1pGCS0YiDyi15kFzv7gDGTkalEUYarWhW
 lTTGawI1WoAPr4XbNa9LJeh6NTq2kshM+ldcK+HfFZQNrpeoY91/xO25vdmQmKSezvh2
 uv7O6TU1HBqd0obe+qwYAXX2aso8DpGBeWoSqsXmevaaCTe15r2y1L9dsW3dvAAAhQIt
 HZ8MiSw1Eg/3ICHb4B6of38Ud32i8DulC3+CAHemPuWpgHFKOVj2FJYEzmnRiaRZ40Bn
 l7v/p7N3rwcUDY/+R3Rodx93t/vPVbzFsxlVfEoCLw8yy7EqxMokvR2KomuQ5Q1T3kl+
 Z2Yw==
X-Gm-Message-State: AJIora8Czu1rkpGvz/G1fLh/z0R2oSnGpnbmWhVDuXmg3rwNjiQInb1a
 CmWErtpn+3ohBJCpfLnWF96m3w==
X-Google-Smtp-Source: AGRyM1szJCxPEoQyQOcscgAyahJbGs16iCvHXm19dtwgk1yIoOcljqDHwJ/uvMRW7uA8lC4eKa/Q1A==
X-Received: by 2002:a05:6512:1590:b0:47f:6e14:a782 with SMTP id
 bp16-20020a056512159000b0047f6e14a782mr11188427lfb.131.1657532601723; 
 Mon, 11 Jul 2022 02:43:21 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 i27-20020a2ea37b000000b0025d4974a12asm1639490ljn.26.2022.07.11.02.43.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 02:43:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Mon, 11 Jul 2022 12:43:16 +0300
Message-Id: <20220711094320.368062-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 0/4] drm/msm/dsi: stop using drm_panel
 directly
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This series superseeds two existing patch series ([1] and [2]) and
merges them together in a single patchset to demonstrate necessity for
the first three patches.

The drm/msm/dsi driver has two separate code paths, one utilizing a
chain of drm_bridges and another one for directly interfacing the
drm_panel. We would have dropped the second path completely but for the
DSI DSC pps data.

To properly support DSI DSC the DSI sink driver (panel) has to pass DSC
pps data to the source (DSI host). The commit 0f40ba48de3b
("drm/msm/dsi: Pass DSC params to drm_panel") added a pointer to the DSC
data to the struct drm_panel. However this is not ideal.

First, this keeps DSC-supporting DSI sink bridges out of the picture
(like ANX7625 which support DSC decoding on the MIPI DSI inputs).

Second, this does not play well with the panel_bridge. Drivers depending
solely on the bridge chains will still have to lookup panel and fetch
data from it.

Last, but not least, the DSC data is not relevant for the wide variety
of panels including DPI and LVDS panels.

To solve all these problems, move struct drm_dsc_config pointer from
struct drm_panel to struct mipi_host_device. This way MIPI DSI host
driver receives DSC data during attach callback without additional
lookups.

The last commit drops the drm_panel code from msm/dsi driver, providing
code simplification.

Changes since v1 (of both patchsets):
 - Minor cleanups in the msm/dsi driver, dropping more now-unused code.

[1] https://patchwork.freedesktop.org/series/103411/
[2] https://patchwork.freedesktop.org/series/105995/

Dmitry Baryshkov (4):
  drm/mipi-dsi: pass DSC data through the struct mipi_dsi_device
  drm/msm/dsi: fetch DSC pps payload from struct mipi_dsi_device
  drm/panel: drop DSC pps pointer
  drm/msm/dsi: switch to DRM_PANEL_BRIDGE

 drivers/gpu/drm/msm/dsi/dsi.c         |  38 +---
 drivers/gpu/drm/msm/dsi/dsi.h         |  14 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c    |  50 ++---
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 264 ++------------------------
 include/drm/drm_mipi_dsi.h            |   2 +
 include/drm/drm_panel.h               |   7 -
 6 files changed, 39 insertions(+), 336 deletions(-)

-- 
2.35.1

