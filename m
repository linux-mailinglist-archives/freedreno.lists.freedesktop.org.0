Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 750D174676C
	for <lists+freedreno@lfdr.de>; Tue,  4 Jul 2023 04:22:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0159210E262;
	Tue,  4 Jul 2023 02:21:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 510D110E264
 for <freedreno@lists.freedesktop.org>; Tue,  4 Jul 2023 02:21:45 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4fb9ae4cef6so7957336e87.3
 for <freedreno@lists.freedesktop.org>; Mon, 03 Jul 2023 19:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688437303; x=1691029303;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JJGttKPpc9oU+TZPEzFQEPF96G1UK9uJ7TLcLtJR5fQ=;
 b=oGLuaHG0aQUZtuLRSpiAHPBKIcIHD6HZQUn1GIF3F+TvWi7fVqN1THV9phA3qmbq2l
 CEqAbVsqQua1WU7qvzwEoCM3A0rbv9o+3CE7Ip0ThuHpSgtY/yBgwBCCYoXlWpjxItxz
 OjwgBj8aGus9v9WPwmYNkR3KR0JmnN2ZTDyHwyY0lSANFGEpNmBoirgteSXSqe6v+dBa
 be/5jWofJGFkpXX8OOzW8qD2hE6rTjecXG1HErKRZaEj6H1oOy74p89/SXDVV1KKHVi5
 nek1pNf18fchuBhdU085RHHqoeFCW5NlGwqN71sTaHDToBiYfFLXOGSkJxgWdIJXw0O0
 4cYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688437303; x=1691029303;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JJGttKPpc9oU+TZPEzFQEPF96G1UK9uJ7TLcLtJR5fQ=;
 b=KSGoeVvs8k4LN+gcinocZg9moiRPdEH2IJiOn9Eb+Qe7xZNYr5qde9N5DQcjIvm2kb
 F25zhxWJeIUtdtLi9TxCVFtXpC8l0Wpt6Y5hejMn9LvjCXH/RLRftEony/HfcAAQNNi5
 Md3Zji9+qZbvsAOX29JocT4dKCn80k/Q0/OMnAtvzYP1l0VhIZGjwF92qDev/KU6eIFB
 bZcjROcZhgMSmSQQhOPQWG59h+mBvxKoOS/GIcME59tsBw24d2RGPI5JSczT1vPImjX3
 XDBY94Wy8jwJTvVqeTIqhl4eTclIBhSf5I2sO5ehNyn5PD5NccRBRU2jMFs9a0REMgCL
 fn4Q==
X-Gm-Message-State: ABy/qLYppxovA9goi+9LxtRWX6XwrfK0Z5IOHsxpVP4cwfnpaBQpICfF
 jqMhGpZesdoUZDlhf86JbNY8/Q==
X-Google-Smtp-Source: APBJJlGNm/KwhBXIiCKyqjeGcp1PM0ZMfPFhtILr+jjeACaVzdOWsQ7Tm1ZBrhKzAK/MGdUU1C2Phw==
X-Received: by 2002:a2e:3211:0:b0:2b6:ec2b:659 with SMTP id
 y17-20020a2e3211000000b002b6ec2b0659mr2742537ljy.17.1688437303450; 
 Mon, 03 Jul 2023 19:21:43 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a05651c021000b002b6e863108esm1137830ljn.9.2023.07.03.19.21.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 19:21:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Tue,  4 Jul 2023 05:21:25 +0300
Message-Id: <20230704022136.130522-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230704022136.130522-1-dmitry.baryshkov@linaro.org>
References: <20230704022136.130522-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v5 08/19] drm/msm/dpu: drop zero features from
 dpu_ctl_cfg data
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

Drop useless zero assignments to the dpu_ctl_cfg::features field.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Tested-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h  | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 757ac648a692..e0cc1ce3f3e2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -54,7 +54,6 @@ static const struct dpu_ctl_cfg msm8998_ctl[] = {
 	{
 	.name = "ctl_1", .id = CTL_1,
 	.base = 0x1200, .len = 0x94,
-	.features = 0,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	},
 	{
@@ -66,13 +65,11 @@ static const struct dpu_ctl_cfg msm8998_ctl[] = {
 	{
 	.name = "ctl_3", .id = CTL_3,
 	.base = 0x1600, .len = 0x94,
-	.features = 0,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	},
 	{
 	.name = "ctl_4", .id = CTL_4,
 	.base = 0x1800, .len = 0x94,
-	.features = 0,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 9fb8ef21c7f0..f52e1fa27e2c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -58,19 +58,16 @@ static const struct dpu_ctl_cfg sdm845_ctl[] = {
 	{
 	.name = "ctl_2", .id = CTL_2,
 	.base = 0x1400, .len = 0xe4,
-	.features = 0,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	},
 	{
 	.name = "ctl_3", .id = CTL_3,
 	.base = 0x1600, .len = 0xe4,
-	.features = 0,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	},
 	{
 	.name = "ctl_4", .id = CTL_4,
 	.base = 0x1800, .len = 0xe4,
-	.features = 0,
 	.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	},
 };
-- 
2.39.2

