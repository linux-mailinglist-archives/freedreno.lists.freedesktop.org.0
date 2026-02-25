Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGxiEeynnmmrWgQAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Wed, 25 Feb 2026 08:42:36 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A153B193A77
	for <lists+freedreno@lfdr.de>; Wed, 25 Feb 2026 08:42:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43BB310E6C4;
	Wed, 25 Feb 2026 07:42:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EPYgKety";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EVr0I95h";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3949710E6C4
 for <freedreno@lists.freedesktop.org>; Wed, 25 Feb 2026 07:42:33 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61P1ocbs3660106
 for <freedreno@lists.freedesktop.org>; Wed, 25 Feb 2026 07:42:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=U+vqTvzL08oUPkG0pMAzCq
 HOh982jZJf7ubG7c1Z69Y=; b=EPYgKetyn525mInCE9ZPJUyzmns/5mZClS2JrU
 evfiJuNT+QjDexyhZ6HAu7+RcUf3YIbKAwOyVK0EQNTJ+pAFfd3Ds5Q7QfSdORF+
 jwOsEMgotIjP/97u/5nbUOiSp4qMmCpGUX/qh6ZTQzYJ3nJPmspYj/ihVMoqI+Ln
 kd3l/AsOx5ynFNRzNyWwnjiTIHP9Gs7QhO1gie4qYgwQkto5K1LxKzy9FKIdlRNX
 PMtV0pxvB5lzDcs5IsDnGoNJqB9EV31gmP7RZ6FPs2oUZwwmnB7Y+iLg6zCIMffe
 yDwL3zH6ul6apVLtepUOTo1n8FoDzlyPt41YadHC//W9/1tg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chg1saccb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 25 Feb 2026 07:42:32 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-358e79b4ca6so1299388a91.1
 for <freedreno@lists.freedesktop.org>; Tue, 24 Feb 2026 23:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772005352; x=1772610152;
 darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=U+vqTvzL08oUPkG0pMAzCqHOh982jZJf7ubG7c1Z69Y=;
 b=EVr0I95hoLjFP3FBuqs6af8dle1MUcLUJ3ZQqsxilMDY0bu5FjT1SRFOiIa78GWh5/
 9pB93tu/NJENOzm0O87iDxjodlIUC9G4pOGHP9FqKEcicuhDVur3kQc07i4g0h9wuW4h
 l3apaFdpT5meRUsTDvBELQB2ogPZ9YLgfIz2ok1THBvHAHcYdJ8h5lmbY2hBOmvyRbo5
 RNZ5YiUdZF5+1Xp73unnON956cqer2nrH4tzI52udng5TqP81ONPwUE5Uf724DWIK/Im
 B5v3/m2iJmLH4DG55koQSFE1F8iWv6leC+codUX4M0no6oSgBkbOND4yNiHuWhKDl4sZ
 U7sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772005352; x=1772610152;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U+vqTvzL08oUPkG0pMAzCqHOh982jZJf7ubG7c1Z69Y=;
 b=LUbS0rvooQbSHX+zyXfGdgffEobiTt29Gg0MfD9WhkGvo2HG5f/SpOCF5A2KWqNqGp
 a5tNhWNVInrU0/Z4rN3H6jBrlhjoSU3Jgod/7eTApjE4zOTBMrL0JyDGYrzXllkCpIGU
 owZfF4Ps9LV4G5JmpQIMnzq6svae5/uhjAPGdMX/VKRwxgFv3vZ5MB4jAJQhEAhAalp7
 7MCYv7ybW+T7+4gnfWAL/lO1gWljrO2hNt0TMuoDXEHCAg4Sb+ENCoAt7UDgETK0BQcW
 usNKVms8noVIH53XCuUEil9DOZgAPu4mmUj6PJ6QLUta5HOGkPiih2HK19nO0L122k1Q
 Xs9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVv5t0eeje7FD0b7xNlm5oAtVrLalRGr5cQ2O7mWoH/dup/IR/apEmLNoCwLEw8/W4k1aMgfRPSho8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx148kksxyr9nz4RtRaQ2er8tMzT61Nj0pg7eFPZzNeDwcxx85Y
 RQw6MONNVCpMv4G8cxPAEWq/0J5XxdyMgEKaIGTqTUy5Iy7/SFRbxkLneNr9DTA6BJrI3xHmd+j
 5pdhc2g2YHXS0PqYJjQq4QZ2dIlrVfQlg7z7yicsx0s6WJbfuU/xc9TgZD/+M/JhXe/+NTDg=
X-Gm-Gg: ATEYQzypaIIsIABRv9CqnZkxg3pek6KG0xXdwEoridp3fcPoeTmNmVt/xbKtHGOwFAm
 uzYlMHQ3mBRb6SHHuk4yjZIvs9nyNq3nYQr+nirgvn3wOtj/Kvig2qijh02eNp8HAqhntKJ3g28
 GFywO52ncCyfInXMU/pXxNA0QsjZZUKeOpZcchJiCxP0vWmROZNszFR3OWu3/GMWCLl5BtsIvW0
 kigQYwQUoXqIriD81lOqL4QNVQUNBx7th71RBeleWOPfAF4An9NvnpHK+rIiA//n3XMOLBXiRLe
 q8gQfY55nT5rT6EMxjCcY//TJNDQT0oNNDacfZzlGYVSTnAxdSbcyY0fmXNtXaifDTuUda5dVOm
 el1oyzB9yjR/NoEb+EakELTUnGQT5qUGG0B+PHwBlANLpKA==
