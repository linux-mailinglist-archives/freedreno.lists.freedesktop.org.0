Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7262D9DA994
	for <lists+freedreno@lfdr.de>; Wed, 27 Nov 2024 15:04:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA3F10EAEC;
	Wed, 27 Nov 2024 14:04:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="R0K+ZbP3";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA62E10EAE8
 for <freedreno@lists.freedesktop.org>; Wed, 27 Nov 2024 14:04:52 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-53de880c77eso2712421e87.1
 for <freedreno@lists.freedesktop.org>; Wed, 27 Nov 2024 06:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732716291; x=1733321091; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rzfmmxXcC5nfkCV4gc5yUHDuhltopU/HIPPIiYJqWlY=;
 b=R0K+ZbP3MRp2+k6B7jCJmYAbtDvzwbJzhOYTZbrrIHHrr0yhfMtRKgm38UqPzO4/30
 TSORUvpWV+PLBDD5JgeneB8ydNzBj0MGh9mTogIf3ahKHC4kdYD+o7T8zympMH2q/aju
 KfyjssDUx382CAZ8+pYvYMROZVHQhpuEr3WNtmEk1bhec61w8/F4tR4k+D/CKOB9t1XH
 FRoEsMVlwrwC7wDyDng7FGonaOnkonvXu7rFP7vVMXzIRq8GvZpzgVsI9/GWwnkkn0aC
 O20zTB7qcDhXmcgXD8wlpnxSPxn+7wj619V0cHEEoa8nPdA0OWgC1VG1EAByjI92CiTs
 MsIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732716291; x=1733321091;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rzfmmxXcC5nfkCV4gc5yUHDuhltopU/HIPPIiYJqWlY=;
 b=uRMzIVerqIz/Eu/5R06kW8en3LSIt7uQnY3ZjR0Rq4AOH75rv3SeeAm84xrC3pMlLJ
 tqJOQhVdMMrwLxn60LuFL4NWpgpLLani2ZeKrd04RY31liJwjtBRzBWRKIrn15AgZ5JL
 9+zHuxsT8OEkh8SBwI2Sf/AivkXl692VxxL7qZ4zsQq05jVESHmvvccuqd3I3oOwec8J
 VOjPepPpcVDLPCuWwmkb6714HOdaLg69E4UMPGggW0pAn4SQgNN3jKcEsMEE1lFKMWPK
 9BN0cqAuCkhbGvSYYCch1YAa748ySZB0Zdsca1tvecIJgKl1+pAs1910CqeV9rUwKJJ7
 1/1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQ5lDtRaqp9AswyMI/azDWuWG+ksWNBuC1kB28YQaS/BELaaYmQDolNZhG3sGDDh+6ObQ94bQEB9Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyk1vwGZXaF3AjQW//c4lUNg/K+UPk7AM8pZ5YjWpxXLfQr1fKT
 7tUOksfw+Xnzv3z2g5IgzVUhxGmiazDjWf1fyIzbS5PaXcZHM7W/HFJKFYxOyAk=
X-Gm-Gg: ASbGncs0+tNddSFFHybVnZDwQEf2CbTDAmMiLzGqdH+Nk4d/fOmNzAmQ/0TfX0PGGZU
 VtPP/YJ2N0JUGIbCmzxpMgKMrIjsprCnvXdv1rMkiowhq31J0pV9cgysA2MRzwN8O7mLYzGJLOr
 kD5g4DwJQ2naDZuWc9yLLD4FJ59BW7GCQuH+hi5rRLMwNZmqv6QhY0NHJppusksNsL67tQJVdTq
 6BQMDV4ONejohmg3U9nFdhPDrEcxY7mQncWgRwskpmxYcZDfeEwE9iStA==
X-Google-Smtp-Source: AGHT+IE2Yz6mOY37264WsE3DpCDAykgqJRgeSNe3trAvSeoBcV7ImxZGXM35npt/8X7BY4n/kF3gwA==
X-Received: by 2002:a05:6512:ba6:b0:53d:e5fd:a44a with SMTP id
 2adb3069b0e04-53df0112217mr1863531e87.54.1732716290684; 
 Wed, 27 Nov 2024 06:04:50 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd44cb7c5sm2157291e87.122.2024.11.27.06.04.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Nov 2024 06:04:50 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 27 Nov 2024 16:04:34 +0200
