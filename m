Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D6D9ECCBB
	for <lists+freedreno@lfdr.de>; Wed, 11 Dec 2024 14:04:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 400A210EB3A;
	Wed, 11 Dec 2024 13:04:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LWMAebQU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F9B510EB41
 for <freedreno@lists.freedesktop.org>; Wed, 11 Dec 2024 13:04:32 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4361f65ca01so4570425e9.1
 for <freedreno@lists.freedesktop.org>; Wed, 11 Dec 2024 05:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733922271; x=1734527071; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=BMl/UGjx4g/sgYeD/tmvYISlIEsOi6IJTxxllbbc/t0=;
 b=LWMAebQUGluPMUypRxTgU1/NDtlUX/eKAslExx1LJ2HV9ov7kkpuABeBHold0tW0Gl
 wijBK/IBjQ7/127oFKLSsLsl9jZaquVbXmCRClecpRgX8wgY8HZTh5D4QTxcc4sy8zS8
 HKkJ5FHv/gyOxT0OQT1Ax/20Ybsgdw4bynJc7rREBhkeBAA9QbDyDILLBIn0LKsHVKPw
 8Swn7uWP7GmOrw/Hw9ntFxkpu+3GQlqGjnvIBkRFngYWa7ucXUVw5Hm7ZE6tSx88TH95
 xxsCGuVVpgIdxpMhWuZvX1NYdomyXztXwjpHdMkF/EF255w2WEM7isCTIOZDAcHn4ben
 FtmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733922271; x=1734527071;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BMl/UGjx4g/sgYeD/tmvYISlIEsOi6IJTxxllbbc/t0=;
 b=kOkbGAkuYBuoigXv7iFzAc9eW0HcxQnE7n/aE53rYbyZzyRPP/wd1Po16iVpguKMYB
 A7+Sug5cNa/Lao7X/DKxel0ja9mPUeEkyTqp8w/oH7Jtdo9lLEJw4RdFvqJFx687cccM
 16HlrEoDY5Y9BVKSPgRqWfv6fz/fLKgZpU9/Q6SH1/HuuMr6U2WPVPSmeozv1nYVrE9g
 wU0IKsvsDdVpHwUWVXRyxylXd4ELAppM5pqrr1ij9tv0oYHXWxN5g50le/sgMmBgSryb
 7d3RIx6YA/3QY715IKUxiniy/f4aZrS8lnlDwCKvGyFHrQAuVNtHfpB6PelBjg0PpIF+
 QZVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnEzLPpURnPt1zudPyHcOoPZqh8OqnHyvcgqM9a60uQecqWw931TCeefJb31Bd1gK5y65PwnkaT0s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwyopggR23aFKmRyxboyX1fC/eg6aQ97qjx/jnJbrz1kz8P6cHE
 ICkR2PJouknZF7IBkUZPxTPreCfOCTPhbWGVFg+R4qVNuMWo63e8PXGT6X1igOQ=
X-Gm-Gg: ASbGnctZnnonhzzoNFwNWNBtGAwfMz3oVzQyY/yvdQZi/DUKm7IUX6bZQkwIieCCird
 M05DP+2hIc95J6z9YHTj32cfMxLffOW1nWQ0xGlQS41m5q6BhtBSxaWtGjSciV+nhocYZ1G/nGO
 vBlcubtghUWXjJF7PI0RYo3d4rz51qWn2g+KBnPPQwdadMj2jBYfgT4M53di5wvfFJWHbYJaD1Q
 IV+0xw8i1FbPtz/rRyAKHGFRbuNnBjGNj3QViK9lH0UpGKICiBkDw==
X-Google-Smtp-Source: AGHT+IFjbQ3FfGDNfx7qLs4fvnwMzWqzUSohxLQJCM95DyVwEx5JIuglm6aMTZ6H5XSHMNC1W9HBjQ==
X-Received: by 2002:a05:6000:23c6:b0:386:3903:86db with SMTP id
 ffacd0b85a97d-3864cea2656mr1638187f8f.27.1733922270673; 
 Wed, 11 Dec 2024 05:04:30 -0800 (PST)
