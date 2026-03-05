Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHwQGsfJqWkAFAEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Thu, 05 Mar 2026 19:21:59 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4A0216F04
	for <lists+freedreno@lfdr.de>; Thu, 05 Mar 2026 19:21:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 449AD10E2D8;
	Thu,  5 Mar 2026 18:21:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TcpQIZGQ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KLK2io2C";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F134710E2D3
 for <freedreno@lists.freedesktop.org>; Thu,  5 Mar 2026 18:21:54 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 625AFoWQ456076
 for <freedreno@lists.freedesktop.org>; Thu, 5 Mar 2026 18:21:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=kzn/Z5bw8Ia071qhOd3mvT
 Rpo1/fZve5V3cUsd4M82k=; b=TcpQIZGQFaSUPDl3+IedSaeMSqdcfbKVf+30Lo
 YDS4btWhTW56WlQVFcRVkRr2jzH41PcLFmpv/5ZUElydSQBCx/QQMmmbfnI1aeXh
 wN1Q34IrBgz6dEkddJVwrzzfJqxzlcepViFVjZF0l9pjkK7GdGAg4LoREpSWTjTJ
 TCj6ETZfV1SODyPQnzFL6oCkR60UgXjYQkT43ZZ82wlYug9ImdV9l44dajXAWj79
 rEOKrbKm6g9ZBr0BNnYo06Rni9eo/fQ+oWMhjF9PH7AufaTIfCqoB/JjWZtFIipR
 XWZowoG2tFkA6dhIf0/rkenbraa415sZiZGzpu/NywPdBJ7g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0wmdxf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 05 Mar 2026 18:21:54 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2adc527eaf5so46501855ad.0
 for <freedreno@lists.freedesktop.org>; Thu, 05 Mar 2026 10:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772734913; x=1773339713;
 darn=lists.freedesktop.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kzn/Z5bw8Ia071qhOd3mvTRpo1/fZve5V3cUsd4M82k=;
 b=KLK2io2CP53Tgi7bMhCJI0iO0nQ0rKNqLyxR4vkyyxt5LFbFmf4n1d7Qio6+iq5pon
 A005KdbzcH6crcfTLea+qNIMgtHzaY07LzdYbEtRaObEF7HnEg7kwwDaaSzjlaFc31qM
 Lh8HSVGo2G3H9QqWI/tUG5udhJc5f2OMQfcrHp+DC7qXwyEwA5Lfo3thkvTv/qLz3CsS
 8N4qfyc7KnFDTMx+PaPEjOkUZqzkwT4Lr+OqyCRiIdKPBANAzXa9BqNrS8pBedFzh8eV
 zratJsSd0r6h9jVUmYBgOkn7M6uQ4/W74CgG5Mxo+05YIxx9kqWGLCgigSkfTQ5/LKLD
 54DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772734913; x=1773339713;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kzn/Z5bw8Ia071qhOd3mvTRpo1/fZve5V3cUsd4M82k=;
 b=EAdLBrdehdkzvC8VF/GoqJ6k2VWohF1fsUZyDm/k+642bd8/Bwzr5zuBK2PT5IO9cX
 D5wBCCtb8De+QDNEngLK5LCA7VEkyvB0y+Bm29V/NJOfszMrZk+wIHjlLehyktQj5ANj
 +MCjrdErIwtYuBFKGM5yB4c48WiRhHBnvp+78Os/J79R9sXLXetEePwVgekCM/Q0DFV4
 6nU3toeywvqBZ7uG+RjNB/PVr7oO9hH2ylb5wrSfrVvAzhBMKkhuBaD2aZRFPV2RXL9f
 Fg5lqOIQsmk0AIwIZf3EdTrVJtF2hXUyDCGdlLHTylzkAhAjOkyO6F7bBopvU1Yw20yo
 3M6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEY+nr9QfhfJ3c6L8meC+AlfS/nUboqmS3BklxOn5pmZi7+d3HON6LW4Y1E5RX7LkyAYbX9owuiNQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxB5WVmg8MpBju0XPGEajEi0A1c0J6e2/n//oyJy3Il6/MyeQ1+
 kMlkJvYJ2PoFutC1Tgh+kn1tWxbX8lp5Xg8lGBiHnG/0OGO+7uSuoqP5uYAS+6/J0NsFifCFr8Z
 hx1A6hDX35TBC8Vxolzjx4mHyJp2ZqL16xl0YDdYRwyVPTVv/g0TXgAZpM6sLtiCFLG6TVhM=
X-Gm-Gg: ATEYQzw3gmm/r4SUA5A/a7Vti6dsqy4pZCGVyNDxHr0kCkfxAr5KRyEDeCPCojdKvu+
 hBgItLHv2t7UQpP3yq9ejalpVKAroNGpnj/2UHwruOHcHmiy7QtjWuD5liWMyoMg02suRHcDE0c
 8xIyfoFITpcES1Z8OtjxIgGiFjNMBuwz9Le2DLba26lr75LUZDA8wg0VtsQTd8qmBk8pLu9lfpe
 +aTorvjlfXgsZNyv79bhqK7DMZyIb5IK7aVdjO2ZUTbFdfUJrU23GmUXH4K9USrCVHluwGKKcVZ
 j6tDP3+vpx0kvvJD4zLs2bh2bLHeKwqFME+aOn1WIPzJ9LMFAm5bHy40v+8KMaWKZ3ySDX+oJQv
 Sl5f9rWs8+qfXmChj/WB8aqfemY3JLIjq4eLm8daOW8twJA==
