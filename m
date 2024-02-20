Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF8C85CB1C
	for <lists+freedreno@lfdr.de>; Tue, 20 Feb 2024 23:50:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCBEF10E5A8;
	Tue, 20 Feb 2024 22:50:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="K7isaMXL";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0981910E5AC
 for <freedreno@lists.freedesktop.org>; Tue, 20 Feb 2024 22:50:49 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a3e82664d53so359803466b.3
 for <freedreno@lists.freedesktop.org>; Tue, 20 Feb 2024 14:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708469447; x=1709074247; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DaiHKOatnN3Icf8gwgiK0T0n2HRv8NzGbPdfVNxfS4k=;
 b=K7isaMXLwmWdtnOxmuch2iyXpRVSiSm3khcQbeJuLfh77cNOgtTP+iBWgfT/TpdGfT
 gfoJe5GipZYWuxxUPG5dVitW6R0ZDdDM5nm7DZG8zyFaQWEbXBf6wMRw6x0rZGJKdqs9
 KYFoq7aykQXsSCUrD87fxPFqEb5Mc8UxBmLHMKsm5PRglKT5nnElrruzR7wUM2SFlu7S
 Fl39iN67pTlOpricCCXW7NhXqdrtmNl/NAgTta1uhvCW0p5/fZE3dKe0D2S3aIlJ1Zow
 MKWwRGPYg/W7yxLKqXT1Hh9VVr9krEAFYSqi9GcKn04pH652SKFw7tnJDJt8KWb6dtef
 DzNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708469447; x=1709074247;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DaiHKOatnN3Icf8gwgiK0T0n2HRv8NzGbPdfVNxfS4k=;
 b=AclLxItnmLR+f0cXqhfmX9/A3kHQbZb85usd9WXjHfciIolrGDrV+Fr/tHYKTLBqHp
 8zPR++dRtBR45dparqeVpAZH7P3rzh+Stw5LgJiynzE4+pLj6OxPfB9KaWT9v0CVShM/
 tg/Iqql828WyyS78aU2uH4cebGxcbBNYp8IZHK4B6GxSzhutE0GMwSRVbHTa7JyXs5SX
 f6gAFVxg3X0XHOjaTYt5tBIzx6Az7Yf4LAIjeqeJ8XqnQNdcn+dFvSCZaa9GIteb+MKe
 9hMOD3Zdng4L3w/QAmQQg6BUHBYMGQ61hfdLCX690wlIXzasXkozDASeohkdX9fYbNy2
 lxqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXdK1jtCo3+DU+UGn3qi2htfwi+6hSsSR1I6jY10bl+bPP7YRteX8PyI5AimUi7D3jscjZMeUgbyh1SOSN8ktvG9YOaQaaq3402Ejoly6U
X-Gm-Message-State: AOJu0YyISIgnswuNetXrhRVtnjTtOs/bEIvLui9WqRRBpdU6s+/H4Sei
 T5sBzVm0EXHNIgPN/Ec/kcsVx3rJO4YztB8AET6IElHNBV4Ha+5l5o4e9RgmieA=
X-Google-Smtp-Source: AGHT+IGKYFLq9n74LH641A+5aXYbvLwZ/7XrnLC2ffc52710JhYABnciYA9kLk++qgZ1K9d8iIvTtQ==
X-Received: by 2002:a17:906:504d:b0:a3e:1225:2d7d with SMTP id
 e13-20020a170906504d00b00a3e12252d7dmr6954762ejk.38.1708469447175; 
 Tue, 20 Feb 2024 14:50:47 -0800 (PST)
Received: from [127.0.1.1] ([188.24.162.93]) by smtp.gmail.com with ESMTPSA id
 g3-20020a170906c18300b00a3ed811cff9sm1601977ejz.154.2024.02.20.14.50.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 14:50:46 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 21 Feb 2024 00:50:33 +0200
Subject: [PATCH RFC 3/3] drm/msm/dp: Add support for the X1E80100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240221-x1e80100-display-refactor-connector-v1-3-86c0e1ebd5ec@linaro.org>
References: <20240221-x1e80100-display-refactor-connector-v1-0-86c0e1ebd5ec@linaro.org>
In-Reply-To: <20240221-x1e80100-display-refactor-connector-v1-0-86c0e1ebd5ec@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1757; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=Bg+64ybndxfDs6b6x4LD2hmPzSVNqo/QK+11IhNoFjQ=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBl1Sy/SY/Li7l08xMJ7M+mWv/uESkmaPF0NsvaC
 dpCRX6qGoOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZdUsvwAKCRAbX0TJAJUV
 Vgn6EACmcH3wtom1eKfkJzuGchzrI103o2ht9z1QwN/8SbMuJseRPCeWyeeikKSw+Po4gGZ/G3D
 0yoTOTAK9JW4c703Yi9C25hqmPQWsoBGvsbRjFVs/twSZQ1NEbVxhUL6f6BFuutOZVfw08UYU89
 tBa3qjivZque5i9drKIn4aC7FifFsZBOQQI/bhqR+ZMOL4Y3vLdlK6i2QHKp+WtAqGRRFXbMgpy
 wAVuWMEvlikjtpGTKq1OiplVqZQJoRhnT06zeeapu7UOSPLYIvar+xRpMSgNZ3uiWypOv95QkEF
 km0lOHe1Z2pdrQIc3LP+ic3fJSYZrUFT4tcuOTagiTFqVNlstMXfoXQ80xe5vf23nQt1tSW17fU
 jbh4JQRTjVGXfeX92p0NkZL/Q24BOYlvADOwNY2dB3FYPyPrLIT14vSbQRG91RPPfTWgWGjuu9M
 qTyQi5g9EINuFMtx8944XfOAMQozkqQbqGl61lxVBRD4egoukK57vxtTVTGKTGFJ90S25n5EfRZ
 HJesuuXKHlyqu6btq67skJmmUpaOjO5ngZBSns/QX3u9/bcJnKF9CQCarp/5ROFEfsFr/B4R7e5
 hS2V+HVKFaG7bWp3lOk8NH6NETTt4/y0HjvnQqGJrzvSmFCZLK8egouw1MQ2b7ulVDeA4sTJeFg
 OpYr4j0j2VYNZXw==
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

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 9e58285d4ec6..7b8c695d521a 100644
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
@@ -179,6 +187,7 @@ static const struct of_device_id dp_dt_match[] = {
 	{ .compatible = "qcom,sc8180x-edp", .data = &sc8180x_dp_descs },
 	{ .compatible = "qcom,sc8280xp-dp", .data = &sc8280xp_dp_descs },
 	{ .compatible = "qcom,sc8280xp-edp", .data = &sc8280xp_edp_descs },
+	{ .compatible = "qcom,x1e80100-dp", .data = &x1e80100_dp_descs },
 	{ .compatible = "qcom,sdm845-dp", .data = &sc7180_dp_descs },
 	{ .compatible = "qcom,sm8350-dp", .data = &sm8350_dp_descs },
 	{ .compatible = "qcom,sm8650-dp", .data = &sm8650_dp_descs },

-- 
2.34.1

