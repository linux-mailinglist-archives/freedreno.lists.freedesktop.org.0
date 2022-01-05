Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F453485C1B
	for <lists+freedreno@lfdr.de>; Thu,  6 Jan 2022 00:10:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FFCF10E3D4;
	Wed,  5 Jan 2022 23:10:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2497410E31C
 for <freedreno@lists.freedesktop.org>; Wed,  5 Jan 2022 23:10:38 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id u13so1144348lff.12
 for <freedreno@lists.freedesktop.org>; Wed, 05 Jan 2022 15:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VQ0ZgNuAluSnuM7ZE2zA1IGqyGYMHg8c0oXA5e7yknc=;
 b=wMd8DSiMeFNXgkyoSpiKIGH6Q5J3GD39IyoPdk727c0BpbtUc7fK68+G4WRRdVJYZK
 rW1UB3kPlP1nDLZ67GwblFOvA1qPfHIA1fgUWFDgoMc0o5gNaQmELtV+U0opCIui/4HZ
 zfPhEYbA6gEN/qV8pK+r0ZQvADN8mR+o19JZU+iQ7pvszqUCVYcUCX9YRDnktVKiTKnE
 p7RGrvEX31WV4efx1KqLlnaoM+D+W9j7kejcRwqoYD7k3ky+YcTHWu4uQrQtR/ZntD0g
 +nQnw7dZNrExG2EFSeLZpA6wlR6xqj8Qm5AlMxKSSQX3Ln/D+NACdVxLOlzPP/68A8TW
 vY4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VQ0ZgNuAluSnuM7ZE2zA1IGqyGYMHg8c0oXA5e7yknc=;
 b=4o8IT6Org7lxZ9rm/r1sJpMSj7LbInq/qqpNrvvQ0LPBCzN1MQ9U/xDPFL904+Gsir
 vjwgaA0vg6prYOjRmh89gGOUORPWxYAdlZ/i4CxaTWshqXmmlGW5FN2GYr4CRkrx6SPP
 k3pOJlMJFrW6LqjK/5sQkjQZSd5cLV6U0VebFFNTLXNFEuo//Ugv5e/YX5Hv7PIvsPYD
 zieoK+gd6DxTQCwo/QG3eP+LL4kzNEoMEC8THr5vfWWH3vOuZ6+bTaFgAPjNt28agzGB
 /1Pid0AI4dGgnUsqFSOm69akpkyNgqj7+UoHEbJlte2iAisQxHN1FM7ENrKeGXXVvx2S
 Pr3w==
X-Gm-Message-State: AOAM532ozc4FVqGEwPOaXdqE/VqS+aVpKsjK/RvpRmQMBTCVTv2swmg1
 ubKBm29dqhU6kfpKeubTWkeU6g==
X-Google-Smtp-Source: ABdhPJykKlEJ9lekzLB1QgFkaj325/gKuLM26orBx+sGIScn2gpWELudG5SMTEw2N9cDfpJUhFCMpQ==
X-Received: by 2002:a05:6512:475:: with SMTP id
 x21mr19400581lfd.562.1641424236481; 
 Wed, 05 Jan 2022 15:10:36 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id a13sm27187lff.104.2022.01.05.15.10.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 15:10:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Thu,  6 Jan 2022 02:10:28 +0300
Message-Id: <20220105231031.436020-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220105231031.436020-1-dmitry.baryshkov@linaro.org>
References: <20220105231031.436020-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 2/5] drm/msm/dpu: add DSPP blocks teardown
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
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add missing calls to dpu_hw_dspp_destroy() to free resources allocated
for DSPP hardware blocks.

Fixes: e47616df008b ("drm/msm/dpu: add support for color processing blocks in dpu driver")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index b5b1ea1e4de6..63ed0d7df848 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -35,6 +35,14 @@ int dpu_rm_destroy(struct dpu_rm *rm)
 {
 	int i;
 
+	for (i = 0; i < ARRAY_SIZE(rm->dspp_blks); i++) {
+		struct dpu_hw_dspp *hw;
+
+		if (rm->dspp_blks[i]) {
+			hw = to_dpu_hw_dspp(rm->dspp_blks[i]);
+			dpu_hw_dspp_destroy(hw);
+		}
+	}
 	for (i = 0; i < ARRAY_SIZE(rm->pingpong_blks); i++) {
 		struct dpu_hw_pingpong *hw;
 
-- 
2.34.1

