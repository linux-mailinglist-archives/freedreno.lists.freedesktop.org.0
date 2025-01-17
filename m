Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19162A15377
	for <lists+freedreno@lfdr.de>; Fri, 17 Jan 2025 17:02:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB1CF10EB29;
	Fri, 17 Jan 2025 16:02:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Pe9xBcfq";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B001310EB29
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jan 2025 16:02:06 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-2165cb60719so43619105ad.0
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jan 2025 08:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737129666; x=1737734466; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PPKBiO+R3EgZx77A0TPWnAvVcvrAKMzeINEZaeXVJnE=;
 b=Pe9xBcfqf34mm6CE6lHKFGNqqoTy5t19WZ0z1m2PQ+1eJIYnBwIKPrInuwWnyUA0VD
 15RV7U8PPuu4h+ApJID1/V35byb5sW7YQs6uz0aBPFvoBH0C9AJY6yuBiXfZoT+Ydhe4
 BZmtwtaTFGYxtjgvAzTVSZ/PMY1OjVteJ9sa0lO8N/8xAJyUaae8ydbUBo0Fos2cysl1
 LM6bu2z9egr1iZLgH9omyBR96Vp7vjIwGyiz2E4LxZELb3opQZIuYMNBjuDMTjflF3di
 yNSYERRKLZjMW0p6+bQS/XggH5+ONoSh1dJhC4bX/d3tBRuXzBOjDMe30e8hXBd6sxMJ
 PoWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737129666; x=1737734466;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PPKBiO+R3EgZx77A0TPWnAvVcvrAKMzeINEZaeXVJnE=;
 b=S5Likjj40kBO6OquR0XSKPLe+bAFqRwdHPcp+tAmabI84rpU1a6O3SLrZ/Es8anpg6
 uCC2OyjEuUUGUzSxNuvlGXRtFzqfM5DtBLa83T2rhQ4MjRLIo2IP5bouGgN97MEkJJOt
 QDVJsudRUb3bwznkMxs0C7huSq8Wdqdh0hVRbjKz4j64bTmh0EcEJARNwvI1Vm4p/muD
 w/zXvkzEmm/0S7yUMZQGhf/ycklPF+BvKmHU3hcxVmT/RiSAkErL6O54arrGYfN1fnb8
 cncJ8RRVM6PDbu5MZ1Sl3By7boJH1DAL/ziCfVjgDMlXx5QyP6tK8/DFhH2AOeOURPtM
 HhjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXI8YOEIxMYukPeMrvjR9NJeUw93QXx0v9skvQV2dbPIIoypfcmirTJwD3mJmvtm6tBPaLNzRVHb0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1eH7a+4jpTxvAnzQVPdzhnZTJ2Flkzt7/3MtIs/AST3VYecbk
 FHDa1eZLUKkslJSB4+VZ+z1pkSimQqL2V/m0pAFaXKJFddSmClSn8Y8/wWZ4rec=
X-Gm-Gg: ASbGnctya/jEj/BHDYe3/w0pExMuQMHGOAIXf8oRAaoT1C2jrKaQ0V1Ghn3Z4b7Nvmi
 HK22Kk8PDJdpHLtGIUQWm1/CDwrdGZr/N3B5swA/0yARM8/8SjGP2cljZ3bsX3RtSOdafx7FFd3
 SRf7FlvELwgeWgn2Usw/5uGe0XuCIR2Lw49MaA1FO+u2SgYmMMmXzBFyPajU4qmzfah802UU1fr
 8rERcLQRziCyxw8DzxJ2SCcfx3BEtEr1cfsyesIQLFaedj+iDVGig==
X-Google-Smtp-Source: AGHT+IFCeX5eddePBHDI+lbpSYeds/KFM0/bcoTWVb9canYO3oKiBovN+3CGC03Ilb7/N7Iwi6Be2g==
X-Received: by 2002:a17:902:ea02:b0:215:19ae:77bf with SMTP id
 d9443c01a7336-21c355028e9mr53570145ad.19.1737129666083; 
 Fri, 17 Jan 2025 08:01:06 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21c2d3e0df9sm17879755ad.196.2025.01.17.08.00.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2025 08:01:05 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH v5 00/15] drm/msm/dpu: Support quad pipe with dual-DSI
