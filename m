Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A3599A175
	for <lists+freedreno@lfdr.de>; Fri, 11 Oct 2024 12:34:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A372D10EAB3;
	Fri, 11 Oct 2024 10:34:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b="IlK9r8S9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 258DC10EA32
 for <freedreno@lists.freedesktop.org>; Fri, 11 Oct 2024 05:24:26 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id
 98e67ed59e1d1-2e18856feb4so1575410a91.3
 for <freedreno@lists.freedesktop.org>; Thu, 10 Oct 2024 22:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=everestkc-com-np.20230601.gappssmtp.com; s=20230601; t=1728624265;
 x=1729229065; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2BGOKIsMg4QP3m6tKk3FDK1aa5VlkpqPKb0X90CWsAo=;
 b=IlK9r8S9bHevutppcYHoJpv5PC4DCtRFoq1uodK4MhZRm29Dfs3Emv23nigAh+jQis
 e8eww7393ob4f1yHNcFHTDJ7eDh9sS30GMtMUYK7XoKwdqbieOTOJECJckZtVnmz9/lL
 N4yPj2ueVCBYdSxVRubxeyAHCxq0IrAyY20t436u2MlSgQfPIKRH2sXF2HZW3O4X6jQK
 fgLjDJMZfn1I5ipS9LQpPYtCnjmingkLB+erVP7G7bKLrjFBXeDkBx5yp7Oz1qvHBicz
 xTNLkLRAaIBMrBsSzAH4uxdXePgabaYxvbmbcRui8ntYLTx2Q7qqc97s5b0iMPJr6Z0z
 IL1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728624265; x=1729229065;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2BGOKIsMg4QP3m6tKk3FDK1aa5VlkpqPKb0X90CWsAo=;
 b=ZVwMgfR6bGn6k1tW3JGXRIdb9tMzPJTAY7GfZgRu6p6cECmhEpqS+5Ao5FLubnY5yq
 zPTc71MQyJv7D08vWLkHvVpGlqA3weLQO8UjupB56JWSHG+VtgDsSoSOFDWpFVQjyNXQ
 cIbtWPV9fu/Jj4VcMnP4ZY+Z8w7/ZDmj+jx5Kh7XffcCg3Uo4ArgsRR4fk/dRn3oAbSC
 PywfsuRoEXexaHa4U2eX0OEEmJVPwL+06eopCCmWXITkYQ1hZjrzMtIRlDdCCLZj5XIG
 VKthuponydP8Nblgx1bBha2Vf7N90Y7lKtHF60hVDsmdS//CVwB1OZ7hDpc02IDkZHKW
 acPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWh5txQtUg2u4LiON/bvzn92xe7NH4i/R7+V8RCdcJzKJU7u2B2VlCCbYGnhMAl4jKAqNWcd0Eou4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6iji6fSmipKpdXUC/r4gmd0JlHwlnUilSuS38P9KAb+EGnNEk
 N4WvMLaTtJT19okR/KZdopfvXNIHUNIaIm4nw/ZTD9rhf42lAhx50JSRC5qooEU=
X-Google-Smtp-Source: AGHT+IH//kLRhYfrjYGsfIlcKbHS3xoQNKhRAMnMq31mnsU+jdE6aFHUT5rih9UTGv4Vs6virTNbVA==
X-Received: by 2002:a17:90b:3844:b0:2e2:8472:c350 with SMTP id
 98e67ed59e1d1-2e2f0ad156dmr2213900a91.17.1728624265466; 
 Thu, 10 Oct 2024 22:24:25 -0700 (PDT)
Received: from localhost.localdomain ([91.196.220.222])
 by smtp.googlemail.com with ESMTPSA id
 98e67ed59e1d1-2e2d5df1133sm2380070a91.15.2024.10.10.22.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2024 22:24:24 -0700 (PDT)
From: "Everest K.C." <everestkc@everestkc.com.np>
To: robdclark@gmail.com, sean@poorly.run, konradybcio@kernel.org,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org,
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch
Cc: "Everest K.C." <everestkc@everestkc.com.np>, skhan@linuxfoundation.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/msm/a6xx: Remove logically deadcode in
 a6xx_preempt.c
Date: Thu, 10 Oct 2024 23:23:14 -0600
Message-ID: <20241011052315.4713-1-everestkc@everestkc.com.np>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 11 Oct 2024 10:34:32 +0000
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

The ternary operator never returns -1 as `ring` will never be NULL.
Thus, the ternary operator is not needed.
Fix this by removing the ternary operation and only including the
value it will return when the `ring` is not NULL.

This was reported by Coverity Scan.
https://scan7.scan.coverity.com/#/project-view/51525/11354?selectedIssue=1600286

Fixes: 35d36dc1692f ("drm/msm/a6xx: Add traces for preemption")
Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
---
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
index 6803d5af60cc..2fd4e39f618f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.c
@@ -297,8 +297,7 @@ void a6xx_preempt_trigger(struct msm_gpu *gpu)
 	 */
 	ring->restore_wptr = false;
 
-	trace_msm_gpu_preemption_trigger(a6xx_gpu->cur_ring->id,
-		ring ? ring->id : -1);
+	trace_msm_gpu_preemption_trigger(a6xx_gpu->cur_ring->id, ring->id);
 
 	spin_unlock_irqrestore(&ring->preempt_lock, flags);
 
-- 
2.43.0

