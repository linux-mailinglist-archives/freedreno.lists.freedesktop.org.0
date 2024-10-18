Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C3A9A4925
	for <lists+freedreno@lfdr.de>; Fri, 18 Oct 2024 23:49:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E276A10E9BB;
	Fri, 18 Oct 2024 21:49:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="liPrWkS+";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E788110E9BB
 for <freedreno@lists.freedesktop.org>; Fri, 18 Oct 2024 21:49:21 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5366fd6fdf1so4190282e87.0
 for <freedreno@lists.freedesktop.org>; Fri, 18 Oct 2024 14:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729288160; x=1729892960; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2irfqM3Mz+ZCMqnLHdPvZOQQDp0yyhpcI0682bVeu5Q=;
 b=liPrWkS+KOPkCZGYSue1awMLQUmzMDC7ryUXggMJDKwnTVw5lkpK0pQ2y+o1MWIvs9
 JRakfUsbAWnf+FZNmOJp443DZsL0/z4rHR7gqjJbJS2nQUAfYmF663qAzaMlQXnoqdA2
 gvUo7jY7M6pBtwD+X+fog8ax4iqYxsmTugKSRIVOieCyEVxLHjQsQqn/3rzhzbJnJKBL
 tIbBi4en7HPhyfX6KDAMWf8GmmB6Dv4LCDhXUzZPjryat0axhmzhwzw7G/eddBKJkzsI
 aW1TDljPPjLF39UxVsOuVGJvvyNPmLDB5BJJRj71kQhrfo0I090+sTGf9h77hYXnPFan
 IINQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729288160; x=1729892960;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2irfqM3Mz+ZCMqnLHdPvZOQQDp0yyhpcI0682bVeu5Q=;
 b=hziYka4/CjnVp9U56+TuDYX5AYHVfJot2bnYXpvExEE0jQ9GjyDtSK4mSJAPoN14xl
 mXXlemfiQRtn5oaDp2sYmNGaxww7oPpYBSrGj6x/ojcYW8Pjp+qR3tjDctRtS08JMTsA
 IYeWH0Uw/LqYAffB3XK5YPSEGz5VnKaYPZtcExvNkkBssbm8gOl7nn+vrtt2rsLtGpfa
 ByGXIbM2O/NiAJL7s8xp25stwQza7wFQV6+nZTZTODt+RgvryutKDf4QFsrt5ers6y3a
 Ae0wY7GC3pBZuJSlg0FWyKn3vDPRVuPbe8rC2hVxyCvss4PoZqwM9M4B7YrGPt2Virwx
 huGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGkFY2zFpKhJv72l+l5DQiXuMl9BxKxCZfrqifNxGhCNsMgT90Zb5aGBajc323tRDWtMZzG5XTaJA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyIsCQUb9oFLUxakHovtNYUYWvq1ekHQfCCU9w4bw2mepcp5luB
 ums1a3wJUIlDdFi2di3ncH6QL+Ki7M0+YrNJD30e7lzj0pPsPoDSfp/V5r0UjDw=
X-Google-Smtp-Source: AGHT+IEbiJcmWXouY2jzgYsz1mAYDcJJqc+sw2cz5Y/7CShkoDoNITpXxcWA9aiNYwpu42eBhOkvxQ==
X-Received: by 2002:a05:6512:10c9:b0:539:fc86:ce21 with SMTP id
 2adb3069b0e04-53a154d8042mr2351360e87.56.1729288159777; 
 Fri, 18 Oct 2024 14:49:19 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a151f0ce5sm332088e87.181.2024.10.18.14.49.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 14:49:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/6] drm/bridge: add ycbcr_420_allowed support
Date: Sat, 19 Oct 2024 00:49:11 +0300
Message-Id: <20241019-bridge-yuv420-v1-0-d74efac9e4e6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANfXEmcC/x2MSwqAIBQAryJvnaCi9LlKtNB81dtYKEkh3j1pO
 QMzBRJGwgQTKxAxU6IzNJAdg/WwYUdOvjEoobQUcuAukm/2vbNWglvrRu216Y1HaM0VcaPn/81
 LrR/2t2sqXwAAAA==
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1747;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=N+kyiXcXGEQOjxyQVLv1O81JcpLhZLN4HcL9iV6FSeM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnEtfdCBDgl7FQjfXSf2tJ9+FrltUIZ2yvXc2UL
 nd4Mv5dt4KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZxLX3QAKCRCLPIo+Aiko
 1UoDB/9tf8rz41U8BqlfA2hhJZm+2syJYLEaVjFa1Q68ReF4WqMafeD1JFGZYEiZdh0oaUaiDfP
 hhq+PMs9h5dHSTS+TSGF3ZeOnxmgNKHqbDq4CPnPTvUFUNOu+2007NZuyiFoaUr7nNzLb6PFomT
 RdqDXDXXDHk0bim3SeSAg6EgK3aLzF3NSboFpb6qf/m6pO9109gTI5wDoYFGrH4I2jLo9b3LssZ
 v4OQU8lZDJMOfqHar2+H/ccgaTwC5zubTeJutpjk28IQyCs3DcQUMiwWBIigjVtXufF/0Q77KAL
 d7eFTwj5PUVZBXzIkOTMvfaRBjDkmalVhXaNrx4Qev2kHNye
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

One of the features that drm_bridge_connector can't handle currently is
setting of the ycbcr_420_allowed flag on the connector. Add the flag to
the drm_bridge struct and propagate it to the drm_connector as AND of
all flags in the bridge chain.

As an example of the conversion, enable the flag on the DW HDMI bridge,
MSM DP bridge, display connector drivers (for DisplayPort and HDMI
outputs) and AUX bridges.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (6):
      drm/display: bridge_connector: handle ycbcr_420_allowed
      drm/atomic: add interlaced and ycbcr_420 flags to connector's state dump
      drm/bridge: display-connector: allow YCbCr 420 for HDMI and DP
      drm/bridge: aux: allow interlaced and YCbCr 420 output
      drm/msm/dp: migrate the ycbcr_420_allowed to drm_bridge
      drm/bridge: dw-hdmi: set bridge's ycbcr_420_allowed flag

 drivers/gpu/drm/bridge/aux-bridge.c            |  4 ++++
 drivers/gpu/drm/bridge/aux-hpd-bridge.c        |  4 ++++
 drivers/gpu/drm/bridge/display-connector.c     |  4 ++++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c      |  3 +++
 drivers/gpu/drm/display/drm_bridge_connector.c |  6 ++++--
 drivers/gpu/drm/drm_atomic.c                   |  2 ++
 drivers/gpu/drm/msm/dp/dp_display.c            |  4 ++--
 drivers/gpu/drm/msm/dp/dp_drm.c                | 10 ++++------
 drivers/gpu/drm/msm/dp/dp_drm.h                |  7 ++++---
 include/drm/drm_bridge.h                       |  5 +++++
 10 files changed, 36 insertions(+), 13 deletions(-)
---
base-commit: 7f796de9da37b78e05edde94ebc7e3f9ee53b3b4
change-id: 20241018-bridge-yuv420-aab94d4575de

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

