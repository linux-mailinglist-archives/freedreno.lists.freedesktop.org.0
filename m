Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EDC51E6AC
	for <lists+freedreno@lfdr.de>; Sat,  7 May 2022 13:40:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 809DF10F348;
	Sat,  7 May 2022 11:40:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EF0B1121BC
 for <freedreno@lists.freedesktop.org>; Sat,  7 May 2022 11:40:13 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id bx33so1086134ljb.12
 for <freedreno@lists.freedesktop.org>; Sat, 07 May 2022 04:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0ysL/MDDZX+Geot7Zeu3H5HxZht23rz3nv2oCFFwflE=;
 b=ovmshWwzkN58+3wOOViYPxyU0kTw3nFoH9MgkTZWjgXnTJIJLZWPP23Nr7YIjZGl2G
 7YQFWReKvx9HFyY6x3Rmsq7aLyLfjw4cypPzxar3okcZMp4jKlVRZaaD6pVIFWpviVzf
 NwV+07k5oDPUAguIH7OABpMx6sFGvAN3DPkM/HrszeGI5xv5FAHf2mhaArrcAJrS9toC
 6xSo8vM+IvlMevwbgFIIUjesxioYlfU6vOiEPJ4p5dMDqO1lqpJKl3hKkIXbZ+m18Dol
 iZz4uSum3CPZRbkRy2buLoQMhgnoG9tq+JtwRk8+K7TxatV2cvYNdN4bxD4rRN1s9VvT
 3nQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0ysL/MDDZX+Geot7Zeu3H5HxZht23rz3nv2oCFFwflE=;
 b=V3eJXCyVIx2lIzQU3Zx5cWe/ghX2vqMbgYoXvqr+NuNcOTtHANAO6DxJ/Ma+RExSmA
 Y9eK93Dmf+fzwQdZS84mxvAz9AT6UsXPzzr8pqbrFj8BjM7DlEt+hadXOmTxY5L6BEdd
 mWpvZgmyj8O7Tgw+6s7UVodVkGhWr31Br+0baYmbise1+CPTJY5XlL76IduiVqQTtlXB
 SvBUFUNgTvC3fEc/KijQFTWWVe7/6xF8Dqkf3m58n2fXmxQ4q9mp5dw/A+K9RC81nmif
 8y8w6R2YDg4SDKS4UfjgjbQqK25PL8u2FzPoCBwiv3g+cjigbZWabe/JLmjOjcVdkCD3
 oQ0g==
X-Gm-Message-State: AOAM532xVbBVT22IxhXbObRulPyhmHrvTOaJbkCt2WF8G9m9CxlZEwHp
 qKCCqUFPYUMQAqYz62yHaxdTzQ==
X-Google-Smtp-Source: ABdhPJykL7x0YQXiXu0uXG4acTOiNNgMT+vUsR0COda25KAqnxHNJVfhdW8GcPFarglKC6ddEf7apQ==
X-Received: by 2002:a2e:7007:0:b0:250:629f:7ca0 with SMTP id
 l7-20020a2e7007000000b00250629f7ca0mr4824093ljc.419.1651923611897; 
 Sat, 07 May 2022 04:40:11 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([94.25.229.149])
 by smtp.gmail.com with ESMTPSA id
 o8-20020a2e9448000000b0024f4bb33c50sm953953ljh.100.2022.05.07.04.40.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 May 2022 04:40:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sat,  7 May 2022 14:40:09 +0300
Message-Id: <20220507114009.1696278-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] drm/msm/dpu: remove NULL-ness check in
 dpu_hw_intr_destroy
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
Cc: kernel test robot <lkp@intel.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

There is no need to check that kfree() argument is not NULL. Remove
extra check and call kfree() unconditionally.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index fa4f99034a08..915250b7f122 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -433,8 +433,7 @@ struct dpu_hw_intr *dpu_hw_intr_init(void __iomem *addr,
 
 void dpu_hw_intr_destroy(struct dpu_hw_intr *intr)
 {
-	if (intr)
-		kfree(intr);
+	kfree(intr);
 }
 
 int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
-- 
2.35.1

