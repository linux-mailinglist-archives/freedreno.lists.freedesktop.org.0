Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7815A2DAE3
	for <lists+freedreno@lfdr.de>; Sun,  9 Feb 2025 06:06:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 718B810E476;
	Sun,  9 Feb 2025 05:06:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Sc1GUipX";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47F1710E46E
 for <freedreno@lists.freedesktop.org>; Sun,  9 Feb 2025 05:06:54 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-5450622b325so738932e87.1
 for <freedreno@lists.freedesktop.org>; Sat, 08 Feb 2025 21:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739077613; x=1739682413; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=B1i3ljPbx6n5V5EZfIVWiBHAB9nww5tkVOh9CuEMj1M=;
 b=Sc1GUipXHXqz5g5yrcI1b7DvtLSN9HZeujncQ9GUAVKkT4t3bWlxvoWwhdu31/1B6A
 NRz695x66mUndIWOYEv64HV4AVhUYPd52hl311hmLqUa+lQ+0HHM9nts2nL38tTMxLlN
 qlYrlP1IBGz1EMLWYJIR0kPfXYSj2tPSnpGgquZJcAtYH6jN/ptgu8+/ISzpBEwfgbPD
 myg4xJS8r/CftvZEP1LnMGwiF9OGp1Sg9Kbs4TU+T3uopc0AxR1BBKwY9gCIhkbEbnQ7
 TziZxIJwnGOLJ6i6iK3rF956zBYyURlk3z/ZzkhMM3HYJkEIJld0hAWTcyph7mlsFJwk
 oNdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739077613; x=1739682413;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B1i3ljPbx6n5V5EZfIVWiBHAB9nww5tkVOh9CuEMj1M=;
 b=s3qbSqJC8YJu8buwzgU/3pNF4/VvACAn7xCoy7OOzzL6qXY7/cMZCxvQE9AQ6Fuw+z
 yorQyhkjcmECMudwXFxZGDtc70dovQIK2spNoxJMDcJQZg3VXqKatM16gya8EsbMeh3G
 YU0tYRFDmgNAZuu7BEaRW4Hqhxzje/kAPiAwStPoLR4M7uk6TIQ12SQvXKZT6VWxYfgU
 yytKqKhux5ruexa1wQkKyLxyDJmPbzlLSEcqCsfyWvokOVP8Mhj/app4cRH9aWgQQztz
 51sL25qehWCkunOIcwNzm6GcDC/PA5sLNyn0SkIiUDNk9CsLwcIIiAYcAZwkyzWtf/Qs
 /vwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXquwM031p8/Ox4gldLXHdSZWH1bIzA73ogWVHaOSrwVcBRywFxLv3yUS3RU5LiELGA+RLNQv+mWKI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwhRZ01C1yVd+96BixXdnM4UHszMwTGTNbixo9SWYz2Lul5Iaqx
 AjSWBOxYcihjScEApG0hUrIPzdDobVS5eABVtjzZCPBvdNZ+ngf/WPAAazKSiTE=
X-Gm-Gg: ASbGncusiYh0FThnKHM7t1vinc2cEBavSvGql5YdIgSb4CRbsfPJcXoySGlKfCEGMoE
 9PM+V4S9LW3RNcbPk15IDv5wJDGocazVQoZIWaNMu4j3j6skU0mp5WqFy78DNyt3ou27k4x9SuW
 QQloVPbGZnB8GjsBc08qjuwM1BOHZ1e4rA2/NznDsPpKat3eIQPDV2iyqQ2gyddUUi+zmaTlAwX
 GH1ZzrBOdTdaPkBhYduMqpetKxaaD9ZlIsPSwYGQPidL0ehQ00KvJjbqUhrxM9BdPFcto7cW9cK
 FTNX71++TNX+x5ELV6Yb7Nw=
X-Google-Smtp-Source: AGHT+IHhrPXiDJCWG6hpdLlaVYwDxoqtPiYGeBTQzAk5uMXShtQkmyqWTzBa2iy7/Jghy3XHQJdKLg==
X-Received: by 2002:a05:6512:6c6:b0:545:a2a:589 with SMTP id
 2adb3069b0e04-5450a2a07f5mr166047e87.52.1739077612585; 
 Sat, 08 Feb 2025 21:06:52 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54506ef1733sm245576e87.1.2025.02.08.21.06.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 21:06:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 09 Feb 2025 07:04:47 +0200
