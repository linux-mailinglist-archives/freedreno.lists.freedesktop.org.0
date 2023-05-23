Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84ADF70DC22
	for <lists+freedreno@lfdr.de>; Tue, 23 May 2023 14:15:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A4C710E435;
	Tue, 23 May 2023 12:15:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C70A410E436
 for <freedreno@lists.freedesktop.org>; Tue, 23 May 2023 12:15:07 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4effb818c37so8126583e87.3
 for <freedreno@lists.freedesktop.org>; Tue, 23 May 2023 05:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684844105; x=1687436105;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HlnLygFYYtSxoKEaC5DFXDBhNuXumh16hVtzEXEvSec=;
 b=SL/WVHABS704+8O+JkeKaXTNIjTPa6bMNxe4CV7AGXBoUs/Jdt4ceFX7jQwNDAyN1+
 BJOdBVhocMwX+gbdjC8AlbYXA9mlNGWCdJM+iikUuY1fcz4I/dmwnnMiBgAXlV1S7tXL
 jfviyHrP2KDMfy76e8Lg1peoMrw1hq/5Ocuk0nQ3vXbGRwtzQf8YiTGt0icIpgU0fNWQ
 iRUecbmN3nbJywrZahJkGoXLhrzzXS8TR5ngxOFwOZcBG1P36g9r3irNgFshMUr9qw7x
 xL47QOII4bg1JQ5vU0zlR9msEyIZfYCj9nDGwfhp4y1OYpJtNIXrATNNec4qpF2HkvxP
 JrJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684844105; x=1687436105;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HlnLygFYYtSxoKEaC5DFXDBhNuXumh16hVtzEXEvSec=;
 b=eUtc2pyg/vMti38CvePYv63L1Td982tLW1i7XThsbnPHiLR3DNOffRmibiJyP04x5N
 TmoxKDWDSGzdSL4EUDJ3g2sFIURTc/koyVE5yOUfqK9L481LhDVyhrwuRtYMeYzUXSn2
 Q6ho/2T2u/EBMMtHoKtqf7XgS7mawQSXKVU7bVfQg7hj4tJLl7KdENVwTCSNV9lrLrfA
 s+lootQR39GY92AfRqqQjr+U0c5Oo/YWsQn3ExMoWE5vWC77kT+KeIaJBQDYVd6lc5rc
 ucfaz6sAZXYFSNuQIKC6PR/RhhWNz5icv5VP5OSeP9qnRR7UmrsRjnSh1XgWTrmQrLq8
 +xtg==
X-Gm-Message-State: AC+VfDwuxRLnr3RqHa2Ki0NacijU6Bi36pxVdfi5TkWIJYc/vkhcp0MH
 I7pHvH5AoSqUIU2Qs5cYlmKOja5K/9eJTpeyHwA=
X-Google-Smtp-Source: ACHHUZ7RIvGjdINojHjJ65ERgUVxZ9JLqK/cT+DIqTF6C4Xu/7dDxF+Uml9xZ924hzI/Ju9SUi5sYw==
X-Received: by 2002:a19:5213:0:b0:4f3:a0f5:92e5 with SMTP id
 m19-20020a195213000000b004f3a0f592e5mr3853326lfb.31.1684844105762; 
 Tue, 23 May 2023 05:15:05 -0700 (PDT)
Received: from eriador.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 c26-20020ac2531a000000b004f160559d4asm1319616lfh.183.2023.05.23.05.15.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 05:15:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Date: Tue, 23 May 2023 15:14:49 +0300
Message-Id: <20230523121454.3460634-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230523121454.3460634-1-dmitry.baryshkov@linaro.org>
References: <20230523121454.3460634-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 10/15] drm/msm/hdmi: correct indentation of HDMI
 bridge functions
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

