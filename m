Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD04C33201
	for <lists+freedreno@lfdr.de>; Tue, 04 Nov 2025 23:03:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 326B610E674;
	Tue,  4 Nov 2025 22:02:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VMqgrX31";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ipX2FK0x";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA64A10E674
 for <freedreno@lists.freedesktop.org>; Tue,  4 Nov 2025 22:02:57 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A4LUkrQ3114702
 for <freedreno@lists.freedesktop.org>; Tue, 4 Nov 2025 22:02:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=GwIOE/j7bW3rjOQQEU9BoakITgjwxGcmKM3
 SVmsTbes=; b=VMqgrX31AcZ6G8tskHhtcPsAKSqJb1QDPVri5FJT2oZ3JJZ1uGU
 romt4jBtJVRYRcXUU6hg/t4Wb7VVd2m2gXkP/GiYFJNzF8kM2Z3f2Cgn6xJgd16q
 PBwMUhJnvr91WMjQ1frIYeuq3D+qvxa+PzKbKiOqFSzxDrqzbFy0wB1SmZBPriPW
 +6nIIQTErlFKzjiFvwSeKFTC/+nu66nqh1M1aNHGygavkn0eeImd3WQeY4XoAbi4
 oGyQtxW72vAnuLjDRf2R5ciLXIFYYPIpfH0W4SJ/d8Jk9TDMH0JpS9yyzgzAB8NQ
 QAOJEyZm8j64Ywq5+Ck00vkTtbpPrBDr6Gw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7sfdr2uy-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 04 Nov 2025 22:02:57 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2955555f73dso30499605ad.0
 for <freedreno@lists.freedesktop.org>; Tue, 04 Nov 2025 14:02:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762293776; x=1762898576;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GwIOE/j7bW3rjOQQEU9BoakITgjwxGcmKM3SVmsTbes=;
 b=ipX2FK0xAtBAUKX417qRmT6q/16AOPBrOxixoceoe9/g48eOp43pyl94Ik5RVzoIo/
 C3ew+4rI2JD1rJxioOC3g14GBFs7ehxmQCbkHcDtWOtT5vjOFVK6Rj+XHDyNcz34WuvP
 QdUL6t/QeFE4hhXJ8VLyKhdN3kTbuVItW4VQBn3Qib4Pcb0X1Dqmb7l5kEhqJsB//7KM
 BDC3rbEgl1vdvs2cTh83/r0UYd+146zNhiQE+5CXk+cHHA/gsWwRxcO1kFADKxWuvVI5
 MaM6nkjZviKnOICQ8ECCKQz7JU+OluDXE7atBOnBZ0Di0tRy6gg/t16LApwedsnoMHaq
 FiUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762293776; x=1762898576;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GwIOE/j7bW3rjOQQEU9BoakITgjwxGcmKM3SVmsTbes=;
 b=aqhOpBpmxEtyMCcHuheQq5y5kp6RhOHy88LKpBCkDuTRtrAPLiPCEbFNZbEWGQBwri
 Ti/bMuVees6EqPhhRSvjbE8xEGp269bomYtgeGgIu0emxCHwRdQQwCB6d0UHx45zuZrd
 Tm9nCB2js+SPnHxfTMkgZ81nXVbDMr+ivT9YnxDllQapUDx7xDPx2dNV5/8w4lJbLuc6
 mo0iwNxS9oI3NRwwyVke5JyKknWHo3ASz9zdueo52DDLE4sJnELYLAK651UXI8UfZUkY
 HP3G9a+L4Hpxu/ULritgbUwlAzNW4bxwJLkxsjsu1z0tDbJscn5ZQffGJq8yKpkyRjrA
 PCNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzDaTIF+WuxLRodejC7DyRd9PDGG3IT4qTLiuk8l+1fvev3wsTx5CZPtih3/PFD++LdHG5JFgnago=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2VUmIkRp3MxjPszjXXbZqzy7jjVljbzqu0/t234VbDu7MvVfs
 O0pSuosE90w6BESkvIe9hImka52w0B8VRJ3873yKY94i0wv2aW8UzQBXbKQtjGMVMKy5Dwfdo72
 FTGEHMU4RTaCPtKPQ7wh0X7MTx6ppTF3+aZTme/cQbMV5HC792r5z9F3QCINaxl2Rm1/n4+8=
