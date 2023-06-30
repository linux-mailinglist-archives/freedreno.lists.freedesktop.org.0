Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F013744396
	for <lists+freedreno@lfdr.de>; Fri, 30 Jun 2023 22:55:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 116CA10E4F4;
	Fri, 30 Jun 2023 20:55:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C879A10E4F1
 for <freedreno@lists.freedesktop.org>; Fri, 30 Jun 2023 20:55:29 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4fb7b2e3dacso3788045e87.0
 for <freedreno@lists.freedesktop.org>; Fri, 30 Jun 2023 13:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688158528; x=1690750528;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kMftiAUxeR8BPoZkZvXeNvb1WLgqdhL6DsPjfLjpExg=;
 b=usVfE0y4jfSD00eARARtyNvfymfnThV6CUhlklL4nAs6e+w1JYFtG/5wLuXzyS+hVf
 Pqv1DBUv1x33Etorg51OvJadmEhWLrgSD2UHH3c2dWGnfuYMLZ7x440UPtBPSL3PTDkp
 kNRkPlRhB9hbrWGKCM3IWX6uPIs51/XTFABGyhDut2tDfIZYnCwCSTZEyZd/VwKDIUn+
 kGH/ZsilZTaONYNkaBiVWuieLVxb3Q3uahF/qo6huPbs/Vj+lIpUwlaD0cLXsUSVFmha
 be2EdSDAszQFtvTyHfID1odLugarT7IN/Vz91nW7In/DfMV9dy82MBLKuB/4Jz/svyVT
 FOYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688158528; x=1690750528;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kMftiAUxeR8BPoZkZvXeNvb1WLgqdhL6DsPjfLjpExg=;
 b=RsKkZ6ApGgphwkwP8rJWN2qWM9UA/VVn6vMvS23QPsW3CG3gx0sZialtHeP/vB1/5+
 YqKaiUnbmmV388VL+inB39yQDq+y6KWxuJ/pL9D0I5hyt8Lr2j79iUKG7NFCckI2LDxm
 hPJewZ5cnUgHoY1NAesqmIP3S5ega5vNB3GyrsEKD7hWVG5vmAxfYr1u17shmywe5T0a
 eSE9AovwiYpRWj8ALQbkaGNA+iLluD+VGbAHP3P4dr1i1HfTZTft8fIB2fg5lZPe3YHO
 utLu7n95igcgqax1o97G1+49/xwQh1W6IxdjUv5venKfDVMcbDI8TnCl1Xi6KKcXo7Q9
 cjCA==
X-Gm-Message-State: ABy/qLaoCyeuLEUa4KAz2v+tRu7knccvAaRfwDeamNOG3Z7UZr6nMoOE
 7B+AAhZwyAGkTzH7PU9R2k5dgg==
X-Google-Smtp-Source: APBJJlHyyQbnm/lpzaiiXKLntZxu3ILVALF+gEnPjZh2lE+JZqTtQLBu3lv4roeobNHdDchPapmEtA==
X-Received: by 2002:a05:6512:619:b0:4f7:6a40:9fd7 with SMTP id
 b25-20020a056512061900b004f76a409fd7mr3055482lfe.47.1688158528191; 
 Fri, 30 Jun 2023 13:55:28 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z11-20020ac25deb000000b004fb75943aa0sm2252168lfq.196.2023.06.30.13.55.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 13:55:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Fri, 30 Jun 2023 23:55:13 +0300
Message-Id: <20230630205523.76823-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630205523.76823-1-dmitry.baryshkov@linaro.org>
References: <20230630205523.76823-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 05/15] drm/msm/hdmi: set infoframes on all
 pre_enable calls
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

In consequent modeset calls, the atomic_pre_enable() will be called
several times without calling atomic_post_disable() inbetween. Thus
iframes will not be updated for the next mode. Fix this by setting the
iframe outside of the !power_on check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index f9293f7d8f34..bb10b35194ff 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -141,10 +141,11 @@ static void msm_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 		msm_hdmi_phy_resource_enable(phy);
 		msm_hdmi_power_on(bridge);
 		hdmi->power_on = true;
-		if (hdmi->hdmi_mode) {
-			msm_hdmi_config_avi_infoframe(hdmi);
-			msm_hdmi_audio_update(hdmi);
-		}
+	}
+
+	if (hdmi->hdmi_mode) {
+		msm_hdmi_config_avi_infoframe(hdmi);
+		msm_hdmi_audio_update(hdmi);
 	}
 
 	msm_hdmi_phy_powerup(phy, hdmi->pixclock);
-- 
2.39.2