Subject: [PATCH v4 03/16] drm/msm/hdmi: convert clock and regulator arrays
 to const arrays
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-fd-hdmi-hpd-v4-3-6224568ed87f@linaro.org>
References: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
In-Reply-To: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2818;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=V2+u0bC4oPjC0u3tfxjS0BIJRTLcQO+x+kAXxGzeCl4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnqDfh2U+hzoadQ+a4byMFO75tIEaeUu43yMPSa
 iC0d4FmLmCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6g34QAKCRCLPIo+Aiko
 1T1FB/9pRpx/pOBOFh/T4LCyxNxh51SDyyHMf7w5RwtVQUYYvUl6RPPtKbYZX6F7YFIczn7O7M3
 1gfOvnRH65inkTaEF2DZBWuCJipdG1GEYIWjC88ltJxAm99olN1LBL7YLMiJzWzhDG8j4cNGDS/
 127blgDqZ452VTRN+ZtNGgTaRGermUVSGfSpF2solm3/zCP8DsgEIGbke6BpZQAE2Gm2VWOYPlS
 /atMVixdLSgxMBdaayyA9p1ngVbm2hYara+DNebVlfi5L+RDAoBsRKWgydKADOnz/hmZDtW52EC
 WDo18zCKmEjFb8BKbS/IpcYJMxaCpqA9nUlKPpj4e7vV3SCP
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

As a preparation to the next patches convert 'static const char *'
arrays to 'static const char * const', as required by the checkpatch.pl

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 10 +++++-----
 drivers/gpu/drm/msm/hdmi/hdmi.h |  8 ++++----
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 248541ff449204c72cd444458dadb9ae4a0a53d1..9e9900882687fa2ae4a734d5cf10b5bae5af2f87 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -224,17 +224,17 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 	.item ## _names = item ##_names_ ## entry, \
 	.item ## _cnt   = ARRAY_SIZE(item ## _names_ ## entry)
 
-static const char *hpd_reg_names_8960[] = {"core-vdda"};
-static const char *hpd_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
+static const char * const hpd_reg_names_8960[] = {"core-vdda"};
+static const char * const hpd_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
 
 static const struct hdmi_platform_config hdmi_tx_8960_config = {
 		HDMI_CFG(hpd_reg, 8960),
 		HDMI_CFG(hpd_clk, 8960),
 };
 
-static const char *pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
-static const char *pwr_clk_names_8x74[] = {"extp", "alt_iface"};
-static const char *hpd_clk_names_8x74[] = {"iface", "core", "mdp_core"};
+static const char * const pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
+static const char * const pwr_clk_names_8x74[] = {"extp", "alt_iface"};
+static const char * const hpd_clk_names_8x74[] = {"iface", "core", "mdp_core"};
 static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0};
 
 static const struct hdmi_platform_config hdmi_tx_8974_config = {
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index a5f481c39277631b7a19d294b086d6208be26511..381f957b34305494cb4da0b7dccb73b6ac3a1377 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -84,20 +84,20 @@ struct hdmi {
 /* platform config data (ie. from DT, or pdata) */
 struct hdmi_platform_config {
 	/* regulators that need to be on for hpd: */
-	const char **hpd_reg_names;
+	const char * const *hpd_reg_names;
 	int hpd_reg_cnt;
 
 	/* regulators that need to be on for screen pwr: */
-	const char **pwr_reg_names;
+	const char * const *pwr_reg_names;
 	int pwr_reg_cnt;
 
 	/* clks that need to be on for hpd: */
-	const char **hpd_clk_names;
+	const char * const *hpd_clk_names;
 	const long unsigned *hpd_freq;
 	int hpd_clk_cnt;
 
 	/* clks that need to be on for screen pwr (ie pixel clk): */
-	const char **pwr_clk_names;
+	const char * const *pwr_clk_names;
 	int pwr_clk_cnt;
 };
 

-- 
2.39.5

