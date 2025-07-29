Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B89B14FBA
	for <lists+freedreno@lfdr.de>; Tue, 29 Jul 2025 16:57:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE84310E64F;
	Tue, 29 Jul 2025 14:57:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IiqUseA7";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D634910E64D
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jul 2025 14:57:42 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T9fR3P017653
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jul 2025 14:57:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=0qBkf9JDSmf
 FwdkCS8a187SNR+0cTRqqV9Ya3fpJH68=; b=IiqUseA7ZxZPmNVf5O8ZEZd1UjI
 snNXRY+1zeGSC0McZYDyiy3tCUSqCWZKN5mQJbLK7Gg89m1ZgWtPV7/p5wxlq/0M
 nUW2js4rF28MoR8IZJtfLwdB/+SxEZ89AZ+20387HNM3Kn+TtpUzc35HkkOFAIVs
 nH1ChZ1XwEWuKW3c5gGgc3o0iB4rr6pbROPIU/K4mEft3R6ED0X+eTIEyXzIyeF7
 VU+Nly8soc0ZPqljK5L8SNDaqD7O77bs1yKd8CMMaKukeSBWyMWe0LsrGAjgprF5
 tMmhAUIJX1songUbbQ2tXmdkk7UJ8uc48fv8Jjua/b88SH1Qvuium1K34Ig==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pm2geje-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jul 2025 14:57:41 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-24004ac2ecdso35102445ad.0
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jul 2025 07:57:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753801060; x=1754405860;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0qBkf9JDSmfFwdkCS8a187SNR+0cTRqqV9Ya3fpJH68=;
 b=A98EGDJ4yAlj/0W7kKCuHwsMapeB9lpQwta56ZYkrqNp6sCNIMA/MQS2ULeDdBV3bI
 p3oavnpQYqRokUrtEjGh0RQVIoTjcc28fAkY/bEFZcpgSEIBcRwE7xV/3y0ull5aoqYd
 2le9TxmAtJwWO9aPi5buVYB+8qPAlvrm8R3BFY6TaqGQtzCaxYbYZ60KjbCnlwyvbiAM
 zjX9i2p+xfQHayVIykDFlXgN3Ofo0Kgman/E6IzFgXlxmefBJ8OquTMs18OGMvaQutPG
 /rsmIg+lvR553ArP9wK/DVJxsFyVssEGb0hcP/1W2IrXZt4+mDqjr94r7pI4Y3Vm6WGn
 lt9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMJq/hJCQUuwxslXnL0DEuVOh00mKUpcaeRFAIImDYuAcdTpgg4CTcy2Jap6j05vk7R9DFcKFB69k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLEmRDS/aY1Y+crlDhLcVNEh+Poje9NcC0aY152E63mYNfu4qG
 BvBv7mCwZTYslTqAflzaji+v9gkEEO7B/Fs9sbvwyRDoMcRi9ylFaCbSVTsOYvoRybuCQZW9yeq
 v+gd3KBfAbdNWeAp+4Mzk73keXinaqEfy/V86GvPP3IOBst0fH/pPBTCoT4XeiNT9C2OgSVY=
X-Gm-Gg: ASbGncu/6y/tVvj5w1rL0JWnSGL3HBKMhxxPVFohv8dfcw4RzkKNrySDMdQo8FqNXCz
 kqjZyFT1ihkG7A/Fw10LBmN896DFJ4tg1spIQbVELPCQMvxRTagJFOUfMCJFOFvLYTa0hVVLUjS
 rm77rrrKUOM/Kz/SHsiLqjxKrItPpGc41QNnwuxFLeH5xRYipO8eSk0GAj2CWmA4VkeJ+tv3BLC
 oamMN3w+6YrfBknZlXF3ANPBB2+30smMipm6SHk5UwHe3S8005mu1wwBwcFGoIllrG6hgYLoOoC
 43PfxwhmpEXw2uPOx96rHUx6A151xLBBO8PbqcMhvlfAsybMGY8=
