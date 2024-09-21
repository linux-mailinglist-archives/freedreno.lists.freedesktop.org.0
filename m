Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C6597DC23
	for <lists+freedreno@lfdr.de>; Sat, 21 Sep 2024 10:17:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC2E10E85C;
	Sat, 21 Sep 2024 08:17:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tJNTEvUx";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ABB410E85C
 for <freedreno@lists.freedesktop.org>; Sat, 21 Sep 2024 08:17:45 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-5356aa9a0afso4723945e87.2
 for <freedreno@lists.freedesktop.org>; Sat, 21 Sep 2024 01:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726906663; x=1727511463; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=SVsyILzzvjiOy2yaVn/07EEy8eWz3i45ZaANjyZGvio=;
 b=tJNTEvUxx9FMUGp2w8QVryBnEfNC0Mlf0RYucEB5jlH0CrI2oE20pYULnfepyh8rgt
 8bciJPWPpiB9FPenIB9sxd6syhCf7ka7CYqvQqp24WMqO6bV0K+Cma4S/N6VsAKBCL48
 ScfSGg1frhDOpgC6nXLZiKtuNC5Y9LMojiGCZS8EzZdS9mc6ldd67JEuaw6on0ehuS2v
 T1C0anLYfQucILcA7ypoqpvl6XgM2HO64QfaE7aaJn1VoVBD4E+BwzaBKyHZZk/iBnul
 sF+/++kYwgsnauOdKckLPtTxv+9q0bpsjrV1JxQr96iLXbr3yWe3vtLBLS3IDc2yQQf4
 u4YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726906663; x=1727511463;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SVsyILzzvjiOy2yaVn/07EEy8eWz3i45ZaANjyZGvio=;
 b=akMNtNFyB4B63EK0ZqF71Yxn3hQK8kCqsNRrVsYA1tuZ5OoDYP65mtZTMHIRNhJC3t
 82yxL4JXXJ/Hjo8WEG//4L3h/G1Aj5kSfHQEyC8LrgqJjX+m2Hoi0WIMIEq+xpgxQBA1
 VVQURlnANIvTcuGJ+e1aVyqLUetnLrSmwSYxa6oEbPFkEepXSSZ7uIDnMlMSJwm/QXhU
 9ibRTG43V6R7VyqjTYAIFYYFI1Nd5zSy8rPwZ/YA5xruWDGXlMsST2IZZI6TAzDcMPBh
 x6rTeEuc9zppmtJIpZg1fr3oojMqQjxbig1P11fagTojtREidvCTAXqOrpmSCqmEWy8b
 iEsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWliUcfAwEll7ut22Wvr+57ViIycBNRGL+WBPf6KMT4tHC4+rCj6YhItusjMDLbUzhwBhRJU2XMh7w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzmdzzs9nCXG9H2Jy1Eub/YyW5egRI3L5gWshOeIMH8oNPcpCkf
 WCEatZ4uP6tJLI+QyLinedl6coqJj2L3gJSCIet8LZbtS0oy5aX9N3lu2Ya/DFI=
X-Google-Smtp-Source: AGHT+IFPY/W2L+v0opGRZsevBEm6pIXjNTUdy2RRjJsvIyR13eOixR1PdLXWb9cbd5UYsG/wDpqcXg==
X-Received: by 2002:a05:6512:1095:b0:530:e0fd:4a97 with SMTP id
 2adb3069b0e04-536ac17ba54mr4389006e87.0.1726906663478; 
 Sat, 21 Sep 2024 01:17:43 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-536870968d1sm2466380e87.175.2024.09.21.01.17.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 01:17:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 21 Sep 2024 11:17:32 +0300
