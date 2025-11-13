Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F234DC5A8F4
	for <lists+freedreno@lfdr.de>; Fri, 14 Nov 2025 00:30:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D71910E96A;
	Thu, 13 Nov 2025 23:30:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="meHSHRFk";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NcwWGNt6";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD6F610E964
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 23:30:08 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ADMatIC1611394
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 23:30:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jGGfQ+tgLcU0SwBwQco9Wli6+1VrBRCLwj6tuxnqYmQ=; b=meHSHRFkwINJu9p2
 ci1j8tDXOJnxz328kucGEK7PVSr+WtvS3Ls1Y2H3KmMsWr7+W3zpw1QIz2N0OTdr
 +z7yxCX/wL+2k62V9hwW/bCAHDn+vKNWjKgxmYsAvWEhLEHGgxNl+vQcO6f2sciL
 Nh/DZWJtBIgU5BwhFEo9wil/v4Wiy6o4Dm6VqptQHBml6gGMtIItlShm7z8hlJQ3
 WWYdQfDEMKGRvqkMv2Fu0C3oEULwKVxT9qmeyueuYRWOwPDfU5ci+6uydHqoM+ej
 vCuBEpqBYyjJVW2wMPwv015i1ROtDlAzmgCDd46qgtEvHu3SE/x+JQ5cjc7fc6P1
 rpBc6A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9h03x5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 23:30:07 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-7b82c2c2ca2so1542987b3a.1
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 15:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763076607; x=1763681407;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=jGGfQ+tgLcU0SwBwQco9Wli6+1VrBRCLwj6tuxnqYmQ=;
 b=NcwWGNt6B3a4Xaw8rXcZO1yIGg5+29CT0JWJ77f4ZTlNdtTc2Tlel1tBLwGLpkiBRd
 8P15o1/WoDf/GS/wKmqM4PePnbHnBgOb66KVK8ZB5Je/2HL2RAdcGORH5KOHZuBDb6rO
 Dn+hIO2HKXmwDZxwIhA/lIDcQqtD5bKeOPaltv3ynX2lHuAPkLnDybyU+7WZ34O38EAK
 VnuGikZtXybEtxF0SJIF1i8l41ADQSl4zw2QmjNCXBS6repAlJWqVd8YkP/GRHYWmodo
 NwfDNSIPhzGpWU4vwBuE9gFmJYSfHX4g4qV4QXGGlJnfdr7CDNQmyNAgeTTQ1QaSyngQ
 a4FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763076607; x=1763681407;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=jGGfQ+tgLcU0SwBwQco9Wli6+1VrBRCLwj6tuxnqYmQ=;
 b=oTZ7/nH9w1mgXhUzEwVrml10wjF8KIPJiZokrQCceml9S5nUh5q+G51Yq0//ulk8QI
 tEoFmOzmgS61ZvCqHm2Iy77yKSaEKsfBKJ/3k7Zkx4vYprGaH06FNLy4DBlRTYYXP3PR
 MzN21wzZ2SHzB+U9YiAKiz6vqZl/dR8kkoZp82LgtcWYJjhPJsvf40eVqCPVkftn78OW
 MxjOdu3EudhXr+fSNurSKNm+l8sVuAXaumcMetebyYxorKg3IUhbPnve6SARZNLyTeUL
 jcB/uUI0EEkDBxsgERiScld412Kfs0umushDmYu/lJZEbkldSrGlxQBXQkNILS5bFQbp
 eE/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiFPcXLR+7vYkv+c//RoSlKl42J7Rb+oDbRQbnpJGDAhtovof8Vv0B0kGGKrEIMQcbQukFK7OFHyI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWzZg5f9+gYrb26i53zlizaaYmQL+iYEwT0Wl7CgN7oksszSIl
 D7ZNoc/E8iT276UnxoOMmGUWVM1UHZbHupKiJ6YQUjNsjXMzDksxaqR/3Zzl0xHfaXKjpIITyZF
 qQZm7J5WND0ZLDDMlTv59p5RUuCzoG/b5lzre4Kv6PrjPYWeFy1Q9tUF4HwFu8Mu792KwMpY=
