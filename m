Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D00CC0EBA1
	for <lists+freedreno@lfdr.de>; Mon, 27 Oct 2025 15:59:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A151310E4CD;
	Mon, 27 Oct 2025 14:59:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DfUXU0H/";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ADFB10E4CF
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 14:59:53 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-426fd62bfeaso2323919f8f.2
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 07:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761577192; x=1762181992; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fTz5FcespsElflIzSbbQg61xL3ePspm/n5VPFrGBCxY=;
 b=DfUXU0H/yvhrord756qDrG/d5tp1BK0a99v5e/vqY7Pgb5zA6YYNEpzkFBV6VGkq6i
 Xi+AMNiASvCdRXkUcrzQWCaYR+S9U8WuGjcvnKk8mTEivM/8XqhqHKSLwF5y7m/+YcMh
 rk74ORLVixlLwDNLPRET+ZOy7GEsUtux1d0ECyDO6nybVw5/zqQO8CTMf3TlRw0KaK70
 im4Gzxjy4oxBces0Vb+3NwdxiEIHiBEQknqKwx5EKWOJeKgF7Z70fsmccVFYvtMhvoo+
 1kHiNdNcOWjoz+27M4+12YfJulHIOBVRSaOZR+ujJCp9iMCfiabdlJQnoTWuLFZarcu1
 xo1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761577192; x=1762181992;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fTz5FcespsElflIzSbbQg61xL3ePspm/n5VPFrGBCxY=;
 b=O5d2xYWHZpkfJXlpR8nLqv2tnC+SGyZmXQSkh8+n3L0LeF4yrLjifzstDWmZaE996A
 1SXaBCWsnyYEmrh2NgPYRuVmKEK6YLZBDF2WpqE5EXoN7MyB/+jV54Qh32IRU4/6JHeW
 /RH5u94lIZ0mva8EFPGPH4lObIN4I6ohKoqnQKfOqj0RlC/5iRa/YfJTpXVswHX2u/jN
 xZ/O2j0tQsB/CHPF9UR+06VDI8VIwQXarW6tMiulZUTjsfrIGr5yJxyzwKTReQdIbrUz
 3R6dERpOcKzRBvvhjxTRfcx7EpgQM7vxpRcbu8fSVxrZl11NUlPc99Gpwc2/iH3v+Gth
 VaeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmngQqmOJdaxCpTrkpdV6T0qHQg9utV3PC3EdEL3MjVtwoH8I5NfuLYd7CMzazklakcAH2aK5PyF0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXzkeugsHGZiTsRO4aggLn5qUUOc45jsShM2/5bOAEKpGN3kg0
 Yj+k4+I8E8L16IlDeQzxbO1D48A+hpuZy6bye/ZLQAA48zEzOHWBzkXNk5UG6p7bCT4=
X-Gm-Gg: ASbGncsf2tSkvq7hUwv2cYpQo4sVPReNs3uC+WkjSx2mw1F+U/jkVVq3OhWSjZdXLWo
 JmpfJMDu7SYgUAR4pCtc4O4zH0lPNDsqyD4vgZ4VjIYJEu7oAAFzJBXIvDZ6YJAfkys1i4Kvknb
 WodWoE+Hk3L55ZUNswbE2W/AYqB2eWRMU9tCrvjen5DYbqAwHUwdzLXO3DoB5KF9L4IE4ZmYQyx
 G3Ij84d0FxSPjmgIda8H8BE1ywdZE4jzxCnqPP0ZL3JgMmBtz8MsXToid0KN8aDa55hXR+GTS7J
 reKxkrAOj8BmwLUCIXUwMZx4Um/Xs2OUh7196bA1g4JqZ2ZMqewDdc6sw9oz35JgEDsr9fU58pR
 g1bhmIq1rD3c/rM4qXiA/DzWfjrp75Z5idpZAKL6Bvg/AS92RJ4gGwxC1aERMn0xvhWDmIP2Haw
 ==
X-Google-Smtp-Source: AGHT+IHhucYcNoU3tpaY64qWm4OHaBuQqtRit8AElkIwAwfqv1bYtt/hH7Pt7uGACFZqBuWs5q+q7g==
X-Received: by 2002:a05:6000:4021:b0:428:55c3:ced6 with SMTP id
 ffacd0b85a97d-429a7e52873mr22632f8f.18.1761577191849; 
 Mon, 27 Oct 2025 07:59:51 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.169]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952df682sm14624801f8f.43.2025.10.27.07.59.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 07:59:51 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 27 Oct 2025 16:59:24 +0200
