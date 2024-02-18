Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F391085947A
	for <lists+freedreno@lfdr.de>; Sun, 18 Feb 2024 05:12:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A4310E08A;
	Sun, 18 Feb 2024 04:12:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TQE14aV2";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD27110E048
 for <freedreno@lists.freedesktop.org>; Sun, 18 Feb 2024 04:12:08 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-511831801f3so3311238e87.2
 for <freedreno@lists.freedesktop.org>; Sat, 17 Feb 2024 20:12:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708229527; x=1708834327; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sdq9YGtFPuh68clN/bcMQ3lDJoxtvUngfBuWNMv8NJE=;
 b=TQE14aV2HDYOwokd4Rt9TXNQPxIcQbWS28G7vZ8R/bJOnHqRputPVSlbOgU8EfxdLg
 JNBOqf5h4R3PPIVpAkeXpNpHXREPkHMYXmGQWBdJinRO4NIbempEavK9xN0QwxOMt97d
 2NDPKz7RyXOPMUGxjQgsDipElWwCpvsAnMF7645HcaEabXKbmBc3V+cRzUepTTH0Axle
 6lbwocb2hH5d/DERFZ3JgZy3Z0+fr6iujJI/Wc0rNqkYOePTcxR2gsKjD/uvZKg59mfw
 pa/A4F+5perXmqd1uLBN6WkUp2lNZtLQTflMDjVEIseNAFqPu5rlewHlQuun77RIHY6N
 dYSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708229527; x=1708834327;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Sdq9YGtFPuh68clN/bcMQ3lDJoxtvUngfBuWNMv8NJE=;
 b=W8ws4u7+J4eyP8jnZw/Q1BDt13MBjJuES4R/MjkIKYlfj+VKeld9FAK1V9ZJPb33vH
 CjCY8KlBbQufHRB5fINSvyEU4rqv24PUnbS3uiiTC32ppVw62EjmYT0Q3QQolJF7KwlO
 RZHcv7OfJMU/6d6J1EtQ1sj53T0yLAe858V0C5CAyZHKuSNwYKUMD0lNQpO3OBQAR7Cf
 mjAOph7ad8nnUbsK99vIi2eU8ZXGDsq52ax9h1xmnJOnYw1hKilF8OX+lxazVyxi9cGy
 cTacfGAPaNrcvMPO+YrNjuXkIrHpzJ3CGP91UyEDS1dBUdAaSxp+TUahVUEQFIQwdqdU
 gxWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVGHJlQyHL+WR+AWwWAMhrOA58uBATH6MZGXYubV8XgSHEeJqdtbPJbh34vrge/bTOP/JsWMC/lVlCkJzOc3L+4CKb0wBXIGgmdmMY+uyK
X-Gm-Message-State: AOJu0YxPZxNkmhSnvVVm8MCDUR6z8rt4MUv9ZHcBqVUxJ6x67L46NHlR
 adLpsbMwVal9W6DBXwg3eWdhmMnI1xOg7jLRN6VGTdHG0NkTrkieH7KDMcpbTXC1dN3Kb+fuUEo
 f
X-Google-Smtp-Source: AGHT+IHWACc/nvXkq0IaBi9yO1yC2cB8MAQZ7sAlzDgSUDta5J5/mnwtHC6aNnUFZMaP7xvgm7RRoA==
X-Received: by 2002:a05:6512:214f:b0:512:b09d:3bc4 with SMTP id
 s15-20020a056512214f00b00512b09d3bc4mr118922lfr.3.1708229526935; 
 Sat, 17 Feb 2024 20:12:06 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 e20-20020ac25474000000b00511aad978dfsm436606lfn.121.2024.02.17.20.12.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Feb 2024 20:12:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Helen Koike <helen.koike@collabora.com>
Cc: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH 3/3] drm/ci: mark universal-plane-sanity as failing on SC7180
Date: Sun, 18 Feb 2024 06:12:04 +0200
Message-Id: <20240218041204.2522828-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240218041204.2522828-1-dmitry.baryshkov@linaro.org>
References: <20240218041204.2522828-1-dmitry.baryshkov@linaro.org>
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The test kms_universal_plane@universal-plane-sanity fails on both SC7180
platforms. The drm/msm returns -ERANGE as it can not handle passet
scaling range, however the test is not ready to handle that. Mark the
test as failing until it is fixed.

ERROR - Igt error: (kms_universal_plane:1554) CRITICAL: Test assertion failure function sanity_test_pipe, file ../tests/kms_universal_plane.c:438:
ERROR - Igt error: (kms_universal_plane:1554) CRITICAL: Failed assertion: drmModeSetPlane(data->drm_fd, primary->drm_plane->plane_id, output->config.crtc->crtc_id, test.oversized_fb.fb_id, 0, 0, 0, mode->hdisplay + 100, mode->vdisplay + 100, IGT_FIXED(0,0), IGT_FIXED(0,0), IGT_FIXED(mode->hdisplay,0), IGT_FIXED(mode->vdisplay,0)) == expect
ERROR - Igt error: (kms_universal_plane:1554) CRITICAL: Last errno: 34, Numerical result out of range

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt    | 1 +
 .../drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
index 7e4d8744fcc6..f0576aa629e8 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
@@ -15,3 +15,4 @@ kms_plane_alpha_blend@alpha-7efc,Fail
 kms_plane_alpha_blend@coverage-7efc,Fail
 kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
 kms_rmfb@close-fd,Fail
+kms_universal_plane@universal-plane-sanity,Fail
diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
index 7e4d8744fcc6..f0576aa629e8 100644
--- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
+++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
@@ -15,3 +15,4 @@ kms_plane_alpha_blend@alpha-7efc,Fail
 kms_plane_alpha_blend@coverage-7efc,Fail
 kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
 kms_rmfb@close-fd,Fail
+kms_universal_plane@universal-plane-sanity,Fail
-- 
2.39.2