Received: from [127.0.1.1] ([82.76.168.176]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3878248e633sm1288081f8f.4.2024.12.11.05.04.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 05:04:30 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 11 Dec 2024 15:04:12 +0200
Subject: [PATCH v2 1/4] drm/dp: Add helper to set LTTPRs in transparent
 mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-1-d5906ed38b28@linaro.org>
References: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-0-d5906ed38b28@linaro.org>
In-Reply-To: <20241211-drm-dp-msm-add-lttpr-transparent-mode-set-v2-0-d5906ed38b28@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@redhat.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3960; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=IIWA+lKM1tkmTiDWlHZ0zy5eqwsnJyc9oPGo1sc8H/U=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnWY3VIh4VtX7N7lLVm6TJZJvbesZ3g/yi4fmkf
 z4wT7CHEW6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZ1mN1QAKCRAbX0TJAJUV
 VvUiD/4gOIEBrXIgr7Tjjp50RNQLN4PYyCFsrIWmviYuBJhS2aDEHXTpq0EGaOCBbsuAs0PwvDq
 gwJGrTWM1bARkmw2Dd6aMfbRGXYr9P8au8qqgoNpOYGnj+0oKRxZk6V50WpubTCHNH3zO5PCeVu
 7ThUbZyDANe9FQbfaSn2Bt76xnnsIVdTgRgmgh8x+MqCkhF9W/dNgW7aeEBtXcQhNHCiD8pkPqR
 e/9+X1t8Jnz0OFfL7EmFc1hI0r8tYkfP/OIlgorLcDa7tSi3iFwG6WgmDSmQnwcQZ8kQEODu17m
 OHx6v3A9lw9vYK+ksks8AY94F3FBFey/I3YhOaYBbAJLF3KjGONnB83ed9DunANS0rRVhtYB+bw
 bXJC0mAc3zTtbd77aC50lh+h0yf7upsDmhYtoAJ2ehfzTeao21Ss+mZ3XooPnZJ8PQ1TNLC0Zdj
 Tf+sqxn/tT3evjCkUo2papj2PWJ57jSmJag7V1fcfuAXxLa1Uf1+t7HftPBiiYWGs/DcHOvXLWI
 i+1aIQBOyGjxP2T9hHGqVYf314tl2muEzNcRUyV7QjLLsxmfD8FuW7MdRUKbLBQYHKgI1Su4HBp
 WGI7q5O/EDCliGewmC5ZDSyGr/GojWCjKMX+Vzfo4C3ybUq1567CXiWjq7+jGt05b2ENzN83lFG
 OfzDOWe8Xv+tUzw==
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

According to the DisplayPort standard, LTTPRs have two operating
modes:
 - non-transparent - it replies to DPCD LTTPR field specific AUX
   requests, while passes through all other AUX requests
 - transparent - it passes through all AUX requests.

Switching between this two modes is done by the DPTX by issuing
an AUX write to the DPCD PHY_REPEATER_MODE register.

Add a generic helper that allows switching between these modes.

Also add a generic wrapper for the helper that handles the explicit
disabling of non-transparent mode and its disable->enable sequence
mentioned in the DP Standard v2.0 section 3.6.6.1. Do this in order
to move this handling out of the vendor specific driver implementation
into the generic framework.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 50 +++++++++++++++++++++++++++++++++
 include/drm/display/drm_dp_helper.h     |  2 ++
 2 files changed, 52 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index da3c8521a7fa7d3c9761377363cdd4b44ab1106e..6abc54cd28e93d8101358ce05be51d4516778451 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -2817,6 +2817,56 @@ int drm_dp_lttpr_max_link_rate(const u8 caps[DP_LTTPR_COMMON_CAP_SIZE])
 }
 EXPORT_SYMBOL(drm_dp_lttpr_max_link_rate);
 
+/**
+ * drm_dp_lttpr_set_transparent_mode - set the LTTPR in transparent mode
+ * @aux: DisplayPort AUX channel
+ * @enable: Enable or disable transparent mode
+ *
+ * Returns 0 on success or a negative error code on failure.
+ */
+int drm_dp_lttpr_set_transparent_mode(struct drm_dp_aux *aux, bool enable)
+{
+	u8 val = enable ? DP_PHY_REPEATER_MODE_TRANSPARENT :
+			  DP_PHY_REPEATER_MODE_NON_TRANSPARENT;
+	int ret = drm_dp_dpcd_writeb(aux, DP_PHY_REPEATER_MODE, val);
+
+	return ret == 1 ? 0 : ret;
+}
+EXPORT_SYMBOL(drm_dp_lttpr_set_transparent_mode);
+
+/**
+ * drm_dp_lttpr_init - init LTTPR transparency mode according to DP standard
+ *
+ * @aux: DisplayPort AUX channel
+ * @lttpr_count: Number of LTTPRs
+ *
+ * Returns 0 on success or a negative error code on failure.
+ */
+int drm_dp_lttpr_init(struct drm_dp_aux *aux, int lttpr_count)
+{
+	if (!lttpr_count)
+		return 0;
+
+	/*
+	 * See DP Standard v2.0 3.6.6.1 about the explicit disabling of
+	 * non-transparent mode and the disable->enable non-transparent mode
+	 * sequence.
+	 */
+	drm_dp_lttpr_set_transparent_mode(aux, true);
+
+	if (lttpr_count > 0 && !drm_dp_lttpr_set_transparent_mode(aux, false))
+		return 0;
+
+	/*
+	 * Roll-back to tranparent mode if setting non-tranparent mode failed or
+	 * the number of LTTPRs is invalid
+	 */
+	drm_dp_lttpr_set_transparent_mode(aux, true);
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL(drm_dp_lttpr_init);
+
 /**
  * drm_dp_lttpr_max_lane_count - get the maximum lane count supported by all LTTPRs
  * @caps: LTTPR common capabilities
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 8f4054a560396a43750570a8c2e95624039ab8ad..3311df3b58255cf0620391d0948ccf6b569a8a34 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -630,6 +630,8 @@ int drm_dp_read_lttpr_phy_caps(struct drm_dp_aux *aux,
 			       u8 caps[DP_LTTPR_PHY_CAP_SIZE]);
 int drm_dp_lttpr_count(const u8 cap[DP_LTTPR_COMMON_CAP_SIZE]);
 int drm_dp_lttpr_max_link_rate(const u8 caps[DP_LTTPR_COMMON_CAP_SIZE]);
+int drm_dp_lttpr_set_transparent_mode(struct drm_dp_aux *aux, bool enable);
+int drm_dp_lttpr_init(struct drm_dp_aux *aux, int lttpr_count);
 int drm_dp_lttpr_max_lane_count(const u8 caps[DP_LTTPR_COMMON_CAP_SIZE]);
 bool drm_dp_lttpr_voltage_swing_level_3_supported(const u8 caps[DP_LTTPR_PHY_CAP_SIZE]);
 bool drm_dp_lttpr_pre_emphasis_level_3_supported(const u8 caps[DP_LTTPR_PHY_CAP_SIZE]);

-- 
2.34.1

