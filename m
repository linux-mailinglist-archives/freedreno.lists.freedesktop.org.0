Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11476A0211F
	for <lists+freedreno@lfdr.de>; Mon,  6 Jan 2025 09:50:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCE8110E5D0;
	Mon,  6 Jan 2025 08:50:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mCMOh4js";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C99510E5CB
 for <freedreno@lists.freedesktop.org>; Mon,  6 Jan 2025 08:50:19 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-aa6647a7556so259280066b.2
 for <freedreno@lists.freedesktop.org>; Mon, 06 Jan 2025 00:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736153358; x=1736758158; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=FqYqpE74NSCIuQ6we8Kew8vkG28Edsdn09mE/ypD+oI=;
 b=mCMOh4js717+pj2S9+20ZF+xDaH97nbZ4LJu/rEL+dUWVe5t9e+E6DM5lbXEz2tG/6
 eNXr/xKmrJYMq45kwwPVq5XNPgJO7Aco3W4yA9N5Uy//DNx7AJ/jsd2UyMLd2s43F7e1
 BWVmptVymGXh28udODqJpUDbL8wk1aWP5Vxk1pwKwiIzrrJgqPhhbPsdsiH7OI5fOPGR
 +yme3ny9bVN+Avf6aipTIx149mwGagAECVuDqnnoBePZmWXSvAcizcWLrlP/G9vsALth
 huZz8TNky2GCroY8CALXw+XgQ+JMTDLlE5c8FORQ1QdK4Vf9dRTs9z8euK0f9kNH5iXw
 Au0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736153358; x=1736758158;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FqYqpE74NSCIuQ6we8Kew8vkG28Edsdn09mE/ypD+oI=;
 b=PN4Hr1CeWN+PQq0OrQcqcUHYqExtGXKfc9OzrrFjPXnvQmtCFPXOv8YoYLfCCJYyRm
 /JFb9LUpAJBNl6mM+rHiMqSk2NkHJS8yytMNP7cjU42jf/JMqThci/IB5VzPXc8RenKq
 /w+q/JTO0Ft3weomfDLdbbPcSGbSnlndzt/KDRvg5b1XS23AjrwHBVYwEtzAqYJcU2uw
 PSyh3iat75ImXRjBzp0kCoh80Gluoqsh2UzmrPzwIaxXv888f84qAQOc2r5EHul/vp2E
 RGl+AOMl96n58zoC/Ok6TlPrsFs8xfm6VbNAkGcjsP8Fpjt2ItqvkJCwzANf9Iw6gfg/
 3q/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW71BDZ0uERga0xFWq0XT0rSKw/oJlmn8HRVSPU21roZeSWmdfSB31v92lzJDaEzCYQs0kfqmCZxYg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2sZalBksTlTksD0HTpIejSkFgpAML65oEoohST+wvs7fYFe9o
 gT9+qySJGWbAeKW31FoAIpAg6NZ4LUXtsMM4XuPyoo/FfJXGyoLejMPBwr27Jrc=
X-Gm-Gg: ASbGncs3twCxj+R369rZEvcTgRat3J/VWkdwArcUvvVOnZPT4fkZU+sY25jvgkWGBxd
 PKUUfwBWika8VGxtFBCjV8I48r1Ic7YUudutZlU9APt4hiF2d2TokDjYLrhC17Web+zYpCNBohY
 DBKdhfk6NU+7QFJXYErx9RkWl/8OCBKYH9jaJu39p7qXSkvxvD632AKC4ywjtKBD93r3GSR3v4D
 FPJXFTiS073S3Vp5gSWkLwHhgz9FFDDuO9q/PlopYie3A0wkHzCqFBCdlpUN4/ApHrpHE4n
X-Google-Smtp-Source: AGHT+IH+pwK330xaahhvQucFSZxUuXVT0b0dCvqw2hihR/wXtnoUMiZ/CIdtEfAi9ckdZ9cr0u7txw==
X-Received: by 2002:a17:907:3d86:b0:aa5:3e81:5abc with SMTP id
 a640c23a62f3a-aac2714ad32mr2069989566b.1.1736153357678; 
 Mon, 06 Jan 2025 00:49:17 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0e82f1d2sm2222112466b.11.2025.01.06.00.49.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2025 00:49:17 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 06 Jan 2025 09:49:06 +0100
