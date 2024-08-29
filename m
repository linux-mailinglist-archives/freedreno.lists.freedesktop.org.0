Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED595964140
	for <lists+freedreno@lfdr.de>; Thu, 29 Aug 2024 12:19:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB11010E58D;
	Thu, 29 Aug 2024 10:19:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OQY0fPBK";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC30310E5BE
 for <freedreno@lists.freedesktop.org>; Thu, 29 Aug 2024 10:19:50 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-7141285db14so438522b3a.1
 for <freedreno@lists.freedesktop.org>; Thu, 29 Aug 2024 03:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724926790; x=1725531590; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=5XVbg4H7DqUL1wC1sOrarS7KoxsQPZKXglpZrahZaTU=;
 b=OQY0fPBKxVq+Gd23BqPqqwHKWo0PBe5NOFR2PBzKkCntr29ctobilvBqr6P+gRjn+A
 coBXUFUuvZ087jQfXXjRNBsBGoyQN1CQF8yWETHAKTP7E597+hAW3018ks4Kl4a8d78G
 rf+cWzHb35cwsZFisrWk7apor9PKM2q5KDs61/WnnpNeyou9lZLnt6p5omsfrX3X3+vG
 IeNrYy1UVyA8MwdOq/PD8ZpfJPB1yUGQ90on0a3Y0lXe4/oNKqPLNoJl/g4azR+mseSw
 p8Mfffdm4EWuJuegmgpbBfIphU8FkDEo6LVNkBBHzWcfrto4Sphwtgg6ftp8ZrtqDHCO
 WmCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724926790; x=1725531590;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5XVbg4H7DqUL1wC1sOrarS7KoxsQPZKXglpZrahZaTU=;
 b=Nc1JoEFJU6yF5xoG3oGyYqtAb6c50weSDvHhegXwr6TNgrtTYMu39G0Ytg/XSbQlR7
 yNEKyqeUbyetmASlunvOEAiOCdiIpj1tE94Ts+9PAcebRf684+gHN1J6NWOeK2LFNsY0
 jgTudvGyc16B+oS18MTwUWjDIJdHTVllJyrszD5BRI6zPF6chDRBX/24IXcbcsH+D7fl
 Qf+hxJ2lbQuqYY68CXuZaRwXGmOupN3Eo5ZGu1fhWpWZG2Zkv+yGpz5Rf82rYF6/LP1C
 xJzdiUbnoPKFRb5uO4dCwSeF6Z8cmSH0TU8Mi8u0wLpnH2cqm0YbjiE1HLWxnlh0bvT9
 yXJw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8rlpztNoNFC1BTE8RLiV/SsRFWOKyvwYwnZGIS+orCcqTLMXdmDeUwMqKna2+3C/BqB0Vi71eU6s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8gfniKYlOY58f/PjfDws0nmWMFygWWgw2wtg9SA3avaEolpwH
 n5QeAONg8Axuv/o0fOY3lMzXKyUq5vTuEe491LRl5v5/7P/wI+GY3OgQWJvc7aI=
X-Google-Smtp-Source: AGHT+IGMiDAlBDPtFQkiAuC1/1Ru4Yek6z8/XGcKf7/UgBC41xY5mzvqMxXMJ8xpjMIYreA+jiSxnw==
X-Received: by 2002:a05:6a20:be1b:b0:1c4:c305:121c with SMTP id
 adf61e73a8af0-1cce10fe4afmr2046484637.42.1724926790096; 
 Thu, 29 Aug 2024 03:19:50 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.167]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7d22e9d4df4sm891684a12.82.2024.08.29.03.19.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 03:19:49 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 29 Aug 2024 18:17:34 +0800
Subject: [PATCH 05/21] drm/msm/dpu: polish log for resource allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-5-bdb05b4b5a2e@linaro.org>
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
In-Reply-To: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724926736; l=1882;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=sjBVYTV8i33N2zpmEmydrCOK2azR2M1Z7wjB2RL+G3o=;
 b=KlDubHL67SerBVY8xx5C5rEgv2bphTfdqkLShKTQ6oSJjyiQdRzrnDbHsO7yCoorHxYyrI+d4
 PPKWy5EToqpAUBNS0nw1kQCBCuQTNZkTCn/nz02pzYUcFPn1NzZ7pG7
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

Add resource allocation type info.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 15b42a6683639..e219d706610c2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -778,6 +778,21 @@ void dpu_rm_release_all_sspp(struct dpu_global_state *global_state,
 		ARRAY_SIZE(global_state->sspp_to_crtc_id), crtc_id);
 }
 
+static char *dpu_hw_blk_type_name[] = {
+	[DPU_HW_BLK_TOP] = "blk_top",
+	[DPU_HW_BLK_SSPP] = "blk_sspp",
+	[DPU_HW_BLK_LM] = "blk_lm",
+	[DPU_HW_BLK_CTL] = "blk_ctl",
+	[DPU_HW_BLK_PINGPONG] = "blk_pingpong",
+	[DPU_HW_BLK_INTF] = "blk_intf",
+	[DPU_HW_BLK_WB] = "blk_wb",
+	[DPU_HW_BLK_DSPP] = "blk_dspp",
+	[DPU_HW_BLK_MERGE_3D] = "blk_merge_3d",
+	[DPU_HW_BLK_DSC] = "blk_dsc",
+	[DPU_HW_BLK_CDM] = "blk_cdm",
+	[DPU_HW_BLK_MAX] = "blk_none",
+};
+
 int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 	struct dpu_global_state *global_state, uint32_t enc_id,
 	enum dpu_hw_blk_type type, struct dpu_hw_blk **blks, int blks_size)
@@ -828,13 +843,13 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 			continue;
 
 		if (num_blks == blks_size) {
-			DPU_ERROR("More than %d resources assigned to enc %d\n",
-				  blks_size, enc_id);
+			DPU_ERROR("More than %d %s assigned to enc %d\n",
+				  blks_size, dpu_hw_blk_type_name[type], enc_id);
 			break;
 		}
 		if (!hw_blks[i]) {
-			DPU_ERROR("Allocated resource %d unavailable to assign to enc %d\n",
-				  type, enc_id);
+			DPU_ERROR("%s unavailable to assign to enc %d\n",
+				  dpu_hw_blk_type_name[type], enc_id);
 			break;
 		}
 		blks[num_blks++] = hw_blks[i];

-- 
2.34.1

