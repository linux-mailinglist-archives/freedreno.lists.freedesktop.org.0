Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 120C573D092
	for <lists+freedreno@lfdr.de>; Sun, 25 Jun 2023 13:43:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37BFE10E16D;
	Sun, 25 Jun 2023 11:42:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7234410E166
 for <freedreno@lists.freedesktop.org>; Sun, 25 Jun 2023 11:42:35 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4f8735ac3e3so3006873e87.2
 for <freedreno@lists.freedesktop.org>; Sun, 25 Jun 2023 04:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687693354; x=1690285354;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kMftiAUxeR8BPoZkZvXeNvb1WLgqdhL6DsPjfLjpExg=;
 b=nE9hwWDfWngVy/rJ1ATloHL2acbnwoqhkXi38nYNFRf1kqZvB71Smf9bY+b/qkrxRP
 MXwB9J5C9ItoBwkkMGNCcn4lpjlZqKXZYOy7ojITBqpz+YA0ayUBiGBnq9HlMmAGb12O
 6u3q0MrT4vlbNvIjFcH+4UMvFq3OVM9Dvw3BRFepnAVB9fEDbqIAit6SifKg1vx1xKzW
 P63sX/0OItKDxNlXzDmh7X/E/fLaWYYPXDddddvAK4XUNeaXVOLEYi+MNbGoqxV7RVQS
 zw6oboCfNTyAoJeHJ9c6K/PvkFU0vbURW6HoODLyIT5IOHXAxdyu2IgUUWmSYxKc133c
 /Z5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687693354; x=1690285354;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kMftiAUxeR8BPoZkZvXeNvb1WLgqdhL6DsPjfLjpExg=;
 b=cwCPm6gVlvnr+cEKgKe5mb3eVeL+AMBdEA2bUXvAoNVfaQlnfw0Ck1O72jjbzXxpc1
 0Dp4j1af7GvP19nupNqmXmiyEV4DJPAp9TaQq7hOKHGB6nyVnlNEDHcgNaruc7wk/hVq
 oYq7r98PTONJew4wiw4xldq1VMmvhFvPlgI7pi7CeI3BKeCBCbgMTPy01xBo0SMEzlt5
 RaurCsq94m7RSQYmdDSg3hfdSBxALaeFKpwD1bLPslH1S/80g84zqGtcz6Lwz0ut8bDh
 ekNDNc1+dRy4mSx5dotQ5IxJVThTZ/u+x/McI5JIU/5E73Z88ckNEJFaCtuWUCUdfDQ+
 YhOw==
X-Gm-Message-State: AC+VfDx8nbf+5HsI1k9hS3vbwrfeC7TA1egVhUnScEA5XRsKLYQPHk+7
 UhBJAwCb0QlRGfTjKCVBLTA43g==
X-Google-Smtp-Source: ACHHUZ42a3rY1LXrItHqP+/HoHNQ4DRPF+yUblDDgmlM5wyJNaabrKnL1yHAUQYVToD3/xWvmBDNxQ==
X-Received: by 2002:a19:5018:0:b0:4f8:75b0:2297 with SMTP id
 e24-20020a195018000000b004f875b02297mr11187764lfb.43.1687693353834; 
 Sun, 25 Jun 2023 04:42:33 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 b23-20020ac25637000000b004f87893ce21sm637323lff.3.2023.06.25.04.42.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jun 2023 04:42:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Date: Sun, 25 Jun 2023 14:42:19 +0300
Message-Id: <20230625114222.96689-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230625114222.96689-1-dmitry.baryshkov@linaro.org>
References: <20230625114222.96689-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 12/15] drm/msm/hdmi: set infoframes on all
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
Cc: freedreno@lists.freedesktop.org, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-phy@lists.infradead.org, David Airlie <airlied@gmail.com>
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