X-Received: by 2002:a17:90b:5185:b0:340:b912:536 with SMTP id
 98e67ed59e1d1-3590f1f3c09mr1234207a91.31.1772005351812; 
 Tue, 24 Feb 2026 23:42:31 -0800 (PST)
X-Received: by 2002:a17:90b:5185:b0:340:b912:536 with SMTP id
 98e67ed59e1d1-3590f1f3c09mr1234196a91.31.1772005351377; 
 Tue, 24 Feb 2026 23:42:31 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3590158f91esm1927304a91.4.2026.02.24.23.42.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Feb 2026 23:42:31 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 13:11:57 +0530
Subject: [PATCH] drm/msm/a6xx: Fix the bogus protect error on X2-85
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-glymur-protect-fix-v1-1-0deddedf9277@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMSnnmkC/yWMQQ6CMBBFr0Jm7URoggpXMSzaMuAkluK0GA3h7
 k7s4i/eT97bIZEwJeirHYTenDguCs2pAv+wy0zIozKY2lxqY1qcn9+wCa4SM/mME3+wa9zNXX1
 L3WRBxVVI73/0PhQWem3azuUEZxOhjyFw7qtRAoYUzjos3nAcP4xza5mZAAAA
X-Change-ID: 20260225-glymur-protect-fix-91b8b7c5e9fa
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772005346; l=1838;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=J3GZ7dzqZ1AcdI0/dHMdYTU0hkgLk6CGn3qfq3mlT6I=;
 b=PoyQmorEsIc22SUrz1GbWovaZ8y+5pprIsoIsAOY0gtLA/IuQ9aPpSNQI0mWdYtRLMRHUDPFA
 Ujpy3kmfDWXDS0pf8lGrPQi018H7SvZOTgGGpnf/Vbed399bpyws9Ip
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=ZKvaWH7b c=1 sm=1 tr=0 ts=699ea7e8 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=kDI2okBShA6p0kcQ2G4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: r86Do4sOeqALAIYvRBOofTsi8Wintum3
X-Proofpoint-ORIG-GUID: r86Do4sOeqALAIYvRBOofTsi8Wintum3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDA3NCBTYWx0ZWRfX3Fpgeo8f3aO5
 6kj6qCgiqhBTEzMCPCRHuX6aX2QyHIUB117pBLX/IGgOAh0tRswxBE5Es+l8+bFo17ufbh+HBn2
 6OHR/XIdRgPFgD2kGTHE4CKdDDy6Zq9McjfyM4Mf3iR0JU1+ThHY/WAFKJkgvzkY/yHQDjzzX3+
 Ww++W0IRr+Hvqka/B4G9n6Wtmxj2LPZYd2VqmyEs5Fdt5V+s29BTLUJkIEeAwlSLaQvpGElac8B
 7p3kmlwFOm+xEldWN9O5YkMRR6arg9QDG9PQ19S16y7KaUKpAaloYFJfhdSC3U/+34OBDMRqYHT
 dJdNd1NwCT8p7HyfoV5Ri+Iu6eFHTqn4pECYW+aHEbO5CGUBGubUcgxek/w1/LbQTid/WCR6KfP
 EGkgxXhkQ/fhqptvCWG/N/CGhEAHHuOcxZ8iN9+os9Fbjf7xMWeanqp7bvQhYz2W2eACHNPwQ6+
 xSvVfyMOfLlnl/p/kZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250074
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
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:akhilpo@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: A153B193A77
X-Rspamd-Action: no action

Update the X2-85 gpu's register protect count configuration with the
correct count_max value to avoid blocking the entire MMIO region from the
UMD.

Protect configurations are a bit complicated on A8xx. There are 2 set of
protect registers with different counts: Global and Pipe-specific. The
last-span-unbound feature is available only on the Pipe-specific protect
registers. Due to this, we cannot use the BUILD_BUG sanity check for A8x
protect configurations, so remove the A840 entry from there.

Fixes: 01ff3bf27215 ("drm/msm/a8xx: Add support for Adreno X2-85 GPU")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 550a53a7865e..38561f26837e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1759,7 +1759,7 @@ static const u32 x285_protect_regs[] = {
 	A6XX_PROTECT_NORDWR(0x27c06, 0x0000),
 };
 
-DECLARE_ADRENO_PROTECT(x285_protect, 64);
+DECLARE_ADRENO_PROTECT(x285_protect, 15);
 
 static const struct adreno_reglist_pipe a840_nonctxt_regs[] = {
 	{ REG_A8XX_CP_SMMU_STREAM_ID_LPAC, 0x00000101, BIT(PIPE_NONE) },
@@ -1966,5 +1966,4 @@ static inline __always_unused void __build_asserts(void)
 	BUILD_BUG_ON(a660_protect.count > a660_protect.count_max);
 	BUILD_BUG_ON(a690_protect.count > a690_protect.count_max);
 	BUILD_BUG_ON(a730_protect.count > a730_protect.count_max);
-	BUILD_BUG_ON(a840_protect.count > a840_protect.count_max);
 }

---
base-commit: ac47870fd795549f03d57e0879fc730c79119f4b
change-id: 20260225-glymur-protect-fix-91b8b7c5e9fa

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>

