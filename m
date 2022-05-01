Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BCD5164DE
	for <lists+freedreno@lfdr.de>; Sun,  1 May 2022 17:12:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB8A10F233;
	Sun,  1 May 2022 15:12:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28F5910F233
 for <freedreno@lists.freedesktop.org>; Sun,  1 May 2022 15:12:24 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id bq30so21643783lfb.3
 for <freedreno@lists.freedesktop.org>; Sun, 01 May 2022 08:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XGarRpvctMdxGlcndXm8WtgN3hVc/0JI0oFVA6fZ9m8=;
 b=RsHhj3VoDc3LIISFBmPUISWBPnxfnKqaLqDLkptb7/ia7ul5svNa1NVf/cMmGbW3td
 LuSTh8xLcmxUgPLq8MMwnlav0I2d8Wv+h1gc13z7PMZWuBpAxykTdrhDig8y0vqfitPv
 uMzGSaBsG6SkL2QHNwM09XPg/1lYIhX+w3Esssch+velHOTjAeI8+J/ACVXrGmMERmec
 5JlM/U0lMk1LevuwIdqGIMHXA3F7E9FvlUvD/xY8fcE/cLbmvrVjB8KwKT6woBAXRSOr
 bhhwJIjR/08U3OcJI6Rm7vLzrd6LJRBt4hx8jPgK6FM/IMCNpsxVeSZUwDuq9xBLUrBA
 wBdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XGarRpvctMdxGlcndXm8WtgN3hVc/0JI0oFVA6fZ9m8=;
 b=1fPlHMkHS8E2zsSZ33/Cp+tnrRXvBUkexXqN8UfP+54uVq2CDzFCfaQidt7xaDjVg6
 I8TTqJdCsbNqX/+ud5+mrbkC8/3GgmrlFwZU23d9P4AGEAzt2Ikx6A/xlsQ1T1s0Paf5
 aixzH9oG4yPbQOEQXeQHi6UtieIUlcpjf5S7RD6cAGnx9qsmulzC85S4dB9ddg9HBCQa
 Nt4aRsiKInB0LglIZ495n7xZySsFiVR4EuabdnIq8R9cNpWKeyxWqcrLFCAe1+nEiNay
 gEA224B9KMydanuz+Z680qzwZzKFFx5cflArNAjZG+NpLfMlZ7siMErzZ45n7K1a59Rj
 FUQQ==
X-Gm-Message-State: AOAM530Ae0Hf3SHdi5pOLs/z21junbJShc9lEzjOMlrNOXv9u4u9EnFg
 0FTyL9D7rwZJhwZMHd7Y5KG9Ig==
X-Google-Smtp-Source: ABdhPJzF3yd5sTdv0tEELeBUYEWDcbSrKXbhUZWTy0NT5w5e1JZRH9LQky4B6RnAS+09nIdjm7e/IQ==
X-Received: by 2002:a05:6512:a83:b0:472:1817:145b with SMTP id
 m3-20020a0565120a8300b004721817145bmr6554902lfu.437.1651417942371; 
 Sun, 01 May 2022 08:12:22 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 l16-20020ac25550000000b0047255d210dbsm461975lfk.10.2022.05.01.08.12.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 May 2022 08:12:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Date: Sun,  1 May 2022 18:12:18 +0300
Message-Id: <20220501151220.3999164-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220501151220.3999164-1-dmitry.baryshkov@linaro.org>
References: <20220501151220.3999164-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 1/3] drm/mipi-dsi: pass DSC data through the
 struct mipi_dsi_device
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
Cc: Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The commit 0f40ba48de3b ("drm/msm/dsi: Pass DSC params to drm_panel")
added a pointer to the DSC data to the struct drm_panel. However DSC
support is not limited to the DSI panels. MIPI DSI bridges can also
consume DSC command streams. Thus add struct drm_dsc_config pointer to
the struct mipi_dsi_device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/drm/drm_mipi_dsi.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 147e51b6d241..8b1c9be9b2a7 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -177,6 +177,7 @@ struct mipi_dsi_device_info {
  * @lp_rate: maximum lane frequency for low power mode in hertz, this should
  * be set to the real limits of the hardware, zero is only accepted for
  * legacy drivers
+ * @dsc: panel/bridge DSC pps payload to be sent
  */
 struct mipi_dsi_device {
 	struct mipi_dsi_host *host;
@@ -189,6 +190,7 @@ struct mipi_dsi_device {
 	unsigned long mode_flags;
 	unsigned long hs_rate;
 	unsigned long lp_rate;
+	struct drm_dsc_config *dsc;
 };
 
 #define MIPI_DSI_MODULE_PREFIX "mipi-dsi:"
-- 
2.35.1

