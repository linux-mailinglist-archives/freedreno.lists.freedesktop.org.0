Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BDB41C497
	for <lists+freedreno@lfdr.de>; Wed, 29 Sep 2021 14:19:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 133316EA57;
	Wed, 29 Sep 2021 12:19:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from smtp-relay-canonical-1.canonical.com
 (smtp-relay-canonical-1.canonical.com [185.125.188.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAEFE6EA54;
 Wed, 29 Sep 2021 12:18:59 +0000 (UTC)
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 6160C40184; 
 Wed, 29 Sep 2021 12:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632917938;
 bh=Bhi6AHpfy+Ej7XA03LLA3tQ3s3CRWpWh6aY3VL7zg6I=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=VFhT8s8l9BI3n5pbmMC9WNLBYSQ8vlH2EBQOf5Z4inyh3DmyXaTEgfqieq0KKCjxp
 HQqVKwJgvhGhewcIyYqANQko+pBIsXUlj4yf5061PKjdIJZ02hESR8oWvMmg7qg7dM
 iCHVmhKZRmcgaFENb+JaHrki7H5Iuc+VcmgqnUCadtF3wlK4nyCEBY1lbeGUGTxKcs
 n60IQb+8b6H0urKz99HuzUwS4xBbZXxVwcuHc21hhBAz7BrM1bvBjg10HcitJhZFo8
 dVab1JfknUC6IrTUjjk4DWkIDM4B80Sdsg07TK3ri5f0ND+2fF5KTfGgDC1EyWnqur
 6jaBmlXOwW5Mw==
From: Colin King <colin.king@canonical.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>, Lyude Paul <lyude@redhat.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Wed, 29 Sep 2021 13:18:57 +0100
Message-Id: <20210929121857.213922-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] drm/msm: Fix null pointer dereference on
 pointer edp
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Colin Ian King <colin.king@canonical.com>

The initialization of pointer dev dereferences pointer edp before
edp is null checked, so there is a potential null pointer deference
issue. Fix this by only dereferencing edp after edp has been null
checked.

Addresses-Coverity: ("Dereference before null check")
Fixes: ab5b0107ccf3 ("drm/msm: Initial add eDP support in msm drm driver (v5)")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/msm/edp/edp_ctrl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/edp/edp_ctrl.c b/drivers/gpu/drm/msm/edp/edp_ctrl.c
index 4fb397ee7c84..fe1366b4c49f 100644
--- a/drivers/gpu/drm/msm/edp/edp_ctrl.c
+++ b/drivers/gpu/drm/msm/edp/edp_ctrl.c
@@ -1116,7 +1116,7 @@ void msm_edp_ctrl_power(struct edp_ctrl *ctrl, bool on)
 int msm_edp_ctrl_init(struct msm_edp *edp)
 {
 	struct edp_ctrl *ctrl = NULL;
-	struct device *dev = &edp->pdev->dev;
+	struct device *dev;
 	int ret;
 
 	if (!edp) {
@@ -1124,6 +1124,7 @@ int msm_edp_ctrl_init(struct msm_edp *edp)
 		return -EINVAL;
 	}
 
+	dev = &edp->pdev->dev;
 	ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
 	if (!ctrl)
 		return -ENOMEM;
-- 
2.32.0

