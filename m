Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D601AB14353
	for <lists+freedreno@lfdr.de>; Mon, 28 Jul 2025 22:34:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9173B10E59C;
	Mon, 28 Jul 2025 20:34:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gxT81nkX";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1112110E596
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jul 2025 20:34:28 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SAlMsP023447
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jul 2025 20:34:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=9HL2ElAARF0
 /fbev6G08+6TVwHe8Nc/ReEeD7pJWGHU=; b=gxT81nkXjsjgayio9XdonbnMeD7
 L2+voPgFoghEPofYHzvzSJ3hLfkheUpUwp6AJecqOkRU/RpXsAyZVmft8OLRHRnp
 OSDvwcAEzcHv/ElcJ3SY/f1Qbxxtxxa+xYZ4qM17D4MU5kHoyDqkRFBXqyE92xrg
 DENhi4NVNJJ8NBdEu/wuWBSRQKoO9FfrcFszkovsvso92EplmAaXrABkXkSeOgXn
 fWB0pahpyQocRVNF4ucOqG89ghmh/G9mxs8epGopELP7oQ97O6fGXcHyR6TM2+G8
 0SEehKRpk9xWcynZbgpAh4d1yU/CcuhsMleGjbACtCb06aQ1m8BJo5lihjA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484r6qnqy3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jul 2025 20:34:27 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-31f2dd30823so225727a91.0
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jul 2025 13:34:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753734867; x=1754339667;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9HL2ElAARF0/fbev6G08+6TVwHe8Nc/ReEeD7pJWGHU=;
 b=IuPFkH619SaxLDyUTy3FNL4BIXHkZY3CAROb9bQhVvDaEBKjcUDHrZwyEu6qTv/6WH
 E8Qp2+HQJiqPHe5BeXcWmpVcWzfjqP1dlQ9PLFGa6kdmKnm7dYbsR29+DOKdI+PKfVG0
 Xd8v/3IUMObnrWOF0DSK0HnieZHzsDIg3gGY28vY7+sGPe7pf4wwT/j5nlEQy5AlJx5n
 6sVkRJTqiA9+prJ6sFHxp2Wd+syt7JvXFjaDMSsvriRDjUGez9978t5i46PTCWFskbAc
 T7lUozJlm0NIo78nQ/nJRv0D3bd8EU6PWGGjo2OYD8xHdbRze4OY1k+H6ZKinAq6+Rwa
 n/Ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmR7hI1DgtVkXzgC7LLpCiPIF5VOX6tp2gJjHBAmCxtBp0vac7Wt6E22MyAgt9WIkSIUcuBII917s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxalJz8zsGZ2vpxUtf7Rp+UQcPyc2oOPAkhO3/Ik061XKPn9kZP
 GZn7MTJ8G0MWY/ydu1VFAFgYmol9bJ0bvS3uNRu44tDEBnqofDxMl/ANgAIQgi5iRJpRTtN7NoO
 6i8ydtu+2X9l5K+QNIwxcO3S+tzLijakwq78uRWBbOZFJDNZHpUSKQYn7X+MpSYbbD9Iz7kc=
X-Gm-Gg: ASbGncuAEOZ8y60ObChRTNO9VcCJ9WrozAG4QM1Le8dKky6aTwPTj8XP6+qyweGIYUY
 oqe6pV0NILH3yZXBkfA6W1Y++NgWMZh09YXNdfbJMcIS4NTKG5vtUWLzhCr+0rCdySy/8M+sYND
 NTl+MKhN/i8xUKZv5tf/M9KvIuacdSkOcX6sZhoV7BN4vEowQxK9fyUhK/lnXfzv2B7oWY2vfs/
 Pz6NzDuYp5BVEiCVlurUknqjtF8FYjEWZCVfpqmSgdNOeAIOJ1I0VDZlxp7mdm+IJfBkTy3FcK7
 K6/R2vfVitTjv1nXLiq6LDjKCGXrN6K938h1C2wflEypDn1OAhQ=
X-Received: by 2002:a17:90b:564f:b0:313:1e60:584d with SMTP id
 98e67ed59e1d1-31e778582ffmr20598895a91.11.1753734866626; 
 Mon, 28 Jul 2025 13:34:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEdJ9/dscUM4BqdHSg4PGTK5hxCSdAWWgSIKT1qLZOsCkP8tbWQs3GjcAPYzq2dmolO2Bt7g==
X-Received: by 2002:a17:90b:564f:b0:313:1e60:584d with SMTP id
 98e67ed59e1d1-31e778582ffmr20598863a91.11.1753734866210; 
 Mon, 28 Jul 2025 13:34:26 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31e83545d23sm6505289a91.31.2025.07.28.13.34.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 13:34:25 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Connor Abbott <cwabbott0@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 6/7] drm/msm: Fix debugbus snapshot
Date: Mon, 28 Jul 2025 13:34:06 -0700
Message-ID: <20250728203412.22573-7-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250728203412.22573-1-robin.clark@oss.qualcomm.com>
References: <20250728203412.22573-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDE1MSBTYWx0ZWRfX5faWoZJzzCIC
 7sUE7CEH2/eVe2PNOdX3g5r9rmTLctcC2ruP730YnSRZuixJ8HnF/ON0US5rrSUdbVn/HTiFbQw
 /WdYgg3dwCtlmb2S3JdOQTxM2EP7vQgIGZOVmlP/dnzxULU7Y24gDce7FyMI13ogpNxoxGPwBU9
 AQhqP29uligAuAT+FcbiNasg7V54RahmKF3ze58ZonwiKbEvospbiEYO4MFZdCT2+ZF7Ye95QXr
 w/j8+j0J9N6YQSsap/zbQO57RFvGQCiPY+ECGAlrLejrKSbdbPs+xEn29wqygvJ6QkKswbgn5b7
 cza9sUdaUxWdBsbEyMSX8J+PbQ8tXtIVZY8VLEE94LKinOFwJrFjbrofyjj0CFJWtuCGLdiwrYb
 wEMLvF3hCfGY0fgc3mbhpwCyv2hoYyjC/iOBlWQyGXWOWHM/tomXuNj7flxtGPkOhZRpa+gt
X-Proofpoint-ORIG-GUID: VGl7uiif5LoXRHQSIeTqK-RoQFdaPv07
X-Authority-Analysis: v=2.4 cv=ea89f6EH c=1 sm=1 tr=0 ts=6887ded3 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=Q8ed3UK4sgpFGPsrdooA:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: VGl7uiif5LoXRHQSIeTqK-RoQFdaPv07
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507280151
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

We weren't setting the # of captured debugbus blocks.

Reported-by: Connor Abbott <cwabbott0@gmail.com>
Suggested-by: Connor Abbott <cwabbott0@gmail.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 33df12898902..4f0d8c0e6ac5 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -430,8 +430,9 @@ static void a7xx_get_debugbus_blocks(struct msm_gpu *gpu,
 				a6xx_state, &a7xx_debugbus_blocks[gbif_debugbus_blocks[i]],
 				&a6xx_state->debugbus[i + debugbus_blocks_count]);
 		}
-	}
 
+		a6xx_state->nr_debugbus = total_debugbus_blocks;
+	}
 }
 
 static void a6xx_get_debugbus(struct msm_gpu *gpu,
-- 
2.50.1

