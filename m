Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE96AFAB9A
	for <lists+freedreno@lfdr.de>; Mon,  7 Jul 2025 08:18:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C965B10E40E;
	Mon,  7 Jul 2025 06:18:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="d7IjAhE5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 949B810E40E
 for <freedreno@lists.freedesktop.org>; Mon,  7 Jul 2025 06:18:34 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-7424ccbef4eso2133663b3a.2
 for <freedreno@lists.freedesktop.org>; Sun, 06 Jul 2025 23:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751869114; x=1752473914; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gZKppSrZ04BhPYsPEMDVl7eb2YZ+sFy//28ARL2GCmc=;
 b=d7IjAhE5pHwHedtIr5lgq+FcXzXQpjzIp8BU1WPc5pLRlYIu9FSFMmhySZiXkvrZOK
 5I/zry59EhmF31vg1WVg/NXa7RquBdsNMTTi64XH4LegakJtx2eOy6E+RvAhdfI8bv7w
 UDJIJ1UxH7qljF5UlcR7sZAMdFUkd14RLVZ0RysqAQqkp/zF0TmLWc0+hmv6547H0KbJ
 bjI3nINakX4Kji2kMtl3i+CSHfh29r72JXGyvwoAMp0YIyXOcFwGvihMx/ebJbCcW9yW
 siVCGNBC2T36HehtALn8cvJdynHZ85weappTLJUw6GWHhq5KMm5ozlJsxWkVawKzD5qR
 Fdlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751869114; x=1752473914;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gZKppSrZ04BhPYsPEMDVl7eb2YZ+sFy//28ARL2GCmc=;
 b=jhRxGpRxgrFWSK8myB2gyuNYO+lucwA8mZd2LRutWp+q14lKlm6aWd7wKylVPqwRoR
 tAZF0zD+81JYMKfIHzv52Tay6IG0EkgSv+QrXgAB7/UQgebjkB9JVwE2yeyqNnP0AqAj
 uAOA2xaIheIYjnorgEd9s6f3YxEz68YilCJ/f2G2ruwoRTumMWB5t0WzxBKWruL+97mM
 J6ZD2lQ325L6SAeA1Uwd3clHuWVY+1bqmzTCvMMTVIO963NhKnl1rk5cRvXMndlU5IKn
 eVP8pGE3qetN5OK5hhHIEv4iov1Bxn3BI/9UdEx4XVWwR7wxmYaBXg1OrEmzIxNeBT9r
 pamA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnFmdeOsc3ZweUYvhMfaP88h8qXezqyME80HV8zVCmIZiblkEKc0h7jsI/OY2CbRO+sB83a1PO1bo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzPXDGaf0hqQs0Yki8sAIBTHyEOVqcZiEqyd9s37zotv6xzrJuz
 EynsCQOAXdOCmSOsKW9GsVoOopxORRGL1gQmfCbR9jMdYNPK7IuNf2wCBg2An6ncCM4=
X-Gm-Gg: ASbGncs+BjDzwhJoneSWHdt5RvqKLSQjdd5OqFDVvut81kdXCebbGNOfXqPbxS3kB5K
 daVE68oKkXW15O917GW3FWmBR0jQFW6yTWCeweTLQeAwPyI3FKzADZDrx6Mk7uB7gYaC1BjeG1s
 EV2DxQ/p7Ly0viSgKuYOgMQwdCbM4KDZfIdPYyS25Tvexv9cJzItbUZhHVgaXIbOlOXWN/hvlZg
 4O1ff27ioc2iw881sbxLCUyTx+348Ed6+G8nyuJacGKORJGgJeKPEkKh4/a5EXrkiqd7a/6KofZ
 o1N71ue8aie1T1cPiveFAfkx5GVSlpU/L7ygk2jD0B9PQHwGoT6kYK/N6TA=
X-Google-Smtp-Source: AGHT+IEhrv3fmXBC2zf/SakWM0z47cC7OpSvTf+Ugbc9/YCKMZxghEVPFjk+9Rao57znNMbR7C25Og==
X-Received: by 2002:a05:6300:2414:b0:220:82c7:309c with SMTP id
 adf61e73a8af0-22608fb3070mr13270461637.7.1751869114109; 
 Sun, 06 Jul 2025 23:18:34 -0700 (PDT)
Received: from [127.0.1.1] ([103.163.156.9]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b38ee450ccbsm8037327a12.3.2025.07.06.23.18.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Jul 2025 23:18:33 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 07 Jul 2025 14:17:59 +0800
Subject: [PATCH v12 04/12] drm/msm/dpu: bind correct pingpong for quad pipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-v6-16-rc2-quad-pipe-upstream-v12-4-67e3721e7d83@linaro.org>
References: <20250707-v6-16-rc2-quad-pipe-upstream-v12-0-67e3721e7d83@linaro.org>
In-Reply-To: <20250707-v6-16-rc2-quad-pipe-upstream-v12-0-67e3721e7d83@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751869084; l=1809;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=flbnou7XSx1ETCmAxdlZnvB3+bqdNxru9LUU48yIE7A=;
 b=8J0scBIavzi43Hc18EtLQ0upqpSsevKQ8nja/mECnzE4bufiDHQr1EC6aLVX4rEF26cw5m/f9
 1POTKLa7ev5BqipWab+rOy402M4esn20vuhkdBAEbl/rKZAxXTIcGSH
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

There are 2 interfaces and 4 pingpong in quad pipe. Map the 2nd
interface to 3rd PP instead of the 2nd PP.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index b476d3c97ac9b6b4c5ca2963aa4a5805d57c8d7e..2d88d9129ec787df6dac70e6f4488ab77c6aeeed 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1158,7 +1158,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_cwb[MAX_CHANNELS_PER_ENC];
-	int num_ctl, num_pp, num_dsc;
+	int num_ctl, num_pp, num_dsc, num_pp_per_intf;
 	int num_cwb = 0;
 	bool is_cwb_encoder;
 	unsigned int dsc_mask = 0;
@@ -1237,10 +1237,16 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 		dpu_enc->cur_master->hw_cdm = hw_cdm ? to_dpu_hw_cdm(hw_cdm) : NULL;
 	}
 
+	/*
+	 * There may be 4 PP and 2 INTF for quad pipe case, so INTF is not
+	 * mapped to PP 1:1. Let's calculate the stride with pipe/INTF
+	 */
+	num_pp_per_intf = num_pp / dpu_enc->num_phys_encs;
+
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
 
-		phys->hw_pp = dpu_enc->hw_pp[i];
+		phys->hw_pp = dpu_enc->hw_pp[num_pp_per_intf * i];
 		if (!phys->hw_pp) {
 			DPU_ERROR_ENC(dpu_enc,
 				"no pp block assigned at idx: %d\n", i);

-- 
2.34.1

