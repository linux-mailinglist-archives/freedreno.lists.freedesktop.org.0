Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63850379E24
	for <lists+freedreno@lfdr.de>; Tue, 11 May 2021 06:19:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4AFF6E9AE;
	Tue, 11 May 2021 04:18:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 670E56E9AE
 for <freedreno@lists.freedesktop.org>; Tue, 11 May 2021 04:18:57 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id n184so17838411oia.12
 for <freedreno@lists.freedesktop.org>; Mon, 10 May 2021 21:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cIlO46CkkS5Pg+0HgvjISZiN0yDOwowrWH9c72C/51g=;
 b=mRuUfhiIHwmHMXwrWfnYTLt04ccW91TQ4rR5w5vnHJkszkv1a4SpShur1Uzw7r/Z8K
 00uSb7n46jZxl38Rto2Onja5mznqs/0SsC2AwYvjLyCnLUprTpM7oqN3B4vUqVNtPdEx
 JLIMNdLQSNRI78gZM4z581JeY7JctQeygnE/CT79ZzwNHghOwl0ELV8FcacyxuHv393n
 1+CCdVcjLIR7+TDymiNpBaUo6wBmkZbfmUM+eG/V8qFhJicdJhNZc5Q5tyAEIodl0vTx
 Zkth37mYKxMrXjKToHTDpY8emf3n2CSCzaDQPVDaxkEHPd6RSYZDjK2Pz3JN7aUUhTRv
 H75Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cIlO46CkkS5Pg+0HgvjISZiN0yDOwowrWH9c72C/51g=;
 b=axL3UPBdPJr7iMOPx/TNU2qHLuK2lZEZCvjQq0BjBfrfFAsbkj77F7ggmswejx+0Z3
 2lauHy69Ga0AEDEZQKAUs6ZJbZNiGE/fPRUOGOTkVljdoft47rDWK1nWNiygiK8FOxBu
 tcHRnrgyaoNFIWt3EMyZDbFno5Fbkhq0/lQTMkiDLoNEwFrLJ0YtaN87/AgWTbYehPMH
 R6ule17MDOG8ulJW3B9Bo9Dwrt38DUd30QvcWEKNrxmqpx01IKfsJQXKDI6MpCyzMfVS
 JJDTY/efUALgmz+sjFundSSGH2bHv77R3aiFGXe72wMT1M5pmy8Y0YQs2zWDWVMYY/Jn
 EHCA==
X-Gm-Message-State: AOAM531UJtsLcMI9IC8hTgSdxcge7iKhV9/FRzB+WY9lcZKffxNXvzF7
 NfC5y8OJOBEjD5N1wf5tDHltSA==
X-Google-Smtp-Source: ABdhPJza5EDuH99wp2zZDu2zrmUrtSb9yOK1fqrsaf9GKSi/kq4l4DAFA0D3L9gkf+7ShvYj7++aaA==
X-Received: by 2002:aca:380a:: with SMTP id f10mr2031022oia.157.1620706736754; 
 Mon, 10 May 2021 21:18:56 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:e623:42c1:10df:adff:fec2:f1d])
 by smtp.gmail.com with ESMTPSA id z15sm558647otp.20.2021.05.10.21.18.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 21:18:56 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 10 May 2021 23:18:49 -0500
Message-Id: <20210511041852.592295-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210511041852.592295-1-bjorn.andersson@linaro.org>
References: <20210511041852.592295-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 1/4] drm/msm/dpu: Introduce knowledge of widebus
 feature
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Some hardware supports clocking 2 pixels per pixel clock pulse, known as
"widebus". The configuration needs to match between the DPU and the
interface controller, and the timing parameters must be adjusted.

As a first step towards supporting this, start by adding a INTF mask
flag to signal the timing configuration code that the INTF_CONFIG2
register should be written - which will clear the bit, in the case that
the bootloader left it set.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c    | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 4dfd8a20ad5c..c2f34a4f82d9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -196,12 +196,14 @@ enum {
  * @DPU_INTF_TE                 INTF block has TE configuration support
  * @DPU_DATA_HCTL_EN            Allows data to be transferred at different rate
                                 than video timing
+ * @DPU_INTF_WIDEBUS            INTF block supports driving 2 pixels per clock
  * @DPU_INTF_MAX
  */
 enum {
 	DPU_INTF_INPUT_CTRL = 0x1,
 	DPU_INTF_TE,
 	DPU_DATA_HCTL_EN,
+	DPU_INTF_WIDEBUS,
 	DPU_INTF_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 1599e3f49a4f..933485d8c03c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -183,7 +183,6 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
 	if (ctx->cap->features & BIT(DPU_DATA_HCTL_EN)) {
 		intf_cfg2 |= BIT(4);
 		display_data_hctl = display_hctl;
-		DPU_REG_WRITE(c, INTF_CONFIG2, intf_cfg2);
 		DPU_REG_WRITE(c, INTF_DISPLAY_DATA_HCTL, display_data_hctl);
 	}
 
@@ -204,6 +203,8 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
 	DPU_REG_WRITE(c, INTF_FRAME_LINE_COUNT_EN, 0x3);
 	DPU_REG_WRITE(c, INTF_CONFIG, intf_cfg);
 	DPU_REG_WRITE(c, INTF_PANEL_FORMAT, panel_format);
+	if (ctx->cap->features & (BIT(DPU_DATA_HCTL_EN) | BIT(DPU_INTF_WIDEBUS)))
+		DPU_REG_WRITE(c, INTF_CONFIG2, intf_cfg2);
 }
 
 static void dpu_hw_intf_enable_timing_engine(
-- 
2.29.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
