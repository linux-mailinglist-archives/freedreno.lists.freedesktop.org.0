Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 926C0A3F882
	for <lists+freedreno@lfdr.de>; Fri, 21 Feb 2025 16:25:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71C7D10EA9C;
	Fri, 21 Feb 2025 15:25:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vn/8PpE2";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFAAB10EAAD
 for <freedreno@lists.freedesktop.org>; Fri, 21 Feb 2025 15:25:32 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-abbb16a0565so32337166b.1
 for <freedreno@lists.freedesktop.org>; Fri, 21 Feb 2025 07:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740151531; x=1740756331; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=a3bwniejdI/OPbevpLj33tIqt0/bau3qVCvVDzBOjOY=;
 b=vn/8PpE2m8Ecuyw3JLZ2Fpwx9lkTUM5n0LDdE3iiMUJo3Tt8IIGsDND3V+KbIGqsnN
 SWYooWTYaMjZeztwFwMr3QYyh0Fiyb1sK96xw0Cya/jkm656ex4+3CAyUoAMN10mRlpG
 S8zV46irEGF0M3UyD33lJfRSZtAA62KpNugLAFuAVGppdleyGgjhsrXx+bBk7oSHHsnL
 Sx2nTMPy7f7qngZOmdOhU39shAd71ckHmB7X7lmwmiOhhkJnuxUJytuuieCazUej4KUX
 KogTrKEKBjI915oPSshMXV8caaMIJqqjGFpT84lfjn208lucX4NHh5fozT1bOP0yvPTd
 0sKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740151531; x=1740756331;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a3bwniejdI/OPbevpLj33tIqt0/bau3qVCvVDzBOjOY=;
 b=FxxnUuA3tFDwTuxEKCnZkV5kYkYkZHJYZ2/F0J0h+QZnjbAdSo1ICUVpwQaBFyYX1f
 CMOFPLQdSYak7zzFpreZFbQryYzJ9Ki1w6o6DnSI2/qj3yFIFBUCILRCqNi5n83ZD9w9
 SJ569yVCMzQTXy9oj8UOg8oOdBGyG98e/6wHcABYWCgX7g13ixIRduNzTLl3tMNzaX76
 7z5KdBvscCG86bi2t04sb+uA3heyMwAgIxszLz5P5pBS9UUbDbvmLiCAWBDcJxeZKUI/
 OSgyBdUAGhssrbNoom/72cQHysxMoAu0ZyF3kVLsEocRLMPqRgLewJMt80Lt0DodlVhA
 gfyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaaJgcTQ1rHXhvzYMSnxhBvdz0ElImAxwhioF2Pm4GpQ9p8l3f2pwQAaPfXRJyIdKffLpWkhv/f+Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6CcS2TeLw200EgKgJUMDt4c3/wY5uqvFVo8PXiALBsWE6BRHe
 G8LKF88J0/NnE47wNlynJg8maIpu8oLW395XzFzVhUziuyz3o2XwLpIva4U2dvo=
X-Gm-Gg: ASbGncuqBl0oSNtHmH0rOJ+rp936SB91bd12mzZtwg5BSPoAvaf/+hTM2XUV5RWtsQA
 Gp5J+VWFO9WUY/8ZWy17RRPAzlBo63xeXIPJNQmJV9+9WcTkDSv8v8P9UuxnHQ/6LtikXY/tw8u
 tvnn2eKHG8Fq4l1qYCdDIxzlNgFKSGzdhAHRdaXWR6xtBKzfvUFYwSD6NudjI9lx1W9HvYTrQme
 UGbPvki61XfcNVw9732M3ktLOYoL6/QtHV01CLCctxoQ35yAqi8mXHpONkHs4ZsNJ2SlDGXsu5q
 N8svlXM2v7W8S4tGsMzpxtyjsx+QBHXdoI1u2GqpWTCt34DamWHyT20F7imM96QyGZN8UG1coa2
 d
X-Google-Smtp-Source: AGHT+IG6Alr+e5u5uJxjL/bold2dU0K4L3hDTsgqPGJ/U2s/DiVnDUFaMiTdmBFp0wEmMkaMFodGpA==
X-Received: by 2002:a17:907:74a:b0:abb:e5ac:28b2 with SMTP id
 a640c23a62f3a-abc09c24732mr106927866b.13.1740151531277; 
 Fri, 21 Feb 2025 07:25:31 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl.
 [78.11.220.99]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbaa56026fsm865456666b.113.2025.02.21.07.25.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 07:25:30 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 21 Feb 2025 16:24:31 +0100