Subject: [PATCH v3 3/3] drm/msm/mdss: use boolean values for macrotile_mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241127-msm-mdss-ubwc-v3-3-9782a7c2b023@linaro.org>
References: <20241127-msm-mdss-ubwc-v3-0-9782a7c2b023@linaro.org>
In-Reply-To: <20241127-msm-mdss-ubwc-v3-0-9782a7c2b023@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Connor Abbott <cwabbott0@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3073;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ErNLlV3VyQUaeuBrJa+IVJY8nm3FUxVk1dHk6f1cd6s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnRybz5EfeQNFPp88Ula96PZeIRf/rzwux4YPIF
 4srT6SRd8eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0cm8wAKCRCLPIo+Aiko
 1c/GB/4mwY3uWvHXGyq/FbPpZu83Lz4gH8Aux84nF/nOP7nQF3NArHkTbPL2B3q+8GXtGQj78EK
 qp7oH7AJiyd93pxBlsc1KdkNxOL9QGZnYxnZsk/iCYPXzGsdnqVY+Xj47Gb9NAtX/5tNRbwX+HP
 nQaABEz0l44nD6C8RPgzdx/Lufo9hx6tf4+x2m/LR6CaDZOpyD1mJPQA917YlqkpuhXBnE4XvZA
 c3zy3IfY/01wXEzbMBNBcM/gstwVu/tN/J17OHIy8qy/wKiYU+20JBK521KzalJWM1JHqQyOHFu
 AGuV/fzcBvSjXKwogKpufaDGitf2gu9xGh5fuhQGHoW6KiBL
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

The macrotile_mode is a flag, not a bit value. Use true/false values to
set it rather than 1/0.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 16 ++++++++--------
 drivers/gpu/drm/msm/msm_mdss.h |  2 +-
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 87ada64133924d712810c644a5ff660a082c2abd..6dbeea860abfa1cad8e1da926c66b825938933a0 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -588,7 +588,7 @@ static const struct msm_mdss_data sa8775p_data = {
 	.ubwc_swizzle = 4,
 	.ubwc_bank_spread = true,
 	.highest_bank_bit = 0,
-	.macrotile_mode = 1,
+	.macrotile_mode = true,
 	.reg_bus_bw = 74000,
 };
 
@@ -607,7 +607,7 @@ static const struct msm_mdss_data sc7280_data = {
 	.ubwc_swizzle = 6,
 	.ubwc_bank_spread = true,
 	.highest_bank_bit = 1,
-	.macrotile_mode = 1,
+	.macrotile_mode = true,
 	.reg_bus_bw = 74000,
 };
 
@@ -615,7 +615,7 @@ static const struct msm_mdss_data sc8180x_data = {
 	.ubwc_enc_version = UBWC_3_0,
 	.ubwc_dec_version = UBWC_3_0,
 	.highest_bank_bit = 3,
-	.macrotile_mode = 1,
+	.macrotile_mode = true,
 	.reg_bus_bw = 76800,
 };
 
@@ -625,7 +625,7 @@ static const struct msm_mdss_data sc8280xp_data = {
 	.ubwc_swizzle = 6,
 	.ubwc_bank_spread = true,
 	.highest_bank_bit = 3,
-	.macrotile_mode = 1,
+	.macrotile_mode = true,
 	.reg_bus_bw = 76800,
 };
 
@@ -689,7 +689,7 @@ static const struct msm_mdss_data sm8250_data = {
 	.ubwc_bank_spread = true,
 	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
 	.highest_bank_bit = 3,
-	.macrotile_mode = 1,
+	.macrotile_mode = true,
 	.reg_bus_bw = 76800,
 };
 
@@ -700,7 +700,7 @@ static const struct msm_mdss_data sm8350_data = {
 	.ubwc_bank_spread = true,
 	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
 	.highest_bank_bit = 3,
-	.macrotile_mode = 1,
+	.macrotile_mode = true,
 	.reg_bus_bw = 74000,
 };
 
@@ -711,7 +711,7 @@ static const struct msm_mdss_data sm8550_data = {
 	.ubwc_bank_spread = true,
 	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
 	.highest_bank_bit = 3,
-	.macrotile_mode = 1,
+	.macrotile_mode = true,
 	.reg_bus_bw = 57000,
 };
 
@@ -722,7 +722,7 @@ static const struct msm_mdss_data x1e80100_data = {
 	.ubwc_bank_spread = true,
 	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
 	.highest_bank_bit = 3,
-	.macrotile_mode = 1,
+	.macrotile_mode = true,
 	/* TODO: Add reg_bus_bw with real value */
 };
 
diff --git a/drivers/gpu/drm/msm/msm_mdss.h b/drivers/gpu/drm/msm/msm_mdss.h
index 1714bb41b838c33f3da19d93c5c1f5c53cfbdbab..14dc53704314558841ee1fe08d93309fd2233812 100644
--- a/drivers/gpu/drm/msm/msm_mdss.h
+++ b/drivers/gpu/drm/msm/msm_mdss.h
@@ -13,7 +13,7 @@ struct msm_mdss_data {
 	u32 ubwc_swizzle;
 	u32 highest_bank_bit;
 	bool ubwc_bank_spread;
-	u32 macrotile_mode;
+	bool macrotile_mode;
 	u32 reg_bus_bw;
 };
 

-- 
2.39.5

