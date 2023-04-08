Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF996DB7D1
	for <lists+freedreno@lfdr.de>; Sat,  8 Apr 2023 02:28:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E7A010EEA3;
	Sat,  8 Apr 2023 00:27:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CA4F10EE82
 for <freedreno@lists.freedesktop.org>; Sat,  8 Apr 2023 00:27:55 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id z8so1931383lfb.12
 for <freedreno@lists.freedesktop.org>; Fri, 07 Apr 2023 17:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680913673;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tES+k/2rCXVwYzByM5X66NR66DuAIeKGJOTQwb8XTGc=;
 b=gl2dOvy71b+fdy0GFm6gRo172Qs+i7rvStO2GKiK5Zn4LHpC7lXESGBa3BdXuz2/Tq
 3rcqQuiLhn07KYGLnZ/0B1ee070aOOII4mewBYnmhBTK05dWWRfZlODHglUmqKgAnN5w
 JhFCuFey+zy5FswvT7tF+k4CFwucDUUmIcZ9w1qZIKnCJO8JX//033LutoTTLljosEve
 npy+hjT2t1BdMF38QPJvG1KuF5AoIowbEb8K01SiRUxgFyP/2C4RgBualpm4nM+UQh/u
 JKubr6VugfSUhPieNZYT9l4TYhh9wWcbHZSz+fooNY2TrQcCImx5qUDvIg1WbraaSbx7
 u92g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680913673;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tES+k/2rCXVwYzByM5X66NR66DuAIeKGJOTQwb8XTGc=;
 b=Seo8BL0M2VdcKCY8wrp/Y371ajPzGnxELdo/TT4XCDzKLI2bS9GysELsbtMuf8U56l
 D5vlG9L1yaEcfmyERm0RiJN+FySAF8TZd7hl+wJaGBRssry0tosHicYf66illIePd2e6
 7Ms93MQ8qT9dkGnCQ0t5folxfNtS9KSpLXo+j0akE0LtQvKpCNnd9T6szb5YnPuUEZWZ
 TEFqqYvnUtZhpkBhcNmNstxIF4IskWOF1Lbj3KUsQiqu7pcyaz6GgPMY6/fP+2qlDzeW
 WU0aoHEISWCV2Gv+bAGioBskyukCFLQdiWyF2epb3NUEze5oPZMyvIt0vOMUdfgqIcnV
 BjUA==
X-Gm-Message-State: AAQBX9dBqQ+53wlet2XvyPGqPiubZmE8AYrWtfGCpSaq7rYwKQ6GGPGP
 fh8hwoF2Ii3tEJ4u6MSHBfM6dw==
X-Google-Smtp-Source: AKy350bxJCx5CO9kEiOH+oHNMx6p+ge37Cpll9/xs1LeOAcl8bONpJoKkkTQc3L5ZTb428unrONxRA==
X-Received: by 2002:a19:c215:0:b0:4b5:23c4:ab1a with SMTP id
 l21-20020a19c215000000b004b523c4ab1amr1361811lfc.42.1680913673131; 
 Fri, 07 Apr 2023 17:27:53 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 q15-20020a19a40f000000b004db3e2d3efesm915759lfc.204.2023.04.07.17.27.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 17:27:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sat,  8 Apr 2023 03:27:49 +0300
Message-Id: <20230408002750.2722304-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230408002750.2722304-1-dmitry.baryshkov@linaro.org>
References: <20230408002750.2722304-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v5 3/4] drm/msm/dpu: enable DSPP and DSC on
 sc8180x
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

Enable DSPP and DSC hardware blocks on sc8180x platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 28 +++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index c57400265f28..085db379083e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -102,9 +102,9 @@ static const struct dpu_sspp_cfg sc8180x_sspp[] = {
 
 static const struct dpu_lm_cfg sc8180x_lm[] = {
 	LM_BLK("lm_0", LM_0, 0x44000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_0, LM_1, 0),
+		&sdm845_lm_sblk, PINGPONG_0, LM_1, DSPP_0),
 	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
-		&sdm845_lm_sblk, PINGPONG_1, LM_0, 0),
+		&sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
 	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
 		&sdm845_lm_sblk, PINGPONG_2, LM_3, 0),
 	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
@@ -115,6 +115,17 @@ static const struct dpu_lm_cfg sc8180x_lm[] = {
 		&sdm845_lm_sblk, PINGPONG_5, LM_4, 0),
 };
 
+static const struct dpu_dspp_cfg sc8180x_dspp[] = {
+	DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+	DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+	DSPP_BLK("dspp_2", DSPP_2, 0x58000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+	DSPP_BLK("dspp_3", DSPP_3, 0x5a000, DSPP_SC7180_MASK,
+		 &sm8150_dspp_sblk),
+};
+
 static const struct dpu_pingpong_cfg sc8180x_pp[] = {
 	PP_BLK_TE("pingpong_0", PINGPONG_0, 0x70000, MERGE_3D_0, sdm845_pp_sblk_te,
 			DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
@@ -142,6 +153,15 @@ static const struct dpu_merge_3d_cfg sc8180x_merge_3d[] = {
 	MERGE_3D_BLK("merge_3d_2", MERGE_3D_2, 0x83200),
 };
 
+static const struct dpu_dsc_cfg sc8180x_dsc[] = {
+	DSC_BLK("dsc_0", DSC_0, 0x80000, BIT(DPU_DSC_OUTPUT_CTRL)),
+	DSC_BLK("dsc_1", DSC_1, 0x80400, BIT(DPU_DSC_OUTPUT_CTRL)),
+	DSC_BLK("dsc_2", DSC_2, 0x80800, BIT(DPU_DSC_OUTPUT_CTRL)),
+	DSC_BLK("dsc_3", DSC_3, 0x80c00, BIT(DPU_DSC_OUTPUT_CTRL)),
+	DSC_BLK("dsc_4", DSC_4, 0x81000, BIT(DPU_DSC_OUTPUT_CTRL)),
+	DSC_BLK("dsc_5", DSC_5, 0x81400, BIT(DPU_DSC_OUTPUT_CTRL)),
+};
+
 static const struct dpu_intf_cfg sc8180x_intf[] = {
 	INTF_BLK("intf_0", INTF_0, 0x6a000, 0x280, INTF_DP, MSM_DP_CONTROLLER_0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
 	INTF_BLK("intf_1", INTF_1, 0x6a800, 0x2bc, INTF_DSI, 0, 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
@@ -190,6 +210,10 @@ const struct dpu_mdss_cfg dpu_sc8180x_cfg = {
 	.sspp = sc8180x_sspp,
 	.mixer_count = ARRAY_SIZE(sc8180x_lm),
 	.mixer = sc8180x_lm,
+	.dspp_count = ARRAY_SIZE(sc8180x_dspp),
+	.dspp = sc8180x_dspp,
+	.dsc_count = ARRAY_SIZE(sc8180x_dsc),
+	.dsc = sc8180x_dsc,
 	.pingpong_count = ARRAY_SIZE(sc8180x_pp),
 	.pingpong = sc8180x_pp,
 	.merge_3d_count = ARRAY_SIZE(sc8180x_merge_3d),
-- 
2.39.2

