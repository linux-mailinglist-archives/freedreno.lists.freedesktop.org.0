Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C6A6110B5
	for <lists+freedreno@lfdr.de>; Fri, 28 Oct 2022 14:08:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ADEF10E800;
	Fri, 28 Oct 2022 12:08:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34D7C10E0CB
 for <freedreno@lists.freedesktop.org>; Fri, 28 Oct 2022 12:08:22 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id fy4so12448987ejc.5
 for <freedreno@lists.freedesktop.org>; Fri, 28 Oct 2022 05:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+UwiNY00/B1wEnev9eGZy7ZKGi1I0cycL/iCTh2NCnA=;
 b=WFhXjhcB/pX6k4XKVx6xAYZLBxEgJdoEEs9MDz3R7vvSnjTjzj3EIsZlVoBXpuvkbH
 GsqErhVmgMJW8jJd5lHD7vEIxvtc6IdDBL+3YkOBwCfIxSgcKnSHv22isGw3/DLmwsIT
 dLzxwBEZ5Xa0RPFkro0DoKSUYyw421m2IhRQvVHH9gq0eaDlBjq1vmeatdkaZRBB/IaS
 9lzxb5B5mSN8jBcRUYKlA3fBlhT8y8IQOZRx/nOa+Rl+swZOxoKl0Hxr+Ldt9U0d+I18
 KM3rNI90JCpcR+S016feJFLdeCkTppGDQwaxJhiFItHs822f4JE2db0Ay8m8X7d67wx8
 pxrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+UwiNY00/B1wEnev9eGZy7ZKGi1I0cycL/iCTh2NCnA=;
 b=MwQd5kTGsFoAflUS2Eyu1DK69aNgHxml3u020AkkbknB/AJlAHhjTH961MOqBhQ5OC
 mBwbbrRYYMy3VQ8xYLHjjLCXKSHeTKUM4Ya1NZxJzqA+ArOtLI/yugR9Dxfpw8LANAik
 HDZZLVKGlHPzReMMVmrE+wHRZjKeMb+IEECHZBBNVl03hpDn00EGH3+Wzp9VI+ZtI9rz
 EoeBPKiK5TdQm+RUgUZdJJdWbORBXFxmbVF+j/0+MWls1s8KRJvQbxxVLNOlvVBeELzK
 Cm4xOchMKXoGCaCJnW3wFkoS4EowWzGMeKbiwA/R0IhHRaPOcPPmHgh6IEZp3wl6llGq
 olMg==
X-Gm-Message-State: ACrzQf0qG1+IaZH0iqvmlbl6wn5hnG2yTkzCbBlgw2jXEqYNqjVq59Cr
 AgvgA4i8pE30x9v9+UTRSbmclQ==
X-Google-Smtp-Source: AMsMyM6qMEgjzC2J8dgTEwYSZlt5kH905cdXrte36zXs4B6iGshkk5H9+3G7jMgli094NZ6MLD10hw==
X-Received: by 2002:a17:906:db0c:b0:77b:7d7d:5805 with SMTP id
 xj12-20020a170906db0c00b0077b7d7d5805mr48359888ejb.726.1666958900428; 
 Fri, 28 Oct 2022 05:08:20 -0700 (PDT)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
 by smtp.gmail.com with ESMTPSA id
 u13-20020a170906124d00b00782e3cf7277sm2067258eja.120.2022.10.28.05.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 05:08:19 -0700 (PDT)
From: Robert Foss <robert.foss@linaro.org>
To: agross@kernel.org, bjorn.andersson@linaro.org,
 konrad.dybcio@somainline.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, quic_kalyant@quicinc.com,
 swboyd@chromium.org, robert.foss@linaro.org,
 angelogioacchino.delregno@somainline.org, loic.poulain@linaro.org,
 quic_vpolimer@quicinc.com, vkoul@kernel.org, dianders@chromium.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 vinod.koul@linaro.org, quic_jesszhan@quicinc.com
Date: Fri, 28 Oct 2022 14:08:04 +0200
Message-Id: <20221028120812.339100-2-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221028120812.339100-1-robert.foss@linaro.org>
References: <20221028120812.339100-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v1 1/9] drm/msm: Add compatibles for SM8350
 display
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

Add compatible string for "qcom,sm8350-dpu" and
"qcom,sm8350-mdss".

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 1 +
 drivers/gpu/drm/msm/msm_mdss.c          | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 008e1420e6e5..70683dbc6b32 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1315,6 +1315,7 @@ static const struct of_device_id dpu_dt_match[] = {
 	{ .compatible = "qcom,sc8180x-dpu", },
 	{ .compatible = "qcom,sm8150-dpu", },
 	{ .compatible = "qcom,sm8250-dpu", },
+	{ .compatible = "qcom,sm8350-dpu", },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dpu_dt_match);
diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index e13c5c12b775..fd5a95cace16 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -447,6 +447,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sc8180x-mdss" },
 	{ .compatible = "qcom,sm8150-mdss" },
 	{ .compatible = "qcom,sm8250-mdss" },
+	{ .compatible = "qcom,sm8350-mdss" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, mdss_dt_match);
-- 
2.34.1

