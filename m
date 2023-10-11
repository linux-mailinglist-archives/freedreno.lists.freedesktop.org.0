Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 048857C5F4E
	for <lists+freedreno@lfdr.de>; Wed, 11 Oct 2023 23:47:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FC6889819;
	Wed, 11 Oct 2023 21:47:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A20A10E205
 for <freedreno@lists.freedesktop.org>; Wed, 11 Oct 2023 21:47:10 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5043a01ee20so459284e87.0
 for <freedreno@lists.freedesktop.org>; Wed, 11 Oct 2023 14:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697060828; x=1697665628; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8NowKG+uxNaCu9ectHj5Raem53l31lC3gwF/MNNR9FI=;
 b=QmsblmOGTqDE5Jlqe82P1dMNyNK3WJG7zNoYR3Mk3vAnXCNwd/NtGM6kMWdI2JELPf
 cCNEZVEDEiaixd/63fRitceqMa/jYeK6urvb5iKylQtyttgxWlqVKcTNFgZ/nKeegZaa
 mnda85TxT0dkEQJYWsf/RX8L+mYCrMO995GTzjcpdEcl/DUUCdwSnYLZSz71BMjV+kHn
 ky4sIbtL7K8L9gg3oAW6jOKBR+K9n7ZLWtKH+NLQXyl6JhWfL6yfeOhihq3wurwWg4+A
 dTHFF0WR3ABk3E5V81ycfAMwsfYUtfhn5JUBGtG8nKrcLMQDNDwQnNe0IxlPFCzkwD0R
 8aYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697060828; x=1697665628;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8NowKG+uxNaCu9ectHj5Raem53l31lC3gwF/MNNR9FI=;
 b=K9rFeOZGG2lbB7X0yQWe870ZBeAa1oSISnukjk1gbcngD0iy92cIRc/Nk3okGFCvKd
 rEmVfEkj+CFoPoxNfsJMgSjapx6gyETQpYjunHU5aC5n4COO4XJpmuAfFGxTAWjeliZ/
 k+NM2PPz/Oog6itjMyp020H9nIbzax/Mca/gnL3WRHcQS+lnqC6o0xuqHBejsRFEokzx
 Lvky6XZQS7C6b1V9zJMEJysF3UyopSAZLl0vb3ZVJs3GD4dl0igARr5DD932X3zadMIx
 x0s45KZiohqwQrNT2qX+7SbCNokR4PRx99KmHdQ7dXhO8mKjl8lyS7S6MlurVr+MHcBe
 +jnA==
X-Gm-Message-State: AOJu0YzOLCYmSDDf5TT0knAZSF1mnCn7JvwIE4KqJm5Ua2880Q0TRrS2
 tcwQ9BrPoi7Rk/lB1qqiHoad0Q==
X-Google-Smtp-Source: AGHT+IEP+I6YA9pAFP7bcd4lqSHrBa9fvXnpEuDyIcwcYbYyLPFB6oI7N62F8hACTs5u5PBR627VZQ==
X-Received: by 2002:a05:6512:b23:b0:503:1913:ed8e with SMTP id
 w35-20020a0565120b2300b005031913ed8emr18628281lfu.61.1697060828355; 
 Wed, 11 Oct 2023 14:47:08 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a056512050f00b004fbab80ecefsm2452485lfb.145.2023.10.11.14.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 14:47:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Thu, 12 Oct 2023 00:47:05 +0300
Message-Id: <20231011214705.375738-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231011214705.375738-1-dmitry.baryshkov@linaro.org>
References: <20231011214705.375738-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 3/3] drm/msm/dp: use correct lifetime device for
 devm_drm_bridge_add
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

The lifetime of the created drm_bridge is attached to the drm_device
rather than the DP's platform_device. Use correct lifetime for
devm_drm_bridge_add() call.

Fixes: 61a72d5efce5 ("drm/msm/dp: switch to devm_drm_bridge_add()")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_drm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 284ff7df058a..40e7344180e3 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -307,7 +307,7 @@ int dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
 			DRM_BRIDGE_OP_MODES;
 	}
 
-	rc = devm_drm_bridge_add(&dp_display->pdev->dev, bridge);
+	rc = devm_drm_bridge_add(dev->dev, bridge);
 	if (rc) {
 		DRM_ERROR("failed to add bridge, rc=%d\n", rc);
 
-- 
2.39.2

