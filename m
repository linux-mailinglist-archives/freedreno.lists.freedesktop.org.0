Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E12A3BFA2F
	for <lists+freedreno@lfdr.de>; Thu,  8 Jul 2021 14:28:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 775716E8BE;
	Thu,  8 Jul 2021 12:28:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B03726E8BF
 for <freedreno@lists.freedesktop.org>; Thu,  8 Jul 2021 12:28:51 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id p16so15026216lfc.5
 for <freedreno@lists.freedesktop.org>; Thu, 08 Jul 2021 05:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xmIwt1LqFtceFX0+1IHR8SZWAq0rLMjLino86+vTL9k=;
 b=YI7n/PtYqgthT4U18+oZ22kSh0qPLqlnRdZzVTdZ0Q/crYnf1mZXBQk9drhK7ycbr/
 4azjSLDLAJ+NZ23s5vtIDDqukktgBuKtec4H39w/yjXula5zJkEGddMTsr+QcNNRKE/i
 bpvPxSrUoXqKeD/fr+Z31ylQTNb+2x1f1hRyqoNIwm+1xBIm6o2szts7+iWfCs57Ap0f
 UvbyAXbbRD/tGMcUEP67k0jD58MyqBbFpuLp/68/dEKZO+XHfcRIx/oehaCU6foSlkhv
 dxBrJ6uQr1Dv3hkKy8Ics2arleg9ClfaLF0H2UVLo6CPi6V/875I0ziHDmetLVSIZG1r
 ZZBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xmIwt1LqFtceFX0+1IHR8SZWAq0rLMjLino86+vTL9k=;
 b=ZQBuWV7dcC3lzGyANNj4NVsMyT2Tu785+CM96mHYZ1kpdQ6y7PCozlCahTXfrEBKP3
 1uy9+RAx5HVbnix0gpXsiMPD9iaKr2cVAV9VFI4VTW5qcAOzYgmIWRzLmOng3ZQj0nLQ
 LIPl1Aumx4Ir9UsRaum5TixxTO3WXvtJtrlyCdsZHLg5YmVK85MEYNbEMTPh8V3m5G9L
 k/pVAaEifus/Bifu0DgE2MdmZrthZL5Jd+x0c9fe2wWYZZDt7VcOqG2DqpCjrJKkpKxu
 pcl0NNcCKdoaA0BUtFUqoNwNjHbhMAGIijG8lLXOfDgIbkCIQhS0c1/0cYEuM8uz9e0S
 Se2w==
X-Gm-Message-State: AOAM532EnV8SQCCtuseFsjdKxNFk4Bqxxwsm3s+lQ8TLpwSmQui7WmAg
 zwJzJFxebc+o2VOMYr7Ff7SLkw==
X-Google-Smtp-Source: ABdhPJxJJ0IqrER/j7k7zlpSO3SejsFNMar2CyrSSNdS3n5rJd4z9Vcl7xqE9ewjOYtrNqKHWwBiYw==
X-Received: by 2002:a2e:752:: with SMTP id i18mr24342680ljd.497.1625747330160; 
 Thu, 08 Jul 2021 05:28:50 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id f1sm184368lfs.211.2021.07.08.05.28.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 05:28:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Thu,  8 Jul 2021 15:28:32 +0300
Message-Id: <20210708122833.363451-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210708122833.363451-1-dmitry.baryshkov@linaro.org>
References: <20210708122833.363451-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v1 6/7] drm/msm/dsi: stop calling
 set_encoder_mode callback
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

None of the display drivers now implement set_encoder_mode callback.
Stop calling it from the modeset init code.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.c         |  2 --
 drivers/gpu/drm/msm/dsi/dsi.h         |  1 -
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 12 ------------
 3 files changed, 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index 5201d7eb0490..77c8dba297d8 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -251,8 +251,6 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
 		goto fail;
 	}
 
-	msm_dsi_manager_setup_encoder(msm_dsi->id);
-
 	priv->bridges[priv->num_bridges++]       = msm_dsi->bridge;
 	priv->connectors[priv->num_connectors++] = msm_dsi->connector;
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 856a532850c0..e0c3c4409377 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -80,7 +80,6 @@ struct drm_connector *msm_dsi_manager_connector_init(u8 id);
 struct drm_connector *msm_dsi_manager_ext_bridge_init(u8 id);
 int msm_dsi_manager_cmd_xfer(int id, const struct mipi_dsi_msg *msg);
 bool msm_dsi_manager_cmd_xfer_trigger(int id, u32 dma_base, u32 len);
-void msm_dsi_manager_setup_encoder(int id);
 int msm_dsi_manager_register(struct msm_dsi *msm_dsi);
 void msm_dsi_manager_unregister(struct msm_dsi *msm_dsi);
 bool msm_dsi_manager_validate_current_config(u8 id);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index a81105633d3c..e7f4e1d8978a 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -216,18 +216,6 @@ static int dsi_mgr_bridge_get_id(struct drm_bridge *bridge)
 	return dsi_bridge->id;
 }
 
-void msm_dsi_manager_setup_encoder(int id)
-{
-	struct msm_dsi *msm_dsi = dsi_mgr_get_dsi(id);
-	struct msm_drm_private *priv = msm_dsi->dev->dev_private;
-	struct msm_kms *kms = priv->kms;
-	struct drm_encoder *encoder = msm_dsi_get_encoder(msm_dsi);
-
-	if (encoder && kms->funcs->set_encoder_mode)
-		kms->funcs->set_encoder_mode(kms, encoder,
-					     msm_dsi_is_cmd_mode(msm_dsi));
-}
-
 static int msm_dsi_manager_panel_init(struct drm_connector *conn, u8 id)
 {
 	struct msm_drm_private *priv = conn->dev->dev_private;
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
