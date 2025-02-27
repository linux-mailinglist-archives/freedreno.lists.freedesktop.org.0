Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 439B2A47274
	for <lists+freedreno@lfdr.de>; Thu, 27 Feb 2025 03:25:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17F5410EA19;
	Thu, 27 Feb 2025 02:25:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZWuZoiLP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BFCA10EA16
 for <freedreno@lists.freedesktop.org>; Thu, 27 Feb 2025 02:25:31 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-abb81285d33so84131466b.0
 for <freedreno@lists.freedesktop.org>; Wed, 26 Feb 2025 18:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740623130; x=1741227930; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=nwMJpPPmQJzExGwtrw5qRSd6mRYkoPvcGAO5V9qYYKM=;
 b=ZWuZoiLPRpgV/k+fJkr7Ro8dvRKTlBBBidxNe6+9hgPZl8kiPQwxlP3Zxbbs7anS3I
 0uvuFtcxaHwXwD4t/7ReF0CdUJQZwpLTjgWSI3R7JenP9rvD6HUN8iY2dxkt1ZOyaT6A
 4ECeBUlGjcB6CZ2t7Z3h92INp8Mxo+hhZBheyzltSvTAJEEDPKzE5vt3RoKjofWIGSSN
 Qy5ucFLwx5TNOzatX21XrcKDNflwbQ5Lov5dW1yQlHHzSAJnDtT9RmJihAMEHFgnrgcH
 9a0Z2mOCsmM75Q6ym5kjNclTOazR/4YiAqjFeUtlO6YaZK8Iuabr4tkEAg8Rt1nDUD0V
 JfYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740623130; x=1741227930;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nwMJpPPmQJzExGwtrw5qRSd6mRYkoPvcGAO5V9qYYKM=;
 b=YZbNe5pRnigowWvBiqsZQfVAl8ibxRL7Tuxm/7wr6UUcTgzLsg8JqKQooTIAM9dg7Y
 BHEtFxhgAh+FnY8uVxTovqAErujnpnY7w78lcuesstvvLZBX9q0SrQVxHjfFFR9t7JQR
 jnILvETONfELNht+eRHw1p85jGVzrhzDynOjhebf6AsN9GuxANW553FlD4VKMrSf158a
 kXeAgwQf7+tNn+s0ILqTvx58pXmhwBLIXzQoR99zrBWanjLvRmkf7Q+Tk8lmJjTXfRYd
 IGZlKrzvBS/HVvs4zMpHme93AO2DyIq9ZszD9TciNH0EQ+nz2r0N/GJ8D/NC6LmAdzBa
 FS3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXezeqQY3icnQcFEI2gFr6GexqH9MZpaHIhwzbYaNnO3Om3qm7JT/u/W3L8mRO7BbAMwJYSFkc5VP8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx31+J0oQlpJmevs1Dcnke3implBZXYNmIlvyhd6bQec3LB2TsD
 wcoEg4epcd2SwTolI7757LjOHK50rgarzkBXUU7Ed/rOcoq5DOGQSWhV+l9/Jfcj44D19vTGMU6
 zyMi+Jw==
X-Gm-Gg: ASbGncuECWKuzNpkinr9Q6/CSYQTU0qD24kykVK5CTsBcReq/kDCu/M7DkLYnDr/l5y
 8jr8YYN77kIXsj7lEjmNUowd+trPL9CX42Qp4w7wfSqlGl6kzmn236uGE/gFWwUmFPc7GoGbPy/
 V3G6He7oekqkF9eUA+x3GwQWZtMMlMptKTZIJr/yQs8tdPmszot0A/SZfaU8Do0JQizCT7FFY9p
 ZBivASSRTRqMSxf6IDKcF1u9E4J30f/Dq/8CXn/uenVSXgf7gCLlz27FGrMfE4tRjCA7m71m5IE
 r+aX6Y7x+qgenvzHU4QrK5SGHmD7xTf+Zg==
X-Google-Smtp-Source: AGHT+IFMFzSt2wsG3oOm+5w5wwMdb2DuK5Yp/Au+CFco5T/pzSUdUvjy0J4YD00jtRalqEX70RhAkA==
X-Received: by 2002:a05:6512:200e:b0:548:794f:f9dd with SMTP id
 2adb3069b0e04-548794ffb8cmr4463137e87.10.1740623119107; 
 Wed, 26 Feb 2025 18:25:19 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-549441742a0sm48067e87.5.2025.02.26.18.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 18:25:17 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 27 Feb 2025 04:25:10 +0200
Subject: [PATCH v3 2/7] drm/msm/mdp4: drop mpd4_lvds_pll_init stub
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250227-fd-mdp4-lvds-v3-2-c983788987ae@linaro.org>
References: <20250227-fd-mdp4-lvds-v3-0-c983788987ae@linaro.org>
In-Reply-To: <20250227-fd-mdp4-lvds-v3-0-c983788987ae@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=983;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ydZYZoA0TUi+Gh3S8eUOrsgEJcPFXVh59QDIeik/wpQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnv80GyadA2VzNwTHLQ/rRvBiE8jpMBgAfbiyde
 YCGRYQ0O/2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ7/NBgAKCRCLPIo+Aiko
 1ZDVB/90aFrmR5KOT95tmB3pWLZEsq87+yhuvUptiF1UJSOURslGc6sVg9ydUx9NCix6I56zEbW
 3GyGXkGhjaQdfQhmFp7u32GGTj7dl9MzYhy+0vcprVXVPn3wkOfwYoL+ZP8j7EKEO0azkfZxNBo
 APuBMtzFjaX8PRcgo7MeQMyxLv5di8a/xaX5TF/0FE9FPAE3vnL4erAXNQvSqw1i/dUOr6BMqOs
 ysFDUPsAzvwcqlgqBgJav4+a2KJLzJrt2BDDeH+wsQ+b0SJ/koY1jFvs9pQR/VQ73GVc9rsWqjo
 G5DuZIKjsVNaD71Is+vFt/CQYparpNF4JOOIxVg1hnWhc2bD
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

Drop the !COMMON_CLK stub for mpd4_lvds_pll_init(), the DRM_MSM driver
depends on COMMON_CLK.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
index 94b1ba92785fe55f8ead3bb8a7f998dc24a76f6a..142ccb68b435263f91ba1ab27676e426d43e5d84 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
@@ -207,13 +207,6 @@ static inline struct drm_encoder *mdp4_dsi_encoder_init(struct drm_device *dev)
 }
 #endif
 
-#ifdef CONFIG_COMMON_CLK
 struct clk *mpd4_lvds_pll_init(struct drm_device *dev);
-#else
-static inline struct clk *mpd4_lvds_pll_init(struct drm_device *dev)
-{
-	return ERR_PTR(-ENODEV);
-}
-#endif
 
 #endif /* __MDP4_KMS_H__ */

-- 
2.39.5

