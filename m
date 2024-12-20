Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B23369F8973
	for <lists+freedreno@lfdr.de>; Fri, 20 Dec 2024 02:28:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 708E610EE2E;
	Fri, 20 Dec 2024 01:28:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xF4PVlgk";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B43A10EE2E
 for <freedreno@lists.freedesktop.org>; Fri, 20 Dec 2024 01:28:44 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-3035210e2d1so12270961fa.2
 for <freedreno@lists.freedesktop.org>; Thu, 19 Dec 2024 17:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734658123; x=1735262923; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=r8niegYZnY9morgL7MxhpeF/UQMeeTk6uKDQF2VfVac=;
 b=xF4PVlgk2JmnA3vCNUid1ovUmvbRPp5gdGi6pCrbPMfv0x3VQYgPenpXt5I69m1Iw3
 98X5yFq5fUbZ5lwMi9Vnaq83tOXpGV1J2uRQv/GObh+Y/uA20+M4Z0Diy2MAvW1rwtD8
 9qtCGSrLtCN+KbbH8up+KqYyHUYSe+50aUYeIBF2t1rkX8JlOcz/iExyZyb6f4xk4Bh2
 r1CWYBTImwYDmiDdsnxnrVov0ot+uxCrw9TTZ74iN7OGsf7gti1kM3V7LDZOrz9gXuvE
 Od+cCnh4+cGtgtq3oN7AhuKhO4aL7Iqt0GvwciRS9Ri5ukNSTvXCdDJu+MRYiwCcCylz
 vAgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734658123; x=1735262923;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r8niegYZnY9morgL7MxhpeF/UQMeeTk6uKDQF2VfVac=;
 b=hBpnC3/fQaUOEWnxF3Qlj1nNJdiIsj/V9t4DRxs9ez6YUaWKhl6QrUifj0Fz19HNSG
 VA9aYSxMf9WjCctCn1g2RjxoT3/69Jx+R95i5Bekf1LrwmoNueAd3319y2MEZHn7c+Bs
 KE2n+r0hqUNw7v1QDndMQp0IT3N+ska1WXj15OPJX6PD9h/Y3zpgf3VdT4WevqdI9c4C
 jD/fkrzea6IUrf7fL5W1TP8xQq3WArkEkSQ3RHFC7ZmnRohyJfLQ9uPvjfFGZy8etkTG
 iMbbXGkav8wyYJsUVkBOBhHGbcvrQ75Q3q879T9N47ft3etvrd6yka20mGCAF1uyR7aa
 Uo3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6xynQcabPId4f9YtNZF0+Twdd4rxU9sZmc13eCEfAqsfjyEoock3MZlUYXWKfPZ3ZI9r2H1HcYss=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz30Spy0GVdnY46FOBvsLys5UpGAu/FUN+Bsr2Yu2/OLhQoliKc
 AxbKn6ikXuCv7OdrrmCMpAPt/+INVaZl4/VAr3d8MbG/eUCjgNr9yHmok8bAxMA=
X-Gm-Gg: ASbGnctx5K1PEfKQqooGtvougKmPFA6AYNtZwnXf8qHx9VZCLTk/c9uNpyGgwrlQlfQ
 ar9SRWoEcSqaRALfHUntPoiE4/NunbUuDSAllR2ojKbe2+QYgYWSFnVwaspHk+IH07hhZ1+RpFf
 uzNn8/gI+S5WGW6zP8YEX85Vu28jpvZcqMQAi+YvQhU9azDAZsNFyOGbx+eF48tamFK0jMM2kc/
 t4VS+BL6fSoKJ7f6ZL1vieZ+7U2iMDzRGwGQjA+qO+vFh3IxiQ5bORrds68Jx+f
X-Google-Smtp-Source: AGHT+IF5Nq2wfvPB92CZMzX3Vkpwjzw8xyQ2wYN5LaM5HZlw7C5cwQ3Tpe29jJapNts5wwecQpNCpg==
X-Received: by 2002:a05:6512:3b99:b0:540:cc4e:6e20 with SMTP id
 2adb3069b0e04-5422958245cmr173527e87.42.1734658122638; 
 Thu, 19 Dec 2024 17:28:42 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54227a89c2csm170540e87.71.2024.12.19.17.28.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 17:28:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 20 Dec 2024 03:28:33 +0200
Subject: [PATCH v2 5/8] drm/msm/dpu: link DSPP_2/_3 blocks on SM8350
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-dpu-fix-catalog-v2-5-38fa961ea992@linaro.org>
References: <20241220-dpu-fix-catalog-v2-0-38fa961ea992@linaro.org>
In-Reply-To: <20241220-dpu-fix-catalog-v2-0-38fa961ea992@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Robert Foss <rfoss@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Richard Acayan <mailingradian@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1297;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=i4FVDn+/rOcn2C84yQSmmpsO3jO494mbVjBwMlV07+c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnZMg+fZYsheFVecn80/JQlhFbjlEtvUNOb5WRv
 Y2n8WFMVhSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2TIPgAKCRCLPIo+Aiko
 1YoMB/4yMWZzpGpG+2PXtT/HTOXM6tBCGMchJ/4CkZavOgbJxQHJkQjxk8vw1CVxJ5U/s20ffmj
 MOkyl9JUAElhkUXb8wt0aqM5r476DzWlXwcCtKsUEvmbZHYzZLGSqYFsk/SaYfXxk5bL/31ZGVZ
 1hTNDmw4hhs4xYpQ87HvCnTrfTbV1T7GaiFXm8fuhaH7M3AM0Z/3/74R5IjdkpTCEbtQui/nNhG
 6vG1agZoeNsl9f02sHLpTgq7EAz3qKipD4X7ddvTwcst7oLxo/vI/KxU35F+pjyn3Hy4pW+vrD5
 Cz0wSqb+t+w5LIESymNJ4Ij5C6mTZdDbJhcZcaBL6+JDg45f
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Link DSPP_2 to the LM_2 and DSPP_3 to the LM_3 mixer blocks. This allows
using colour transformation matrix (aka night mode) with more outputs at
the same time.

Fixes: 0e91bcbb0016 ("drm/msm/dpu: Add SM8350 to hw catalog")
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index aced16e350daa1bf5d24078b2468b5095a40ce07..f7c08e89c882038aa658955ca1202bda3d928e80 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -162,6 +162,7 @@ static const struct dpu_lm_cfg sm8350_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
+		.dspp = DSPP_2,
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x320,
@@ -169,6 +170,7 @@ static const struct dpu_lm_cfg sm8350_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
+		.dspp = DSPP_3,
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x320,

-- 
2.39.5

