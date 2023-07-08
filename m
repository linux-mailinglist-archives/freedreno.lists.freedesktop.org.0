Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB46E74BAC3
	for <lists+freedreno@lfdr.de>; Sat,  8 Jul 2023 03:04:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FFE510E169;
	Sat,  8 Jul 2023 01:04:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6081910E06D
 for <freedreno@lists.freedesktop.org>; Sat,  8 Jul 2023 01:04:15 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2b703c900e3so38802041fa.1
 for <freedreno@lists.freedesktop.org>; Fri, 07 Jul 2023 18:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688778253; x=1691370253;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1dDa09IPPKyYg+3VZJKhZ3MpuhgcB8Qzz0Yy6G9C0Hg=;
 b=sCHFkAXRMGNLN34irJotyEcd+hn9zqPWNSmMxcrmEowScO05PBx1OEgjsErNy7P1PG
 QXZdrUHEYIPrR+ymYAiUKG58rbU8zL1fG4r51xsbnVKXXBObMbA1X1mCUKC1bVHTQFRS
 8WIXJ3jMAwr09u8l6CzvDOdFFtbhf//Rub3ZZFqo3T1Qig5jq8ir73cySv3WgSduhQ6p
 I/25LuuGClWJQrPqfM2rLJPbXDCzGsk+Tgp2/PULNlqG1po4hP2+imGEcEfAidMJoRlQ
 IcXEeo2rIeVJgfXRzhPgADpTSQ7W/SkLfcN0e2gan23B9L/QREZIqiOTvbrasPG0ICh7
 faOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688778253; x=1691370253;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1dDa09IPPKyYg+3VZJKhZ3MpuhgcB8Qzz0Yy6G9C0Hg=;
 b=TKqe56IT0Ug+f7japUd4nx0zC3wQAH991Lcg2BEWc/iiFnQfVGcVD1Lgl+bAPpAFjv
 bwG5G1Erwev+QWa5T91LYIsWFtAcFPA7dAi3si7j1ZSH8tyvmwOBj84tgl7iI6bulXFu
 CDFZn6e8/IMhSIe+4G/0swVG+O1LSmU+miwAifF5qVmweRhROQFe97P4XcQZdErOisud
 3g6smPxF4Eubk9qUaBCvXrYz/EKFOQ8r/Y6QiaVHBeSXoYnNoamummbMtAG/h+3kBvmy
 UM/1HjnE/SWv1CZVSwLmAWq0Mm5qDanGWISzG3Biel7xez7eEcc44feaHS0nAf0pPxGh
 1MiA==
X-Gm-Message-State: ABy/qLY3tff3iSWZt0pS7J+cGiNWlP36KG0BWkZCh9lm4cGEZwZHimgF
 SpODHJSVWO95KLIg8k3I87A/0g==
X-Google-Smtp-Source: APBJJlFZI7DJACf80E6XDfRqLGI8AxOmzj91GP7D4NEzNyhKdUniENni2CFKzVBC/CXpA+9+td2koQ==
X-Received: by 2002:a2e:9c8f:0:b0:2b4:6f0c:4760 with SMTP id
 x15-20020a2e9c8f000000b002b46f0c4760mr4282505lji.11.1688778253718; 
 Fri, 07 Jul 2023 18:04:13 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a2e8685000000b002b6ee99fff2sm1012807lji.34.2023.07.07.18.04.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 18:04:13 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sat,  8 Jul 2023 04:03:57 +0300
Message-Id: <20230708010407.3871346-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
References: <20230708010407.3871346-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 07/17] drm/msm/mdp5: use devres-managed
 allocation for INTF data
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

Use devm_kzalloc to create INTF data structure. This allows us
to remove corresponding kfree() call.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 0a85777625d3..fb2b3bf081ee 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -616,11 +616,6 @@ static int mdp5_kms_init(struct drm_device *dev)
 
 static void mdp5_destroy(struct mdp5_kms *mdp5_kms)
 {
-	int i;
-
-	for (i = 0; i < mdp5_kms->num_intfs; i++)
-		kfree(mdp5_kms->intfs[i]);
-
 	if (mdp5_kms->rpm_enabled)
 		pm_runtime_disable(&mdp5_kms->pdev->dev);
 
@@ -741,7 +736,7 @@ static int interface_init(struct mdp5_kms *mdp5_kms)
 		if (intf_types[i] == INTF_DISABLED)
 			continue;
 
-		intf = kzalloc(sizeof(*intf), GFP_KERNEL);
+		intf = devm_kzalloc(dev->dev, sizeof(*intf), GFP_KERNEL);
 		if (!intf) {
 			DRM_DEV_ERROR(dev->dev, "failed to construct INTF%d\n", i);
 			return -ENOMEM;
-- 
2.39.2

