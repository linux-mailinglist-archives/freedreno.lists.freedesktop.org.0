Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A3A85FD31
	for <lists+freedreno@lfdr.de>; Thu, 22 Feb 2024 16:55:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EF9110E9A1;
	Thu, 22 Feb 2024 15:55:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Fb7TSD9p";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBC8310E99B
 for <freedreno@lists.freedesktop.org>; Thu, 22 Feb 2024 15:55:27 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-563c0f13cabso10361616a12.3
 for <freedreno@lists.freedesktop.org>; Thu, 22 Feb 2024 07:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708617326; x=1709222126; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qJjRNIUqnXrTF9bzdEi2VC9ooQUEnRbmpw6uyhCO978=;
 b=Fb7TSD9pIs/Z1TnZycA1O7cu/amkEQKrb6zM7gFiPJFDAlXqYf6Atq9SP7MXa/XPeQ
 YHI7yCYtlSTv7eMMjB0nCVeBfxO6oip3vxRIpoUsOca5LjJS/IMst9Umbr4MDMIlNJCH
 p0i2xw7Vr37stYSHS1JaosZDsWi/2FFbdusAgqPgcDwN9ntk8fiEITYJSvvhEBXd980Q
 +5H8aa28q8g1FIuaycUIkwPgzgwF/GUaf68a0GvOEr/wIR4QcRVSWzSqbdHplCPSuH2D
 cSPa2qWtbnaYyp93mZ0ckQ34J5tSWmSkal6iR1YGivg6aBULh+Q497keCzPb/z+f6nGj
 BsYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708617326; x=1709222126;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qJjRNIUqnXrTF9bzdEi2VC9ooQUEnRbmpw6uyhCO978=;
 b=uNarg42ys9Qkx6JNx3caNyd9UHcWd8+2LyvGBd3deu4IXqa7MUwOpoAeQYyFh50/F6
 /B9AgO9t3dH5XdUmK9elR3grX3mWIv4ExZ9kw5e6RsoonOY05suq7PwgU7wiptIlP6TC
 nURjEeewTfljJzcgHHi/bnmOD9ExlmGcY0ORMQ/pWFNz7zxFCjtGHuN1IlsEM1XamdLP
 BSdgRYZ5m4uQlMuwTBYs16fhRJ66NAQUHN1T1YS4c7aJVptiJ9DEnWKhE5AKp6GjvfNA
 PTPk5cJbehx2xjMzgn1ZY04yjz+KKR3sOLf+kUAi5s0bBaK4dn/+10sKTT4a5aig7+31
 KJwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaVja5VIWLmzf7fsGTTTgaxzS3bshvMtT2p4QTgqEoSASgI0pB8EDKQwPW0kSo4enX4NnTn5ZIu7s4T3PGzYuM/XVB8aD/XPerfTSC8Deh
X-Gm-Message-State: AOJu0Yzivwt/BL0VDwn9QRUamkmgVkrRZn5CLGY8ZD7eu155W+HnafB5
 11vzBqkXVUPgr8v/ElHlq4S0VLgzIh/jrjRRo/+sldADhm+KwjkvqQv1IYc2n8w=
X-Google-Smtp-Source: AGHT+IHx8wUrxZAoY0QTpZfuPEXHwmLiOc0Tnk3az8nxpMMl9wTbjHf3g0uq86KA89J0Eq+x6oS1Kw==
X-Received: by 2002:aa7:c44d:0:b0:564:7bed:b836 with SMTP id
 n13-20020aa7c44d000000b005647bedb836mr7778452edr.3.1708617325938; 
 Thu, 22 Feb 2024 07:55:25 -0800 (PST)
Received: from [127.0.1.1] ([188.24.162.93]) by smtp.gmail.com with ESMTPSA id
 v7-20020aa7dbc7000000b00564e489ce9asm1924247edt.12.2024.02.22.07.55.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Feb 2024 07:55:25 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 22 Feb 2024 17:55:08 +0200
