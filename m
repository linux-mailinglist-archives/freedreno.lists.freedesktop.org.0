Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3A796412E
	for <lists+freedreno@lfdr.de>; Thu, 29 Aug 2024 12:19:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7345410E29B;
	Thu, 29 Aug 2024 10:19:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="j5tZGvti";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDBED10E29B
 for <freedreno@lists.freedesktop.org>; Thu, 29 Aug 2024 10:19:06 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-715e3e03831so455783b3a.2
 for <freedreno@lists.freedesktop.org>; Thu, 29 Aug 2024 03:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724926746; x=1725531546; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7iLI7cij8am378pXVWz99+34Fx5KxP/VDjPfueOIZ8k=;
 b=j5tZGvtil1oUmYZLlYiY7DepE10Ff6nRi+6YCFfcFbdLw7jlBwwCzk/Ah+kZpGNwIL
 IpldfJAUD4v+HazSid0vsQPEi+oifHazori4c59jUhoIRk9D3G1cgGPsDd/LCrpY3RLP
 vTpiL4W9/deanusDgDGpK1qXv8eIWg0uvIwNM/ypcL1k0SKFwWjzMIBNy/3d+Rkf+jt5
 NxzkgSsrpqPs8QzJv4NpC1VBvBtoppB78wu5rBmhilIxgj2OSupkmZWHYRTL5s3ikBE0
 rAa7s3AaBrm43P0VpHG3hvl+Qyqz5vv8CKxA7oL28It8uvNJBAAWF4CvnuL7mKh2g1ga
 AwzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724926746; x=1725531546;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7iLI7cij8am378pXVWz99+34Fx5KxP/VDjPfueOIZ8k=;
 b=lfTJ75DGFA7s6o93ho+W7PivukDQUMiqI/pgN95yCts0BSWwO+dUX9k2z1v2rgavKn
 /BAgK+r5B5hF3DCa5xgSkvLCU+VrJdVFcjmMRwHuWiUKIlP82+tw4JyiV4mnR4eGyUis
 849Crg6m0wIJtVIihoubQcCwvpO/pC0SV58in4mEWngGk0Yy5fQVjEn8O1Ja52Ih3/1o
 mh45YD7NLYoOYRQTQ/+N/GvzL6H0pZDswJPAZrJOKvTyyTgLjau5Vohopl8tBiKMaRoQ
 jXmAsszoG40/Vw7xfLzDU3j9Qq1s2py3JTyjaL78YwoRZsFY7zMGgSZTNEq7Q3o8ee6x
 QkBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwmc6L//BmcIUmiMmSS4pHVBPdMwu0DJwjCNdMiM8KMQReuP1mn2rPTf8cI7tWA8FlySJ6E+OpqF0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxwmwtMKELGIU9siJDB79LCDB+TJMAgnHMlp+TfdrpEWfdcx+0G
 3awuJmbu+DI1rks9nNfPsbPruVB6SzRR7U4coZ6Rmst7SncyS8l4WmC2/D1KtEc=
X-Google-Smtp-Source: AGHT+IHE4Do/N3GkCtLaAyB3B6mwF3f2W+Yg9mp1g0ej7usEm9UI8mQxD+BXOiKkv6+kMYM4hnVftw==
X-Received: by 2002:a05:6a20:e196:b0:1c3:ff33:277e with SMTP id
 adf61e73a8af0-1cce1016e8emr2628682637.32.1724926746319; 
 Thu, 29 Aug 2024 03:19:06 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.167]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7d22e9d4df4sm891684a12.82.2024.08.29.03.18.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 03:19:05 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH 00/21] drm/msm: Support quad pipe with dual-DSI
Date: Thu, 29 Aug 2024 18:17:29 +0800
Message-Id: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALlK0GYC/x3NQQ6CMBBG4auQWfsnbZVavYpxAcwgXRRqR4gJ4
 e42Lr/NezuplChK92anIlvUuMwV9tTQMHXzSxC5mpxxFxPcDZqCbw02D2sxJUZehhGJVfFeO8a
 a9VOkSwhgx74/S2+5vVIN5iJj/P5nj+dx/ACmY+0hfAAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Jonathan Marek <jonathan@marek.ca>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724926736; l=2929;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=Iuc0O1yLGF/gyUtcBEXqUDSMK4I5nIldsvZ6bLqKzZQ=;
 b=/XAz7k9LePyEc9Awj75B8UirKvpOKm55t65AeMenHcISQ/oiIJItRucdOO9puyB2zmAPw9AGJ
 hz6VuF0WZetBqwEXHRoMioS3dxbrjgu9ikDjdhx3xAFdSAWcWcnFNfc
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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

2 SSPP and dual-DSI interface are need for super wide DSI panel.
This patch set make changes to DSI driver and extend pipes
and related mixer blending logic to support quad pipe.

This patch set is based on virtual plane patch set:
https://patchwork.freedesktop.org/series/131109/

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
Jonathan Marek (3):
      drm/msm/dsi: add support to DSI CTRL v2.8.0
      drm/msm/dsi: fix DSC width for the bonded DSI case
      drm/msm/dsi: support DSC configurations with slice_per_pkt > 1

Jun Nie (18):
      drm/msm/dsi: pass the right width to dsc
      drm/msm/dpu: polish log for resource allocation
      drm/msm/dpu: Add utility to get mixer number
      drm/msm/dpu: Support dynamic DSC number
      drm/msm/dpu: decide right side per last bit
      drm/msm/dpu: request more mixer for 4K+ DSC case
      drm/msm/dpu: fix lm number counter for quad-pipe
      drm/msm/dpu: Support 4 mixers at most
      drm/msm/dpu: switch RM to use crtc_id rather than enc_id for allocation
      drm/msm/dpu: Support quad pipe in header files
      drm/msm/dpu: Support quad-pipe in SSPP checking
      drm/msm/dpu: support plane splitting in quad-pipe case
      drm/msm/dpu: support SSPP assignment for quad-pipe case
      drm/msm/dpu: setup pipes with 2 set of stage config
      drm/msm/dpu: blend pipes by left and right
      drm/msm/dpu: bind correct pingpong for quad pipe
      drm/msm/dpu: support quad pipe in general operations
      drm/msm/dpu: revise debug info to support quad pipe

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         | 119 ++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  11 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      |  73 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c       |  19 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h       |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h      |  11 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h          |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c        | 385 ++++++++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h        |  30 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c           | 209 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h           |  19 +-
 drivers/gpu/drm/msm/dsi/dsi.h                    |   3 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c               |  54 ++--
 drivers/gpu/drm/msm/dsi/dsi_manager.c            |   2 +-
 include/drm/drm_mipi_dsi.h                       |   2 +
 18 files changed, 566 insertions(+), 393 deletions(-)
---
base-commit: 9651fbfb684e7a1288dbae3bf1f15cd484c0217a
change-id: 20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-d2d6b3eb1d57

Best regards,
-- 
Jun Nie <jun.nie@linaro.org>