Subject: [PATCH 4/4] drm/msm/mdss: reuse defined bitfields for UBWC 2.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240921-msm-mdss-ubwc-v1-4-411dcf309d05@linaro.org>
References: <20240921-msm-mdss-ubwc-v1-0-411dcf309d05@linaro.org>
In-Reply-To: <20240921-msm-mdss-ubwc-v1-0-411dcf309d05@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2564;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ScCRd7+z7cwAGX0LzQnkBaj1sUTBN7g+ylhI1wBf8No=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm7oEfFUNz63SZIIIv4PSfaBvDuI15ysOw/396a
 6UffauUniqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZu6BHwAKCRCLPIo+Aiko
 1dLUCACLFFbWklq276VM0/8R0H4sDEzmkz4gKnwfDpRPWAfsBCwUuuo+yznN+gqcNrh5FQKRyJq
 4a6Lq5j9qgRAt92C9N3elKB+wQXyIy8k06pGS/gL/eWnx/2YpQJ1seTn0GcN9iEOEHyv2petgEK
 uT1h8YyflDQfylQpRjWCdItA7GaFNpShxp4W2cqcCf5LyFC7c3I1Pcvquel4wv1n15N8mc5xtvt
 PuSQ22r/G0Mlmt8BKBd0jpa/dGfK6YwDmSPZsYy0whHFOajAVpZXDaQBoGunDeJyGmpA0tRhLGr
 BQfl+po4ZAG2aTUqjR8nNkWJlMSoXHaIS+8hTXCMv7Qr31zK
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

Follow other msm_mdss_setup_ubwc_dec_nn functions and use individual
bits instead of just specifying the value to be programmed to the
UBWC_STATIC register.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 17 +++++++++++++----
 drivers/gpu/drm/msm/msm_mdss.h |  1 -
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 7704e1c9eb2a..0b49187c52de 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -166,8 +166,16 @@ static int _msm_mdss_irq_domain_add(struct msm_mdss *msm_mdss)
 static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss)
 {
 	const struct msm_mdss_data *data = msm_mdss->mdss_data;
+	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
+		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit);
 
-	writel_relaxed(data->ubwc_static, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
+	if (data->unknown_3)
+		value |= MDSS_UBWC_STATIC_UNKNOWN_3;
+
+	if (data->ubwc_enc_version == UBWC_1_0)
+		value |= MDSS_UBWC_STATIC_UNKNOWN_8;
+
+	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 }
 
 static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss)
@@ -577,7 +585,8 @@ static const struct msm_mdss_data qcm2290_data = {
 static const struct msm_mdss_data sc7180_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
-	.ubwc_static = 0x1e,
+	.ubwc_swizzle = 6,
+	.unknown_3 = true,
 	.highest_bank_bit = 0x1,
 	.reg_bus_bw = 76800,
 };
@@ -628,7 +637,7 @@ static const struct msm_mdss_data sm6350_data = {
 	.ubwc_enc_version = UBWC_2_0,
 	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = 6,
-	.ubwc_static = 0x1e,
+	.unknown_3 = true,
 	.highest_bank_bit = 1,
 	.reg_bus_bw = 76800,
 };
@@ -651,7 +660,7 @@ static const struct msm_mdss_data sm6115_data = {
 	.ubwc_enc_version = UBWC_1_0,
 	.ubwc_dec_version = UBWC_2_0,
 	.ubwc_swizzle = 7,
-	.ubwc_static = 0x11f,
+	.unknown_3 = true,
 	.highest_bank_bit = 0x1,
 	.reg_bus_bw = 76800,
 };
diff --git a/drivers/gpu/drm/msm/msm_mdss.h b/drivers/gpu/drm/msm/msm_mdss.h
index 69095c18ab4a..521d4e6b8043 100644
--- a/drivers/gpu/drm/msm/msm_mdss.h
+++ b/drivers/gpu/drm/msm/msm_mdss.h
@@ -11,7 +11,6 @@ struct msm_mdss_data {
 	/* can be read from register 0x58 */
 	u32 ubwc_dec_version;
 	u32 ubwc_swizzle;
-	u32 ubwc_static;
 	u32 highest_bank_bit;
 	bool unknown_3;
 	bool macrotile_mode;

-- 
2.39.5

