Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8056F2AD5
	for <lists+freedreno@lfdr.de>; Sun, 30 Apr 2023 22:57:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85F9710E14E;
	Sun, 30 Apr 2023 20:57:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DC2310E0EA
 for <freedreno@lists.freedesktop.org>; Sun, 30 Apr 2023 20:57:18 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2a8a600bd05so18296721fa.2
 for <freedreno@lists.freedesktop.org>; Sun, 30 Apr 2023 13:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682888236; x=1685480236;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qzpwoQn9RRhc4ryS2NC6b56j2Iecp0jHxmUMlgSgFwA=;
 b=tmJvfV3l7dLIcrzcvOCwqbRAd/1DmJK45ZyM8CoPzvWDCEluh9vRk0jXKbrlnhsyBp
 sAUTDzaBSwKfzOzyCnBWEc1bHTKWhR9DRY7BCIUuOBvU0kdj8ofMMZOElGJ5+D/RPmmZ
 OJIrcpA8B1mOYlK+CZZ21E4l8Y8uJ+eMHv7Jkgpp+TvXvi/OXUUAcC62WYo3w8BnKuhu
 jS5W9n5guYp0xrt6nbQRyLYAqHxDcNG3iM/TJ6A8BY4JzVZ4K++U6u6ETybQ07canEYk
 KUazZKUSEuOFepTVPwpBHmzwiV4Dt1ww4EPgZam0TTgl4vwmAFs3gy46RavTrD7LaZ7N
 QECg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682888236; x=1685480236;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qzpwoQn9RRhc4ryS2NC6b56j2Iecp0jHxmUMlgSgFwA=;
 b=UH4nhzKjzdU6xV4fAbAZaJSV4kQnymVfpBaYUTwh3ARo9jd0Ke7msgrEnO5PicpvlQ
 8xWpM3fSGkK+gr+nNS4BsFpeeKWYD/zzRiY8M5F+GY7Hh6/doaZ/1PqBU9aqJaMJWccR
 ZwGW/+GZhPW7BWLxfoxrJcCioxH9+K/mgrAEOOSk7qR9ujKohPsQRzIRH/wxnOHAlDjN
 GL3Tjd+fP+xuu24Noy9tMFaw9gkRpchpKkrrg72k58nJlJSHGicFc2hpLAEJ3QMnlQqS
 k/ZVlrxx+qmNedY7KknzR9XlRahZiWUOcKMJjEs6Qa14PKx12Z6DBXIGc6ezjVz2iBm3
 8v5g==
X-Gm-Message-State: AC+VfDxQTi7tcB1JgA1hRVfpUpX/163F9eiYeEDXNeJzaxfzZ7zeUMF7
 VwAKNBuXNC40wq1A9/E20Boruw==
X-Google-Smtp-Source: ACHHUZ5lMTDhIB12DUnJLuvfLBYrRmUr3MoxP9RD1x2BMti7y3EQPxInzW2YBoGmYozEV3n2t1qHdg==
X-Received: by 2002:a19:ac4b:0:b0:4ed:c640:a20d with SMTP id
 r11-20020a19ac4b000000b004edc640a20dmr2909756lfc.49.1682888236272; 
 Sun, 30 Apr 2023 13:57:16 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 x6-20020ac259c6000000b004db1a7e6decsm4332749lfn.205.2023.04.30.13.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Apr 2023 13:57:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sun, 30 Apr 2023 23:57:07 +0300
Message-Id: <20230430205710.3188230-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230430205710.3188230-1-dmitry.baryshkov@linaro.org>
References: <20230430205710.3188230-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 6/9] drm/msm/dpu: simplify qos_ctrl handling
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

After removal of DPU_PLANE_QOS_VBLANK_CTRL, several fields of struct
dpu_hw_pipe_qos_cfg are fixed to false/0. Drop them from the structure
(and drop the corresponding code from the functions).

