Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E01FB186FB
	for <lists+freedreno@lfdr.de>; Fri,  1 Aug 2025 20:00:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A993B10E8DB;
	Fri,  1 Aug 2025 18:00:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dzLsOGhn";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1ADC10E313
 for <freedreno@lists.freedesktop.org>; Fri,  1 Aug 2025 18:00:21 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 571HfQYq028595
 for <freedreno@lists.freedesktop.org>; Fri, 1 Aug 2025 18:00:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=JAyYn1wklNQ
 c4y389Esg9VJ4y6TS3xXtsI3mzf8UH2Q=; b=dzLsOGhnul4nZ5I7+cQsdMKEAmV
 gy5K7ViT1KebwdmpHhsypAx1PONroiKyBavoudtKCdQNorSg+gMmGFdpq6cesjML
 fKvxyLVeGv+cA1HYQ9yuw2ssO5F9097RZP276dHkgy+ulIsuQGqP9L6AXqwTbhgx
 Y7ForzOSJnf6lfeY1aTzNP84TvmYbjGXEcfDstVT7uqja8L+fpK5l4xCq/la9GX+
 axyTjm3WGDRuO4H3+ZC23Yh+ocAwpA4vJslTLl25v6TqYwDPuc/dS1zvtpPz2k28
 lRgFBPeTnk1BVFNpEnJSWwnsds5omm1fcBaEeGgEmpkrPrzwjnWs2B/QtsA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484q86d5a0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 01 Aug 2025 18:00:21 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-23824a9bc29so20386435ad.3
 for <freedreno@lists.freedesktop.org>; Fri, 01 Aug 2025 11:00:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754071220; x=1754676020;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JAyYn1wklNQc4y389Esg9VJ4y6TS3xXtsI3mzf8UH2Q=;
 b=JlU0w6MXB57IeX/H+lbVO6pA9gHMbv7SaA4fZ/ROUWhMcy06kETl+GN4SCFSng46VI
 +K8iSoybc+37X8pWKQafkYljI7/e6EZaGNyLltrRjOrRkMzCoixxOoLCsLYbKnbDWZxy
 yQtCZdV3uFEwBK4ep/jslMQaFwZwRMDkbr3GMrzKpb9XqcBp1mxgpMXM1DQSXhdkYrQz
 TdCvNlPPSLmGZSes0I9ftR5rODBBwmoGsFndHBkQRTOPlVCofpYELzwG0JGIqMWUHOtx
 IHVnkc+4+nrAczw5HnLoY4Hn3impJDsF1OGat6lLiU0rpyDziqadVz2SXQpPnUjOIcuT
 wHlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWekrpcyDLucx/zu+CWaGt0VwnuSzpspahsyJfvm3WFSWPOmqIy7k0Pbn1R5W0OZr5AmkAHM+ZaKik=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgoJmyw+wWimtL3wE8DGdLPrqlLSL4c97rQl1WjDqIX8NeAWIl
 MWZFMt8+i4pgokpIrlqU7e0Pzvgc63NuSivR1Zjhssi3oIj+Peelv00LlIpOwZYuPRva6iMlebP
 V53BLSj8BFzRZNr7Ltue0qYnt0jKTESI8FRqF8fjmaWEGPipsYhCd0y36BQTkCj49MKObsXw=
X-Gm-Gg: ASbGncvSm2S7tUZ050rudUXHTOefiHtDW5GZD4+47woyAsbXJThqrsU/4LSVP00ri1O
 rJiWfeKwcLRTY8oEYDNtGUZ22QH+NHNexD96JploW3u1X2sxJKw1alYRW+kZIecOO9FWxZAtmaO
 8Ki+II+HOgR20TgRVbpS9vNzA7WG6gAKXdYL2oWLjXWwj/D3I8ANbYy2N+znRKWXefzv+2vwlB6
 P7E2hQ94XmmNLyPkPLwb+g8crj9L1gzPiYidC3DsfkXpLe16tRe9S5qUxfvKYbjUol4YQHdCoJc
 pU2RtVdGx1jzi/JynJR/YW2x/TbnYgazyEDSWXaOlyywdRc8COY=
