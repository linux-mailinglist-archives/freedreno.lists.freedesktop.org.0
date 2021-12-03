Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 671BC4670D5
	for <lists+freedreno@lfdr.de>; Fri,  3 Dec 2021 04:42:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0020A6F45E;
	Fri,  3 Dec 2021 03:42:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 303 seconds by postgrey-1.36 at gabe;
 Fri, 03 Dec 2021 03:42:06 UTC
Received: from out30-45.freemail.mail.aliyun.com
 (out30-45.freemail.mail.aliyun.com [115.124.30.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C046E6F45E
 for <freedreno@lists.freedesktop.org>; Fri,  3 Dec 2021 03:42:06 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R611e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400; MF=yang.lee@linux.alibaba.com;
 NM=1; PH=DS; RN=10; SR=0; TI=SMTPD_---0UzDkkD3_1638502617; 
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com
 fp:SMTPD_---0UzDkkD3_1638502617) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 03 Dec 2021 11:36:58 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: robdclark@gmail.com
Date: Fri,  3 Dec 2021 11:36:52 +0800
Message-Id: <1638502612-113708-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [Freedreno] [PATCH -next] drm: remove node from list before freeing
 the node
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yang Li <yang.lee@linux.alibaba.com>, daniel@ffwll.ch, sean@poorly.run
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

fix the following smatch warning:
drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1675 dpu_plane_init() warn:
'&pdpu->mplane_list' not removed from list

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index ca190d9..aad238b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1672,6 +1672,7 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
 	if (pdpu && pdpu->pipe_hw)
 		dpu_hw_sspp_destroy(pdpu->pipe_hw);
 clean_plane:
+	list_del(&pdpu->mplane_list);
 	kfree(pdpu);
 	return ERR_PTR(ret);
 }
-- 
1.8.3.1

