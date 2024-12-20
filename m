Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 942789F896C
	for <lists+freedreno@lfdr.de>; Fri, 20 Dec 2024 02:28:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7165710E008;
	Fri, 20 Dec 2024 01:28:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OY3YRaw+";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83E3210EE27
 for <freedreno@lists.freedesktop.org>; Fri, 20 Dec 2024 01:28:39 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-303489e8775so14957351fa.3
 for <freedreno@lists.freedesktop.org>; Thu, 19 Dec 2024 17:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734658118; x=1735262918; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=B+IOu8UV/6vM6ydhmIg2O/tJH2Ir+xajrwaLNWIqsKA=;
 b=OY3YRaw+JI0zVljJPoXq10gdK8evi/PUhC+xJhxzqBWX3oslU2qEgeTRPgho6TD51V
 vnzz6r9EJfAGQ6FMNYezI0iFc0JufGKVkfy6a3RrAxuh87ZmbKj2Gmbv5TghlhQi7xtF
 gckXbteLYiQSozqbl3J7+dbyFm7FZgjhCPv/I4hoAz4MRA46H/ke2THfP00Cf8x4bAi1
 ph/3sSGyxOEjcCquQ0EiJ1OVvoQcNYipmUpkTpePyoAQIKk5SLvVf83Az8lOpcNBRvZx
 M3vlTphfHRCDMsTrU0hdId//I9dloI4hEUyw2lTJ/3t5GH9KPk5zUAF5K6K/7e4IhmUX
 2+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734658118; x=1735262918;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B+IOu8UV/6vM6ydhmIg2O/tJH2Ir+xajrwaLNWIqsKA=;
 b=DGRETBUX9VPz0dBfnyr/y1BSvEeR7WDN57nSa1qUJh4+ST6ZKZ67NnBnoJWBdOC6By
 CI14mVxe/EMCcl7Yq+nIHjkrFRIqiUcEne+syHa5S3Z4NrL0GyjmFErUQTL8Vaczl8D+
 XTJj0RuFggoAXYzWjzS3FxX/TjN9FPmbh8GvY8LdOImJM0sGhkbswBwYHhJwA8PVyoZh
 Y1Mzr086qfctvGq9tc/vfcW1G33MHv7tVYNua8DAqFOLUp+Bi3NiI0mzGItjZUJimDh+
 NoEuzxXl6Ji5RICQyN7UDR9+0LLkvjOrrmcngl/DUjp35Ve81ixg60F0uc/oomhoHSS7
 VPiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlbQag/cqGrRrN7NSom0zx+/aVt94bBFGcaHKjVpVX4RV6VD5D+TMzUyNqhHXmFjEGkQYOi1uhhlg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzDWaalWhPyyYX7i2oaqWcPEbFzmVIMVj7gKib+/5iE+mO90a0k
 CVU3UrJ8+fx0F8JPBYDe9LCKP6BISRSqsXXFnPW46koVL2qT95KbmHuS0FbjPcg=
X-Gm-Gg: ASbGnctwwLcjRNFweQSPoWi2C+RqXQp7fim/kMkRFQYZa1q6i1iTOqHXDdVljrY5znU
 YMXQhVGuGWDWJm4nRKz67I1pSwZTNRNrr+rPVYnVTwktkDGP4RHCw8lIa/2GGeVAh1m7OZDJEHF
 qDH35gDZmEF7RajAu2KOjKF6IhhpvQRPVYztvG6HiniIY2FyaEl8QRnFI1JNLvvLpabcM0+gbFh
 rCQAadSnks3ofyHLVD0QxsxsV4qg6DJ+wsTsEuZ3e8VpvLycD0yKd3wTELW+jjG
X-Google-Smtp-Source: AGHT+IF/gOolHvWa7yF/iCUiShP09wS2f5aMQOTOUG5/8f9sFilzuUtqb9Nhi5hK3cHa1R8oVHUSSA==
X-Received: by 2002:a05:6512:281b:b0:540:1fae:b355 with SMTP id
 2adb3069b0e04-5422956bdc1mr180935e87.52.1734658117831; 
 Thu, 19 Dec 2024 17:28:37 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54227a89c2csm170540e87.71.2024.12.19.17.28.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 17:28:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 20 Dec 2024 03:28:31 +0200
Subject: [PATCH v2 3/8] drm/msm/dpu: link DSPP_2/_3 blocks on SC8180X
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-dpu-fix-catalog-v2-3-38fa961ea992@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1310;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=EPTpddReUdMYZ2WS7Ttu60U++lU0UI8BvSWUbWEeV/s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnZMg+ULIs7Do/CbVm2Z6XMut+0mgevQOhJC9Jk
 e4FFOsZiDmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2TIPgAKCRCLPIo+Aiko
 1bvoB/wJarARi6agh4POgzBYGs/R1Pm89eSXojW6joFnqCgC2QvVp+stKH+rcPi2Wl6d+0/o+aH
 BdAxxQcwy/OW+NhaRsZexjjzlOncTAtHoKB+we8AoFIM3g3n9c8hwFokeEvb4VhXrOul5w91yhe
 DsyAFaF3+bmiobrYFvxa7bnUgIPGRCkGOQntnBoAZGXpN5cGaHUO/JcJO5wEEtEB8O3Ok8IpFpd
 89rOzGUCUP4i+RKYppwE1gmtJQoprSHu00XVXVaFBWacndtQwQW6nYWE96xuRAzuc007SEFWj1L
 mYri9Rmscfeo9wbdMqO/zbgQx35nRB4C+0VZMtLLzS2Sj4aQ
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

Fixes: f5abecfe339e ("drm/msm/dpu: enable DSPP and DSC on sc8180x")
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index bab19ddd1d4f97805c1bfba8ba6e117ae77c6c2e..641023b102bf59352546f0782d9264986367de78 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -163,6 +163,7 @@ static const struct dpu_lm_cfg sc8180x_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
+		.dspp = DSPP_2,
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x320,
@@ -170,6 +171,7 @@ static const struct dpu_lm_cfg sc8180x_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
+		.dspp = DSPP_3,
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x320,

-- 
2.39.5

