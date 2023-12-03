Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF55802388
	for <lists+freedreno@lfdr.de>; Sun,  3 Dec 2023 12:53:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AC5B10E2B9;
	Sun,  3 Dec 2023 11:53:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E7BB10E2AD
 for <freedreno@lists.freedesktop.org>; Sun,  3 Dec 2023 11:53:18 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2c9f8faf57bso6375291fa.3
 for <freedreno@lists.freedesktop.org>; Sun, 03 Dec 2023 03:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701604397; x=1702209197; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=p+lPohBi/ZxoOWEwMqklXE78q3N8omeUQljRY/SKmPA=;
 b=fjRn1iyZqPINLzcee4IfVTKbfo4G3Mm6WelcrFa9Xw7r1uKCsl97VCqKT5c6zBg1Ui
 zBuKO/+tHHQNAKbX9o3C2ohNkc9lm2VMoKp/ARJv8VMKUdHNxn4sza4lXxvJKCXQhvnr
 ea8TLkJ6Uhwd4FiVst0G3AlNLvsQ+UBSqJUBKOfvZDQbVQOqYh6Rk0LXLtQUMZ3kP77R
 RiAWretnIjoPWP2ZvPusIYDImT6Lqb+rpV0SJqZVCO1Ibh/zRe4qGOyNTrk4E8xTloA8
 oiO3YSPNDLtF1eEjpnkXl8uYO/4530SvVxcSU1Et+g77HXRbhztGlreFjRMbK3Ha6xxD
 UZyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701604397; x=1702209197;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p+lPohBi/ZxoOWEwMqklXE78q3N8omeUQljRY/SKmPA=;
 b=WmtFj8UnFREgARnalQiXlr/xpZLf63zOSqvYtp2CgxApHP+n6AlhbTHQaeiZ03anIt
 CV0CD14IVz/ApMxELajgh9cLT/jRFPtCBPQtzNrFX7CR5t5engLe84XqdzMMBpuB4bHK
 81dCmX84Eew+owK9Hf9ma3U9psbB2K6REGSbEEs4cDiqE+5ilPO5sYjg/QSeog28ScrL
 xuCjhF3QEKcFszDet7fCnIiZLjkTyZTFyPfd97YgTcbZ+NhadzxT9vzqyYv4gbLIeSSl
 7nTwJVyN8MmqSt7uL+hLIVczGlQcfQd0ks0A6Sgqql3cH9ehl3CXuQJCiKarcoS71f5S
 Wf2g==
X-Gm-Message-State: AOJu0Yzuzq/s79ws7d0YmbnSd1oow4dMQXmZtxbmz1g8lcWXYAaQO0QA
 LlM9eEou60iRjauHJ2REbt9VpQ==
X-Google-Smtp-Source: AGHT+IEX8KqcCeITGDqjCPGan5WOV95qsQaT/IZAMSQd/9QNkAU6y90+zhFGlVygmZEqaicsSHKynQ==
X-Received: by 2002:a2e:381a:0:b0:2c9:caf4:18b0 with SMTP id
 f26-20020a2e381a000000b002c9caf418b0mr1904893lja.41.1701604396691; 
 Sun, 03 Dec 2023 03:53:16 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a2e9645000000b002c9c21d01c2sm900437ljh.101.2023.12.03.03.53.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Dec 2023 03:53:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Date: Sun,  3 Dec 2023 14:53:12 +0300
Message-Id: <20231203115315.1306124-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH RESEND v2 0/3] drm: introduce per-encoder
 debugfs directory
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
Cc: linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Resending, patch 1 needs review from DRM core maintainers, but it got no
attention since October.

Each of connectors and CRTCs used by the DRM device provides debugfs
directory, which is used by several standard debugfs files and can
further be extended by the driver. Add such generic debugfs directories
for encoder. As a showcase for this dir, migrate `bridge_chains' debugfs
file (which contains per-encoder data) and MSM custom encoder status to
this new debugfs directory.

Changes since v1:
- Brought back drm_printer usage to bridges_show (Tomi Valkeinen)
- Updated the drm/bridge commit message to reflect format changes (Tomi
  Valkeinen)

Dmitry Baryshkov (3):
  drm/encoder: register per-encoder debugfs dir
  drm/bridge: migrate bridge_chains to per-encoder file
  drm/msm/dpu: move encoder status to standard encoder debugfs dir

 drivers/gpu/drm/drm_bridge.c                | 44 --------------
 drivers/gpu/drm/drm_debugfs.c               | 65 ++++++++++++++++++++-
 drivers/gpu/drm/drm_encoder.c               |  4 ++
 drivers/gpu/drm/drm_internal.h              |  9 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 45 ++------------
 include/drm/drm_bridge.h                    |  2 -
 include/drm/drm_encoder.h                   | 16 ++++-
 7 files changed, 96 insertions(+), 89 deletions(-)

-- 
2.39.2