Subject: [PATCH v3 21/21] drm/msm/mdss: Add support for SM8750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-b4-sm8750-display-v3-21-3ea95b1630ea@linaro.org>
References: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
In-Reply-To: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Clark <robdclark@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3191;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=npT/AUk70cBHCRbn81WnGX4UoVxSXbDYwaGyJuk3VME=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnuJq/ctXpMZ8Jnwnml7qBOIiMMaNsLSOfnFQtu
 E+RAw9e9LeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7iavwAKCRDBN2bmhouD
 17mXD/94+XDsJfLydNAyZTQ+/RWjpP+M005+GCV3TKtBNDit1ewBvJdQko5LBfWZJlSMI0nTmKJ
 z/z7fgHHOeeW58wIwdsjtLf3k3SR7XqaonuobTJHEP+gdpvcUvFRKfBzwpsAjFbtVRiZ9SZM0pB
 814FttaFuZO0WF9rYaRk1bdtoAoAeZJ3zli7f53GyQ6mbAye5P0vrhMnVUSpK3C9vp8pSyOQ0Eb
 0fkMQxzYCMmSaCaIpffD9XH7GFEGgjhO43h+yHZp+qELOfCDizLV+BzbIixYLvAH5u7D8cl2Woq
 D6L2M/qrSHWSV6STwB26EPFDr/40lcVL6RDglOv44lNTVwvwnGhh/HUmume8slOYwK4PtlB9Aen
 U6o3772Tsho6oqXQ5rIUYfYiyiHp0yP39Wrh+G8HMYk78tCSaXuEEGl4XnXuB8HyKDYWdUrnYZA
 +zE/9srdqNj1bqsup1ouiljIQSyUjh7uGff9MUrh9p+57CVMWHkFTgiFJdmmjlc6y9n+u1OX4dW
 tj9prAwgFZBlqyPZ76kH/F3pn6Sgr+gSVqB7tvQ6C+iaSaJkHP9+G+nMRp5HQ1aga0WU9nEi5yr
 8E0Im/f16dGTMtSNUM1Fm7mT4PwXWLXaZlLJdQYJviLwCP6YkJSi35ZIo2qhJzlNvZsmjxcqQAB
 Zcg9tFWD5yU7oJw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Add support for the Qualcomm SM8750 platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 33 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_mdss.h |  1 +
 2 files changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index dcb49fd30402b80edd2cb5971f95a78eaad6081f..3f00eb6de3a9d2bee7637c6f516efff78b7d872b 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -222,6 +222,24 @@ static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
 	}
 }
 
+static void msm_mdss_setup_ubwc_dec_50(struct msm_mdss *msm_mdss)
+{
+	const struct msm_mdss_data *data = msm_mdss->mdss_data;
+	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
+		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit);
+
+	if (data->ubwc_bank_spread)
+		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
+
+	if (data->macrotile_mode)
+		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
+
+	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
+
+	writel_relaxed(4, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
+	writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
+}
+
 #define MDSS_HW_MAJ_MIN		\
 	(MDSS_HW_VERSION_MAJOR__MASK | MDSS_HW_VERSION_MINOR__MASK)
 
@@ -339,6 +357,9 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	case UBWC_4_3:
 		msm_mdss_setup_ubwc_dec_40(msm_mdss);
 		break;
+	case UBWC_5_0:
+		msm_mdss_setup_ubwc_dec_50(msm_mdss);
+		break;
 	default:
 		dev_err(msm_mdss->dev, "Unsupported UBWC decoder version %x\n",
 			msm_mdss->mdss_data->ubwc_dec_version);
@@ -722,6 +743,17 @@ static const struct msm_mdss_data sm8550_data = {
 	.reg_bus_bw = 57000,
 };
 
+static const struct msm_mdss_data sm8750_data = {
+	.ubwc_enc_version = UBWC_5_0,
+	.ubwc_dec_version = UBWC_5_0,
+	.ubwc_swizzle = 6,
+	.ubwc_bank_spread = true,
+	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
+	.highest_bank_bit = 3,
+	.macrotile_mode = true,
+	.reg_bus_bw = 57000,
+};
+
 static const struct msm_mdss_data x1e80100_data = {
 	.ubwc_enc_version = UBWC_4_0,
 	.ubwc_dec_version = UBWC_4_3,
@@ -756,6 +788,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sm8450-mdss", .data = &sm8350_data },
 	{ .compatible = "qcom,sm8550-mdss", .data = &sm8550_data },
 	{ .compatible = "qcom,sm8650-mdss", .data = &sm8550_data},
+	{ .compatible = "qcom,sm8750-mdss", .data = &sm8750_data},
 	{ .compatible = "qcom,x1e80100-mdss", .data = &x1e80100_data},
 	{}
 };
diff --git a/drivers/gpu/drm/msm/msm_mdss.h b/drivers/gpu/drm/msm/msm_mdss.h
index 14dc53704314558841ee1fe08d93309fd2233812..dd0160c6ba1a297cea5b87cd8b03895b2aa08213 100644
--- a/drivers/gpu/drm/msm/msm_mdss.h
+++ b/drivers/gpu/drm/msm/msm_mdss.h
@@ -22,6 +22,7 @@ struct msm_mdss_data {
 #define UBWC_3_0 0x30000000
 #define UBWC_4_0 0x40000000
 #define UBWC_4_3 0x40030000
+#define UBWC_5_0 0x50000000
 
 const struct msm_mdss_data *msm_mdss_get_mdss_data(struct device *dev);
 

-- 
2.43.0

