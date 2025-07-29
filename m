Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E6FB14FC0
	for <lists+freedreno@lfdr.de>; Tue, 29 Jul 2025 16:57:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE95010E65C;
	Tue, 29 Jul 2025 14:57:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cwE4C6zi";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D47510E659
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jul 2025 14:57:48 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T9ESjv017592
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jul 2025 14:57:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=bV9napCh09s
 i1kGi9emra2vbNQVuKZFFrQKfXkn3mks=; b=cwE4C6zi1myTmBMi/zSeVDwYByp
 cSRwkxUl1oaeXRMzSaMvqhpXkRVPK7kz8kHclbNaBDupQMhj61Qp0oUo8A7W21PY
 1v8lIH+9t+BoNHrFJR/vzp1RXA8Km3JIZF0uDZXWnS7jidqhfVTVp9/OCYuV3D7n
 9q3Vjb3ibCyjMjyJbJUDLUFXWBoFkbM7ib1uE/+WBkRVXLPohlGS/EC/Mtz3o8iF
 z2UwZevKN/aF0lmno08TbILqcfBtX+mFS76YbbTK1+jjYjpP0hz7VW1ItKHQWdQF
 CRHhHqA74hzgTv6sA/U+9Vdj+GAOKVLS/UZPWFU+q5MzzJa/9yPAQfi0SMA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484p1aggbj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jul 2025 14:57:48 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-74b29ee4f8bso5249708b3a.2
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jul 2025 07:57:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753801067; x=1754405867;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bV9napCh09si1kGi9emra2vbNQVuKZFFrQKfXkn3mks=;
 b=JmYKTo+5+YGQzkf5i161t1FutHgPC633idr0MelN4OTPWU2N3nv6U6xvA4sTDrIvqT
 4M4YwwSUx4bPww9Qu/XkFleIAo1lztwRqom9PcPZwREu1CV+Jj7NAWF5/WGD7RYXrhIA
 IeDeh6ortrsnI2k+eMYqqR3K/Klb8TrJhZKk/mQ2dZCq5tPJpQFdzgcrxkjfAcvjWzzA
 lZzGaQ3L66TdsGbj1f5coGgaJklF3xglfMo2/7okzGD284V/b0aVwxRculHDbzFMNOYk
 0u/dU7/hBfBFmLm1ff8fSprZvfPfaAGbfGKKyWgz6z59FX1Q2vD4Ju8/FkZoiKCxVzSN
 q0Eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdCfK8tcnxjMqPhxxUNn+uhiSSXImmPKo/SZd6co3GSI8L9ETGe1cVcS7orvCpuebVvavln3ZvFKA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyydJjuODqNZI6JD8iQXWuwyZx99yPc/B1njsBF9PioZhPjEIHO
 OZOPF9aimmTodfoyOX41W/zSsrNq2FOCmehB9N+pYHOMM6CPlOHBJL7tyqCZYYRb9OCm+dgtwpn
 uWYaUSioNANYlaWenCxChTrjt+WVvnKiluA9ac3NWnpfL/oVoWYcEQhs2VYnRt76756CdBNE=
X-Gm-Gg: ASbGncsLZP3ONlm0V4Ve85O0GY4aJnlXKFUTUGp39EPCkg9U3/CwDpCinKIvwz3FGKe
 bU1TTdCiZshSG3SnIw6XBv/v1KOvJmXOrKgXMLZNr5B/lvhHAhpsU3uFXUPm2W7f5gPg2FKGRe4
 ogEn7a+YvJ4sd+8K7WykPl3tV1gIpgy85jSpu401nmoXwRGh4n2b4hewQmANG7nIgaytZDtE6h2
 B5odjsBhiuSzlnuiUdFJXx+NP1S0/ZBxPQ8yh6y0NqOw1yRBl9XiIsRDav/cndP8/27a+w26Esi
 V60gc6gptot1hCk5rn5LSbi8t2h70XG86Po0UGrPb+MRphRwWvs=
X-Received: by 2002:a05:6a20:4322:b0:21f:d0f6:13ba with SMTP id
 adf61e73a8af0-23d6ffe8724mr25354323637.1.1753801066008; 
 Tue, 29 Jul 2025 07:57:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkVUdWVY1jgk5W7nGQYN/xwaTvSOwMDc1T4fWKqth8CqZfG64KwyTPkn95VrDifdcVac2c4Q==
X-Received: by 2002:a05:6a20:4322:b0:21f:d0f6:13ba with SMTP id
 adf61e73a8af0-23d6ffe8724mr25354282637.1.1753801065484; 
 Tue, 29 Jul 2025 07:57:45 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b420db5d93bsm1812782a12.27.2025.07.29.07.57.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jul 2025 07:57:45 -0700 (PDT)
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
Subject: [PATCH v2 6/7] drm/msm: Fix debugbus snapshot
Date: Tue, 29 Jul 2025 07:57:23 -0700
Message-ID: <20250729145729.10905-7-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250729145729.10905-1-robin.clark@oss.qualcomm.com>
References: <20250729145729.10905-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: m-OVHrbodyt5JrysmAIJa81i0Q6NaSUD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDExNCBTYWx0ZWRfX5XCz8Mmy1J0F
 8bdHN4kPyNNr9zqREVMrudHpESiODOpWWqeEZMmqwsbiS/4l0cpltBazxQtLsvYQtPtF4T6eIDn
 xS2B4+qI8IETgkrS8CEV85ZDDVPedzok0xhuPM8ve1k8yg8bxL6WTjQSyz4cOx4lsGQnWQaTeT9
 HmzVLtDp8TAhYam2KKOITH48MX3yBCfyAULbU8IOVIsO1q5fFDz+sUDHrR9gg+TTK2KKOSJ03Tm
 SOfX6kFhkkLh/TpbcbY7Gpg/9Wz6XnI1jYhYRFYEBd4FORgJuAB+5kiKRtaAJ6c4fyHReO+IEFo
 nI8ZL0fzUS+IQVlgb5c6ykJcnGbz6JLMoRtfYF57jm9pkiztN86iaIbh6IoABgaPYQBQPk+/hAu
 H2iaW9flR74M341/SDXarWay+xhCJoMW8HZFF/EGAl364f1MbQNgESLnmPOsrisnFNUef8b7
X-Proofpoint-GUID: m-OVHrbodyt5JrysmAIJa81i0Q6NaSUD
X-Authority-Analysis: v=2.4 cv=KtNN2XWN c=1 sm=1 tr=0 ts=6888e16c cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=Q8ed3UK4sgpFGPsrdooA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
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

We weren't setting the # of captured debugbus blocks.

Reported-by: Connor Abbott <cwabbott0@gmail.com>
Suggested-by: Connor Abbott <cwabbott0@gmail.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 8317e1107389..ab9b35e44778 100644
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

