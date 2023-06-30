Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E09BB744392
	for <lists+freedreno@lfdr.de>; Fri, 30 Jun 2023 22:55:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8E3910E4F5;
	Fri, 30 Jun 2023 20:55:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46E1D10E4F1
 for <freedreno@lists.freedesktop.org>; Fri, 30 Jun 2023 20:55:28 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4fb761efa7aso3730138e87.0
 for <freedreno@lists.freedesktop.org>; Fri, 30 Jun 2023 13:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688158526; x=1690750526;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HlnLygFYYtSxoKEaC5DFXDBhNuXumh16hVtzEXEvSec=;
 b=LdRu7+xmOYqxG4so8J+p/be/A77ZNeA7zmtp4kw1Hp/6IRShPyqjPxt7SqvY9L/fMp
 JSJOEjvvXUNpHzV0m0XeMszPtCNtcy1g7CUsacsBOQ3Wqge+LVApp+MyzRn9sooIS77R
 KhCsrRZD7fTHF+sh0w2LSCFWaa/WleAO51og0EtbQ8/LoJePP3zPDJMelaWFgCXhIUbU
 vuJ1iP9Nk22/wh5oHgPfOP1bPk+eUEkU51NT8CUeFx8JHNkg1o8JkQ4/xfmxQYatn5Gt
 DK96D//0mZWICso7x0Pmde3f/VTSLmpCz1VjNPTsuJO+k5WVHtyq6ajJKD+dBShRlZTS
 O5OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688158526; x=1690750526;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HlnLygFYYtSxoKEaC5DFXDBhNuXumh16hVtzEXEvSec=;
 b=MkvTnlkQlay8cEwtfEmjmngdcXlLiUEp+AZ3RrcW5t7ybIkFJ9OgCIDWyiL2pS6PFo
 An8G3AQStO/mu3tR5RebaWGzjxd+d8/jqoF8A7+Oiu7yNZ4qIS00Q0PjbNR7GyupEkXv
 XccjoPzJlqvrhumNSB48tfY/G/bY2MjVQPvLzlWQQ10TrtijeEDAObHv1iG/QKFueSV3
 Wutn+6tamRlhhMNXIO5H9EnO9lfTXYsBNLOWDqX0Tawaf3RnOy8sD0OpH4tXrwdpOB9D
 zFKJepqa4DiDFRe7ck35VhkEnCesmos0dODvn5x0xsJxQgFGfLmNpalYcH8eG+u0l+xO
 mIcQ==
X-Gm-Message-State: ABy/qLZewB0GPJHLFP4oYISyoqF+B57ZZmTxdgvo/e9yohFkRCk00MPl
 IOvyppnJnc+hWB81U3Pbr0/0WQ==
X-Google-Smtp-Source: APBJJlFrki3ug4eykwM7IZLMHwKU+OyXNp/uu8IFYeAHUGGL1wXbnHzfztuBeqQ0EYYaVO81BtySNQ==
X-Received: by 2002:a19:2d49:0:b0:4f8:6e1d:cf98 with SMTP id
 t9-20020a192d49000000b004f86e1dcf98mr2983408lft.66.1688158526612; 
 Fri, 30 Jun 2023 13:55:26 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z11-20020ac25deb000000b004fb75943aa0sm2252168lfq.196.2023.06.30.13.55.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 13:55:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Fri, 30 Jun 2023 23:55:11 +0300
Message-Id: <20230630205523.76823-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630205523.76823-1-dmitry.baryshkov@linaro.org>
References: <20230630205523.76823-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 03/15] drm/msm/hdmi: correct indentation of HDMI
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
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

