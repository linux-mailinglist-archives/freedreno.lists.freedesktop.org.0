Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6EE31D160
	for <lists+freedreno@lfdr.de>; Tue, 16 Feb 2021 21:10:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1740A6E983;
	Tue, 16 Feb 2021 20:10:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D8346E980
 for <freedreno@lists.freedesktop.org>; Tue, 16 Feb 2021 20:10:32 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id v10so7973628qtq.7
 for <freedreno@lists.freedesktop.org>; Tue, 16 Feb 2021 12:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NKwlbcTtgnB6BisI4Bvy7S6GuugskOb7r/1I3tSO040=;
 b=Fwl1w0m1yyz+DUSfQ+nlbFIh9wxR18vvObIsEy0qzWgUdgqJGtnC9sOxTr8SCTD9aP
 66sIMMCN3NX1kJMC2FelE5qc7mO1YvdAR8UDTULWi0w1uUFtDPwcrwJrCdUD8Bd1H2RD
 ce3CYes027o9rz0lBqy9FMu1rJXSbFPANa8l0U2XazTDJVAKB7Xx+t2CkaaVR/AsGl6x
 Gt9fDIFh4os3sf+Wmx+Zxd4XcTG83lwVhc63v/f1GKq480aLQuyO5eya3GABj+ffsfrA
 8oDIl9Grj7LZlSxJBEtTnKeJm+pkYd23mNw5cd0+xGKnR4WQpd//b6q7BfOJe3JXMO4T
 U7VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NKwlbcTtgnB6BisI4Bvy7S6GuugskOb7r/1I3tSO040=;
 b=Xc0M1DXWcWiow4jSh4VA4xRcOMFz7TRpDxrCWzvG3yanqGtKL4tuXuIKsxI1+CXfCG
 XNgFNeojQJgbljT7zaVXVZ5pNT0fL+Rs6IWas8ojRxcaUZRol7RfIAU2N/VBjIOca28j
 yms4TFuDkJOSZSON9xi0R9Z9kFmhWEUiZMvKQLmc6Bhb3wIGqKmzlLnMrm3IKt0zz4hh
 7VOhDwiSgfvCbXydi/eFoM8IM/1Jl0QX/iZb5P9+RuuyiRLsOYSrlyhbhMXP0iGo6GqB
 Wd9gBPPaXEO0EYqUpuhm9fa6BO7V3H9ywdFKvmt1EJYSa4n3viLCzuPukAh9MlhQp++e
 ZY6Q==
X-Gm-Message-State: AOAM531CWuejZN6nOGNsSsW8Kj6+vC6snyDJs4qjKAtgcTmL4+Nqx1yC
 xKNgowP3rlAnuvsVdPd1O/9niRqUlOT9a3CimFw=
X-Google-Smtp-Source: ABdhPJx0vhTIMA5ITSYJJ7UNmZPzb2lwEoYHxSg9A1Z0cAvYN5MflzYoDldlCk79CRVDHsPiwZ9t1g==
X-Received: by 2002:ac8:7383:: with SMTP id t3mr19902693qtp.242.1613506231455; 
 Tue, 16 Feb 2021 12:10:31 -0800 (PST)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id 16sm13451423qtp.38.2021.02.16.12.10.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 12:10:30 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Date: Tue, 16 Feb 2021 15:09:07 -0500
Message-Id: <20210216200909.19039-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Subject: [Freedreno] [PATCH] drm/msm/a6xx: fix for kernels without
 CONFIG_NVMEM
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
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Jordan Crouse <jcrouse@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>, Eric Anholt <eric@anholt.net>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Ignore nvmem_cell_get() EOPNOTSUPP error in the same way as a ENOENT error,
to fix the case where the kernel was compiled without CONFIG_NVMEM.

Fixes: fe7952c629da ("drm/msm: Add speed-bin support to a618 gpu")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index ba8e9d3cf0fe..7fe5d97606aa 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1356,10 +1356,10 @@ static int a6xx_set_supported_hw(struct device *dev, struct a6xx_gpu *a6xx_gpu,
 
 	cell = nvmem_cell_get(dev, "speed_bin");
 	/*
-	 * -ENOENT means that the platform doesn't support speedbin which is
-	 * fine
+	 * -ENOENT means no speed bin in device tree,
+	 * -EOPNOTSUPP means kernel was built without CONFIG_NVMEM
 	 */
-	if (PTR_ERR(cell) == -ENOENT)
+	if (PTR_ERR(cell) == -ENOENT || PTR_ERR(cell) == -EOPNOTSUPP)
 		return 0;
 	else if (IS_ERR(cell)) {
 		DRM_DEV_ERROR(dev,
-- 
2.26.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
