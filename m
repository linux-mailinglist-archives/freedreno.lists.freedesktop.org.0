Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBA4642D0F
	for <lists+freedreno@lfdr.de>; Mon,  5 Dec 2022 17:38:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D83B10E25C;
	Mon,  5 Dec 2022 16:38:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBB0B10E24F
 for <freedreno@lists.freedesktop.org>; Mon,  5 Dec 2022 16:38:08 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id v8so16600513edi.3
 for <freedreno@lists.freedesktop.org>; Mon, 05 Dec 2022 08:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FA6VZLr8EX+1LwmM9brJgk2AqL1UbJ0XsUIaiz9n7JY=;
 b=tuw0NhESTq3UZ+zy40f7o9AcmkK+r5BotJvqEeJrQPDv77id5pMwvQOHANJ2pRtiTl
 xfu6zuqe1cvA141nvEgxDsqRM6STYF64bsrkifcmQGHQfR6upjeQ2pNje7FVJr/e3bD/
 7Q8yXuYkEQkCGpUntC88RpDTIMB7KJ7F4idNK0jBre+Ez8Wn5egIntB5VRXzSDec4ICR
 xn0GB/c0+JK1b0gWuCkNWcFtQ/QTSlNO8lezjo0kRY1JbCt35Vss2vzU4viHBqOU6Ciy
 wUKYJF+T/HFTNyQQwori8EBSxhi4ogLMiDJpL5GPTOcJnuPfL2KtbCtqReGC/cMny0BV
 sPKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FA6VZLr8EX+1LwmM9brJgk2AqL1UbJ0XsUIaiz9n7JY=;
 b=u6NXIuN6IyV7Pq0hkOU1BDVsJJmAexTlboatNxIQ3El15LJxqWqZt3vhKJVH+ij4ex
 TsmEHWVR/8Ad6TZNXJvMefqRm3iR7oLDYlJuHUAkEijPOqcXiIqqbUCBFzT+L9Et4wxG
 YrrQYBllnGytaKsP6NNIgevMjA6mDTHZnnZIJ46/kdrUWqFmrJ23NZfxmKZjrcCUoysU
 1p34fwFhBIVuyKQDo0LiifhOy9bpsRoK78T+3Rnp7rpWPpnPx1G6pDH8tZxdipM6LBni
 Jmt0IdGGIHRrAsG1MtjOJ0RcIzaeYG9GSqKlKwC809RZP/wM41+4oR998HP2k/C57MWs
 Dj7w==
X-Gm-Message-State: ANoB5pmqqSXUwT9j1ldKzMYodhjBdbtaw3thTNvcr+CpsCP09vXvEdE/
 jYzM63kqKKJPKCADFvWQzsBMIg==
X-Google-Smtp-Source: AA0mqf4UTFIOaQqMzS0VIDvYTbzzH/oX2gTN+rgxrjAy0Q4o2IYeg3hUbwZ7Nzsbb/5KoI4Sh/LVdw==
X-Received: by 2002:aa7:d556:0:b0:45c:6467:94e2 with SMTP id
 u22-20020aa7d556000000b0045c646794e2mr73784880edr.295.1670258287354; 
 Mon, 05 Dec 2022 08:38:07 -0800 (PST)
Received: from prec5560.localdomain (ip5f58f364.dynamic.kabel-deutschland.de.
 [95.88.243.100]) by smtp.gmail.com with ESMTPSA id
 e21-20020a170906315500b007bed316a6d9sm6413610eje.18.2022.12.05.08.38.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 08:38:06 -0800 (PST)
From: Robert Foss <robert.foss@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 agross@kernel.org, bjorn.andersson@linaro.org,
 konrad.dybcio@somainline.org, quic_kalyant@quicinc.com,
 angelogioacchino.delregno@somainline.org, robert.foss@linaro.org,
 loic.poulain@linaro.org, swboyd@chromium.org, quic_vpolimer@quicinc.com,
 vkoul@kernel.org, dianders@chromium.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>, vinod.koul@linaro.org,
 quic_jesszhan@quicinc.com, andersson@kernel.org
Date: Mon,  5 Dec 2022 17:37:48 +0100
Message-Id: <20221205163754.221139-6-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221205163754.221139-1-robert.foss@linaro.org>
References: <20221205163754.221139-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 05/11] drm/msm: Add support for SM8350
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

Add compatibles string, "qcom,sm8350-mdss", for the multimedia display
subsystem unit used on Qualcomm SM8350 platform.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index a2264fb517a1..39746b972cdd 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -293,6 +293,9 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 		/* UBWC_2_0 */
 		msm_mdss_setup_ubwc_dec_20(msm_mdss, 0x1e);
 		break;
+	case DPU_HW_VER_700:
+		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_4_0, 6, 1, 1, 1);
+		break;
 	case DPU_HW_VER_720:
 		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_3_0, 6, 1, 1, 1);
 		break;
@@ -530,6 +533,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sc8180x-mdss" },
 	{ .compatible = "qcom,sm8150-mdss" },
 	{ .compatible = "qcom,sm8250-mdss" },
+	{ .compatible = "qcom,sm8350-mdss" },
 	{ .compatible = "qcom,sm8450-mdss" },
 	{}
 };
-- 
2.34.1

