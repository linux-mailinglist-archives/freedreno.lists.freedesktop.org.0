Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B3C7D66C0
	for <lists+freedreno@lfdr.de>; Wed, 25 Oct 2023 11:27:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 923B010E61B;
	Wed, 25 Oct 2023 09:27:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5588610E614
 for <freedreno@lists.freedesktop.org>; Wed, 25 Oct 2023 09:27:16 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-507bd19eac8so8007353e87.0
 for <freedreno@lists.freedesktop.org>; Wed, 25 Oct 2023 02:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698226034; x=1698830834; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UkpbSuCxl41j50LHtJ6p/pRvRPPyQRBDrCJQ5yXQI1A=;
 b=sPKNURKpiRBPrL3pg8D4qUYn3Oslaf1JMbkv7wiIJagY+Dg2RUAqLAA2YOoBd77+Ur
 ZKXkuK0zPj4RY4mpg5SUw629ruCoVcXDn1pyN2eKITkxrnRpWH7W3J1ESect2tuBmzKS
 YkHLhVlE9omK7qCrlCP/DzHAf8CnBBber8f4UdzJgfuJdmVDEVQzQdvlO22FGxW/p5Aq
 xhhvxAXMT4f2naaM6xVTZI04VFLNFB7UN1Oy9pW1DgA6AutcHlsoC0LDUoUlnRTFYFE+
 8jz+0tMNaNBF8pRk5ClTqHkgsZdNI9gc5jkyTSxJl/S38CjSmdHvVQBVlcKL0iKzOl6y
 4O9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698226034; x=1698830834;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UkpbSuCxl41j50LHtJ6p/pRvRPPyQRBDrCJQ5yXQI1A=;
 b=eccfQSeU+xdUleRJowNzbTNkRBV+taeLaVqKh6BIhBTEyrYFXZP/+xcnu1NQMNPwzd
 NMWtV+bZXtvPSYqgTpCWdX8Qm2gTLu4cwSG6yGcwQqX14qmOnunQbPPFvjN4ys2eUUJr
 4kZlKJqICeFlOAQ3znePYzL1gGSWStQVXX4pTUaQzQIt5BiQBILXlupsiSbW/Nzu3LTb
 keU7mEQxLTAo3+7JhwJsKqhu21NpyQDcPC3E+VBtMysnME7wccmm1V8zDbU2y4Pe32yf
 Q8vprY08iRA99S4TpBv0+Hw+nia1Y0vhl6WaKcZlyzRQGSpPnBPgujtEVwTBZGgAaX5k
 VcDQ==
X-Gm-Message-State: AOJu0Yy89BFovQ1ybZfCQTtKaCTThs1USMvdM6ajGH+B7vhF95SzZ7JS
 cq5yAknO6NW7lcSyrP9JHwszqg==
X-Google-Smtp-Source: AGHT+IGkqKhZhFNNxxXtCNi2yE8kJvwqnPOVlHtkHTCLzLASuPo6tPElKpo0tbmLTxYuBhKJa0juGQ==
X-Received: by 2002:a05:6512:214d:b0:507:99fe:3237 with SMTP id
 s13-20020a056512214d00b0050799fe3237mr9576663lfr.41.1698226034586; 
 Wed, 25 Oct 2023 02:27:14 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 eq25-20020a056512489900b005079fff83d2sm2470377lfb.3.2023.10.25.02.27.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Oct 2023 02:27:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Wed, 25 Oct 2023 12:23:10 +0300
Message-ID: <20231025092711.851168-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231025092711.851168-1-dmitry.baryshkov@linaro.org>
References: <20231025092711.851168-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 2/2] drm/msm/dp: attach the DP subconnector
 property
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Abel Vesa <abel.vesa@linaro.org>, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

While developing and testing the commit bfcc3d8f94f4 ("drm/msm/dp:
support setting the DP subconnector type") I had the patch [1] in my
tree. I haven't noticed that it was a dependency for the commit in
question. Mea culpa.

Since the patch has not landed yet (and even was not reviewed)
and since one of the bridges erroneously uses USB connector type instead
of DP, attach the property directly from the MSM DP driver.

This fixes the following oops on DP HPD event:

 drm_object_property_set_value (drivers/gpu/drm/drm_mode_object.c:288)
 dp_display_process_hpd_high (drivers/gpu/drm/msm/dp/dp_display.c:402)
 dp_hpd_plug_handle.isra.0 (drivers/gpu/drm/msm/dp/dp_display.c:604)
 hpd_event_thread (drivers/gpu/drm/msm/dp/dp_display.c:1110)
 kthread (kernel/kthread.c:388)
 ret_from_fork (arch/arm64/kernel/entry.S:858)

[1] https://patchwork.freedesktop.org/patch/555530/

Fixes: bfcc3d8f94f4 ("drm/msm/dp: support setting the DP subconnector type")
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_drm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 40e7344180e3..e3bdd7dd4cdc 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -345,6 +345,9 @@ struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct dr
 	if (IS_ERR(connector))
 		return connector;
 
+	if (!dp_display->is_edp)
+		drm_connector_attach_dp_subconnector_property(connector);
+
 	drm_connector_attach_encoder(connector, encoder);
 
 	return connector;
-- 
2.42.0

