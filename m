Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 465727E3AD4
	for <lists+freedreno@lfdr.de>; Tue,  7 Nov 2023 12:14:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35E1310E523;
	Tue,  7 Nov 2023 11:14:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05DC910E135
 for <freedreno@lists.freedesktop.org>; Tue,  7 Nov 2023 11:14:17 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2c6cb4a79deso59594061fa.1
 for <freedreno@lists.freedesktop.org>; Tue, 07 Nov 2023 03:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699355655; x=1699960455; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zApwXx3neP4r1a11TdYT2Rbt6ZBCaXJpgGfrnVx6vhU=;
 b=pRbDh2b3BJNFKxUWCe6B4u3Pthyxq8YqVFzUBu6VcnvBTgylC0KEty65iHgODHq/B1
 gwC1iCsZr1X+BbiwHByQsx+c2PiFN75kuy088ce8ovC15E+uNqWL7pNyrBxGaFgh/4RU
 fnkIe3DYTiXkde49hoe3rr5WGo0XYJkoIyEtSTgwJ2CYKrWUlZKxAI0jcoDMTbCYtK1n
 0mdPcJglUByHaGFVSHn9m581VI/Z8e0or88sQ32+2eKWrB6ONsOe1sj5vtTM3eWFJy55
 PvuwDuAEuL9kIFCL/aRbT5ycM+65SRcMZRXpeDv/AJqmod8J3E8hKMbdxoFgVBHfZ3zW
 SV+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699355655; x=1699960455;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zApwXx3neP4r1a11TdYT2Rbt6ZBCaXJpgGfrnVx6vhU=;
 b=aiSqr03yx4iE05sl2qnN/kLealVBa1JjyhkYKn0jMF7wRnQlzt+s4TzU3yPbEvO3mo
 2S49619XJNHcA1/xa/jo8y3AzKj1qQ7k8gqawwGxs8/c1WEa7IiuDx3dOq3M7fTcyCZ5
 aEPNSk3kUYDflIlXH9lio8qVxbK2ONaouWwpxw7mo8A5SXgUibiKX2NBto7P5Iqj95gg
 PZHYX+9CZy3F/CR3vhrKejOlGFC2So8ffUwVPebPB/ovVAJaG7bOlgEjvX0lJnInm9O5
 kDJKFs79iCb5nAFUj+CN8tuL/WGfgWA2Ge76PvU9izaCppjLqXjQ67dBgbdltdI5iJR/
 e6lw==
X-Gm-Message-State: AOJu0YwxwB4x7dDQO17V2fKPhOsPdfhLHOQrT6H56R5H0KJ6b726jxh0
 zPljkGtqEPkOujYVprz1M7HWLw==
X-Google-Smtp-Source: AGHT+IGlC+Qe7O3Dsc//34fEfEFsFCFPIeXzj8PbY46sCt3KyWk2AdZkm1qf9H6r2LzbPWRh/XMXVw==
X-Received: by 2002:a2e:990b:0:b0:2c6:ec37:fb5 with SMTP id
 v11-20020a2e990b000000b002c6ec370fb5mr800852lji.10.1699355655026; 
 Tue, 07 Nov 2023 03:14:15 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 t15-20020a05651c204f00b002bfff335ca1sm1484399ljo.79.2023.11.07.03.14.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Nov 2023 03:14:14 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Tue,  7 Nov 2023 13:14:13 +0200
Message-ID: <20231107111413.2212942-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] drm/msm: remove exra drm_kms_helper_poll_init()
 call
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

It seems during rebases I have left a call to drm_kms_helper_poll_init()
which is not guarded by the (priv->kms_init) check. This leads to the
crash for the boards which don't have KMS output. Drop this call, as
there is a correctly guarded one next to the one being removed.

Fixes: 506efcba3129 ("drm/msm: carve out KMS code from msm_drv.c")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 2aae7d107f33..3f217b578293 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -288,8 +288,6 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	if (ret)
 		goto err_msm_uninit;
 
-	drm_kms_helper_poll_init(ddev);
-
 	if (priv->kms_init) {
 		drm_kms_helper_poll_init(ddev);
 		msm_fbdev_setup(ddev);
-- 
2.42.0

