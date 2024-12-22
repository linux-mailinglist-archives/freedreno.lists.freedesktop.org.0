Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AA49FA7EC
	for <lists+freedreno@lfdr.de>; Sun, 22 Dec 2024 21:14:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 818DF10E0F3;
	Sun, 22 Dec 2024 20:14:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Sne1SfKt";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A70410E0F3
 for <freedreno@lists.freedesktop.org>; Sun, 22 Dec 2024 20:14:13 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-3022c61557cso45388941fa.0
 for <freedreno@lists.freedesktop.org>; Sun, 22 Dec 2024 12:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734898452; x=1735503252; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=GfWsP8zJ6Bd75v6qXHtg0PPjaDnw7fwLfE4CLjuKSrI=;
 b=Sne1SfKtsaYSCwordL7T3I4dZvgYudopv4g+ai9huxv/lSJeaAaBjRQOAB6tARwgoh
 oTflEeiHDu5pvjvf2tunQdJEEDBQJRe4N97SSLOpaXX1yP3BKwvbJ9tmpvl6vuMyMR6g
 G430wm7faI31eDONQYqQzeUZnW1DEX8aveShA6/3P+rcYTYmXXSCoBfSGln9bqbFD+wn
 wE4tPz0vj3EwhyeNxJ6WE3o6jO3xP4dWTOC5f+cIpDv5Lz0a+1iW+zrEMXNqLqzUeGQl
 SY7VxwOON9tzk7j4c1n2to7lYCh/wSeM+EYoykspRxR+DuyO3uelXGHRKmD1yuZPItyc
 jkUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734898452; x=1735503252;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GfWsP8zJ6Bd75v6qXHtg0PPjaDnw7fwLfE4CLjuKSrI=;
 b=P0pDjQlfl5UhArYpndGqYP7Js8pjiJMmVlXlTjujzJCbnlhxOstmW/JVCEJrWKmgBJ
 lqJIvC7wA/9y+W5cZXOzp0rcLDDREQaug8jMYy7gqyrrFMyINuSWF2UrymQL1xj98/eo
 BsPmQB6LIjQmaWAY98mZI2Bt7+pF1ERPXZWYyL+5a20tx/63iw+kwo0XCkNaOcsQYO3K
 ndmH6bKVjHR+cVDw+u4kk3wgmeb0azhFSmsARABReDvJFIvVsXOr23RMGZ+vvqGBIiLN
 WK0bCpXg/z8kEIKOK73F7S5XwSS9SFFHPfVESH1Q0QXXMzD7u9exWjb7KGQ9ZR86Pj1F
 XKPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUn4bHFvY0+Peh/YF3VkDh+mUUsE1ItwL45Ot6nTO2T5h4/mi1CqvREBQN2U/yaWmBzDgG2hRm+DfU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyRGA1WcFecv5h9sKBTqYGeXXSrZBJtcSVd+iYmMZqjFA6A9Gze
 oIL5h8BxrqGy2GwV0n62mDfUcTK8cxytbG58J1FIP1QWIb1TNU2G/NK/XnCA6do=
X-Gm-Gg: ASbGncsZpPNZzteUHs3RZ7IkjXvNbNDIrx5yFa3uHcGg1mvER1RvlZj7Ra1ltVZDSPT
 gzj4BpIQuvEAbaP+WNzxwC31fy3qgl01fPdwMP7sKjODBICw+CnbTgAa5RT+xEib1ifCydqoq0F
 D5fs86eLQxmrUeyPI5scGYL2CfMmwll9kXs4HwsGb0cYWUwB1rYlHEOZCkxPOQnM5LCUJUKGV8J
 M/rq/sLpZO80z4JjZdIRtWYgxTwOMF+UaQCyyJ+h0f/qPatOhj256ClUKnmC8N3
X-Google-Smtp-Source: AGHT+IF2hs7U2IOGhzcx5YpO+C2EoTCBdCFGQtBxCnmoWVldzG+ujthX6kCy1bdhismRsdOvmBoXIA==
X-Received: by 2002:a05:6512:1309:b0:542:2934:71a7 with SMTP id
 2adb3069b0e04-54229532463mr3380150e87.15.1734898451761; 
 Sun, 22 Dec 2024 12:14:11 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235f7765sm1034331e87.13.2024.12.22.12.14.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Dec 2024 12:14:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 22 Dec 2024 22:14:04 +0200
Subject: [PATCH v5 01/11] drm/msm/dp: split MMSS_DP_DSC_DTO register write
 to a separate function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241222-fd-dp-audio-fixup-v5-1-370f09492cf6@linaro.org>