Subject: [PATCH 3/4] drm/msm/dsi: Minor whitespace and style cleanup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-drm-msm-cleanups-v1-3-271ff1c00795@linaro.org>
References: <20250106-drm-msm-cleanups-v1-0-271ff1c00795@linaro.org>
In-Reply-To: <20250106-drm-msm-cleanups-v1-0-271ff1c00795@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4972;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=/a3blq7uTO7fUJvEaGIXSRTJ4dpfb7qJYZHpImk2dVY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBne5kGPLcMDXTAFLB7FrGzq2KBwobfDoM2Axvrj
 aejM+xFPaCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ3uZBgAKCRDBN2bmhouD
 12suD/9plZkSR1GSSGcpRhCfw5+T70v5pcFayEvEVJBIDykDJm8lIN92LDQE5NBumEO11lwWxPC
 CZ4f/waCUhmh3Loap2GjCt4/4TxZBM1+aMK0//cTiLj7LoTR0mYfUSIjZ11gIsOPOaQwsh1CeXC
 yUvvzhwKVTJCm+oHioyAbm3GexCFBEn7GRx6yLHqtto5VOgMlaFh0GsUry3e6LIpIkevjZmCpGz
 cS+TaFatdkNFN77I2PGoi1aw3iIR82bKz7Aeu+K09XcJuNuCDZbTcgZlyRae6i4lveD+Pl7U5ir
 jiulukBPI60UsavcKrcTuTLAk4HCe5/t7gkYg1vhOV5ZoCe1xpxZEr15oMtZki6S9y9bSpjycyG
 ha3tev3HEVuUFIQhikzEOfOHkrCu0k9LgY+UZ77Lv5alOKdF6SIVlWICmhlhe5oOZTLKZPJKYlJ
 byShuxZrJF71LQzuuRgkWc4rr2CCgNVIdhSDA45ohfZCR98soas9LngZ/suxJdM19rW8C4tzeR7
 pdkdcCPWQH3djhjBFye1+bjsiynZ/HPhGOijgIGeDZxLiFnTM0m0lmZmlWsbRANHQ//cOXMvMhu
 i3mvlotSNMgX/cEKm8c19rqHws8FkfadXTX6VfvoaxLTQMTwRGHBmpF/j3HxbxwdRoWxLoXOvfO
 bpSXOzVQ17OSjcA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Cleanup few obvious kernel coding style violations: missing or
unnecessary braces in 'if-else', unnecessary break lines, incorrect
breaking of long function declarations, unnecessary 'else' after a
'return'.  No functional impact expected.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 51 +++++++++++++++++++-------------------
 1 file changed, 26 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 4a2ad04eea7359545a088bdc63907f6b3e5615bd..a3c344b75fc2e90923cd6d26df87b7c05208f736 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -179,18 +179,18 @@ struct msm_dsi_host {
 	int irq;
 };
 
-
 static inline u32 dsi_read(struct msm_dsi_host *msm_host, u32 reg)
 {
 	return readl(msm_host->ctrl_base + reg);
 }
+
 static inline void dsi_write(struct msm_dsi_host *msm_host, u32 reg, u32 data)
 {
 	writel(data, msm_host->ctrl_base + reg);
 }
 
-static const struct msm_dsi_cfg_handler *dsi_get_config(
-						struct msm_dsi_host *msm_host)
+static const struct msm_dsi_cfg_handler *
+dsi_get_config(struct msm_dsi_host *msm_host)
 {
 	const struct msm_dsi_cfg_handler *cfg_hnd = NULL;
 	struct device *dev = &msm_host->pdev->dev;
@@ -370,7 +370,6 @@ int dsi_link_clk_set_rate_6g(struct msm_dsi_host *msm_host)
 	return 0;
 }
 
-
 int dsi_link_clk_enable_6g(struct msm_dsi_host *msm_host)
 {
 	int ret;
@@ -588,7 +587,6 @@ static void dsi_calc_pclk(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 
 	DBG("pclk=%lu, bclk=%lu", msm_host->pixel_clk_rate,
 				msm_host->byte_clk_rate);
-
 }
 
 int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
@@ -677,8 +675,8 @@ static inline enum dsi_traffic_mode dsi_get_traffic_mode(const u32 mode_flags)
 	return NON_BURST_SYNCH_EVENT;
 }
 
