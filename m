Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A73DB70DC26
	for <lists+freedreno@lfdr.de>; Tue, 23 May 2023 14:15:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94C4910E440;
	Tue, 23 May 2023 12:15:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E72E510E43E
 for <freedreno@lists.freedesktop.org>; Tue, 23 May 2023 12:15:09 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4eed764a10cso7938073e87.0
 for <freedreno@lists.freedesktop.org>; Tue, 23 May 2023 05:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684844107; x=1687436107;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kMftiAUxeR8BPoZkZvXeNvb1WLgqdhL6DsPjfLjpExg=;
 b=ETX+jpQh1MkS/oEmbkm1RFkjIuPTjVkoKZKMQyqb44Ujy6MPxqvuFFRR5Ozv1N0fPL
 IyRB8EvrCQUBDzkstsPROcFAYQ7O6UofNHKb4BgRFu8BpUTjlKD5eVx0dhx3mVAHQr+e
 ozCd+EVp6H33iBFNoDaAnD5i2WIfckcUzBL91i4FYMXFEn7vvogAnsjs9zn53E/hJkK3
 LElwG+XWm/cAFZrLhqcdOPkbMVV/f7Z65RHR/MDV4Mm2ULcy2ilkir4TjCbvjfiTc8iB
 BnpqO61RlUfjK6tn/iGB7tqivbti3PaXHqJ4yeetkBiZ9/Exc43+iHe9sV9rqRdhlFe8
 Px/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684844107; x=1687436107;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kMftiAUxeR8BPoZkZvXeNvb1WLgqdhL6DsPjfLjpExg=;
 b=IJ3DvEfkSfv0vnl+9tRf4icS9WsOIkZbJySM58SgyQtFjcQj85PjyWaw0/jMvkSWgD
 ph5zLXEVcuoeVvyMFrJWcY+fhzW7QV1kET4F0ftab1QqF9/GN0qGoTHGf2iAarPx76is
 3JSIsW3WKXjEsJPkkr7/ag6gG6PTEyNcjwevec3DrQz5zWVM98TANAE0lT+Styh+H0u4
 DjXv6CdaAlcLyUmGAlomqym4ZLQg+33/eHxVQC001BtnZRzQv9rxwsz/l/GiRy6VuygN
 atVzXZgcCq4gU2dxNjxJ8Om6rzS1ClN3506l0AE502tFf4uPAEnrjfV0YubRrz/h195y
 POmg==
X-Gm-Message-State: AC+VfDxq3gQ79VedXtQKaScqiU/33HQ/i4GkJpce5lWMk9dp+Jc+LoFa
 cGX9J90QBsObZgPIo6dJVkD8YQ==
X-Google-Smtp-Source: ACHHUZ43GR6mi7FCfEihpvwLYVmk40w1hC6t0c87laL1uoecXBbBd/pseUpVwOps9C9xtYnTi/b2Gw==
X-Received: by 2002:ac2:5fae:0:b0:4ed:b4f9:28c7 with SMTP id
 s14-20020ac25fae000000b004edb4f928c7mr4155100lfe.6.1684844107381; 
 Tue, 23 May 2023 05:15:07 -0700 (PDT)
Received: from eriador.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 c26-20020ac2531a000000b004f160559d4asm1319616lfh.183.2023.05.23.05.15.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 05:15:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Date: Tue, 23 May 2023 15:14:51 +0300
Message-Id: <20230523121454.3460634-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230523121454.3460634-1-dmitry.baryshkov@linaro.org>
References: <20230523121454.3460634-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 12/15] drm/msm/hdmi: set infoframes on all
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