X-Received: by 2002:a17:903:ace:b0:240:1953:f9a with SMTP id
 d9443c01a7336-24019531719mr133423425ad.2.1753801059628; 
 Tue, 29 Jul 2025 07:57:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGD4GKtP2sJEpJJxujTV2ZRkIuCi7nOh6GWilBcpkOTveTX8D8XdwMAVNRZGCDv3ocJrDEVyw==
X-Received: by 2002:a17:903:ace:b0:240:1953:f9a with SMTP id
 d9443c01a7336-24019531719mr133422875ad.2.1753801058983; 
 Tue, 29 Jul 2025 07:57:38 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24029726586sm48279835ad.19.2025.07.29.07.57.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jul 2025 07:57:38 -0700 (PDT)
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
Subject: [PATCH v2 1/7] drm/msm: Add missing "location"s to devcoredump
Date: Tue, 29 Jul 2025 07:57:18 -0700
Message-ID: <20250729145729.10905-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250729145729.10905-1-robin.clark@oss.qualcomm.com>
References: <20250729145729.10905-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: W0tzx43EnefiRLSJvXnPEcStcb3tLpi6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDExNCBTYWx0ZWRfXwc9FFlsDbu08
 hHmG/AvAprun07IuB7hSPPJzGGH25D4DIM8gTqcw3AyVowP1gRicZlBSBAb47PXvuYVA0C6k9w5
 aARzkxUvG48OgnrVIXC0iUlbuifCE9xWEAXmAPbkLviN6EeGZg+5B4te+YYBbquqKTMkAgTLGId
 zHwg8m3XrN4jmOujmQKEIzUjTJxdLvUCJJdl4IuDvnCHJq/PmXymU57lKqerxye/SiYAMWx7emW
 dEQ1kosQ+D1yZ/GGpDc+vsgAbnl66qIfQ30APFxXrBcJ27wImnLZu58lvE5r7c4+BbOFegZ40C8
 eMV8tbu0gHbVKHCbG0PI4U/jSuG9o6ECd1hafY1r0vKO9qpuqn8czs3unJ7sZLfSwdrnNwXdasy
 T44HM5QGHO9NnUznujRKh7AGBwMjjaqrIQPMWhATOFyH9X8a0OnP32g50sP9a7BPJnBQSAqf
X-Authority-Analysis: v=2.4 cv=HfYUTjE8 c=1 sm=1 tr=0 ts=6888e165 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=YFM8xwheDJGXjHaRWHsA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: W0tzx43EnefiRLSJvXnPEcStcb3tLpi6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507290114
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

This is needed to properly interpret some of the sections.

v2: Fix missing \n

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index fe38ea9328d4..a35cec606d59 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -1800,6 +1800,7 @@ static void a7xx_show_shader(struct a6xx_gpu_state_obj *obj,
 
 	print_name(p, "  - type: ", a7xx_statetype_names[block->statetype]);
 	print_name(p, "    - pipe: ", a7xx_pipe_names[block->pipeid]);
+	drm_printf(p, "    - location: %d\n", block->location);
 
 	for (i = 0; i < block->num_sps; i++) {
 		drm_printf(p, "      - sp: %d\n", i);
@@ -1877,6 +1878,7 @@ static void a7xx_show_dbgahb_cluster(struct a6xx_gpu_state_obj *obj,
 		print_name(p, "  - pipe: ", a7xx_pipe_names[dbgahb->pipe_id]);
 		print_name(p, "    - cluster-name: ", a7xx_cluster_names[dbgahb->cluster_id]);
 		drm_printf(p, "      - context: %d\n", dbgahb->context_id);
+		drm_printf(p, "      - location: %d\n", dbgahb->location_id);
 		a7xx_show_registers_indented(dbgahb->regs, obj->data, p, 4);
 	}
 }
-- 
2.50.1

