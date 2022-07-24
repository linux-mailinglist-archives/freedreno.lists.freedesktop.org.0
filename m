Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50EAC595E8F
	for <lists+freedreno@lfdr.de>; Tue, 16 Aug 2022 16:49:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A0B9A9AA1;
	Tue, 16 Aug 2022 14:49:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from smtpbg.qq.com (biz-43-154-221-58.mail.qq.com [43.154.221.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73DA31123A3;
 Sun, 24 Jul 2022 12:53:52 +0000 (UTC)
X-QQ-mid: bizesmtp86t1658667219tiqqdwip
Received: from localhost.localdomain ( [171.223.97.251])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Sun, 24 Jul 2022 20:53:37 +0800 (CST)
X-QQ-SSF: 01000000002000F0U000B00A0000000
X-QQ-FEAT: RrZlkntZBflKcuY8rrgOtE6VDI+adS2tmGpOUI5TaU9rC6YaVQCXtBpTxBiDD
 w/Tu1RgqOoKHEX2qqZGRqWAw0LKbxyzhsG9oW+KkLDWgYINr33l572bzy+wU7mdQdzHeY8U
 qQe4xOhQ9A8iGRjzbufEFp01vo8aCb9pXyyviQfM79ZfpyvxGyNG+9w96D8SLtu6wicASts
 phknQuDRPu5AyKs7BrJvKlKvpasIkXiyYpo0b3Ve+SqxJ3/upzksCZkAb+moGdJIRti4aLD
 ROfi2F5VcHDiz71+BpqVkQwjZI/vzDr/JypXAVwQ9MWNE8+bRNSU2j/dYzTtXsVYOPMZhpH
 f5bGHj8orl0TIOEMOxBGANgMBDw8X5vsd6fwzkJmzFOHEpZs216OoB9gFI17Gy/vDtl7AOi
X-QQ-GoodBg: 0
From: Jason Wang <wangborong@cdjrlc.com>
To: quic_abhinavk@quicinc.com
Date: Mon, 25 Jul 2022 04:42:42 +0800
Message-Id: <20220724204242.4107-1-wangborong@cdjrlc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr6
X-Mailman-Approved-At: Tue, 16 Aug 2022 14:49:33 +0000
Subject: [Freedreno] [PATCH] drm/msm/dpu: Fix comment typo
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
Cc: quic_kalyant@quicinc.com, freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 robdclark@gmail.com, Jason Wang <wangborong@cdjrlc.com>, daniel@ffwll.ch,
 dmitry.baryshkov@linaro.org, quic_vpolimer@quicinc.com, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The double `be' is duplicated in the comment, remove one.

Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 71fe4c505f5b..38aa38ab1568 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -76,7 +76,7 @@ enum {
 
 /**
  * MDP TOP BLOCK features
- * @DPU_MDP_PANIC_PER_PIPE Panic configuration needs to be be done per pipe
+ * @DPU_MDP_PANIC_PER_PIPE Panic configuration needs to be done per pipe
  * @DPU_MDP_10BIT_SUPPORT, Chipset supports 10 bit pixel formats
  * @DPU_MDP_BWC,           MDSS HW supports Bandwidth compression.
  * @DPU_MDP_UBWC_1_0,      This chipsets supports Universal Bandwidth
-- 
2.35.1


