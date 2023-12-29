Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4413E820253
	for <lists+freedreno@lfdr.de>; Fri, 29 Dec 2023 23:57:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D28C10E2E6;
	Fri, 29 Dec 2023 22:56:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD9E310E2D8
 for <freedreno@lists.freedesktop.org>; Fri, 29 Dec 2023 22:56:54 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-50e7b9cca2fso4415521e87.3
 for <freedreno@lists.freedesktop.org>; Fri, 29 Dec 2023 14:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703890613; x=1704495413; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=65Hje5YXaORQSyEWFWupE4ife9x+kLl2sZ7qIz73e34=;
 b=lwlYltNAfP92Fj+/VCX8J2EIAFS83LMKw9sU7DeV9QHFP1qy18NsD+CiQWcCj5j9N8
 YCbEpcpvjy0c6em0DPqIR5qF2hrrcNUrlkIuoxZb/UwTimrq/GPxHLJr3icdG5iGEPbF
 8GkZzl44geF+UAbXvCVW0+UxQNaELw8HtRaIW5iQwHSoc5x8G7gsu/dYx5KNYgQGpFFU
 AacIq3Nt83mC1FqMpiewTi/adCK66Ky5Jd+g5X1YHXPdIxFdkMBmiyOR5A6rH1eZZNvA
 rSW6nArMxvoyYnVUOrAtyf+/NThkLjcM2RWF/Wy0mC2T6rE+Blj8fWsu107pTf9oP9fY
 lOeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703890613; x=1704495413;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=65Hje5YXaORQSyEWFWupE4ife9x+kLl2sZ7qIz73e34=;
 b=c9z9AWZyhaYB7oG5XxsljprTGIQpUaDAGMwGuL9dhMb908DfAfhKo9t7YI85/A3mBA
 NZ9FhnBeXVepq4AYwe8y5flQsP2FTcQz9xJlo+F+e04pa1rRgoeNho39taOCh2nT9WDT
 ubbaktveI/PZ4GRNY99gKXaV9aFniG+IFLUBWaA9tzOHxodFQsJayvTtYVvFevBIrHBm
 3dGUFAdN2eZ0G9LfZVgaQS1e63yn6YxAluj7VZNW7M5INg4phtDO1pVj+mEwHL5PKueR
 FQKi1L2PBeBx5iVm4KwNep0IjgIncbUk7gqW7NPI1N/eA197x69p/dTUR/3jsmgmAUGt
 m5wg==
X-Gm-Message-State: AOJu0Yx/gUeB6HplyyH16/8wH3Nt5hwtIByGOHavVxfdKDWn6De3rUFT
 M6K66obDvhHDb5PaZlxY3nJP2lspJgrk1g==
X-Google-Smtp-Source: AGHT+IGVq+diA0pkorRsAbsI4Anh7OfFf9HYssPj86p2ooUO7ezBaTmvKfh/JqVgeB8/bDpP0XljlA==
X-Received: by 2002:a05:6512:3b07:b0:50e:7ef1:df8a with SMTP id
 f7-20020a0565123b0700b0050e7ef1df8amr3140027lfv.58.1703890613116; 
 Fri, 29 Dec 2023 14:56:53 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j26-20020ac2455a000000b0050e7f5794cbsm1326952lfm.309.2023.12.29.14.56.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Dec 2023 14:56:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Subject: [PATCH 02/14] drm/msm/dp: drop unused fields from dp_power_private
Date: Sat, 30 Dec 2023 00:56:38 +0200
Message-Id: <20231229225650.912751-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231229225650.912751-1-dmitry.baryshkov@linaro.org>
References: <20231229225650.912751-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Drop unused and obsolete fields from struct dp_power_private.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_power.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
index c4843dd69f47..b095a5b47c8b 100644
--- a/drivers/gpu/drm/msm/dp/dp_power.c
+++ b/drivers/gpu/drm/msm/dp/dp_power.c
@@ -16,9 +16,6 @@ struct dp_power_private {
 	struct dp_parser *parser;
 	struct device *dev;
 	struct drm_device *drm_dev;
-	struct clk *link_clk_src;
-	struct clk *pixel_provider;
-	struct clk *link_provider;
 
 	struct dp_power dp_power;
 };
-- 
2.39.2

