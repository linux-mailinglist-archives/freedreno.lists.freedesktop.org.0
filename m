Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A722F39B74B
	for <lists+freedreno@lfdr.de>; Fri,  4 Jun 2021 12:44:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 376A26F5FB;
	Fri,  4 Jun 2021 10:44:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E26756F5FB
 for <freedreno@lists.freedesktop.org>; Fri,  4 Jun 2021 10:44:36 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id m3so10923703lji.12
 for <freedreno@lists.freedesktop.org>; Fri, 04 Jun 2021 03:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9h1yKD+LgXGUnoZj5bAFUkiqd1zySY4f07AJKJZ6sB8=;
 b=esj90VqN2pifcAXHyVCWCrqSCXOxARgl24V2l2stp5Kulet9jYYn/ArvQTTwu7I5xN
 M0WJI7CSHPeyb1jkxoc/XZArFAu5vNz84pbnSdalDr2EzcKBcrASJPU2LZHzHbpmwPuh
 vMjkuhL5+DC2eVZIopdrCd8WhQwcxUS4e3tEU1u3ueTvdBE//lcQJsGb9U40Le31pcMO
 PECaN2PP8aZQ1XLX3/ylgcNSHPDa6JFDdWQGU2F0ESLjGr0cGyfw4FR9ZwhA6CfJAu6K
 g9bQsFlm2mCfWZZVc40xVkGKiDDSQMOklWhkT8OL7L3584EyGptSBwN62HUeN925DIu/
 NpYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9h1yKD+LgXGUnoZj5bAFUkiqd1zySY4f07AJKJZ6sB8=;
 b=Z5NhfEplkLJhxW67BiwqpdtVSFJRzV/Zuv15EhWOU7wgsLHy3yEhQrFe5ObRHsWDQX
 ZxpB6E6mSSqAD3KgDtMLJzOx2tQdEFVp9epWcpitA1xaCtfNCctTuTfCLdYiuRNNIid1
 /t/KA1l3uYXaK6Ua4vc7Ay7YuK4IKe6ILKJ3G9MRN0VQmQlmt5e2gm0b5vw9XjlYdb1t
 qZsFQ55Covu/MTfNcjdF3y7wkzZ4lkbMCG/AHdBjZQRpeeYz5k4Mlqkhv9FjSGfGIxHp
 VLqvpeJ2BwANQD7iFh2sF6GRQSt0LS5BevdEOkHb2MBXZpfcm4fNFlEd+VWbGrW1m54p
 0tTg==
X-Gm-Message-State: AOAM533yVQehYJMiP87T1iP9NiTGqWvIv9AHjLxTpHNO4GHgQNvlX9AY
 vXwlbLhR+YrveceH4m52I97OsQ==
X-Google-Smtp-Source: ABdhPJwdRAGWrohXulTTMqwK47ar+H8y5xiqlSo2SCohQGWRuR4wUm9D4HbCLMOYqQq/PCW9jf888A==
X-Received: by 2002:a05:651c:104e:: with SMTP id
 x14mr2987179ljm.345.1622803475248; 
 Fri, 04 Jun 2021 03:44:35 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id q17sm671687ljp.3.2021.06.04.03.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 03:44:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Fri,  4 Jun 2021 13:44:33 +0300
Message-Id: <20210604104433.1442949-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Freedreno] [PATCH] drm/msm/dsi: print error code when MIPI DSI
 host registration fails
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

In order to ease debugging of DSI host registration issues, print return
code of dsi_mgr_setup_components().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index cd016576e8c5..4df5defdbf4c 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -817,8 +817,8 @@ int msm_dsi_manager_register(struct msm_dsi *msm_dsi)
 
 	ret = dsi_mgr_setup_components(id);
 	if (ret) {
-		pr_err("%s: failed to register mipi dsi host for DSI %d\n",
-			__func__, id);
+		pr_err("%s: failed to register mipi dsi host for DSI %d: %d\n",
+			__func__, id, ret);
 		goto fail;
 	}
 
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
