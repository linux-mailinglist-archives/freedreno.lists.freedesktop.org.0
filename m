Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D4670A379
	for <lists+freedreno@lfdr.de>; Sat, 20 May 2023 01:40:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1625710E547;
	Fri, 19 May 2023 23:40:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61E2510E4A5
 for <freedreno@lists.freedesktop.org>; Fri, 19 May 2023 23:40:31 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4eed764a10cso4356909e87.0
 for <freedreno@lists.freedesktop.org>; Fri, 19 May 2023 16:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684539629; x=1687131629;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nnu86aHsFvtanZnKvSuDSJpSBM6pga1ozC9nPHHaAaM=;
 b=Tyzuj9NJexe/fWbID7X9P/UU50wnU2GBXTk/YUtY+wSAYKnkbW/iWv5LAxrNVEJKr3
 BFDtqENi1k2fiZpcyEYd+kdwsYnVUhpgFHNl7LfDjopnyT0tcxDIC+tgLB5K4eLGsmF+
 OqJYvoaQdKd3HHYCPNKyD0E5JbiN4jgnKnVaGB8jvlEbOQrq62Y4IAAyxu5J1uuTO9Nh
 5O/5s640YbolZnTxj6kDkNVEj7uiN11kaOEGFWqrrcIl++SVKfDTtZ8hvBkiYC5LQy70
 By3b3zqSLqEidEKMlAVxYP3Sj/JKDrykNIwyNfi6wv/ZRI7LZIurtyzvG7mAKbn99ziT
 obuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684539629; x=1687131629;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nnu86aHsFvtanZnKvSuDSJpSBM6pga1ozC9nPHHaAaM=;
 b=Kvtuq6n4KT9JuMShBwNM5SM1tswXKD8itjrE4bdXav7+qt79Vw9552NcvQRgWliJvo
 KTIWapxRsPljsg3El8ZE4eZvuCroDHy9r5OLVf5YrH2k777rd1P7NRMgynQIB/Yuilyp
 e2+oZRwnJKX/Z9gyDRFUXaWoRViYX2GYocHrvvs1KtiFGBglxOHjeIL16B5C+NIHkX5G
 iI3T7kx1ih5mQs31grCF64sKy++/II50h8u0wjDJ4qN2sjNK8GVW3jUvK00e1zZgWdCQ
 PdjBc21OSDz3dtKeLma7LgBdBYC0XTg744pjEbeAFhzMKd4pMvCtigx3MYuhqB6ZUNrF
 z0mA==
X-Gm-Message-State: AC+VfDydeJ6fC2UrMlxI5y+b3ogM3nvdrwx47t2vVI91p7mfR69IGXVD
 f7b/WMpqBo0YE58VbKE7WRAG8w==
X-Google-Smtp-Source: ACHHUZ50vwYQILoWGT/85lXxQMyIRH7gbuo5XLMlym2eypjBVfGij6VZ8WAp24RQWsG/raTqlYAVpQ==
X-Received: by 2002:a19:ee14:0:b0:4f1:1de7:1aab with SMTP id
 g20-20020a19ee14000000b004f11de71aabmr1073203lfb.44.1684539629268; 
 Fri, 19 May 2023 16:40:29 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 l7-20020a2e3e07000000b002af25598f07sm43454lja.78.2023.05.19.16.40.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 16:40:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sat, 20 May 2023 02:40:24 +0300
Message-Id: <20230519234025.2864377-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230519234025.2864377-1-dmitry.baryshkov@linaro.org>
References: <20230519234025.2864377-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 3/4] drm/msm/dpu: use PINGPONG_NONE for LMs
 with no PP attached
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

On msm8998/sdm845 some LM blocks do not have corresponding PINGPONG
block. Currently the driver uses PINGPONG_MAX for such cases. Switch
that to use PINGPONG_NONE instead, which is more logical.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h  | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h             | 3 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c                  | 2 +-
 5 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 37a52b4ef8d3..3c732a0360c7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -104,9 +104,9 @@ static const struct dpu_lm_cfg msm8998_lm[] = {
 	LM_BLK("lm_2", LM_2, 0x46000, MIXER_MSM8998_MASK,
 		&msm8998_lm_sblk, PINGPONG_2, LM_5, 0),
 	LM_BLK("lm_3", LM_3, 0x47000, MIXER_MSM8998_MASK,
-		&msm8998_lm_sblk, PINGPONG_MAX, 0, 0),
+		&msm8998_lm_sblk, PINGPONG_NONE, 0, 0),
 	LM_BLK("lm_4", LM_4, 0x48000, MIXER_MSM8998_MASK,
-		&msm8998_lm_sblk, PINGPONG_MAX, 0, 0),
+		&msm8998_lm_sblk, PINGPONG_NONE, 0, 0),
 	LM_BLK("lm_5", LM_5, 0x49000, MIXER_MSM8998_MASK,
 		&msm8998_lm_sblk, PINGPONG_3, LM_2, 0),
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 0b727252671c..36ea1af10894 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -102,9 +102,9 @@ static const struct dpu_lm_cfg sdm845_lm[] = {
 	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
 		&sdm845_lm_sblk, PINGPONG_2, LM_5, 0),
 	LM_BLK("lm_3", LM_3, 0x0, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_MAX, 0, 0),
+		&sdm845_lm_sblk, PINGPONG_NONE, 0, 0),
 	LM_BLK("lm_4", LM_4, 0x0, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_MAX, 0, 0),
+		&sdm845_lm_sblk, PINGPONG_NONE, 0, 0),
 	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
 		&sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 1cb5699a5a47..677048cc3b7d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -529,7 +529,7 @@ struct dpu_sspp_cfg {
  * @base               register offset of this block
  * @features           bit mask identifying sub-blocks/features
  * @sblk:              LM Sub-blocks information
- * @pingpong:          ID of connected PingPong, PINGPONG_MAX if unsupported
+ * @pingpong:          ID of connected PingPong, PINGPONG_NONE if unsupported
  * @lm_pair_mask:      Bitmask of LMs that can be controlled by same CTL
  */
 struct dpu_lm_cfg {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index 1913a19de733..02a0f48aac94 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -191,7 +191,8 @@ enum dpu_dsc {
 };
 
 enum dpu_pingpong {
-	PINGPONG_0 = 1,
+	PINGPONG_NONE,
+	PINGPONG_0,
 	PINGPONG_1,
 	PINGPONG_2,
 	PINGPONG_3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index d5a06628885e..bf7b8e7c45b1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -117,7 +117,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 		struct dpu_hw_mixer *hw;
 		const struct dpu_lm_cfg *lm = &cat->mixer[i];
 
-		if (lm->pingpong == PINGPONG_MAX) {
+		if (lm->pingpong == PINGPONG_NONE) {
 			DPU_DEBUG("skip mixer %d without pingpong\n", lm->id);
 			continue;
 		}
-- 
2.39.2

