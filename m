Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D981AA3D7F4
	for <lists+freedreno@lfdr.de>; Thu, 20 Feb 2025 12:15:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B16210E942;
	Thu, 20 Feb 2025 11:15:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="u51D0B4u";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93B6410E941
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2025 11:15:01 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5462ea9691cso957830e87.2
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2025 03:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740050100; x=1740654900; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=v2FT69grsgtQGwodtPuDBrmjAJehPRULckabnrzgeOM=;
 b=u51D0B4uEAQCa1B2ZUIF5Wsj1bc6dT5lj5QB5id6JWOhdek2oT75zn6AS8E1EvVyv+
 iywuoiRjrrryAP9U3nF/RJu01zmRY1+OkwWYe70fgIf4wvklxWMT+V3iFhQPisK6Eu1x
 MDE652wtOQoh0U8SC7xrWzT+QFY6mlU/I6J+SBBcuLrFJIziASMNOh2IFFFGFUmYa6j9
 YPKqL5XGNU+q34P70xx6H5WeNpVqenGxbr71fa6Vq30SbzQlHUugjo8Uoavgn1yFRWQ0
 BmX+3sB1AqbyADB9tIGiXa/H2hAY6NQa3SoF+nYeQ5Dyc7y9u7EKMIgfoRuhTsSbqs9x
 HnMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740050100; x=1740654900;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v2FT69grsgtQGwodtPuDBrmjAJehPRULckabnrzgeOM=;
 b=YmCCoyyYnKo3rRVLKO3Z7tBkkKjROOCCXu/0EovOEu6H7YPaTUQznt5TUqgiKRRhcf
 CbrUEHjnGu2fyCedCAkdp4HAIUIlQyfvHYFOQ75tY1Lz1M+ZuneEMK0adOwklgAQrqva
 JjIT/knZEHBy1O+sUoyEApb+G1R9LoEjd9p9S9UAwzrzAjcXZ4oKd+yPIPA4cYl+J79T
 LckWbYddiskWRk7oH5qLJYC1o2Q7GJUUgFUBRcue8PhIXBNXVdYRNk/o0NAs8fIaMNjO
 921/gFNIhkdeQUdz51w+UrH9jS+DNr4YTXo6qgYLmKwG/ZYMsmHJbFDpMo0+mXeG8NVL
 GXCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRRBcVKIl1p+Da2HQiIBkEKXHB5vfJw4QDhLpFp7I9Wx0ccWymJib7wltSe7wFUvnZi5JIp6KnBUs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXCf0QYivDUWZzSbF0n5f6rPnEBZJkQHpKk2vgKzrrMYSJN++u
 lc+Awop1btjERhBLhu61g+znkVaNMTkacuGl/Ld82GXh7Ot8Rg/aq8LQxQcUL6c=
X-Gm-Gg: ASbGncvoENRGei6IHjjsiOhk91ny8CYZpiLNOgu2kES2MM7DXJ4mfFG8CwSe2sGXabR
 60pJPh5JMnoO5exLWuKCDwe8V24oUFyEdBUIXE8e3mNAHRRrnGZeLDTUuFBF6kDx/STUze+ui8m
 2Yh6UgoOL+RyXGr/x195Z6n/1zEqN68L1Bz3Qp7oI1u5IOR5p5fooVkbMkZBIsT9Mis/jEmgG2q
 Olc4Nq2e+939KUIJm/IENrjJgBcwyrYHjRWgKb3QlHnsPlJ0eZsUIt60KS0TpL/Kkzh/iGUIjw7
 Wa6FBb4BJpPzEUd4D+HEf9U=
X-Google-Smtp-Source: AGHT+IEK5YepgQWPALUfLRJKi3C8erOz++2sLryCYJu3ofhHXWr7LbJxyrpPkJIZbnwDfcXCA7dAIw==
X-Received: by 2002:a05:6512:1189:b0:545:bda:f17 with SMTP id
 2adb3069b0e04-5462ef201a0mr3010127e87.44.1740050099792; 
 Thu, 20 Feb 2025 03:14:59 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-545297856c6sm2056164e87.142.2025.02.20.03.14.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 03:14:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 20 Feb 2025 13:14:44 +0200
Subject: [PATCH v2 2/7] drm/msm/mdp4: drop mpd4_lvds_pll_init stub
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-fd-mdp4-lvds-v2-2-15afe5578a31@linaro.org>
References: <20250220-fd-mdp4-lvds-v2-0-15afe5578a31@linaro.org>
In-Reply-To: <20250220-fd-mdp4-lvds-v2-0-15afe5578a31@linaro.org>
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
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=922;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Iuu/rih2gTkZKK6Ghs6dsVuCdf8xwLg/vMhkHtsubTw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBntw6rBhceXrSdx0nb7uB53zSoFWDO1AkbXhVhq
 +gcl/EdOZuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ7cOqwAKCRCLPIo+Aiko
 1YGzB/0Xno3UiIYTOdud4CEcJfrYiPKQ+eDCZMrq2/oZ3IKWU8zODmyCDhFLUcbZQ0C04pdG40O
 rYOSy2Jg8WQNkxq444ypAAVL3fV3LD466bkbnE84alabWsqUc95eCsbpatXcR1zt5C0SXGXZiZc
 Md04vbC4VX36PjRWVJigYfHQbbINZ7pG28jzX3Sk3GzjQ4frPc8PlEI7NBw+0T9gPcqfovjJp4a
 j+JLYqZ2LQFVh4CThB5jajAT1whTWnjZZNxaUgEld9idFUVCoLrRLazh8ADiIT3oMEBF9UbJt2J
 FY1lN1Ofmnmmuw+OeJcGqDv8RkS5ZlbAx+7roaozkAtlnVV3
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

