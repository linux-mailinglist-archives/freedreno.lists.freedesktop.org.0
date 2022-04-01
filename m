Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DD74EFCFE
	for <lists+freedreno@lfdr.de>; Sat,  2 Apr 2022 01:11:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 518E210E100;
	Fri,  1 Apr 2022 23:11:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5917C10E0D7
 for <freedreno@lists.freedesktop.org>; Fri,  1 Apr 2022 23:11:09 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id m3so7450499lfj.11
 for <freedreno@lists.freedesktop.org>; Fri, 01 Apr 2022 16:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aBelTolXdBHgrs8x4WhdW94lmNOFNROJVduSORgOB7o=;
 b=cSJO5Y0WHrvicOzagTdzW8mxEYjtLoEonod/QPZAJ1+rnNH7WrPhfIyLEsUz1LTn1U
 HMYu15v74gwcy/bppNWOwlyIbkowizviinW4I7zNp2IYoAcdxCxiuQhw4tHQ/tJn1Jab
 9vJysKhMOmHn8o54gaTBFtnWb1HuCILeL7NgmD3AM1pcAWMkvCz88wFcIc0nhXylhgH/
 gLfqvMJ6bVTAsHmw1hUIDrF46Gd0efzHu0HrTc85YrIvJk4qBlEty8gg3zQJyF7HhLpq
 8iZCB57UBD4kYrYVVw6xplOJw+M6QEPzIbquGrLocHK40680EXYR7S49ScyVbGZUNTYN
 tDtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aBelTolXdBHgrs8x4WhdW94lmNOFNROJVduSORgOB7o=;
 b=BBoqiSNN0TeWF7UImh7rQUvd7dUL0LTfyEMfpOfpA/zy/7ItJyXq6oOARYuvL1cOE4
 D44zuXCauQ32wytz6HFaQGQtYcu4Yy+RwmLiRTeAUfSwDbwyFGwtS/TWCnFqIZf0pg8c
 gC349Tc8VLSphi8WbVLtssYsE/k3ZZVmAaIceI0z4AP3iDzSgYxDFYc56OJY6Czghp1p
 /CJ70aG03VJ1WvNhgOhrNq9O4GRal6Z7FaJ++8GpCq1EN0siwo0WDMY9qnnwWBkgUyb7
 Tk2VTHwDAWIveWQAB7YjQzud050bH9erGX+GVKPC8Y5Ib0bV3Di0MXKIW656xf1Q0Qu4
 MqpQ==
X-Gm-Message-State: AOAM533wwSGJfh/5htWkx3Kix8RtnrfZLQHxdv6odFyFVuJnunzmaLVE
 c7a76MX/fy9ZGo/xpSJXqZ2TrAPKhbL3FQ==
X-Google-Smtp-Source: ABdhPJyP1ntsUFhZ7UVRnsIPgItCfAmAVAJQ1H5AqQQMbem7zgObeIf3ZPKJlaJJdwrfnNaEdQ112g==
X-Received: by 2002:a05:6512:1306:b0:448:5689:2be0 with SMTP id
 x6-20020a056512130600b0044856892be0mr15309047lfu.57.1648854667651; 
 Fri, 01 Apr 2022 16:11:07 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 x23-20020a19e017000000b0044a4820f882sm367413lfg.84.2022.04.01.16.11.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 16:11:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sat,  2 Apr 2022 02:11:04 +0300
Message-Id: <20220401231104.967193-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] drm/msm/dsi: fix error checks and return values
 for DSI xmit functions
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

As noticed by Dan ([1] an the followup thread) there are multiple issues
with the return values for MSM DSI command transmission callback. In
the error case it can easily return a positive value when it should
have returned a proper error code.

This commits attempts to fix these issues both in TX and in RX paths.

[1]: https://lore.kernel.org/linux-arm-msm/20211001123617.GH2283@kili/

Fixes: a689554ba6ed ("drm/msm: Initial add DSI connector support")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index d51e70fab93d..8925f60fd9ec 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1341,10 +1341,10 @@ static int dsi_cmds2buf_tx(struct msm_dsi_host *msm_host,
 			dsi_get_bpp(msm_host->format) / 8;
 
 	len = dsi_cmd_dma_add(msm_host, msg);
-	if (!len) {
+	if (len < 0) {
 		pr_err("%s: failed to add cmd type = 0x%x\n",
 			__func__,  msg->type);
-		return -EINVAL;
+		return len;
 	}
 
 	/* for video mode, do not send cmds more than
@@ -1363,10 +1363,14 @@ static int dsi_cmds2buf_tx(struct msm_dsi_host *msm_host,
 	}
 
 	ret = dsi_cmd_dma_tx(msm_host, len);
-	if (ret < len) {
-		pr_err("%s: cmd dma tx failed, type=0x%x, data0=0x%x, len=%d\n",
-			__func__, msg->type, (*(u8 *)(msg->tx_buf)), len);
-		return -ECOMM;
+	if (ret < 0) {
+		pr_err("%s: cmd dma tx failed, type=0x%x, data0=0x%x, len=%d, ret=%d\n",
+			__func__, msg->type, (*(u8 *)(msg->tx_buf)), len, ret);
+		return ret;
+	} else if (ret < len) {
+		pr_err("%s: cmd dma tx failed, type=0x%x, data0=0x%x, ret=%d len=%d\n",
+			__func__, msg->type, (*(u8 *)(msg->tx_buf)), ret, len);
+		return -EIO;
 	}
 
 	return len;
@@ -2092,9 +2096,12 @@ int msm_dsi_host_cmd_rx(struct mipi_dsi_host *host,
 		}
 
 		ret = dsi_cmds2buf_tx(msm_host, msg);
-		if (ret < msg->tx_len) {
+		if (ret < 0) {
 			pr_err("%s: Read cmd Tx failed, %d\n", __func__, ret);
 			return ret;
+		} else if (ret < msg->tx_len) {
+			pr_err("%s: Read cmd Tx failed, too short: %d\n", __func__, ret);
+			return -ECOMM;
 		}
 
 		/*
-- 
2.35.1

