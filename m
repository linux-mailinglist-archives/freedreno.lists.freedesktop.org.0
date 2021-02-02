Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3447B30BDEB
	for <lists+freedreno@lfdr.de>; Tue,  2 Feb 2021 13:17:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2B3789DA3;
	Tue,  2 Feb 2021 12:17:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 665 seconds by postgrey-1.36 at gabe;
 Tue, 02 Feb 2021 12:17:08 UTC
Received: from mail-m17640.qiye.163.com (mail-m17640.qiye.163.com
 [59.111.176.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39D6B89DA3
 for <freedreno@lists.freedesktop.org>; Tue,  2 Feb 2021 12:17:08 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [157.0.31.124])
 by mail-m17640.qiye.163.com (Hmail) with ESMTPA id 921F1540084;
 Tue,  2 Feb 2021 20:05:58 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Emil Velikov <emil.velikov@collabora.com>,
 Matthias Kaehlcke <mka@chromium.org>, Bernard Zhao <bernard@vivo.com>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Date: Tue,  2 Feb 2021 04:05:49 -0800
Message-Id: <20210202120552.14744-1-bernard@vivo.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZT04YSUxLGU1CSU5CVkpNSklJTUxOTkNCS0xVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hNSlVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6ORg6LQw5IT8VOTYKFDoYEjER
 QhAKCRhVSlVKTUpJSU1MTk5CSUJMVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlKTkxV
 S1VISlVKSU9ZV1kIAVlBSUhDQjcG
X-HM-Tid: 0a7762a297bfd995kuws921f1540084
Subject: [Freedreno] [PATCH] gpu/drm/msm: remove redundant when devm_kzalloc
 failed
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
Cc: opensource.kernel@vivo.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Line 1826 pr_err is redundant because memory alloc already
prints an error when failed.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index ab281cba0f08..246d3f06f3ef 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1826,8 +1826,6 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 
 	msm_host = devm_kzalloc(&pdev->dev, sizeof(*msm_host), GFP_KERNEL);
 	if (!msm_host) {
-		pr_err("%s: FAILED: cannot alloc dsi host\n",
-		       __func__);
 		ret = -ENOMEM;
 		goto fail;
 	}
-- 
2.29.0

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
