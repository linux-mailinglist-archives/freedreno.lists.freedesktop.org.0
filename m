Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D57CB6492F9
	for <lists+freedreno@lfdr.de>; Sun, 11 Dec 2022 07:57:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 294E610E13B;
	Sun, 11 Dec 2022 06:57:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 450 seconds by postgrey-1.36 at gabe;
 Sun, 11 Dec 2022 06:57:42 UTC
Received: from smtp.smtpout.orange.fr (smtp-26.smtpout.orange.fr
 [80.12.242.26])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9622B10E13B
 for <freedreno@lists.freedesktop.org>; Sun, 11 Dec 2022 06:57:42 +0000 (UTC)
Received: from pop-os.home ([86.243.100.34]) by smtp.orange.fr with ESMTPA
 id 4GA4pPlLH5FWA4GA4pDe1A; Sun, 11 Dec 2022 07:50:10 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 11 Dec 2022 07:50:10 +0100
X-ME-IP: 86.243.100.34
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Date: Sun, 11 Dec 2022 07:50:06 +0100
Message-Id: <b3d9dac978f1e2e42a40ec61f58aa98c44c85dfd.1670741386.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] drm/msm/hdm: Fix the error handling path of
 msm_hdmi_dev_probe()
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
Cc: linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

If an error occurs after a successful msm_hdmi_get_phy() call, it must be
undone by a corresponding msm_hdmi_put_phy(), as already done in the
remove function.

Fixes: 437365464043 ("drm/msm/hdmi: move msm_hdmi_get_phy() to msm_hdmi_dev_probe()")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Not sure if the Fixes tag is correct. At least it is when the probe needs
to be fixed but the issue was maybe there elsewhere before.
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 4d3fdc806bef..97372bb241d8 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -532,11 +532,19 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
 
 	ret = devm_pm_runtime_enable(&pdev->dev);
 	if (ret)
-		return ret;
+		goto err_put_phy;
 
 	platform_set_drvdata(pdev, hdmi);
 
-	return component_add(&pdev->dev, &msm_hdmi_ops);
+	ret = component_add(&pdev->dev, &msm_hdmi_ops);
+	if (ret)
+		goto err_put_phy;
+
+	return 0;
+
+err_put_phy:
+	msm_hdmi_put_phy(hdmi);
+	return ret;
 }
 
 static int msm_hdmi_dev_remove(struct platform_device *pdev)
-- 
2.34.1