The DPU_PLANE_QOS_VBLANK_AMORTIZE flag is also removed, since it is now
a NOP.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 10 ----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  6 ------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 17 ++---------------
 3 files changed, 2 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index b198def5534b..341e3a8fc927 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -575,16 +575,6 @@ static void dpu_hw_sspp_setup_qos_ctrl(struct dpu_hw_sspp *ctx,
 	if (!ctx)
 		return;
 
-	if (cfg->vblank_en) {
-		qos_ctrl |= ((cfg->creq_vblank &
-				SSPP_QOS_CTRL_CREQ_VBLANK_MASK) <<
-				SSPP_QOS_CTRL_CREQ_VBLANK_OFF);
-		qos_ctrl |= ((cfg->danger_vblank &
-				SSPP_QOS_CTRL_DANGER_VBLANK_MASK) <<
-				SSPP_QOS_CTRL_DANGER_VBLANK_OFF);
-		qos_ctrl |= SSPP_QOS_CTRL_VBLANK_EN;
-	}
-
 	if (cfg->danger_safe_en)
 		qos_ctrl |= SSPP_QOS_CTRL_DANGER_SAFE_EN;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 86bf4b2cda77..aaf6f41d546c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -165,15 +165,9 @@ struct dpu_sw_pipe_cfg {
 
 /**
  * struct dpu_hw_pipe_qos_cfg : Source pipe QoS configuration
- * @creq_vblank: creq value generated to vbif during vertical blanking
- * @danger_vblank: danger value generated during vertical blanking
- * @vblank_en: enable creq_vblank and danger_vblank during vblank
  * @danger_safe_en: enable danger safe generation
  */
 struct dpu_hw_pipe_qos_cfg {
-	u32 creq_vblank;
-	u32 danger_vblank;
-	bool vblank_en;
 	bool danger_safe_en;
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index d7ee4bdc752f..f7656436f3f1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -73,12 +73,9 @@ static const uint32_t qcom_compressed_supported_formats[] = {
 /**
  * enum dpu_plane_qos - Different qos configurations for each pipe
  *
- * @DPU_PLANE_QOS_VBLANK_AMORTIZE: Enables Amortization within pipe.
- *	this configuration is mutually exclusive from VBLANK_CTRL.
  * @DPU_PLANE_QOS_PANIC_CTRL: Setup panic for the pipe.
  */
 enum dpu_plane_qos {
-	DPU_PLANE_QOS_VBLANK_AMORTIZE = BIT(1),
 	DPU_PLANE_QOS_PANIC_CTRL = BIT(2),
 };
 
@@ -359,25 +356,15 @@ static void _dpu_plane_set_qos_ctrl(struct drm_plane *plane,
 
 	memset(&pipe_qos_cfg, 0, sizeof(pipe_qos_cfg));
 
-	if (flags & DPU_PLANE_QOS_VBLANK_AMORTIZE) {
-		pipe_qos_cfg.vblank_en = false;
-		pipe_qos_cfg.creq_vblank = 0; /* clear vblank bits */
-	}
-
 	if (flags & DPU_PLANE_QOS_PANIC_CTRL)
 		pipe_qos_cfg.danger_safe_en = enable;
 
-	if (!pdpu->is_rt_pipe) {
-		pipe_qos_cfg.vblank_en = false;
+	if (!pdpu->is_rt_pipe)
 		pipe_qos_cfg.danger_safe_en = false;
-	}
 
-	DPU_DEBUG_PLANE(pdpu, "pnum:%d ds:%d vb:%d pri[0x%x, 0x%x] is_rt:%d\n",
+	DPU_DEBUG_PLANE(pdpu, "pnum:%d ds:%d is_rt:%d\n",
 		pdpu->pipe - SSPP_VIG0,
 		pipe_qos_cfg.danger_safe_en,
-		pipe_qos_cfg.vblank_en,
-		pipe_qos_cfg.creq_vblank,
-		pipe_qos_cfg.danger_vblank,
 		pdpu->is_rt_pipe);
 
 	pipe->sspp->ops.setup_qos_ctrl(pipe->sspp,
-- 
2.39.2