Date: Sat, 18 Jan 2025 00:00:43 +0800
Message-Id: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-0-9701a16340da@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKt+imcC/53NSw6CMBSF4a2Qjr2mLwo4ch+GQW0v0GgptkA0h
 L1bWYLD/wzOt5GE0WEil2IjEVeXXBhzlKeCmEGPPYKzuQmnvKSMKUi+ViWFVQETMHgLFs1DRwv
 epgSvRVtYpjRH1B6EgE43lkvLK1Mzkk+niJ17H+CtzT24NIf4OfxV/ta/qVUChUpWsjEK71qI6
 9ONOoZziD1p933/AndkG9LtAAAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737129659; l=4678;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=g4wHki1acUZ4SGxtT81osJ+lxPcuS+NzxwZWfXfKlgI=;
 b=CDs/fiB1Bs+rHnEJlPaGI1fKDaA9SzbRS4cYP5EftnVMDeA5XA2eTwmk/z5R9xQUw2/jodlEP
 bYJpeUXDWuCAxS32iWtY3cgDvQCowwve9gPXYkCcfJLYLbd1MU56fyH
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

2 or more SSPPs and dual-DSI interface are need for super wide panel.
And 4 DSC are preferred for power optimal in this case due to width
limitation of SSPP and MDP clock rate constrain. This patch set
extends number of pipes to 4 and revise related mixer blending logic
to support quad pipe. All these changes depends on the virtual plane
feature to split a super wide drm plane horizontally into 2 or more sub
clip. Thus DMA of multiple SSPPs can share the effort of fetching the
whole drm plane.

The first pipe pair co-work with the first mixer pair to cover the left
half of screen and 2nd pair of pipes and mixers are for the right half
of screen. If a plane is only for the right half of screen, only one
or two of pipes in the 2nd pipe pair are valid, and no SSPP or mixer is
assinged for invalid pipe.

For those panel that does not require quad-pipe, only 1 or 2 pipes in
the 1st pipe pair will be used. There is no concept of right half of
screen.

For legacy non virtual plane mode, the first 1 or 2 pipes are used for
the single SSPP and its multi-rect mode.

To test bonded DSI on SM8650, the 5 patches for active-CTL improvement
are needed:
https://gitlab.freedesktop.org/lumag/msm/-/commits/dpu-4k?ref_type=heads

Changes in v5:
- Iterate SSPP flushing within the required mixer pair, instead of all
  active mixers or specific mixer.
- Limit qaud-pipe usage case to SoC with 4 or more DSC engines and 2
  interfaces case.
- Polish commit messages and code comments.
- Link to v4: https://lore.kernel.org/r/20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org

Changes in v4:
- Restrict SSPP flushing to the required mixer, instead of all active mixers.
- Polish commit messages and code comments.
- Rebase to latest msm/drm-next branch.
- Move pipe checking patch to the top of patch set.
- Link to v3: https://lore.kernel.org/dri-devel/20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org

Changes in v3:
- Split change in trace into a separate patch.
- Rebase to latest msm-next branch.
- Reorder patch sequence to make sure valid flag is set in earlier patch
- Rectify rewrite patch to move logic change into other patch
- Polish commit messages and code comments.
- Link to v2: https://lore.kernel.org/dri-devel/20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org

Changes in v2:
- Revise the patch sequence with changing to 2 pipes topology first. Then
  prepare for quad-pipe setup, then enable quad-pipe at last.
- Split DSI patches into other patch set.
- Link to v1: https://lore.kernel.org/all/20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
Jun Nie (15):
      drm/msm/dpu: check every pipe per capability
      drm/msm/dpu: Do not fix number of DSC
      drm/msm/dpu: configure DSC per number in use
      drm/msm/dpu: polish log for resource allocation
      drm/msm/dpu: decide right side per last bit
      drm/msm/dpu: fix mixer number counter on allocation
      drm/msm/dpu: switch RM to use crtc_id rather than enc_id for allocation
      drm/msm/dpu: bind correct pingpong for quad pipe
      drm/msm/dpu: Add pipe as trace argument
      drm/msm/dpu: handle pipes as array
      drm/msm/dpu: split PIPES_PER_STAGE definition per plane and mixer
      drm/msm/dpu: blend pipes per mixer pairs config
      drm/msm/dpu: support SSPP assignment for quad-pipe case
      drm/msm/dpu: support plane splitting in quad-pipe case
      drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI case

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         |  88 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      |  75 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h          |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c        | 404 ++++++++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h        |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c           | 215 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h           |  32 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h        |  10 +-
 12 files changed, 517 insertions(+), 345 deletions(-)
---
base-commit: 793ba0dd2dc6a38180a82d0ad0c58920bcf595b5
change-id: 20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-fa9d24d27c81

Best regards,
-- 
Jun Nie <jun.nie@linaro.org>