X-Gm-Gg: ASbGncsQI8ZNLAyOMUvPY8P4Q2EbxDT/++gGCLMCDmMr1wmKXhUWUjCg2u82Qqf6flX
 3YwVN673AgjXF6iHA9LnA2YuRSELOqiz1cqB9f6va+0XAcMxcIFfeEQhVVLVCtVMdHHEYBjXYvp
 RwFx0JVKnQ+hqqzDSJ/KV+bkP+j6iRYM0iay/dENa/3U4JT3JIMxwRl7dqznPMc0fwV7MvDHCFa
 x84FAw0YVo+UwNrTenqHyCGzesiLL8Hl20EdrgJSt4tS301ci1glY2vLEuJ80iZHOL6ASaQP7de
 0V88Zzji7E+iUEuiuwxstb9lVUelNRg3WHP5h2Wzl1ZtuQQTyuRmLeVrmayfOhaLoYrisDM8I/5
 mM+bNt/EZyg==
X-Received: by 2002:a17:902:fc48:b0:271:479d:3de2 with SMTP id
 d9443c01a7336-2962ad13fd2mr16326295ad.13.1762293776305; 
 Tue, 04 Nov 2025 14:02:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFavk35ju6KTwN78IzRXYY+q07xxAOOCvfNpXlRntG/9emf8L8fCqQYtFVa2gtfvOtl9wk9DQ==
X-Received: by 2002:a17:902:fc48:b0:271:479d:3de2 with SMTP id
 d9443c01a7336-2962ad13fd2mr16326005ad.13.1762293775845; 
 Tue, 04 Nov 2025 14:02:55 -0800 (PST)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ba1f2a80459sm3394989a12.15.2025.11.04.14.02.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 14:02:55 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] MAINTAINERS: Add Akhil as a reviewer for the Adreno driver
Date: Tue,  4 Nov 2025 14:02:45 -0800
Message-ID: <20251104220245.240480-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: RvC1oSMFzn_ePQjFnDuASIscm0389fty
X-Authority-Analysis: v=2.4 cv=MMFtWcZl c=1 sm=1 tr=0 ts=690a7811 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=e5mUnYsNAAAA:8 a=TbDdNxe2xOi8XIqjo84A:9 a=324X-CrmTo6CU4MGRt3R:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: RvC1oSMFzn_ePQjFnDuASIscm0389fty
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDE4NSBTYWx0ZWRfXwiiyUGlyMuTF
 JnwFFlum/vM0V23J/Bd2MiItAzaGXoyoo48gbK3hgbg5IM3WuMbkazx2jiZDmPy3lwtwCy/q635
 XZJYVqtasADQ5tPnaVX/9oUo0VO33ba2Qbardj7/KpI4JUGaRkrPZZssquDlKAlsUrp7pAqc6BB
 ya/WuDjYkSez3fHq7aoCCg+x66COrFl7DPw3/KnubgaSnhZ02sLQi6xkmxT9Ue7TtJFf10LdQ5p
 oheCofeg5vMBZu57QqxCoJiycsl1YWQxE30A62A//0pfbM7sBTIQMqNLLtO8HoDfI39knTiGPIF
 iX6FE2SQRHUbvu2fNoc0d3wMrBGNbC+sdqUOLR0KCC/HFbEmoKvS1s9K2vSqX0w5423AIwWdInD
 YQIDaNkm7SRbe+j5agT9B8dhNJ3X+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-04_03,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040185
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

Akhil should be getting tagged to review GPU patches.

Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1083598bb2b6..033675aab0d0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7880,6 +7880,7 @@ DRM DRIVER for Qualcomm Adreno GPUs
 M:	Rob Clark <robin.clark@oss.qualcomm.com>
 R:	Sean Paul <sean@poorly.run>
 R:	Konrad Dybcio <konradybcio@kernel.org>
+R:	Akhil P Oommen <akhilpo@oss.qualcomm.com>
 L:	linux-arm-msm@vger.kernel.org
 L:	dri-devel@lists.freedesktop.org
 L:	freedreno@lists.freedesktop.org
-- 
2.51.1

