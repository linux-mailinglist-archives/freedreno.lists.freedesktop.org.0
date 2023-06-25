Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A06AA73D094
	for <lists+freedreno@lfdr.de>; Sun, 25 Jun 2023 13:43:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D944F10E17A;
	Sun, 25 Jun 2023 11:42:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18E3D10E17A
 for <freedreno@lists.freedesktop.org>; Sun, 25 Jun 2023 11:42:34 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4f6283d0d84so3015065e87.1
 for <freedreno@lists.freedesktop.org>; Sun, 25 Jun 2023 04:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687693352; x=1690285352;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HlnLygFYYtSxoKEaC5DFXDBhNuXumh16hVtzEXEvSec=;
 b=bJDzcJXCkAPD5zeUzpoqy0kG3q005OtGeLsMf6/8V95IZdLI0J9FwWFQzM7I0TviaG
 7R72ljXh4KrImRig/whnSLpd6D+vlRxOUdDwWuupvCQS7qyud0wY7+GK+uT+kqTl9Tqu
 spKdhblRSZ/3kfTR4niN2Mbd10wb19O3UehlWtub8FJ/kOPQglGSe7XF9bIKwtfryB6G
 ApTzotjKQMX3+GMHDaU1t8gp+wa2hLP4pmo8Lqu+fEOwu1kpacrne/Ttr6H/9T0X90dE
 u1Lujt97vZeMsX1ApXMYlC9jczbq0/FkcAzNk0PxtqsRa8rOqSFB3L+HD3ABtublF8Qd
 PTaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687693352; x=1690285352;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HlnLygFYYtSxoKEaC5DFXDBhNuXumh16hVtzEXEvSec=;
 b=lnFLGva0lJ2iB9kFKnQQMNf4ol7/eqTuc1GfOpX2vkGihjgu0Kns+Z5duxZ8+yMKBB
 CWlGSQsDWCBjv0wYg/F+RaaodqK90za2gPQ3Iu8cFYiQGfSzPqP/yxUkzuzivQYv907H
 05RxEFJom1WDXhFyqtwvsmxFElBYHBsvYOCpcDkzDufvzczaw2NlafkLiTBlz32A1RaE
 HV7j5m6+CNC+FUELFTNmFYRatQh/2tJTh9oEx3Fbl+nUIwaVjU/f6rKOjg3vjEDB233e
 th5y7nLnFNUwkOR3xHmfZpL2gGXq4IESQwRLzufbezQBUjyFZ1tft37POwJpc9XK0lqi
 MTzw==
X-Gm-Message-State: AC+VfDxfk/h8KJTXhdIp0k5lNfrEDGufUl2bxVFz6e7gZYXtlGf++Aiw
 4Xpjk9USpXm+bebZQpYmuhC77g==
X-Google-Smtp-Source: ACHHUZ7uaGIlPGOJp+0nRUkLMEV41kt31Ga6/kU/1+uK8JUDcsenYErcV7bYVaZlQb/IfK6J5BBR0A==
X-Received: by 2002:a19:9156:0:b0:4f8:58af:ebd7 with SMTP id
 y22-20020a199156000000b004f858afebd7mr14228099lfj.39.1687693352116; 
 Sun, 25 Jun 2023 04:42:32 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 b23-20020ac25637000000b004f87893ce21sm637323lff.3.2023.06.25.04.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jun 2023 04:42:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Date: Sun, 25 Jun 2023 14:42:17 +0300
Message-Id: <20230625114222.96689-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230625114222.96689-1-dmitry.baryshkov@linaro.org>
References: <20230625114222.96689-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 10/15] drm/msm/hdmi: correct indentation of
 HDMI bridge functions
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
Cc: freedreno@lists.freedesktop.org, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-phy@lists.infradead.org, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 62ce1455f974..fbcf4dd91cd9 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -291,12 +291,12 @@ static enum drm_mode_status msm_hdmi_bridge_mode_valid(struct drm_bridge *bridge
 }
 
 static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
-		.pre_enable = msm_hdmi_bridge_pre_enable,
-		.post_disable = msm_hdmi_bridge_post_disable,
-		.mode_set = msm_hdmi_bridge_mode_set,
-		.mode_valid = msm_hdmi_bridge_mode_valid,
-		.get_edid = msm_hdmi_bridge_get_edid,
-		.detect = msm_hdmi_bridge_detect,
+	.pre_enable = msm_hdmi_bridge_pre_enable,
+	.post_disable = msm_hdmi_bridge_post_disable,
+	.mode_set = msm_hdmi_bridge_mode_set,
+	.mode_valid = msm_hdmi_bridge_mode_valid,
+	.get_edid = msm_hdmi_bridge_get_edid,
+	.detect = msm_hdmi_bridge_detect,
 };
 
 static void
-- 
2.39.2

