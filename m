Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7997E759F
	for <lists+freedreno@lfdr.de>; Fri, 10 Nov 2023 01:04:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C69210E23B;
	Fri, 10 Nov 2023 00:04:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36A4C10E38A
 for <freedreno@lists.freedesktop.org>; Fri, 10 Nov 2023 00:03:32 +0000 (UTC)
Received: by mail-qv1-xf32.google.com with SMTP id
 6a1803df08f44-66d134a019cso9421676d6.3
 for <freedreno@lists.freedesktop.org>; Thu, 09 Nov 2023 16:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek.ca; s=google; t=1699574611; x=1700179411; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=X8kRvGVwwQROTbtBALdJ/O4XXBQy9n/2BNY8tadKsdI=;
 b=NDD+1uooTrY1Mb+7b38RFKqM++EBCwqqM5hCdasZ70VEMplx8qjzYnw0gOkpYg4K5i
 UkIjJkgSLATFdmrEGxYvNdMQb3HUMMgbhN0qNIrU6hU4AZAjUeWCkgbUFiTvOgWecERB
 jpkYYgUMWFZrNFFfASurcAmJqXj+4LBIIid2SHCI2ewDM7666Xa+aOSF4EXRZTJTcyND
 gVFyqJcyEoYVY6KLKPbOh8xJNB4Rfgmu1SNDy8wVdcKvzmKv5lDH8kBRHrL7n2EdtGko
 bCMWcrAxMDYbouosGr3qYZVx+vAac1dwsSmD4NOWj7qvE0g9E6vgdB/SR324/UtNrPlm
 7/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699574611; x=1700179411;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X8kRvGVwwQROTbtBALdJ/O4XXBQy9n/2BNY8tadKsdI=;
 b=VwurlA+Acc0wh9EcdqbEZI66UGtkiLCPjh6NkKqK1BIP3hx1LKM9JRrGH9IqPNMTf6
 zbO1ou5Veg5VM7q/ilnKY3eDoAFdkORGF8sVFCNwxkH1kLBZOyvQGvMVAKbJk8liRFB9
 CsXiN4u2Sjt3diVbEC8pXx4ZFholM+DeZbG9gk6kDbjL4FRWQ9d/hfT6PcxXpzOiZPcz
 Kqf0TWzfbyHWuX9QogRgG8oXdyZdj9h4va8jd6aFEEylzoMS0PztJ47Jy3ErcFFcbIbb
 oL9ShEi0/+cQ+aF+wFNPRnNMAtHSsHufwcq9ZrS4BhXlQbV7pOx0XD/Ui+INQ07nu7qE
 Xp5Q==
X-Gm-Message-State: AOJu0YwVPn5lNe/C1cQqfT1N+IFQv4BEYlE5q+vb08B+zlXVKA1FwfN+
 S8ooRk7XGyt21kMFomesJgYJ5orZbRozy1J3TPE=
X-Google-Smtp-Source: AGHT+IGYCXADfCmllu0MdkQC6KJQ2Cnx9eUW550qzPyNlADCiAziRwgvnW3qjd1nZZKBRjkl2P01xQ==
X-Received: by 2002:a05:6214:411:b0:66d:1624:2203 with SMTP id
 z17-20020a056214041100b0066d16242203mr7062080qvx.20.1699574611676; 
 Thu, 09 Nov 2023 16:03:31 -0800 (PST)
Received: from localhost.localdomain
 (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
 by smtp.gmail.com with ESMTPSA id
 x4-20020a0cfe04000000b0065b0554ae78sm2455969qvr.100.2023.11.09.16.03.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Nov 2023 16:03:31 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Date: Thu,  9 Nov 2023 19:02:14 -0500
Message-Id: <20231110000216.29979-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2] drm/msm/dsi: use the correct VREG_CTRL_1
 value for 4nm cphy
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
Cc: Vinod Koul <vkoul@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, David Airlie <airlied@gmail.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Use the same value as the downstream driver. This change is needed for CPHY
mode to work correctly.

Fixes: 8b034e6771113 ("drm/msm/dsi: add support for DSI-PHY on SM8550")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
v2: fixed the Fixes: line

 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 3b1ed02f644d..89a6344bc865 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -918,7 +918,7 @@ static int dsi_7nm_phy_enable(struct msm_dsi_phy *phy,
 	if ((phy->cfg->quirks & DSI_PHY_7NM_QUIRK_V5_2)) {
 		if (phy->cphy_mode) {
 			vreg_ctrl_0 = 0x45;
-			vreg_ctrl_1 = 0x45;
+			vreg_ctrl_1 = 0x41;
 			glbl_rescode_top_ctrl = 0x00;
 			glbl_rescode_bot_ctrl = 0x00;
 		} else {
-- 
2.26.1

