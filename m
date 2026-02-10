Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPn4OdeAjGl9pwAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Wed, 11 Feb 2026 14:15:03 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38837124AF1
	for <lists+freedreno@lfdr.de>; Wed, 11 Feb 2026 14:15:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2B8110E02A;
	Wed, 11 Feb 2026 13:15:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gCL7ki9e";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CDB910E010
 for <freedreno@lists.freedesktop.org>; Tue, 10 Feb 2026 08:36:04 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-4376bd50b01so224261f8f.3
 for <freedreno@lists.freedesktop.org>; Tue, 10 Feb 2026 00:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770712563; x=1771317363; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=p6XI8q1fFGx5WhbwxSZeL59bQVB27jLicC8f3KiU06c=;
 b=gCL7ki9eIHrze0YsCLBeKAH8ULwMOTRSMqJnLc4dD1RgJX0W5V3ez615vlcODwcAyR
 uTu493QA4di9FFuNfUwkBsxoecsLl1w1kZ1Y1oImQxpvvovW0dofS5/pmhMnIO0FUjgt
 /p5EyfLnlGGG4gKarNWBvBKHMHetpoamT0l83ibCXFPeUpo+vUIfh46Dc9SRo24h3gwR
 wjaPG6scGEAvBn/mdGvPCW3pofVYPESQunFTvs0wYcYIqlOO6hWc61yYWaCKOtliUnVI
 uEBF+DCJX75o/aQj4noVSa2UvSjUVIjB6yuUYGLbw3Xd3+a3g1cw1B7hsFfrCGUy2K+9
 UWaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770712563; x=1771317363;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p6XI8q1fFGx5WhbwxSZeL59bQVB27jLicC8f3KiU06c=;
 b=WTAvP6+LPxDu+hJd8F/hFhpP63ZYjIFNsne/dYL/z7nCa3UgsyQVo1/5GU8srxuSVr
 iEWSdNIOxZPwUt3G30f4S17FGGuQrhPYX6MC/3p1IC+DIGRLpy2YainBU1L7lHdt0yRX
 fcPznewqC7noDaEWWUwK1lXKnkv4TzcNAZ15ysxIhqpEtQVoHQnfAje1bsLT0ZnyE7Uq
 iRCA3/19UfEtk1jXh/zdFzxEw2zN378qzkeqFOBGrPCzhIqPpH8P7BRyY67E/K9xeV7L
 S8XTe1Jhes67CiZ8vbpQfllotY80z115ZRzON7/ejRX9uYqRvNWqy20ark5C4kaQqB2Y
 9rMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsppLqAYEvpGBwgJsdx1hQNQvKiyAVL4BI3UbMnF3IgnsQv0DtxSxmbhko86l/upg6XV5WeZWsvyc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbmQlb2p/6v9GDqrAOj5thAzrTEghyGLc/3AyEN54SnVfP2do5
 GeE+cxycr0eDgmwRwBn14ZCX9JcpR0MJ7ECMFYgU0lzqtfQlQZSGxEw4
X-Gm-Gg: AZuq6aK1qqlPjjYilghFw6wmdT4Qbksq2gVInBYiM8/eCLcPclBhqx1CscZ4Xx3qs16
 GE+vtnA2hKG5sO6ixXiZV7teDjRaFZD1vn6O1el1xSlsbxkUG5FKhfsrOG379sEEzrNgLYAQ0Xw
 N11De4CpkYGoEsdsNcvjeypSMmbDxognKksJYoNOcsyksM6zroUcjV8NirevYZB0JRfzPqo36ih
 ItbXCENPI6kFLYPyByonTA4sRty0KItiMxCqZMaWCQk3o4gqy2CoF2QCmrqr3FPiu+iPoqIgjkx
 tzq66/g0vUJcch9+UoIzKIWszuYFrzBaDhD2rvGmJLES4xzrEx/vzJmTnnxYd6rtnMid17WkQOE
 fq9LAB1oiqjGlQKKrcHUYH95M9tbvQe4F7n9XA8TsxZSbvwJ63X+DACSYucYP/z5QyHZAHQGvRN
 j7VtmOhZ9RhJEvuwqxUntYZqkBXKnC0V1Jf9YKz7DgV3wldzVSPKxApE4/U7B21aKDzRyxdil2Q
 B7aaQxlcMvRVILfnmA=
X-Received: by 2002:a05:600c:4f43:b0:477:a977:b8a0 with SMTP id
 5b1f17b1804b1-483519c9dafmr7521405e9.3.1770712562678; 
 Tue, 10 Feb 2026 00:36:02 -0800 (PST)
Received: from thomas-precision3591..
 (cust-east-par-46-193-67-14.cust.wifirst.net. [46.193.67.14])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-4834d5d8ebfsm71911485e9.2.2026.02.10.00.36.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Feb 2026 00:36:02 -0800 (PST)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>, stable@vger.kernel.org,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] accel/qaic: Fix dma_free_attrs() buffer size
Date: Tue, 10 Feb 2026 09:35:27 +0100
Message-ID: <20260210083529.22059-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 11 Feb 2026 13:15:00 +0000
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
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[28];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:fourier.thomas@gmail.com,m:stable@vger.kernel.org,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jonathan@marek.ca,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:fourierthomas@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[fourierthomas@gmail.com,freedreno-bounces@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fourierthomas@gmail.com,freedreno-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[freedreno];
	MID_RHS_MATCH_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,somainline.org,ffwll.ch,marek.ca,lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 38837124AF1
X-Rspamd-Action: no action

The gpummu->table buffer is alloc'd with size TABLE_SIZE + 32 in
a2xx_gpummu_new() but freed with size TABLE_SIZE in
a2xx_gpummu_destroy().

Change the free size to match the allocation.

Fixes: c2052a4e5c99 ("drm/msm: implement a2xx mmu")
Cc: <stable@vger.kernel.org>
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a2xx_gpummu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c
index 0407c9bc8c1b..4467b04527cd 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c
@@ -78,7 +78,7 @@ static void a2xx_gpummu_destroy(struct msm_mmu *mmu)
 {
 	struct a2xx_gpummu *gpummu = to_a2xx_gpummu(mmu);
 
-	dma_free_attrs(mmu->dev, TABLE_SIZE, gpummu->table, gpummu->pt_base,
+	dma_free_attrs(mmu->dev, TABLE_SIZE + 32, gpummu->table, gpummu->pt_base,
 		DMA_ATTR_FORCE_CONTIGUOUS);
 
 	kfree(gpummu);
-- 
2.43.0

