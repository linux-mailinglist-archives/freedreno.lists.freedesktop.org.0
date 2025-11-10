Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D73F4C48004
	for <lists+freedreno@lfdr.de>; Mon, 10 Nov 2025 17:38:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71F1710E2D6;
	Mon, 10 Nov 2025 16:38:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FylzTH7q";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PulHJ158";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F88810E2D5
 for <freedreno@lists.freedesktop.org>; Mon, 10 Nov 2025 16:38:17 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AAFQ0gB4071297
 for <freedreno@lists.freedesktop.org>; Mon, 10 Nov 2025 16:38:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 mcdYC2GUWX3Yt8G/A+qwsr5JfoxF8rsQMfbirKGchD8=; b=FylzTH7qXckURdUD
 OLX83HGhHgJ+Q9hrI7XQQPI62RDSKKMBhh0bziVThWbjjxWf5o05jdu1XEuAvH8e
 y2wjqPz9YWG1klmm6PcsEK+dGJf1TE1OFvEQ5q6vtg4vTtft9dNnvAYFpwAGqYtI
 5cMkGqXJG1ErKfP5JM7siZHbbmnWs/YWf5DSJ0zsNpgkSHyyNeWJZlJCu9fSBCTi
 h22vLn4WnQF6xiaI8+hwlP4O/MMi5QIvHss41z8H5CVHvL/9YdB88qbjl7VH5R9z
 +pplPbbGPpUqPwS7snab8AalsHi+UjuVhJcr9kzTwD78uwY5lHZ24hYcBCC7LlYH
 BaYOPA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abjpgr8u4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 10 Nov 2025 16:38:17 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-3418ad76023so8108476a91.0
 for <freedreno@lists.freedesktop.org>; Mon, 10 Nov 2025 08:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762792696; x=1763397496;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mcdYC2GUWX3Yt8G/A+qwsr5JfoxF8rsQMfbirKGchD8=;
 b=PulHJ158EBMGTUBpKNfmgFwdp5JHO1Tk6lKJ4LRQZHjba8kcmc5zWiHRkMMYmf44ye
 QMYEiO/w+ZKAZBMb6pSGdrnE1L+43hMgL29XVLKobn/nz/ePu8N0AjPIBxyVSF8+TwOt
 /QXPTdlslh6T/BM5SgwrCLdI6psRFKaOtoBVESyV6O18R7WM5Aycak+XKNSONuw/2Jhx
 17eZc2ss4/kvNrIunXaNOGTKnbEh1mbAbRsB+/Wa7notyzYilex/3UweYbMd2cFMv8u9
 IRAZS78LaYvpaTDEZ5YdwLgDTp5WnWm7HGQy1PLx7fnCU5iXFXLnUqjCOQya6MO4hwMI
 C/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762792696; x=1763397496;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=mcdYC2GUWX3Yt8G/A+qwsr5JfoxF8rsQMfbirKGchD8=;
 b=Vhw/XpFh+hljoQswgX2GBW+rZdNIHA3sqS5RsTIhnnklo/3VoDxygK3mnga2vI00Vc
 dw67M9FE0ZcKqqyJqIMwMpS5YhCb/U6cslw8qjRVi+7Faskzc0y0+XhnpYqlvC/65rAe
 JQNtiBJvrLcx+FhGl7mtNsDQGEa0sYkopcTFFkF8mvLd1h3nfRZ7i1AwGwsQ0YNlOJLn
 bXibqXZHAn2zK1Z1YPKvIVae5rTD3hkNQeonaTLhVyVxlig5v1uQmIrlHx+rUa7dWQUr
 tIVo6HuwW6B+ykG5hhRenrK1A8xjEAfFeBiu2jHAGdNCvkSzcTRhyrFb9A/00+djAAO9
 q/Ng==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJAKDZD84PWRCPKULnFmfO12Qiq955di/NBF1RYEpe9S6fI67bdx4HZCmOGEWgomBEih443nkLplQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzX955Y+xc9VWoJQW3dju6YxigUM16kY0AKOz/6NpA9EglboER9
 BwIPm+NnFMjjnvjpRsl6S9zi2jRmC1JhyVJ2Dkfb5/NwSxTHgJZb4pWB6CqGAIZ8vKlHftRgaR8
 HmQpLWUJrFSIymbGswJKHL/M/6/IZJ7b+CS9hV8bBEkpfs3UWhhk1EE5GgOdcbEYH3/UDdlQ=