Subject: [PATCH v3 7/7] soc: qcom: ubwc: Add configuration Glymur platform
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-glymur-display-v3-7-aa13055818ac@linaro.org>
References: <20251027-glymur-display-v3-0-aa13055818ac@linaro.org>
In-Reply-To: <20251027-glymur-display-v3-0-aa13055818ac@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1580; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=u/HvMjY0aylTChFeyIjWmvaFpyJNj26Jf3Mm0ByCBoo=; 
 b=kA0DAAoBG19EyQCVFVYByyZiAGj/iNPIUineIXhmofimGiCWnLycyUP46iKlGWzX11Z/Hcj+r
 YkCMwQAAQoAHRYhBE7z7hFOeo8qyqfRuBtfRMkAlRVWBQJo/4jTAAoJEBtfRMkAlRVWBQoP/AqX
 o5fDnRdKoS6q3XpzWKqrQ7zMv6up7tNiJzjI277cfvSxLM7uDtj2Ia73Bq3MKvuS79y7rfkviR5
 TTHt4CnxLQjDNumvwrZJTR2H6kKuOR6zihzyXsosRKceuYd/rCMlSkHcTTtM45EQDTtiW3+uQUD
 gt6/z2wnM7LFVcloJvfnSqUGI17uKwF94SU0tQdtJsrXFU54j8zorO14GarzTputEFstffK0ifJ
 7ty3mGzzXhW5ZRGTMQp916xDdeFgZpoZkqrn6Y88nrutiLfRGno/Q2idW+n0Fh/F8axD2sR3GLS
 xRsqcpZthvbjVgrCkdvSnK2ut6szHGsVV0XePv+0nh61oV3vCd5tEh9VASBPvpjHCNrzUxZ5Tmg
 BhYLUL5oQ4+wxjVR4/ELhS7QrMJNOlMEJidEtXDrRm3rDmOkyTNri82aS+lOIIdyKKnroXz6zFK
 tBJMZHACT7EthUbiGqcmvF66zd7gNWhLL5BAT7ILrUj/URdLJeOT3zDXRnZgM2f4MG23VliFeTt
 z2z756NNtgd+1dK3XpUwRz4eT8sLhtOHPdHZkKiU2q6cPX//CUJY0TzBLJupKc6yu3dXzZJG/vG
 YPlxIv/fh/BUFgMEBcr8DTnj4V9u34Tzib4G8KY0BD2dofnj5NmMP2ahxtNtNa+dq19V0H/LPcC
 qC4V4
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
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

Describe the Universal Bandwidth Compression (UBWC) configuration
for the new Glymur platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/soc/qcom/ubwc_config.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 15d373bff231d770e00fe0aee1b5a95c7b8a6305..7cca2afb68e3e9d33f3066f1deb3b9fcc01641a1 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -218,11 +218,23 @@ static const struct qcom_ubwc_cfg_data x1e80100_data = {
 	.macrotile_mode = true,
 };
 
+static const struct qcom_ubwc_cfg_data glymur_data = {
+	.ubwc_enc_version = UBWC_5_0,
+	.ubwc_dec_version = UBWC_5_0,
+	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
+			UBWC_SWIZZLE_ENABLE_LVL3,
+	.ubwc_bank_spread = true,
+	/* TODO: highest_bank_bit = 15 for LP_DDR4 */
+	.highest_bank_bit = 16,
+	.macrotile_mode = true,
+};
+
 static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
 	{ .compatible = "qcom,apq8016", .data = &no_ubwc_data },
 	{ .compatible = "qcom,apq8026", .data = &no_ubwc_data },
 	{ .compatible = "qcom,apq8074", .data = &no_ubwc_data },
 	{ .compatible = "qcom,apq8096", .data = &msm8998_data },
+	{ .compatible = "qcom,glymur", .data = &glymur_data},
 	{ .compatible = "qcom,msm8226", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8916", .data = &no_ubwc_data },
 	{ .compatible = "qcom,msm8917", .data = &no_ubwc_data },

-- 
2.48.1

