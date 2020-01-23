Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C18146108
	for <lists+freedreno@lfdr.de>; Thu, 23 Jan 2020 04:49:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D088F6F97C;
	Thu, 23 Jan 2020 03:49:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 942 seconds by postgrey-1.36 at gabe;
 Thu, 23 Jan 2020 03:49:22 UTC
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EE3B6F978
 for <freedreno@lists.freedesktop.org>; Thu, 23 Jan 2020 03:49:22 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id E731D1098EFDB35A05AB;
 Thu, 23 Jan 2020 11:33:34 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Thu, 23 Jan 2020
 11:33:25 +0800
From: Zheng Bin <zhengbin13@huawei.com>
To: <robdclark@gmail.com>, <sean@poorly.run>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>
Date: Thu, 23 Jan 2020 11:40:41 +0800
Message-ID: <1579750843-5315-3-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1579750843-5315-1-git-send-email-zhengbin13@huawei.com>
References: <1579750843-5315-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
Subject: [Freedreno] [PATCH 2/4] drm/msm/dpu: fix comparing pointer to 0 in
 dpu_encoder_phys_vid.c
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
Cc: zhengbin13@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Fixes coccicheck warning:

drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c:242:48-49: WARNING comparing pointer to 0
drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c:562:25-26: WARNING comparing pointer to 0
drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c:562:48-49: WARNING comparing pointer to 0

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zheng Bin <zhengbin13@huawei.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index c71c18d..b5a4905 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -239,7 +239,7 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 	struct dpu_hw_intf_cfg intf_cfg = { 0 };

 	if (!phys_enc->hw_ctl->ops.setup_intf_cfg) {
-		DPU_ERROR("invalid encoder %d\n", phys_enc != 0);
+		DPU_ERROR("invalid encoder %d\n", phys_enc != NULL);
 		return;
 	}

@@ -559,7 +559,7 @@ static void dpu_encoder_phys_vid_disable(struct dpu_encoder_phys *phys_enc)

 	if (!phys_enc->hw_intf) {
 		DPU_ERROR("invalid hw_intf %d hw_ctl %d\n",
-				phys_enc->hw_intf != 0, phys_enc->hw_ctl != 0);
+				phys_enc->hw_intf != NULL, phys_enc->hw_ctl != NULL);
 		return;
 	}

--
2.7.4

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