X-Gm-Gg: ASbGnctiODTtLMoinQlGOed1rbZ2a3nvkvmaej4Tfe9n8nChvleU5G7AMLSM6oXRbUh
 Gp7DsAIW6Sc8TdoGTKsdodvb0e/nXolNHqsuMI9fE6YfoSLC6KV5tzfZl8AwA0qCfjQIY98lPHr
 kNCLAdHubqSuiQvQZanclEAd8oaIiiTeqAd1b4hZrqO/SrWfmkJoJkOlrf1oRD8rVMb46vqNYi9
 78SDgwTTtS7jYr3BVdNtgSHszXqTmMye4SeM/6aUlPp4EqyNgS3ZwKeTAUqTm/TVpHbjC9Kt3e/
 /4lVq3AHI6+qtNmyZ0ag7wBfw95D07nzTzn5lfusr+qUkDawLjvcmbkQrGHEVB5xSNoZIl0H6H1
 IwtXQD3gUYAVSHL2GP2ckrxA=
X-Received: by 2002:a17:90b:3d8d:b0:340:c64d:38d3 with SMTP id
 98e67ed59e1d1-3436cba90e9mr15119932a91.12.1762792696043; 
 Mon, 10 Nov 2025 08:38:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFpeeLzlAYES/pvtPhYhWt6lEiwIUScD1B6YRIb/1r23lLyKUJQumTRvtgD/qeTqkbN1zcfMw==
X-Received: by 2002:a17:90b:3d8d:b0:340:c64d:38d3 with SMTP id
 98e67ed59e1d1-3436cba90e9mr15119892a91.12.1762792695560; 
 Mon, 10 Nov 2025 08:38:15 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3434c337b20sm11468922a91.13.2025.11.10.08.38.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 08:38:15 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 22:07:07 +0530
Subject: [PATCH v2 01/21] drm/msm/a6xx: Flush LRZ cache before PT switch
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-kaana-gpu-support-v2-1-bef18acd5e94@oss.qualcomm.com>
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762792679; l=1640;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=0RH5+HB1DhuPB+qO4uxLrDpF6juU+e+LzCOFWLT2Qxo=;
 b=QKpYscsE7JUidxLJTjdztF9wYuuFQ9/van/0jE0PIt/jNOJ6D3vBNzOOdZyJ/eo0wJsHZeZJC
 YOytieMGrHrAXCLYQcFt1IEg81WjWnyBwdBPtLgVa7LKRAYQ44FDAn7
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE0MCBTYWx0ZWRfX4kQKwcAemQnr
 LL3ou8F+HBadGC0/Ho+5jWwA6+ISdnXPL3ZUf6ArpqFIYmULSMgF3gQQ09V22rHZ7zChjrNhNHu
 71Wd1ZgOKlxWjCWhOimfpOlLFfQQbjJmtEJvOibA7BtVO73rn6scoiSVHjSYBnkmgBDQYf1AdmT
 wkmOS2BcRO0xvL/ySafOPUo3oGuZQhlRNR3je0qR8ifhaHybPorLwjdNuaAFSzml0ds2CU71ojE
 vspHRavJj3xHHYd7QrpFekkNxI67P3iQYMbiK71gqEzFnTXKyZJHrQk7oVOSfpt85i7C9+XkoIe
 R/UE1ad9RXCkuSEIWKaa6wW+h++dCsWTi4FDSygulO0mOW7Lsav37ZePVzbfxoj/2HqRNP+Fu6Y
 5U3AXcQUpPaO3BIVX3SfUZouFdxnqg==
X-Authority-Analysis: v=2.4 cv=br5BxUai c=1 sm=1 tr=0 ts=691214f9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=bBR9okFf-Jgdumx6fEkA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: azGouN-4MsOn3vo53VHi5-E32s6_lNl5
X-Proofpoint-ORIG-GUID: azGouN-4MsOn3vo53VHi5-E32s6_lNl5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_06,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100140
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

As per the recommendation, A7x and newer GPUs should flush the LRZ cache
before switching the pagetable. Update a6xx_set_pagetable() to do this.
While we are at it, sync both BV and BR before issuing  a
CP_RESET_CONTEXT_STATE command, to match the downstream sequence.

Fixes: af66706accdf ("drm/msm/a6xx: Add skeleton A7xx support")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index b8f8ae940b55..6f7ed07670b1 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -224,7 +224,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 		OUT_RING(ring, submit->seqno - 1);
 
 		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
-		OUT_RING(ring, CP_SET_THREAD_BOTH);
+		OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BOTH);
 
 		/* Reset state used to synchronize BR and BV */
 		OUT_PKT7(ring, CP_RESET_CONTEXT_STATE, 1);
@@ -235,7 +235,13 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 			 CP_RESET_CONTEXT_STATE_0_RESET_GLOBAL_LOCAL_TS);
 
 		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
-		OUT_RING(ring, CP_SET_THREAD_BR);
+		OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BOTH);
+
+		OUT_PKT7(ring, CP_EVENT_WRITE, 1);
+		OUT_RING(ring, LRZ_FLUSH);
+
+		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
+		OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BR);
 	}
 
 	if (!sysprof) {

-- 
2.51.0