X-Received: by 2002:a17:903:3846:b0:2ae:5275:4d52 with SMTP id
 d9443c01a7336-2ae80292b1amr5866315ad.53.1772734912829; 
 Thu, 05 Mar 2026 10:21:52 -0800 (PST)
X-Received: by 2002:a17:903:3846:b0:2ae:5275:4d52 with SMTP id
 d9443c01a7336-2ae80292b1amr5866075ad.53.1772734912343; 
 Thu, 05 Mar 2026 10:21:52 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2adfb5c183bsm238554615ad.24.2026.03.05.10.21.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 10:21:51 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 23:51:16 +0530
Subject: [PATCH] drm/msm/a8xx: Fix ubwc config related to swizzling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-a8xx-ubwc-fix-v1-1-d99b6da4c5a9@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJvJqWkC/yWMSw7CMAwFrxJ5jUUI4qNeBXXhJC54kRaStkSqe
 ncssniLedLMBoWzcIHObJB5lSLTqHA6GAgvGp+MEpXBWXe1Z3tButeKi/8GHKQi3TiSi4O3jkC
 dd2a9/71H3zjzZ9Hs3E7wVBjDlJLMnYk5YSrpqMPm9fv+A99qQGKUAAAA
X-Change-ID: 20260305-a8xx-ubwc-fix-a7eda2dfb02a
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772734907; l=1645;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=t10gycm7XN6yp836FuswCQpUYixNfUW82DsaMspLZuM=;
 b=wP9Gmp7/cuBD9ZtEtl7gNjgUsY4RTnj0lBI/zX7KxJHHjUHQXjxTpoQzJDaAOkHT+/9yR7DZB
 6Vru41JFGJlCg1+Pvw1LU4jkTmufP2U2zkp2gY7QkrTX0+L1Ej+9m0K
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: WI-hQI0mQNB-Yob_cU_CpvIL-rUeky7P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE1MSBTYWx0ZWRfX4HZx4Uk7ott8
 R/e1yTniu87Qv4VhDcgkax5PDtqbBIQw19Z8qqEyTolqtmnz5OVidzoXqC4aw3bsUc+aQ2wYdVs
 TVwV5NWvUrLuRvkvsnoya4CB3V78mXibe7HiTfJwdn/dk3CTFIdi5fIiHTKEqojwSC1qeR1btlO
 8IDxzrfGAuG+xm+ldrauQtbbWqJD9jj/tKHxwT10T1GXAhk6GgbwEwQiQ6Y1cVte7jVR90quuKb
 xQz/GxKU3SCPTd5EqdeDzwT8X9CDURCAAJlXRciSzdzWXAyYbrt6CFOMrdGGflM2IflfZ+cklAt
 wLnSQbLO4XCIjTP/8q2QxMC3PpG8DJNICtjj0vUre8RqWFz28HuG5Mf74beeC8ZbrfmHSeocCpw
 d2s1ERAehw2zIkMJ8+faY8G4BTUpTu0j1DxMoIk03zgSTfGEiOUZP4+QxmINf6f+KtMevkSEcHO
 kA6g+1Ce1/7ZcaGbRTQ==
X-Authority-Analysis: v=2.4 cv=OYWVzxTY c=1 sm=1 tr=0 ts=69a9c9c2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=gtd1DNuhXpllK-bHf4IA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: WI-hQI0mQNB-Yob_cU_CpvIL-rUeky7P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_05,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050151
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
X-Rspamd-Queue-Id: BB4A0216F04
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
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
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
X-Rspamd-Action: no action

To disable l2/l3 swizzling in A8x, set the respective bits in both
GRAS_NC_MODE_CNTL and RB_CCU_NC_MODE_CNTL registers. This is required
for Glymur where it is recommended to keep l2/l3 swizzling disabled.

Fixes: 288a93200892 ("drm/msm/adreno: Introduce A8x GPU Support")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 5a320f5bde41..b1887e0cf698 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -310,11 +310,21 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 	hbb = cfg->highest_bank_bit - 13;
 	hbb_hi = hbb >> 2;
 	hbb_lo = hbb & 3;
-	a8xx_write_pipe(gpu, PIPE_BV, REG_A8XX_GRAS_NC_MODE_CNTL, hbb << 5);
-	a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_GRAS_NC_MODE_CNTL, hbb << 5);
+
+	a8xx_write_pipe(gpu, PIPE_BV, REG_A8XX_GRAS_NC_MODE_CNTL,
+			hbb << 5 |
+			level3_swizzling_dis << 4 |
+			level2_swizzling_dis << 3);
+
+	a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_GRAS_NC_MODE_CNTL,
+			hbb << 5 |
+			level3_swizzling_dis << 4 |
+			level2_swizzling_dis << 3);
 
 	a8xx_write_pipe(gpu, PIPE_BR, REG_A8XX_RB_CCU_NC_MODE_CNTL,
 			yuvnotcomptofc << 6 |
+			level3_swizzling_dis << 5 |
+			level2_swizzling_dis << 4 |
 			hbb_hi << 3 |
 			hbb_lo << 1);
 

---
base-commit: ac47870fd795549f03d57e0879fc730c79119f4b
change-id: 20260305-a8xx-ubwc-fix-a7eda2dfb02a

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>

