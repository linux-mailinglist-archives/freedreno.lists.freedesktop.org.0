Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9DD7B1B34
	for <lists+freedreno@lfdr.de>; Thu, 28 Sep 2023 13:35:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D6B010E05D;
	Thu, 28 Sep 2023 11:35:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 866B410E0E3
 for <freedreno@lists.freedesktop.org>; Thu, 28 Sep 2023 11:35:42 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-50444e756deso16752282e87.0
 for <freedreno@lists.freedesktop.org>; Thu, 28 Sep 2023 04:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695900940; x=1696505740; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Eb1RaFTPuOznsZqFGXUK4RnXqt+ysVjM/0XAAs1EH/E=;
 b=MR3t/ruiqtmEwlF8bTYRoW9h523uXi5BfddOdOoTzi+iHClMh/Vs/SU8IUTB+wqev4
 J3zzLrzXHItJlZUeBqbhnRfUJFm6O9VOyRsIt5cgqPyTU7euIngJ8vqYzpZeU1SUlN9h
 oF2qPSS3cGmwrW6qThrmPN5juZpRdcnI3XVpSEaqPKG1bgq61Z1MPaJJKMCgFczYi6Q5
 QJuY5BGyUCS6uDiHQXB1VUxXox/cx1brldC4NdeBLajT1+0OqALzWfLW8yI8cNyVCQkK
 ZseDsNmTFl8XXn1EuuLktP2HxzHW6XmzUZxR5ZVZakFTO51zOtgg/Fzmq0UsrN0BnMvy
 Ck0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695900940; x=1696505740;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Eb1RaFTPuOznsZqFGXUK4RnXqt+ysVjM/0XAAs1EH/E=;
 b=ZNa1hy7XHyd6PNUWqAmCSX8TUOhWqVv7dgo1U9m5WppF82OpuP3jXVRKAjmyUXADeH
 m8QTYydSEjM3UZwiTpEaSKNb4rRY0HCFQgtwtuW7NS41+3tpFPacsXgFXxj6a3kHcZ4u
 IOrGFn9lYNnklfRvBJAF9xjCkfRBLhYCe9Kwwfsmb8UOa7TDWg3ynfDZDW0P0csEQ3Rh
 By4pR8PZsyVnAxFwug5zzPOy5JzZdLy8Ub4cd9cBVPAjnbGIojBH3osjFQxjPktWTkkf
 IZn785T6o036CxkOSLwzuYT6koEYtDxAekOrjV7MNvV15GVYwiR0x81nqxuMtrlDh7SK
 S0Ig==
X-Gm-Message-State: AOJu0YxG2iMdBxNufSMufM0DSumj+ZyRrJwScP+aVsBtvBf2ZnxCIH6H
 0vEehGsFS+3QP0pGrDmjMK6Tzw==
X-Google-Smtp-Source: AGHT+IGBdkcRrvknuZD4d194L2ZCqUJBec7xmOjhz7SNrqyOHnIwOet6vWxOy+DCm82lEiZ0jer+KA==
X-Received: by 2002:a05:6512:617:b0:503:19d9:4b6f with SMTP id
 b23-20020a056512061700b0050319d94b6fmr859945lfe.0.1695900940716; 
 Thu, 28 Sep 2023 04:35:40 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 k14-20020a0565123d8e00b00504816564c7sm704327lfv.104.2023.09.28.04.35.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Sep 2023 04:35:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Thu, 28 Sep 2023 14:35:34 +0300
Message-Id: <20230928113535.1217613-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230928113535.1217613-1-dmitry.baryshkov@linaro.org>
References: <20230928113535.1217613-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 5/6] drm/msm/mdss: inline
 msm_mdss_icc_request_bw()
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

There are just two places where we set the bandwidth: in the resume and
in the suspend paths. Drop the wrapping function
msm_mdss_icc_request_bw() and call icc_set_bw() directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index ec8608e22b24..1a921e9107b1 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -66,14 +66,6 @@ static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
 	return 0;
 }
 
-static void msm_mdss_icc_request_bw(struct msm_mdss *msm_mdss, unsigned long bw)
-{
-	int i;
-
-	for (i = 0; i < msm_mdss->num_mdp_paths; i++)
-		icc_set_bw(msm_mdss->mdp_path[i], 0, Bps_to_icc(bw));
-}
-
 static void msm_mdss_irq(struct irq_desc *desc)
 {
 	struct msm_mdss *msm_mdss = irq_desc_get_handler_data(desc);
@@ -227,14 +219,15 @@ const struct msm_mdss_data *msm_mdss_get_mdss_data(struct device *dev)
 
 static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 {
-	int ret;
+	int ret, i;
 
 	/*
 	 * Several components have AXI clocks that can only be turned on if
 	 * the interconnect is enabled (non-zero bandwidth). Let's make sure
 	 * that the interconnects are at least at a minimum amount.
 	 */
-	msm_mdss_icc_request_bw(msm_mdss, MIN_IB_BW);
+	for (i = 0; i < msm_mdss->num_mdp_paths; i++)
+		icc_set_bw(msm_mdss->mdp_path[i], 0, Bps_to_icc(MIN_IB_BW));
 
 	ret = clk_bulk_prepare_enable(msm_mdss->num_clocks, msm_mdss->clocks);
 	if (ret) {
@@ -286,8 +279,12 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 
 static int msm_mdss_disable(struct msm_mdss *msm_mdss)
 {
+	int i;
+
 	clk_bulk_disable_unprepare(msm_mdss->num_clocks, msm_mdss->clocks);
-	msm_mdss_icc_request_bw(msm_mdss, 0);
+
+	for (i = 0; i < msm_mdss->num_mdp_paths; i++)
+		icc_set_bw(msm_mdss->mdp_path[i], 0, 0);
 
 	return 0;
 }
-- 
2.39.2

