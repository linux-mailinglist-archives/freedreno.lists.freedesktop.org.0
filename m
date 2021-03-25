Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDEE349B37
	for <lists+freedreno@lfdr.de>; Thu, 25 Mar 2021 21:49:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F3EE89E08;
	Thu, 25 Mar 2021 20:49:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 015AE89E08
 for <freedreno@lists.freedesktop.org>; Thu, 25 Mar 2021 20:49:23 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id o16so3685781wrn.0
 for <freedreno@lists.freedesktop.org>; Thu, 25 Mar 2021 13:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=VwYVwBu9Zmvg36BeUPTeaGddjln1nZxLz9LCUgNWe7M=;
 b=FasUerrM1Wt0gJ4o9m6rFixDtNDYZC/5gKERWn/1xjcDYro48HD7IIIHH3h1B1p2/R
 uwy7vqxRPh2saZV4pPFxVdAoWEtl/7Ci59aYjih/dH81eSgAOmnjZUp5EO/mtvBwSYN3
 SnL59FlFtZU11BqNAn1mt9u2FCWL/VP3V8zlV+sgQ7d0XF0MrEu4ns6ONk2ECp/rl/9E
 ovFldTXM0P92aOmMQvZu/IK+i2rQ/X20aY/UwKCEk6H8NJHyt49lvyydKl9lfPgNh8CJ
 QGQxzb6BiPJa7phza6+6RqQceDBLowoB6MuKWBuMF+HpeUNXsBOwF7FpKMVeeTsjpETM
 C2mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=VwYVwBu9Zmvg36BeUPTeaGddjln1nZxLz9LCUgNWe7M=;
 b=Fwz1eE9WuVVzcGmM+7Qb8p13A/kW2/jM+0PnZCply05UqR7XP3mOX34UNLnpW1FbSF
 UkE0vJCSBONIh5KWTFiTOsoonUEFwTTMh3W15+vHpyU1SceIIp//wLsniqPHQPGda4wS
 K0lCWD5CJUDp1y2JbN6EbD5cKoZDVM/oKs8RcktNT+zi7BmQQ+YVF8jd045JJArNFb5y
 09bY4uRHgkIWqXUpAIHcwTPtiMhmSAmwPU3EU3trQmJrRcAyhdrneo5+OPoS6PvwLsTF
 p7iYrCHOiBl66PC5ySxRc8aisdGVDOy83QEI9Nu4482p8WK+0r7N4J+XMgCWeEYLyyJA
 Sc2g==
X-Gm-Message-State: AOAM532cNvCaQ3Ho+rwIWJmbrkQq4DNWrZ2qRw8tZdP9wY8XdRvF7VjY
 kbuLJsOF+0kWYWBsy7lVciifO71z57Rr0tzlMxI=
X-Google-Smtp-Source: ABdhPJxqwuu6U9HyyF7877yc5qzqGUa/DxzfcXDzHCMibsHodC1dZp0+0Y4D9ekferfakhDkEyrGdKx0xDftmyezvLk=
X-Received: by 2002:adf:d0c3:: with SMTP id z3mr10984429wrh.28.1616705362347; 
 Thu, 25 Mar 2021 13:49:22 -0700 (PDT)
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 25 Mar 2021 13:52:36 -0700
Message-ID: <CAF6AEGtGMcZzvA79FmQ-nPM8Cb+Lhi2OQpzsTicKBvQtoPrhpg@mail.gmail.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [Freedreno] [pull] drm/msm: drm-msm-next-2021-02-07 for v5.12-rc5
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
Cc: Sean Paul <sean@poorly.run>, freedreno <freedreno@lists.freedesktop.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, jordan@cosmicpenguin.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi Dave & Daniel,

A few fixes for v5.12

The following changes since commit 182b4a2d251305201b6f9cae29067f7112f05835:

  drm/msm/dp: Add a missing semi-colon (2021-02-07 09:57:04 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-next-2021-02-07

for you to fetch changes up to 627dc55c273dab308303a5217bd3e767d7083ddb:

  drm/msm/disp/dpu1: icc path needs to be set before dpu runtime
resume (2021-03-22 18:52:34 -0700)

----------------------------------------------------------------
Dmitry Baryshkov (4):
      drm/msm/dsi: fix check-before-set in the 7nm dsi_pll code
      drm/msm/dsi_pll_7nm: Solve TODO for multiplier frac_bits assignment
      drm/msm/dsi_pll_7nm: Fix variable usage for pll_lockdet_rate
      drm/msm: fix shutdown hook in case GPU components failed to bind

Douglas Anderson (1):
      drm/msm: Fix speed-bin support not to access outside valid memory

Fabio Estevam (1):
      drm/msm: Fix suspend/resume on i.MX5

Jonathan Marek (1):
      drm/msm: fix a6xx_gmu_clear_oob

Jordan Crouse (1):
      drm/msm: a6xx: Make sure the SQE microcode is safe

Kalyan Thota (1):
      drm/msm/disp/dpu1: icc path needs to be set before dpu runtime resume

Konrad Dybcio (1):
      drm/msm/adreno: a5xx_power: Don't apply A540 lm_setup to other GPUs

Rob Clark (1):
      drm/msm: Ratelimit invalid-fence message

Stephen Boyd (2):
      drm/msm/kms: Use nested locking for crtc lock instead of custom classes
      drm/msm/dp: Restore aux retry tuning logic

 drivers/gpu/drm/msm/adreno/a5xx_power.c   |   2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c     |   2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 108 ++++++++++++++++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c   |  12 ++--
 drivers/gpu/drm/msm/dp/dp_aux.c           |   7 ++
 drivers/gpu/drm/msm/dsi/pll/dsi_pll.c     |   2 +-
 drivers/gpu/drm/msm/dsi/pll/dsi_pll.h     |   6 +-
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c |  11 +--
 drivers/gpu/drm/msm/msm_atomic.c          |   7 +-
 drivers/gpu/drm/msm/msm_drv.c             |  12 ++++
 drivers/gpu/drm/msm/msm_fence.c           |   2 +-
 drivers/gpu/drm/msm/msm_kms.h             |   8 +--
 12 files changed, 119 insertions(+), 60 deletions(-)
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
