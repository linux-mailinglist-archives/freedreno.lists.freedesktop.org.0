Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B350574B809
	for <lists+freedreno@lfdr.de>; Fri,  7 Jul 2023 22:37:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C3E10E5FF;
	Fri,  7 Jul 2023 20:37:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E5E210E5F3
 for <freedreno@lists.freedesktop.org>; Fri,  7 Jul 2023 20:37:32 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4fba8f2197bso3826203e87.3
 for <freedreno@lists.freedesktop.org>; Fri, 07 Jul 2023 13:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688762249; x=1691354249;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p1naQ/0oURgoeOGRk7cLDdAN24Fuu5yXRK3xPVkECZM=;
 b=bor53ey1Qq6hehFlehHsmeg6s8UZ9ewhwXjniQlerjiaj9xrbfRygghG+pPTPzcw9a
 GYVT1WUT9z/rW1bOl58dtGGwCbr3zH4qvn1WJ30Ru4QsdW4/k+1swtxukM79M721M+ZV
 gUBylvl+2IbHYStxmQi5LFqh0bMyz+rppqx1oGFQIEzpo4X4eBs71vyQJSbfy9JmRQMa
 OSgUyxx/ODU8qKzMB4kr8tnvjgsGxvr8BIUDkmNkqujx6iEa5obzRnT1gforGwNeogNo
 fNTSlY9ppSRClamfZsnqzNeinWAbugZcr3k8whDrd/wJIDbQGbMFYYIQmP7kBUSY79cw
 ZsNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688762249; x=1691354249;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p1naQ/0oURgoeOGRk7cLDdAN24Fuu5yXRK3xPVkECZM=;
 b=jIIsuptQgdzBWm9SQ7WPG6X1NFPw+FSK1FfnUVUs1yEdoMEdoT01PHW64qKp512d8T
 jCr9QZRjluwX2XaT9czqbbNb428KXr22FgJROG8cOO/NAfhPSE/K88q8QjnwKpEPVUll
 izMhQEASkLH2NJLa1mQLbvmpmS86/Dyr15Z2tRgMm7CzBq+MHEziSau9Fp7NnxqgsBtS
 UTKIscv1Y+UqHOHJLxI4OnBmPEZIOzPu6hm3k8MyjC2Tu0n6okNoiZRPb9l0gGr5LO0H
 yOEs+XSrzsHODBK7i5IcvWqODR0491vtQ2/DbKpeno/zjCc5gJZnIad26jV0WeKQacND
 Al1Q==
X-Gm-Message-State: ABy/qLafUCKtCVRseQiSHIYotNub/oLAoTidUYVOeBrWEW0qQayAcE1y
 j+Kv5OCw5EPRte8HD2mSffkAxQ==
X-Google-Smtp-Source: APBJJlE2zbFV9KSEWEHk8NmE0qjtl13bZ/HT+jyGorcoIr0OMjfa2j6WjwwBqsYxx+mARa8PMeb5Jw==
X-Received: by 2002:a05:6512:2ed:b0:4f8:6dbf:401d with SMTP id
 m13-20020a05651202ed00b004f86dbf401dmr4443939lfq.57.1688762249808; 
 Fri, 07 Jul 2023 13:37:29 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d4-20020ac244c4000000b004fb738796casm808899lfm.40.2023.07.07.13.37.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 13:37:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Fri,  7 Jul 2023 23:37:18 +0300
Message-Id: <20230707203724.3820757-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230707203724.3820757-1-dmitry.baryshkov@linaro.org>
References: <20230707203724.3820757-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 07/13] drm/msm/dpu: drop unused dpu_plane::lock
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

The field dpu_plane::lock was never used for protecting any kind of
data. Drop it now.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index c2aaaded07ed..aba5185e1d66 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -78,8 +78,6 @@ static const uint32_t qcom_compressed_supported_formats[] = {
 struct dpu_plane {
 	struct drm_plane base;
 
-	struct mutex lock;
-
 	enum dpu_sspp pipe;
 
 	uint32_t color_fill;
@@ -1186,8 +1184,6 @@ static void dpu_plane_destroy(struct drm_plane *plane)
 		if (pstate->r_pipe.sspp)
 			_dpu_plane_set_qos_ctrl(plane, &pstate->r_pipe, false);
 
-		mutex_destroy(&pdpu->lock);
-
 		/* this will destroy the states as well */
 		drm_plane_cleanup(plane);
 
@@ -1447,8 +1443,6 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 	/* success! finalize initialization */
 	drm_plane_helper_add(plane, &dpu_plane_helper_funcs);
 
-	mutex_init(&pdpu->lock);
-
 	DPU_DEBUG("%s created for pipe:%u id:%u\n", plane->name,
 					pipe, plane->base.id);
 	return plane;
-- 
2.39.2