Subject: [PATCH v2 3/3] drm/msm/dp: Add support for the X1E80100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240222-x1e80100-display-refactor-connector-v2-3-bd4197dfceab@linaro.org>
References: <20240222-x1e80100-display-refactor-connector-v2-0-bd4197dfceab@linaro.org>
In-Reply-To: <20240222-x1e80100-display-refactor-connector-v2-0-bd4197dfceab@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1624; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=Igx0dc8kyT7O4TGZsOtKQnB+6acRvpeqzdoVuoVCK4E=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBl125mmmA1uULH1SHqNXIODPJZhjtL5J4xyD3J0
 gjgi12m37yJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZdduZgAKCRAbX0TJAJUV
 VoDVEACr6Dk0tJq9ePeNm+CmSWomyrFLd+GFTUs6dPPc+1N7ayp6jdKgOVxEG1HP2FHS+md0AlP
 XUB5CLUHyU3SvwdcRKz2vvWKreVn6w9dtP4fzvygYfOiRCMuJYT4zdczFwVSPUawfLjgKErA4Hh
 xqtADZ2EKatT8TIDNtt6AEMSWot5NtWCWgN+CWCNbZEIiRcKKva1In+HUjEL7PuSAPzzpxKITJd
 QyxENlkIzdAvT+q9i/XTKnZoeWU+W2YmJRTJUiFk+VeJgiz1DsKfzgfS06PpUTubNY+L4vD5LLZ
 Y9mOusYFlbNI05+o58j8ChNahPZeh6lCvH5K3Hcy5oMlG8leVbOMSFglkuSFDTwRH07UG05CbW3
 ROh8d5D2m4kHzhGtvuQ7GHryrdFmG+8ZplsFZvkaNRk2uEdATvWVTvlM2flsFHDriNF/en9skzE
 488eIKHDYWDsDgdhJyOkpfXlVW6WZY0a7glCER7TlcuDS5j+tVKXgHVMg5b87lKIkqeSzTShwy2
 CASdhiX7aL+6DFbvYvEACkLgQl50sztW7aZlTnnbFf/rQFGP6aaT7v3bdXTIUfw4wV38IqvcWEl
 1qSN37cQVXCM5ViNBwUoqG8XQUnbqnaVFIodFGh5PlEMYryOdB2GbfeHO5Dh129rhkmOM3HpSuA
 knU3z19i1BermYA==
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

Add the X1E80100 DP descs and compatible. This platform will be using
a single compatible for both eDP and DP mode. The actual mode will
be set in devicetree via is-edp flag.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index e01b41ad2e2a..fb1969617617 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -171,6 +171,14 @@ static const struct msm_dp_desc sm8650_dp_descs[] = {
 	{}
 };
 
+static const struct msm_dp_desc x1e80100_dp_descs[] = {
+	{ .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_en = true },
+	{ .io_start = 0x0ae98000, .id = MSM_DP_CONTROLLER_1, .wide_bus_en = true },
+	{ .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2, .wide_bus_en = true },
+	{ .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_3, .wide_bus_en = true },
+	{}
+};
+
 static const struct of_device_id dp_dt_match[] = {
 	{ .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_descs },
 	{ .compatible = "qcom,sc7280-dp", .data = &sc7280_dp_descs },
@@ -182,6 +190,7 @@ static const struct of_device_id dp_dt_match[] = {
 	{ .compatible = "qcom,sdm845-dp", .data = &sc7180_dp_descs },
 	{ .compatible = "qcom,sm8350-dp", .data = &sm8350_dp_descs },
 	{ .compatible = "qcom,sm8650-dp", .data = &sm8650_dp_descs },
+	{ .compatible = "qcom,x1e80100-dp", .data = &x1e80100_dp_descs },
 	{}
 };
 

-- 
2.34.1

