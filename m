Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1374A398CE1
	for <lists+freedreno@lfdr.de>; Wed,  2 Jun 2021 16:33:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0EF46ECBF;
	Wed,  2 Jun 2021 14:33:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B3E8919D
 for <freedreno@lists.freedesktop.org>; Wed,  2 Jun 2021 14:33:22 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 s5-20020a7bc0c50000b0290147d0c21c51so1803306wmh.4
 for <freedreno@lists.freedesktop.org>; Wed, 02 Jun 2021 07:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+O8/a75/EGow+S0U9CZ37LWYZF774zelw+e2XQOlCh4=;
 b=scMNCuo7TvPXa/USduYx8vxHkn2MkaUpB/bN1OuLdxfsaI+PpPhnlCrmyoe+4EHTmU
 jFK04vbNwMnHuPVQmyLhx52b9l+/CSxXAXnUYFr7GjkAnoBIqK8J3ymoO4oVnGZGEdgX
 oiSi/WNKw0IHG0OyN5uxmtxrAQxg3KnYF5VsZjMSWV6EczUUQPyD3PLTsY+ArBKXHTN5
 DeN3ZU9OQy6Y+TDZ8MGOr8hnAxhkVibGo4dfMBMoWkO+9ihunme98Y4F/HzTXxcdgMaN
 L4BdImnB+LgHZcjpjPTmOC7eGJnmswNVu5t/C94aTLH0RN7bWtskwGiUM4nIvX85fR/7
 5V3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+O8/a75/EGow+S0U9CZ37LWYZF774zelw+e2XQOlCh4=;
 b=uX4hW4oCS9qbVh7LR/ZSy59xfSZWiCX32qWIRjOJESAOGyHUfK9aI3vphgfEyCdAOH
 /DfLpX23D+VONtkXefZXvXFRI7YrK1J+WfgKCW1miHoa2SaCt5U0VouqAvedbA2E88nR
 JMUWfaiNh57yNj7eFJ7Z5i34xjeZdgcrcJL66G1UuJuSZZTVrwPNeER40KpB9oUlLsEV
 uqVnlVqASU4Iu0I34LwJ3fjdD+C7Z+J6IY8x8VgEvlHKh0ZqLKY5k6hjhsKTwGwjrU/k
 K+CJaD4qGU63KtXI3AfxGxy5ts/31bXVX4pmGgyZlQnRGzh7eL9GO3pNZQCV/DrxiFql
 rjwA==
X-Gm-Message-State: AOAM532dyYHvFeEbWgTep+jLFKkUNKgXD4LSBTb6RiLnwGOP49DoLjzx
 f09er5p3wavKPFjJEW267ceAeA==
X-Google-Smtp-Source: ABdhPJz9TRllsEvlN+ktwZnb9cVc9l9L2T5I+Wnc6TLlIRk64GePM4LE9fhxWq0yuGqCx4cj+jlpAQ==
X-Received: by 2002:a05:600c:22d7:: with SMTP id
 23mr5326693wmg.119.1622644400640; 
 Wed, 02 Jun 2021 07:33:20 -0700 (PDT)
Received: from dell.default ([91.110.221.214])
 by smtp.gmail.com with ESMTPSA id o11sm132315wrq.93.2021.06.02.07.33.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 07:33:20 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Wed,  2 Jun 2021 15:32:44 +0100