X-Received: by 2002:a17:903:110c:b0:235:f078:4746 with SMTP id
 d9443c01a7336-24247030c77mr4913425ad.42.1754071218954; 
 Fri, 01 Aug 2025 11:00:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFq88m/8XtM65tFOPvwPzp0RMN6Lo0LKYxRrxCCtaSzhjaCvj19hJqOoPXnJBjwX5k93B39mA==
X-Received: by 2002:a17:903:110c:b0:235:f078:4746 with SMTP id
 d9443c01a7336-24247030c77mr4912905ad.42.1754071218424; 
 Fri, 01 Aug 2025 11:00:18 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e899b43dsm48563275ad.136.2025.08.01.11.00.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 11:00:17 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Connor Abbott <cwabbott0@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 3/7] drm/msm: Fix order of selector programming in cluster
 snapshot
Date: Fri,  1 Aug 2025 11:00:00 -0700
Message-ID: <20250801180009.345662-4-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250801180009.345662-1-robin.clark@oss.qualcomm.com>
References: <20250801180009.345662-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDE0MSBTYWx0ZWRfX8goZxruez8Ra
 kNlecrgJ9WmFVkThpNH2KS/vL5mHC0PWxcCpVu95dDDIzDkwsNDo75z4ZSC9zQSl8TIK0CjnaYG
 nmhXKysSXMvbBjJlNG8VVD86PkLzL2BGhHpVU+qO9o3T1ydx6bQQtcBTjVwKqdb8SHg2zmM155e
 8nxxRBS1xCAnda61b0vxqzv/f41CeMEgKMQIq8tUDXxtP2aPmEaAeG20PGE2QwNfXUt4VWzxTGL
 M2Nprz/qybeJbjgv/tRYueWjyMoThMWR5rM2dzfrsQ/y3upvHvsorszEyzZgo5In/PNpkMAnC2y
 6SE/6FNsXQ2D9rLXEoPQQI9IU52TMyWK9LvBbmy56BO+c1yBXh6QDWH1fuZN2wZLsckRnKq4W96
 aCA4Smit2FKYylxcdQLC33VpelQVdhDBobDw+wq563F2FW4p7oUZxu7xr89io48BGKf9b+CJ
X-Authority-Analysis: v=2.4 cv=TqLmhCXh c=1 sm=1 tr=0 ts=688d00b5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=EUspDBNiAAAA:8 a=5vtJ6i-I-lkEOiUwjbYA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: vSMx1JSwV0tZOYvqtqw9h3L_PwkGT1yT
X-Proofpoint-GUID: vSMx1JSwV0tZOYvqtqw9h3L_PwkGT1yT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_06,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508010141
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

Program the selector _after_ selecting the aperture.  This aligns with
the downstream driver, and fixes a case where we were failing to capture
ctx0 regs (and presumably what we thought were ctx1 regs were actually
ctx0).

Suggested-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index a35cec606d59..5204b28fd7f9 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -759,15 +759,15 @@ static void a7xx_get_cluster(struct msm_gpu *gpu,
 	size_t datasize;
 	int i, regcount = 0;
 
-	/* Some clusters need a selector register to be programmed too */
-	if (cluster->sel)
-		in += CRASHDUMP_WRITE(in, cluster->sel->cd_reg, cluster->sel->val);
-
 	in += CRASHDUMP_WRITE(in, REG_A7XX_CP_APERTURE_CNTL_CD,
 		A7XX_CP_APERTURE_CNTL_CD_PIPE(cluster->pipe_id) |
 		A7XX_CP_APERTURE_CNTL_CD_CLUSTER(cluster->cluster_id) |
 		A7XX_CP_APERTURE_CNTL_CD_CONTEXT(cluster->context_id));
 
+	/* Some clusters need a selector register to be programmed too */
+	if (cluster->sel)
+		in += CRASHDUMP_WRITE(in, cluster->sel->cd_reg, cluster->sel->val);
+
 	for (i = 0; cluster->regs[i] != UINT_MAX; i += 2) {
 		int count = RANGE(cluster->regs, i);
 
-- 
2.50.1

