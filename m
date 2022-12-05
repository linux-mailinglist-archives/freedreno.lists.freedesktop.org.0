Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDD3642D0E
	for <lists+freedreno@lfdr.de>; Mon,  5 Dec 2022 17:38:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0461810E25B;
	Mon,  5 Dec 2022 16:38:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E7C210E0DE
 for <freedreno@lists.freedesktop.org>; Mon,  5 Dec 2022 16:38:07 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id fc4so22235054ejc.12
 for <freedreno@lists.freedesktop.org>; Mon, 05 Dec 2022 08:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ikVD0DfwFm4BefZfjV8KlOgWa9wgGHVQ5qduHZ3YKJI=;
 b=Tw/QVM0P9PmY/myId1uSMoV/+vdpASaSP247AGtd0Am6EWFgZzPH+GdQvB8mOIQlZO
 sLZuMfr5anncSiT3AMTjfCN6k9o28ooIGjE9/1155kzFn0icUtygfdTTnsTIfIApKeZc
 uBOIsjQLeVyRfEkKdUcqWeJVZLCkVyM3Wkn+/XcpkN5ws7dZZg8FPYE4yZ/+YZgsECYj
 NXE6drlG4IX1jhD5IMbZmVsxX8nWF9KZh9XncckpxzbK/F8HlgoMoQo9IVcsG1rbIV8f
 J3c+w0zd8oMKXzv47Egqvpl9+OTa0ptqloQuWijvZ6QE/keuu3x4B++TsoXKCv5ZUGcU
 OTrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ikVD0DfwFm4BefZfjV8KlOgWa9wgGHVQ5qduHZ3YKJI=;
 b=YTXvRhkb9tUDnJoYcT4cXAjEpBN+zSqvjY46fm5LkYrMNNsQuTlBcJvOCIgaLiXTvG
 XtiGBVgCkY+gUfv+b9YZn6oWaqhR1YEtKSGaB9Kv+/brsQnwxBlZygEDO8DZsFhf8y4T
 oiCCVdy8uTT/uEErsnJ6nyeXd0UZMx1aOWVQEbsE96F0uuP+UIL1+04/OEPkAVVwd3h3
 xE9Tk3iS4sDIT4N1ULxI+eDYbq1XR6derx/zLEqAX2AQf2V6CD8r1+IZrpSsQEJsjudL
 8ZBLt7oPpt14O1vtUJjRqHtQ8sdXsBB+y+UTktymJo5MR1lF+fOopQMlsmQJczk9Sq0i
 n0ZQ==
X-Gm-Message-State: ANoB5pnFhy0Ck0ZsWiLKOHmYQj6sHRvqCCSsChn66MnsfXdxbqMAoiqG
 0e4PKO625j0Q/QKDvVWEmqTZEg==
X-Google-Smtp-Source: AA0mqf4GCqnjHAkihknASAn0yi5G+Mq3odla2UDNvKPhEwC6fSs2KP4dmfXWt5u/x4RRFQ1j57oPAQ==
X-Received: by 2002:a17:906:cc92:b0:7c0:beef:79e2 with SMTP id
 oq18-20020a170906cc9200b007c0beef79e2mr13796496ejb.148.1670258285960; 
 Mon, 05 Dec 2022 08:38:05 -0800 (PST)
Received: from prec5560.localdomain (ip5f58f364.dynamic.kabel-deutschland.de.
 [95.88.243.100]) by smtp.gmail.com with ESMTPSA id
 e21-20020a170906315500b007bed316a6d9sm6413610eje.18.2022.12.05.08.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 08:38:05 -0800 (PST)
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
Date: Mon,  5 Dec 2022 17:37:47 +0100
Message-Id: <20221205163754.221139-5-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221205163754.221139-1-robert.foss@linaro.org>
References: <20221205163754.221139-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 04/11] drm/msm/dpu: Add support for SM8350
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

Add compatibles string, "qcom,sm8350-dpu", for the display processing unit
used on Qualcomm SM8350 platform.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 9827914dc096..6048bfae0824 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1322,6 +1322,7 @@ static const struct of_device_id dpu_dt_match[] = {
 	{ .compatible = "qcom,sc8180x-dpu", },
 	{ .compatible = "qcom,sm8150-dpu", },
 	{ .compatible = "qcom,sm8250-dpu", },
+	{ .compatible = "qcom,sm8350-dpu", },
 	{ .compatible = "qcom,sm8450-dpu", },
 	{}
 };
-- 
2.34.1