X-Gm-Gg: ASbGncu9wSNqiUv+8PhWt9cyMZxWgPzubkkWy2XB8/g/MtvP0A54lD4iAr8EQDniCTl
 IGde6zsrIKFmZ4Po+kCX89yv1wKIdnXU10olVYtuqp1GXGqQ+DYkfIKcHI9FKlq0/eH0qVlRvz0
 +skY7OW8ipQXEY1igg+r5GuUNV+0H/oANdZgvfaUXkXse0Jnixs+q1iBAe7k/aNIKzBp2Ub5WQM
 9QIU9Ti878QzecFv5Gby2R+r4Id2jfnDghP88nN2CsHn/UtbToFUBWL1FVNlMGS60DcRe8f7Vcr
 clB0ZNK/Hb/WXiF6lHZtLRV3BStI4FcFNqOXBRrHux0BDbhNfIluk5SU7NUpK1kMs+QcI3Jc2C3
 zz8KCOhSGQioBUkgk/Ep8/vU=
X-Received: by 2002:a05:6a20:7d9f:b0:351:d6ff:dd0a with SMTP id
 adf61e73a8af0-35ba259dd93mr1575435637.49.1763076606576; 
 Thu, 13 Nov 2025 15:30:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGqb9xTf/1RdUkSb0wiuQ/LducqEzVd/Avvst0tIrciZXoTqPCwdrblFiddRcVRxAW8PRxnIw==
X-Received: by 2002:a05:6a20:7d9f:b0:351:d6ff:dd0a with SMTP id
 adf61e73a8af0-35ba259dd93mr1575387637.49.1763076606061; 
 Thu, 13 Nov 2025 15:30:06 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-bc36ed72cd1sm3049486a12.11.2025.11.13.15.29.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 15:30:05 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 04:59:00 +0530
Subject: [PATCH v3 03/20] drm/msm/a6xx: Skip dumping SCRATCH registers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-kaana-gpu-support-v3-3-92300c7ec8ff@oss.qualcomm.com>
References: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
In-Reply-To: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
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
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <rob.clark@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763076573; l=1280;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=dtSwkU/2MTVLwCFlRqqTYMozfSVMz5AGTKvrJ9IlCNw=;
 b=pSCBNHippoLHyPBaZa3ZDzn8ibiYCS5gdO400/t3T9Sn9xouKFOuo4y+vrWWiMmy+E3FJYp4X
 6WqXbKsGI6MDNSnLjrTIELBXTdLWZs4mQyMQrKTDeLZ2O1KboBgdl9V
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: icIrsSB2j4Sy4702b55eDCG5cwEDUA01
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE4NSBTYWx0ZWRfX7AvUxe61fAD5
 +JoSM9oXlnx7/ijwc91/yDu0WDhyoWt/3xza9EQNHFmcGKB69UxnuKWWBP4V+gMMUXLbQp69oYc
 JeLU5Btr0vrwf6AxB7AKvDzFlmYva5LG4LDownC37Nv3amzTMj8B2zyZG/NmWkTfVnIlNj96xAn
 FOkSdClqSNp8T411FXnZLVk97t0U4WMlUSLFvElK0hEJD+Mp2RBNgbhtMTOMCYI3PeG+caFzf76
 Defrwrg67SUSsgAjBlPz3K1ke6lr//wu8iZ/9GXaXkjODJN8GPRzn8x9iol6RIEzLfbG4KfNMrF
 cWMb0m8A5CFwOmrigNU7JSBruHxQMdoK4zyBXQIV633XSN8uUN0Miz8rE1UNEOsJU0dlGvX5t42
 Cuuhq7lvZUI2tFIbEY8Ydl2Oi5/kYA==
X-Proofpoint-GUID: icIrsSB2j4Sy4702b55eDCG5cwEDUA01
X-Authority-Analysis: v=2.4 cv=V+1wEOni c=1 sm=1 tr=0 ts=691669ff cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rH6QHmREy2P50qlKy74A:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_06,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130185
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

Crashdec doesn't require SCRATCH registers anymore for a6xx and newer
architectures. So skip dumping them during recovery.

Suggested-by: Rob Clark <rob.clark@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 6f7ed07670b1..0995aa1f7286 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1546,7 +1546,7 @@ static void a6xx_recover(struct msm_gpu *gpu)
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
-	int i, active_submits;
+	int active_submits;
 
 	adreno_dump_info(gpu);
 
@@ -1554,10 +1554,6 @@ static void a6xx_recover(struct msm_gpu *gpu)
 		/* Sometimes crashstate capture is skipped, so SQE should be halted here again */
 		gpu_write(gpu, REG_A6XX_CP_SQE_CNTL, 3);
 
-		for (i = 0; i < 8; i++)
-			DRM_DEV_INFO(&gpu->pdev->dev, "CP_SCRATCH_REG%d: %u\n", i,
-				gpu_read(gpu, REG_A6XX_CP_SCRATCH_REG(i)));
-
 		if (hang_debug)
 			a6xx_dump(gpu);
 

-- 
2.51.0