Message-Id: <20210602143300.2330146-11-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210602143300.2330146-1-lee.jones@linaro.org>
References: <20210602143300.2330146-1-lee.jones@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [RESEND 10/26] drm/msm/disp/dpu1/dpu_hw_interrupts:
 Demote a bunch of kernel-doc abuses
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
Cc: Krishna Manikandan <mkrishn@codeaurora.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:17: warning: expecting prototype for Register offsets in MDSS register file for the interrupt registers(). Prototype was for MDP_SSPP_TOP0_OFF() instead
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:35: warning: expecting prototype for WB interrupt status bit definitions(). Prototype was for DPU_INTR_WB_0_DONE() instead
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:42: warning: expecting prototype for WDOG timer interrupt status bit definitions(). Prototype was for DPU_INTR_WD_TIMER_0_DONE() instead
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:51: warning: expecting prototype for Pingpong interrupt status bit definitions(). Prototype was for DPU_INTR_PING_PONG_0_DONE() instead
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:71: warning: expecting prototype for Interface interrupt status bit definitions(). Prototype was for DPU_INTR_INTF_0_UNDERRUN() instead
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:85: warning: expecting prototype for Pingpong Secondary interrupt status bit definitions(). Prototype was for DPU_INTR_PING_PONG_S0_AUTOREFRESH_DONE() instead
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:94: warning: expecting prototype for Pingpong TEAR detection interrupt status bit definitions(). Prototype was for DPU_INTR_PING_PONG_0_TEAR_DETECTED() instead
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:102: warning: expecting prototype for Pingpong TE detection interrupt status bit definitions(). Prototype was for DPU_INTR_PING_PONG_0_TE_DETECTED() instead
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:110: warning: expecting prototype for Ctl start interrupt status bit definitions(). Prototype was for DPU_INTR_CTL_0_START() instead
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:119: warning: expecting prototype for Concurrent WB overflow interrupt status bit definitions(). Prototype was for DPU_INTR_CWB_2_OVERFLOW() instead
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:125: warning: expecting prototype for Histogram VIG done interrupt status bit definitions(). Prototype was for DPU_INTR_HIST_VIG_0_DONE() instead
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:133: warning: expecting prototype for Histogram VIG reset Sequence done interrupt status bit definitions(). Prototype was for DPU_INTR_HIST_VIG_0_RSTSEQ_DONE() instead
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:141: warning: expecting prototype for Histogram DSPP done interrupt status bit definitions(). Prototype was for DPU_INTR_HIST_DSPP_0_DONE() instead
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:149: warning: expecting prototype for Histogram DSPP reset Sequence done interrupt status bit definitions(). Prototype was for DPU_INTR_HIST_DSPP_0_RSTSEQ_DONE() instead
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:157: warning: expecting prototype for INTF interrupt status bit definitions(). Prototype was for DPU_INTR_VIDEO_INTO_STATIC() instead
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:170: warning: expecting prototype for AD4 interrupt status bit definitions(). Prototype was for DPU_INTR_BACKLIGHT_UPDATED() instead

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Krishna Manikandan <mkrishn@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 32 +++++++++----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 48c96b8121268..aaf251741dc27 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -10,7 +10,7 @@
 #include "dpu_hw_util.h"
 #include "dpu_hw_mdss.h"
 
-/**
+/*
  * Register offsets in MDSS register file for the interrupt registers
  * w.r.t. to the MDP base
  */
@@ -29,14 +29,14 @@
 #define MDP_INTF_1_OFF_REV_7xxx             0x35000
 #define MDP_INTF_5_OFF_REV_7xxx             0x39000
 
-/**
+/*
  * WB interrupt status bit definitions
  */
 #define DPU_INTR_WB_0_DONE BIT(0)
 #define DPU_INTR_WB_1_DONE BIT(1)
 #define DPU_INTR_WB_2_DONE BIT(4)
 
-/**
+/*
  * WDOG timer interrupt status bit definitions
  */
 #define DPU_INTR_WD_TIMER_0_DONE BIT(2)
@@ -45,7 +45,7 @@
 #define DPU_INTR_WD_TIMER_3_DONE BIT(6)
 #define DPU_INTR_WD_TIMER_4_DONE BIT(7)
 
-/**
+/*
  * Pingpong interrupt status bit definitions
  */
 #define DPU_INTR_PING_PONG_0_DONE BIT(8)
@@ -65,7 +65,7 @@
 #define DPU_INTR_PING_PONG_2_AUTOREFRESH_DONE BIT(22)
 #define DPU_INTR_PING_PONG_3_AUTOREFRESH_DONE BIT(23)
 
-/**
+/*
  * Interface interrupt status bit definitions
  */
 #define DPU_INTR_INTF_0_UNDERRUN BIT(24)