References: <20241222-fd-dp-audio-fixup-v5-0-370f09492cf6@linaro.org>
In-Reply-To: <20241222-fd-dp-audio-fixup-v5-0-370f09492cf6@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3146;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=pwp2kwUxVvqIf59YFiuScbWDIyecIHnjWcyoreyeCFc=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ3pGMa++0LZ/1XryNU8XlohaeJpOvM3S5L286MlyAQZzM
 eUHs5Q7GY1ZGBi5GGTFFFl8ClqmxmxKDvuwY2o9zCBWJpApDFycAjARpzz2/zGXWevjfXwYtV1v
 /PtxeepZydq+SV2PPRnclXoqvzWumxjZ9VfvBl9PUJSqxO/gxtC1wZGTPrEsdhEvE5tyzCnxgwl
 n8keNQ6tOhhl9dVy7I6IwymqR8dYnLe8m9NdlulcevWrxJfPo9zUiyrnXznYKdq15mx/2ao3JX6
 N7yj+2XxPNfHVoIuecZdeLD5kn956Zc6jztUqWYkEE5+HLcWpxR/x596zxb3bfscvKljP+8Zltx
 yL/cInP6UyP7uVxjrj6dQbjN2ZGgy8b4lNbvip1T/lwXUwgU21C4Yk791bVVUT2C+QzeYmkM5x8
 c2udCLOeh3qUzfyVUsvV7V7wtrgyF5jvuhy+f+OCKyqvAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

It's the dp_panel's duty to clear the MMSS_DP_DSC_DTO register. Once DP
driver gets DSC support, it will handle that register in other places
too. Split a call to write 0x0 to that register to a separate function.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # sc7180-trogdor
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 9 ++++++++-
 drivers/gpu/drm/msm/dp/dp_catalog.h | 2 ++
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 2 ++
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 7b7eadb2f83b169d8df27ee93589abe05b38f3ae..4f80eceb6ae19f542110d7379007f57c2ac16a8a 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -486,7 +486,6 @@ void msm_dp_catalog_ctrl_config_msa(struct msm_dp_catalog *msm_dp_catalog,
 	drm_dbg_dp(catalog->drm_dev, "mvid=0x%x, nvid=0x%x\n", mvid, nvid);
 	msm_dp_write_link(catalog, REG_DP_SOFTWARE_MVID, mvid);
 	msm_dp_write_link(catalog, REG_DP_SOFTWARE_NVID, nvid);
-	msm_dp_write_p0(catalog, MMSS_DP_DSC_DTO, 0x0);
 }
 
 int msm_dp_catalog_ctrl_set_pattern_state_bit(struct msm_dp_catalog *msm_dp_catalog,
@@ -1039,6 +1038,14 @@ void msm_dp_catalog_panel_tpg_disable(struct msm_dp_catalog *msm_dp_catalog)
 	msm_dp_write_p0(catalog, MMSS_DP_TIMING_ENGINE_EN, 0x0);
 }
 
+void msm_dp_catalog_panel_clear_dsc_dto(struct msm_dp_catalog *msm_dp_catalog)
+{
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+				struct msm_dp_catalog_private, msm_dp_catalog);
+
+	msm_dp_write_p0(catalog, MMSS_DP_DSC_DTO, 0x0);
+}
+
 static void __iomem *msm_dp_ioremap(struct platform_device *pdev, int idx, size_t *len)
 {
 	struct resource *res;
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 6678b0ac9a67881244884d59487fa288d33d1be7..08bb42e91b779633875dbeb4130bc55a6571cfb1 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -92,6 +92,8 @@ void msm_dp_catalog_panel_tpg_enable(struct msm_dp_catalog *msm_dp_catalog,
 				struct drm_display_mode *drm_mode);
 void msm_dp_catalog_panel_tpg_disable(struct msm_dp_catalog *msm_dp_catalog);
 
+void msm_dp_catalog_panel_clear_dsc_dto(struct msm_dp_catalog *msm_dp_catalog);
+
 struct msm_dp_catalog *msm_dp_catalog_get(struct device *dev);
 
 /* DP Audio APIs */
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 9c463ae2f8fae916661fef1c7e225f55c1026478..b9c461fee96f8fae9259ce03a32e1155b42d17bb 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2011,6 +2011,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train
 		pixel_rate_orig,
 		ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420);
 
+	msm_dp_catalog_panel_clear_dsc_dto(ctrl->catalog);
+
 	msm_dp_ctrl_setup_tr_unit(ctrl);
 
 	msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, DP_STATE_CTRL_SEND_VIDEO);

-- 
2.39.5

