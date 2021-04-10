Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A94E35A9E2
	for <lists+freedreno@lfdr.de>; Sat, 10 Apr 2021 03:19:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF6786E0E8;
	Sat, 10 Apr 2021 01:19:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1B486E0E5
 for <freedreno@lists.freedesktop.org>; Sat, 10 Apr 2021 01:19:04 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id j18so12499679lfg.5
 for <freedreno@lists.freedesktop.org>; Fri, 09 Apr 2021 18:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cXbadlhQap92WD3Oxzmo0aIh3c0IVq45U8NgZ/myc0w=;
 b=J1qJfsd3G51VUtZHejH2W0xArwQAEIsoz7Ag3L9pkjuW9XHmrSxPCeCc/ASZnF+sVm
 ao5RvymWUw/ApUSWMZVl6cjcbtbY2hofZkTz5+q4f0F20ggHftxfnxOj79pUZp4JT65A
 eqSvZZmRYJXudweA/UN3bqVjQOwqxvSuPk78zAP07Mb5GGvhPeep9m2Qek4RDmaa3Rhp
 3G5eRSYhob8ZlNUGS9ePi40CfXpSKWDW4BvXvbAbcl1l6vYmBzr2R63UYbOJ80o+mQWO
 M2zVqUeysH85gJUPIBpalHz32PcA+YL72ITBld7kdu4yyKLFZ3TFSQ61ZODP9bAqNs/g
 uCTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cXbadlhQap92WD3Oxzmo0aIh3c0IVq45U8NgZ/myc0w=;
 b=GOjoFiKwU+RR6zfcl+yNVbCgST5Lc+3Upz7W4E9E1XiajK1/YHJhEqzDaHggBsorrX
 +WxB5ugekXmEnUH0aq3LA3EqBKwaR+g6ylEDv6oqUdGljPm9rsCd4mp0HOrcrxSYkRf0
 JlMJCRoQCTDmF5QmvKv+uYDkWjjhCZdFdqZmSZOoK+qIERBclhbtyDuHlqII1ERHfCC3
 j6v8r1WsVnE/0euw2CohA7OFS0DDnr94VOCsL/A350qHxHnPSWq1fp76FxjjtveM89fu
 2E364odezEiU96QSvQWxwM5Qb+Eq//xMTbrsSxG3e+G9YE3JXebE87Eg0C3GVgKNtRkq
 Arng==
X-Gm-Message-State: AOAM5318HuXoo8sMH/UxC72yCG4t2G5ZCbjoWG7/MWwUSSPEj1vIJiLX
 K9t3o4NjlA5MwloNZm30XwdJww==
X-Google-Smtp-Source: ABdhPJy75C3YoO0lTlpMn1djMnbOvX0ZgTBZhlF04KJLU8PmMSu98lEtJWHvdzOgvsr7y/RLrpboIg==
X-Received: by 2002:ac2:5446:: with SMTP id d6mr11571187lfn.527.1618017543025; 
 Fri, 09 Apr 2021 18:19:03 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id h4sm614132lfv.22.2021.04.09.18.19.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 18:19:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>
Date: Sat, 10 Apr 2021 04:19:01 +0300
Message-Id: <20210410011901.1735866-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Freedreno] [PATCH] drm/msm/dsi: dsi_phy_28nm_8960: fix
 uninitialized variable access
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
Cc: kernel test robot <lkp@intel.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The parent_name initialization was lost in refactoring, restore it now.

Fixes: 5d13459650b3 ("drm/msm/dsi: push provided clocks handling into a generic code")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
index 582b1428f971..86e40a0d41a3 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
@@ -405,6 +405,10 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
 	if (!vco_name)
 		return -ENOMEM;
 
+	parent_name = devm_kzalloc(dev, 32, GFP_KERNEL);
+	if (!parent_name)
+		return -ENOMEM;
+
 	clk_name = devm_kzalloc(dev, 32, GFP_KERNEL);
 	if (!clk_name)
 		return -ENOMEM;
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
