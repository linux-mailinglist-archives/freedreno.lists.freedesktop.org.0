Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9386599D5
	for <lists+freedreno@lfdr.de>; Fri, 30 Dec 2022 16:36:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE43110E44C;
	Fri, 30 Dec 2022 15:36:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6126710E1BC
 for <freedreno@lists.freedesktop.org>; Fri, 30 Dec 2022 15:36:10 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 b24-20020a05600c4a9800b003d21efdd61dso15401886wmp.3
 for <freedreno@lists.freedesktop.org>; Fri, 30 Dec 2022 07:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=UpPq5JazF5WYQ6jpgXZutDJ6jwFO4iP9SJS7CYk0/y0=;
 b=IpFvRCH7jQ1qWrmgFoWu0b+b6MW5eXC/n7lDMp/rPVGRmWg3wAK2lnV3sL5GxEOPCb
 JmDCzs9hTA+VhH7QPw83kZltUJ3ltSFX0hHH0dPvSLA4M0RS74+M5e8Jt9meIOwwlnvL
 A18R45EQaEgYRyrMzV9cpu+Me2+SFgsV44YQ2OiezuBuyKvejcGg1+krBsJFYO6Y1qFS
 aqO5jfjWy62uWPRBTvoqRLmScF42JSVukLt9hEHb54Bak8o5knX4vxTlDNnUDGNB52nM
 Uuipi/07BFVK05Qv7GJAMgiOwevHD81cCb5QLmq1P0L+9mmQ1pKUu4iUMnGUku5iCYZw
 4AhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UpPq5JazF5WYQ6jpgXZutDJ6jwFO4iP9SJS7CYk0/y0=;
 b=kckxcr7gQlYKhUvpqZjTUsd1y+ls4+jRE9nZWCo7IVM0gD0ElqB2Jm2dGVeCYUCzbG
 jB6WIll4JBoiUTKEcT2WMKKbflgFZzovn8ajALXa1R6nFffwl/PDVdcv9rmyiVsRIeXl
 wM6pN9uZDmjlaHyztZvfVLAn7Q7jLkC0AViOCQqY/M2jJxGMT1Vx5Yz5pKKpcq55Nm5g
 2Iip+XgwL3+Q/5/cdtgqwufGmJ8K0F6hPM58glRtY0CQptKgOJQYLWTkSLnXQhFs9c+v
 Wubo23nmgG688FcXhv7YwgRSdRe0UlogI0Q7W7G4nNnF3jLTV7A3gH8Z73fPDC/ZNRDh
 m3bg==
X-Gm-Message-State: AFqh2krqmj6/9z47tlR9iEugDqrShVhYY068uRPK3UL8cxJyb4oX8HvN
 bKqvTr9k1c9Vtr+e2ZQWjT6zRg==
X-Google-Smtp-Source: AMrXdXtLrKFZgNnLmucO73CgP/R0EgJOux6fVGeOspso4zpdgP2Pp5PGqIWUTqEVkYr5vhE+FKsERQ==
X-Received: by 2002:a05:600c:295:b0:3d2:259f:9061 with SMTP id
 21-20020a05600c029500b003d2259f9061mr28475797wmk.34.1672414568688; 
 Fri, 30 Dec 2022 07:36:08 -0800 (PST)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
 by smtp.gmail.com with ESMTPSA id
 l42-20020a05600c1d2a00b003cfbbd54178sm49857993wms.2.2022.12.30.07.36.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Dec 2022 07:36:08 -0800 (PST)
From: Robert Foss <robert.foss@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 agross@kernel.org, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_jesszhan@quicinc.com, robert.foss@linaro.org,
 angelogioacchino.delregno@somainline.org, loic.poulain@linaro.org,
 vkoul@kernel.org, a39.skl@gmail.com, quic_khsieh@quicinc.com,
 quic_vpolimer@quicinc.com, swboyd@chromium.org, dianders@chromium.org,
 liushixin2@huawei.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>, vinod.koul@linaro.org
Date: Fri, 30 Dec 2022 16:35:47 +0100
Message-Id: <20221230153554.105856-5-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230153554.105856-1-robert.foss@linaro.org>
References: <20221230153554.105856-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 04/11] drm/msm/dpu: Add support for SM8350
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
index 987a74fb7fad..165958d47ec6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1302,6 +1302,7 @@ static const struct of_device_id dpu_dt_match[] = {
 	{ .compatible = "qcom,sm6115-dpu", },
 	{ .compatible = "qcom,sm8150-dpu", },
 	{ .compatible = "qcom,sm8250-dpu", },
+	{ .compatible = "qcom,sm8350-dpu", },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dpu_dt_match);
-- 
2.34.1

