Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3367D9CE23B
	for <lists+freedreno@lfdr.de>; Fri, 15 Nov 2024 15:50:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C4DE10E874;
	Fri, 15 Nov 2024 14:50:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fe05SzGI";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1C8D10E876
 for <freedreno@lists.freedesktop.org>; Fri, 15 Nov 2024 14:50:14 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-43152b79d25so6529565e9.1
 for <freedreno@lists.freedesktop.org>; Fri, 15 Nov 2024 06:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731682213; x=1732287013; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I3InoUXqD6T6uxxkojh3IT3+QQg3Pub9UoRpvavO2qI=;
 b=fe05SzGIycb8ZBKuKehUpkM+sllVBIj2afNFeZHEqByYl9aBspsUncQDMg35a4Dnkz
 o4E50C3WqqSFUmbDiHIjdsIggjS9h3/WRHohhEbmd55pp6adtGo8jsS/G3mQU6FnhIfi
 dd9k47MS/fbR2WG1OTBqEWD54I3MnOiO9VL0obSAoZzRRRlfHeNA5KwXGgxABa7sp2c5
 RGFa9iWuC9ZOqOiiB1nq0ZHt0KHPl3ahmcbljJb3UWCDE8jharVTxvLifN8YAKB719Wm
 /veoBGbQeFCTlX8rR10uXXFwmz1Z4UnGlFeGHI1BZ73n4MIgapGYFWZE9aUZHLe91iLW
 Gojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731682213; x=1732287013;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I3InoUXqD6T6uxxkojh3IT3+QQg3Pub9UoRpvavO2qI=;
 b=sRfiL1l6/T16U4sni42qgDiYkVQ7CbzyYPCLt4VSYDiM93yv3v95BrchPFSS6X49UM
 /vQdA2CR8tJANfCu8IWWyYyaSwaAczTpmF4ek1+vYcDGQIUdwm5MKFNTaTwfwjh4wbIj
 IpDmAgZCMCPtCY6JhAqBEWFbftux+73qVkJ82R5ysRk1CJSfNRawPFbwP3Kumtpiukkm
 4ogA3Er+12VBigd5q1o9XFSsV/gCcXTtc5G22///8mg1ltHyjxO7i0GQmJr7Gpx9e9oz
 OCdfO2gGBu9lLcS/OCmat24cfwdFap3pOoWKzAgLEEHvw1FjA8qI2ZGXpXF+lNqRPgeb
 QVnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMyVSRt8mzTQxkTUM+y1xL47p774obWpKlgcRcCfdvbb1G130T/gA1+Dztc9x3IzxNie2Qx0xOp08=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyxqE9f4UjQL7cP4PTAxxem+TvFRrj8jwx8LnpgV3poisXoNq5t
 pezVBUYliDjB1/bJ7OfXI186gw2f/jSNPAypTDxxYWBYjBBie8VgkR1RFybkX4M=
X-Google-Smtp-Source: AGHT+IELTncAcPS4YEQroY4QuEM9WQoaNiEMcLaa5qSj7F8nR5Z0m/BEZVxNXK2sXlfnW7v/XbGFkg==
X-Received: by 2002:a05:600c:1548:b0:431:6060:8b16 with SMTP id
 5b1f17b1804b1-432df792d1fmr27540505e9.30.1731682212985; 
 Fri, 15 Nov 2024 06:50:12 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432da27ffafsm59247175e9.22.2024.11.15.06.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 06:50:12 -0800 (PST)
Date: Fri, 15 Nov 2024 17:50:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/msm/gem: prevent integer overflow in
 msm_ioctl_gem_submit()
Message-ID: <7c1e6300-8eb3-4d10-8ec5-51df5d9149a0@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

The "submit->cmd[i].size" and "submit->cmd[i].offset" variables are u32
values that come from the user via the submit_lookup_cmds() function.
This addition could lead to an integer wrapping bug so use size_add()
to prevent that.

Fixes: 198725337ef1 ("drm/msm: fix cmdstream size check")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index fba78193127d..f775638d239a 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -787,8 +787,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 			goto out;
 
 		if (!submit->cmd[i].size ||
-			((submit->cmd[i].size + submit->cmd[i].offset) >
-				obj->size / 4)) {
+		    (size_add(submit->cmd[i].size, submit->cmd[i].offset) > obj->size / 4)) {
 			SUBMIT_ERROR(submit, "invalid cmdstream size: %u\n", submit->cmd[i].size * 4);
 			ret = -EINVAL;
 			goto out;
-- 
2.45.2

