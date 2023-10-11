Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EB17C5F4C
	for <lists+freedreno@lfdr.de>; Wed, 11 Oct 2023 23:47:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 888E410E20F;
	Wed, 11 Oct 2023 21:47:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A99D410E205
 for <freedreno@lists.freedesktop.org>; Wed, 11 Oct 2023 21:47:09 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5044dd5b561so442408e87.1
 for <freedreno@lists.freedesktop.org>; Wed, 11 Oct 2023 14:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697060827; x=1697665627; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wPUGWW275MYstsSHxHHUDypFjqdrph9V1YvKG1p4fyc=;
 b=YgJtaMbm2xwRT1vQP4H+zgNvc1R0QD64oEaEIaZpSb/HICKI/XgB2IkU63h+zmhias
 1rp7yUSaWiw6MzKB3F0u54r6do2cSnTcEmtKUux0DaIHZXo0WzFglQT25AS2ifvgIMpe
 oQkAiyQPA0jh0yO9tGoTqCNLkaZuuWK9BmNyqCMfru5RJVFBwMauc/EpX1M0JrwYp0nn
 WX7JM5qu+C/qd+eDQsydcizFMXqeLeJ03tOqi63S+jgXR2QTRASoyNntXJxiV3zAm+wo
 pYvBy0qc7QrwVkTFwacvU23ZKrmyJFYr6rvMiW5eKNWWAJgFLJT20tg1RoYI2XKRtLI8
 xFYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697060827; x=1697665627;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wPUGWW275MYstsSHxHHUDypFjqdrph9V1YvKG1p4fyc=;
 b=wnX7vLaGS6lpRsRKc0mRjmdKrCEaBz9x572KeZdAUXcM8WAmXI0X9rUFHwc77vRpJb
 q6HChkoArpyI6Bv75MXqE/JTRcyUgrzBe5xsLgTE3ZLscPG0bP5XWLAZ6VYc9vajmLmU
 esjCUV/iVP8Ce9eEbH7uQYihYWdNVudkN+sI4pwju53JjkWwbY+ZvKAPUoR7oI42rikx
 OlJkwL+xy4mBWmCK9egLO7spgMzshjqV6r6SufkuzFb8oWfRZhP8/BtWHaIFOWV7Y/gk
 wPNHQNgrDbOKbaghvyobteUR7QAxC1SW8270sHACzgDKYt7F0p9yCA4+wfHq+7WTSORh
 TGTA==
X-Gm-Message-State: AOJu0YwK73f8xHcQamX5rYBjhSi+0ph8K7hOiEQDeN9zWWmY8HV4Rte/
 YCpGzVmfF70xCgj6naKeGHDwcA==
X-Google-Smtp-Source: AGHT+IHAQzCJ2KIdfIvr74FJ4FmySCFQSZAxPAtlfM1u4q0G9LMI7SdYKf1D9vU2z0PW+GjWV/UsDg==
X-Received: by 2002:a05:6512:e9f:b0:500:d960:8b6d with SMTP id
 bi31-20020a0565120e9f00b00500d9608b6dmr23912348lfb.33.1697060827655; 
 Wed, 11 Oct 2023 14:47:07 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a056512050f00b004fbab80ecefsm2452485lfb.145.2023.10.11.14.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 14:47:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Thu, 12 Oct 2023 00:47:04 +0300
Message-Id: <20231011214705.375738-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231011214705.375738-1-dmitry.baryshkov@linaro.org>
References: <20231011214705.375738-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 2/3] drm/msm/hdmi: use correct lifetime device
 for devm_drm_bridge_add
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
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The lifetime of the created drm_bridge is attached to the drm_device
rather than the HDMI's platform_device. Use correct lifetime for
devm_drm_bridge_add() call.

Fixes: 719093a67c7f ("drm/msm/hdmi: switch to devm_drm_bridge_add()")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 0b7a6a56677e..f5e01471b0b0 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -331,7 +331,7 @@ int msm_hdmi_bridge_init(struct hdmi *hdmi)
 		DRM_BRIDGE_OP_DETECT |
 		DRM_BRIDGE_OP_EDID;
 
-	ret = devm_drm_bridge_add(&hdmi->pdev->dev, bridge);
+	ret = devm_drm_bridge_add(hdmi->dev->dev, bridge);
 	if (ret)
 		return ret;
 
-- 
2.39.2

