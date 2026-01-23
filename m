Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJZUENXSdGnl+AAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Sat, 24 Jan 2026 15:10:29 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0447DC48
	for <lists+freedreno@lfdr.de>; Sat, 24 Jan 2026 15:10:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B72D910E337;
	Sat, 24 Jan 2026 14:10:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VDIqZ7XP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com
 [209.85.217.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9034E10EBDD
 for <freedreno@lists.freedesktop.org>; Fri, 23 Jan 2026 21:10:44 +0000 (UTC)
Received: by mail-vs1-f44.google.com with SMTP id
 ada2fe7eead31-5f526c39718so2682133137.2
 for <freedreno@lists.freedesktop.org>; Fri, 23 Jan 2026 13:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769202643; x=1769807443; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xOKBsrYlyb9CGTosX89C67uibLCQdicC5e/4vrZsIig=;
 b=VDIqZ7XPyXbJ4QKdMZNnF8PpUQQh6JaauYWBwzHvckxS8lUPBtuoGQedbKZyFbJYVP
 mDX1L+mK8a30gdmEu96hbk2e3mQifYnuNfZcGFzKet3PIusT6QIaxODhrNzcg28Od6pJ
 LjCna4E389obxxar4jxErmOa/Ek3Jxd14aMN0ehdPr1n2cW6WeKZvzuwgwApb0pQ8j1A
 0NI94aEi/uk1nGIhu7V/+EKoFLd2epFiK/Cz2HzRX0SrGI3W91CfkY6XTd6Gjp125vUx
 uDhHNML4fPloE23kcXxkqqwItnpqyluR5YAw2RXAAsuSBkBULYC1knqCDFRZtZ6OCbkF
 Vi9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769202643; x=1769807443;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xOKBsrYlyb9CGTosX89C67uibLCQdicC5e/4vrZsIig=;
 b=mdHiZ7OXT9xCwIvOL3DlKe/1uSCsZ4BLY76Zz1ygfIFCy2eq8o55JqdYwS24qZhGCT
 ZWhfG8AnnoAkoMFMymA7wKWT7D3rAkV37aXlCoi7Vn3mVNfO85xCQBJn7LGkE0CO2sd3
 WuJeNKedB+cCb36zsBgyGj1aoR+OXYjmtXe8UoqG6fdFdGOovzU7sb8jrakmy+rkJ8CD
 aNDfmbcUSDEz6C5xwsshFEv3IjhAas6dEWZXjw6P0+P/a3k1cc3jHWgwDnCStW6pMbDA
 7bdrzD3+u1vM00jCkcYvCR1xBNblrzFCugkt4F/vX5koHSb452qtpJ6lQ9NDvPvdIxrx
 oo4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVshzGGmfZZimOhv3o+e3y7G5wGQehW7GGVajgAJpfBlJtk77TQtbfpjLWkX2DgcRwr5lr+qJv5GVM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw04y01jr1eyT+3HdUPW4+U4DHjdSlTtqea+0qXbTC85Kp6V6Nx
 boGy0WqdX8nFEkjRnv3JWE8Vn+TMnlpv6LB3F1m4ZMhEj6TjCGz+JtXdr8FzhBZwABI=
X-Gm-Gg: AZuq6aJLNSvhCTRp/4/p0BRCh43Jmy8fnzeBDLZpP1zFvSXongA/QS3OpZ850jf1DV1
 rsCqIXttYdqjk2ANsQaNNnwyoKrGqmyaCEyXSj8FLq65y9rCZMdETbk6ug1BUgYb3EawesoYsoy
 1WQk6d7IKK17vjHJaLFmKYudx8/IJA+PGmS8du7A+Dvg1Mw31zujUxCz/Qr3Wkxt6W55MkKUDd1
 l8ec12MobgR1Wf60CIgxW6kZlY5m4XXcJv4obmkdyIf/hsMkN4Tw6OXTQ+4qkLzlcAujIf22hzY
 9FuS3myWFCbvdCArbNja4FIKEz9CWypYkMgFBQFjkJK4IYcJXz3s5uqeGsq5iIk48uNdOUf8Q5o
 hlbufTFL4LzxgpuGmv2LE/xW91r4AQWbWVrGJE+T1U3trlPNki/8H9v4GhP77w4sqh1+G5T4xx4
 4OQAb68WxvkETXCwgarhel8t6b
X-Received: by 2002:a17:90b:6c3:b0:34c:3cbc:db8e with SMTP id
 98e67ed59e1d1-35368b45324mr3047519a91.25.1769196870985; 
 Fri, 23 Jan 2026 11:34:30 -0800 (PST)
Received: from junjungu-PC.localdomain ([188.253.124.89])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3536d8b8f7bsm2731215a91.6.2026.01.23.11.34.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jan 2026 11:34:30 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sat, 24 Jan 2026 03:34:23 +0800
Subject: [PATCH v2] drm/msm/adreno: Fix a reference leak in a6xx_gpu_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260124-a6xx_gpu-v2-1-86a1dcf85e13@gmail.com>
X-B4-Tracking: v=1; b=H4sIAD7Nc2kC/0XMSwrCMBSF4a2UOzaSpLWoo+5DiuTdC7YpiYZIy
 d6NBXH4Hw7fBtEENBGuzQbBJIzolxr80ICaxOIMQV0bOOU9Zbwlos/57tYXUVLRy0lL0/EW6n0
 NxmLeqdtYe8L49OG9y4l91x/S/ZHECCNWUHWWXCsr2eBmgY+j8jOMpZQPzZC/r6AAAAA=
X-Change-ID: 20260123-a6xx_gpu-cbc095dbe423
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769196866; l=2364;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=yrXNODIr7BomkmwbFTfdc1dmWE/M85IjDSwFYcpA9YY=;
 b=JgU/mPDrjPcXojazLX4qDQiHBhnqfv8QLohkDcjKBfaKWjkBRHhGiwsK40juItBCsPTUMbGsj
 /xEXYoqT0yDCiLEQMLR3tJNMRtRSyCbYJcmWJmFa90fSMpi9ncOKNJb
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-Mailman-Approved-At: Sat, 24 Jan 2026 14:10:24 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:ustc.gu@gmail.com,m:ustcgu@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	TAGGED_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[ustcgu@gmail.com,freedreno-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ustcgu@gmail.com,freedreno-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[freedreno];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: DC0447DC48
X-Rspamd-Action: no action

In a6xx_gpu_init(), node is obtained via of_parse_phandle().
While there was a manual of_node_put() at the end of the
common path, several early error returns would bypass this call,
resulting in a reference leak.
Fix this by using the __free(device_node) cleanup handler to
release the reference when the variable goes out of scope.

Fixes: 5a903a44a984 ("drm/msm/a6xx: Introduce GMU wrapper support")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
Changes in v2:
- Explicitly add header file.
- Link to v1: https://lore.kernel.org/r/20260124-a6xx_gpu-v1-1-fa0c8b2dcfb1@gmail.com
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 2129d230a92b..604b0f861d27 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -9,6 +9,7 @@
 #include "a6xx_gmu.xml.h"
 
 #include <linux/bitfield.h>
+#include <linux/cleanup.h>
 #include <linux/devfreq.h>
 #include <linux/firmware/qcom/qcom_scm.h>
 #include <linux/pm_domain.h>
@@ -2640,7 +2641,6 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	struct msm_drm_private *priv = dev->dev_private;
 	struct platform_device *pdev = priv->gpu_pdev;
 	struct adreno_platform_config *config = pdev->dev.platform_data;
-	struct device_node *node;
 	struct a6xx_gpu *a6xx_gpu;
 	struct adreno_gpu *adreno_gpu;
 	struct msm_gpu *gpu;
@@ -2660,7 +2660,8 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	adreno_gpu->registers = NULL;
 
 	/* Check if there is a GMU phandle and set it up */
-	node = of_parse_phandle(pdev->dev.of_node, "qcom,gmu", 0);
+	struct device_node *node __free(device_node) =
+		of_parse_phandle(pdev->dev.of_node, "qcom,gmu", 0);
 	/* FIXME: How do we gracefully handle this? */
 	BUG_ON(!node);
 
@@ -2702,7 +2703,6 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 		ret = a6xx_gmu_wrapper_init(a6xx_gpu, node);
 	else
 		ret = a6xx_gmu_init(a6xx_gpu, node);
-	of_node_put(node);
 	if (ret) {
 		a6xx_destroy(&(a6xx_gpu->base.base));
 		return ERR_PTR(ret);

---
base-commit: a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
change-id: 20260123-a6xx_gpu-cbc095dbe423

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>