-static inline enum dsi_vid_dst_format dsi_get_vid_fmt(
-				const enum mipi_dsi_pixel_format mipi_fmt)
+static inline enum dsi_vid_dst_format
+dsi_get_vid_fmt(const enum mipi_dsi_pixel_format mipi_fmt)
 {
 	switch (mipi_fmt) {
 	case MIPI_DSI_FMT_RGB888:	return VID_DST_FORMAT_RGB888;
@@ -689,8 +687,8 @@ static inline enum dsi_vid_dst_format dsi_get_vid_fmt(
 	}
 }
 
-static inline enum dsi_cmd_dst_format dsi_get_cmd_fmt(
-				const enum mipi_dsi_pixel_format mipi_fmt)
+static inline enum dsi_cmd_dst_format
+dsi_get_cmd_fmt(const enum mipi_dsi_pixel_format mipi_fmt)
 {
 	switch (mipi_fmt) {
 	case MIPI_DSI_FMT_RGB888:	return CMD_DST_FORMAT_RGB888;
@@ -1282,14 +1280,15 @@ static int dsi_cmd_dma_add(struct msm_dsi_host *msm_host,
 static int dsi_short_read1_resp(u8 *buf, const struct mipi_dsi_msg *msg)
 {
 	u8 *data = msg->rx_buf;
+
 	if (data && (msg->rx_len >= 1)) {
 		*data = buf[1]; /* strip out dcs type */
 		return 1;
-	} else {
-		pr_err("%s: read data does not match with rx_buf len %zu\n",
-			__func__, msg->rx_len);
-		return -EINVAL;
 	}
+
+	pr_err("%s: read data does not match with rx_buf len %zu\n",
+		__func__, msg->rx_len);
+	return -EINVAL;
 }
 
 /*
@@ -1298,15 +1297,16 @@ static int dsi_short_read1_resp(u8 *buf, const struct mipi_dsi_msg *msg)
 static int dsi_short_read2_resp(u8 *buf, const struct mipi_dsi_msg *msg)
 {
 	u8 *data = msg->rx_buf;
+
 	if (data && (msg->rx_len >= 2)) {
 		data[0] = buf[1]; /* strip out dcs type */
 		data[1] = buf[2];
 		return 2;
-	} else {
-		pr_err("%s: read data does not match with rx_buf len %zu\n",
-			__func__, msg->rx_len);
-		return -EINVAL;
 	}
+
+	pr_err("%s: read data does not match with rx_buf len %zu\n",
+		__func__, msg->rx_len);
+	return -EINVAL;
 }
 
 static int dsi_long_read_resp(u8 *buf, const struct mipi_dsi_msg *msg)
@@ -1366,8 +1366,9 @@ static int dsi_cmd_dma_tx(struct msm_dsi_host *msm_host, int len)
 			ret = -ETIMEDOUT;
 		else
 			ret = len;
-	} else
+	} else {
 		ret = len;
+	}
 
 	return ret;
 }
@@ -1435,11 +1436,12 @@ static int dsi_cmds2buf_tx(struct msm_dsi_host *msm_host,
 		return len;
 	}
 
-	/* for video mode, do not send cmds more than
-	* one pixel line, since it only transmit it
-	* during BLLP.
-	*/
-	/* TODO: if the command is sent in LP mode, the bit rate is only
+	/*
+	 * for video mode, do not send cmds more than
+	 * one pixel line, since it only transmit it
+	 * during BLLP.
+	 *
+	 * TODO: if the command is sent in LP mode, the bit rate is only
 	 * half of esc clk rate. In this case, if the video is already
 	 * actively streaming, we need to check more carefully if the
 	 * command can be fit into one BLLP.
@@ -1864,9 +1866,8 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 	int ret;
 
 	msm_host = devm_kzalloc(&pdev->dev, sizeof(*msm_host), GFP_KERNEL);
-	if (!msm_host) {
+	if (!msm_host)
 		return -ENOMEM;
-	}
 
 	msm_host->pdev = pdev;
 	msm_dsi->host = &msm_host->base;

-- 
2.43.0