@@ -79,7 +79,7 @@
 #define DPU_INTR_INTF_3_VSYNC BIT(31)
 #define DPU_INTR_INTF_5_VSYNC BIT(23)
 
-/**
+/*
  * Pingpong Secondary interrupt status bit definitions
  */
 #define DPU_INTR_PING_PONG_S0_AUTOREFRESH_DONE BIT(0)
@@ -88,7 +88,7 @@
 #define DPU_INTR_PING_PONG_S0_TEAR_DETECTED BIT(22)
 #define DPU_INTR_PING_PONG_S0_TE_DETECTED BIT(28)
 
-/**
+/*
  * Pingpong TEAR detection interrupt status bit definitions
  */
 #define DPU_INTR_PING_PONG_0_TEAR_DETECTED BIT(16)
@@ -96,7 +96,7 @@
 #define DPU_INTR_PING_PONG_2_TEAR_DETECTED BIT(18)
 #define DPU_INTR_PING_PONG_3_TEAR_DETECTED BIT(19)
 
-/**
+/*
  * Pingpong TE detection interrupt status bit definitions
  */
 #define DPU_INTR_PING_PONG_0_TE_DETECTED BIT(24)
@@ -104,7 +104,7 @@
 #define DPU_INTR_PING_PONG_2_TE_DETECTED BIT(26)
 #define DPU_INTR_PING_PONG_3_TE_DETECTED BIT(27)
 
-/**
+/*
  * Ctl start interrupt status bit definitions
  */
 #define DPU_INTR_CTL_0_START BIT(9)
@@ -113,13 +113,13 @@
 #define DPU_INTR_CTL_3_START BIT(12)
 #define DPU_INTR_CTL_4_START BIT(13)
 
-/**
+/*
  * Concurrent WB overflow interrupt status bit definitions
  */
 #define DPU_INTR_CWB_2_OVERFLOW BIT(14)
 #define DPU_INTR_CWB_3_OVERFLOW BIT(15)
 
-/**
+/*
  * Histogram VIG done interrupt status bit definitions
  */
 #define DPU_INTR_HIST_VIG_0_DONE BIT(0)
@@ -127,7 +127,7 @@
 #define DPU_INTR_HIST_VIG_2_DONE BIT(8)
 #define DPU_INTR_HIST_VIG_3_DONE BIT(10)
 
-/**
+/*
  * Histogram VIG reset Sequence done interrupt status bit definitions
  */
 #define DPU_INTR_HIST_VIG_0_RSTSEQ_DONE BIT(1)
@@ -135,7 +135,7 @@
 #define DPU_INTR_HIST_VIG_2_RSTSEQ_DONE BIT(9)
 #define DPU_INTR_HIST_VIG_3_RSTSEQ_DONE BIT(11)
 
-/**
+/*
  * Histogram DSPP done interrupt status bit definitions
  */
 #define DPU_INTR_HIST_DSPP_0_DONE BIT(12)
@@ -143,7 +143,7 @@
 #define DPU_INTR_HIST_DSPP_2_DONE BIT(20)
 #define DPU_INTR_HIST_DSPP_3_DONE BIT(22)
 
-/**
+/*
  * Histogram DSPP reset Sequence done interrupt status bit definitions
  */
 #define DPU_INTR_HIST_DSPP_0_RSTSEQ_DONE BIT(13)
@@ -151,7 +151,7 @@
 #define DPU_INTR_HIST_DSPP_2_RSTSEQ_DONE BIT(21)
 #define DPU_INTR_HIST_DSPP_3_RSTSEQ_DONE BIT(23)
 
-/**
+/*
  * INTF interrupt status bit definitions
  */
 #define DPU_INTR_VIDEO_INTO_STATIC BIT(0)
@@ -164,7 +164,7 @@
 #define DPU_INTR_DSICMD_2_OUTOF_STATIC BIT(7)
 #define DPU_INTR_PROG_LINE BIT(8)
 
-/**
+/*
  * AD4 interrupt status bit definitions
  */
 #define DPU_INTR_BACKLIGHT_UPDATED BIT(0)
-- 
2.31.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
