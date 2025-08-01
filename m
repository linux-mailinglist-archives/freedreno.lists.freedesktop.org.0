Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 637BAB186F5
	for <lists+freedreno@lfdr.de>; Fri,  1 Aug 2025 20:00:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 115A610E8D7;
	Fri,  1 Aug 2025 18:00:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lqjb021A";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB5F010E8F0
 for <freedreno@lists.freedesktop.org>; Fri,  1 Aug 2025 18:00:17 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 571HfRHc028630
 for <freedreno@lists.freedesktop.org>; Fri, 1 Aug 2025 18:00:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=0qBkf9JDSmf
 FwdkCS8a187SNR+0cTRqqV9Ya3fpJH68=; b=lqjb021AtTqCvnIJMJBuUKy1mw+
 SKPUHSZlPGv/P89wjiX2SYFjrHJfsfOrmAeW50LSXHK3LPcaZpjRUMIMiGKVv9l+
 fsz1dmWa9hHOHAGkgdauML9IhAYm3w2/cFdcuzXzn+uRAZj5ymAKCQ5jZtwCO/L6
 jh8aity2LH5dT6DNbCvbF5/07qdwLikc99JXmBKHqcSh94zDrcv8gWs/MFTAqQFP
 wRvF/F+jZsQXtqU9XGaAKaZ+WqcIE9sHJfO+kdHzPdMET3MbR9UXycmCFmo5ME8w
 C4BFLfa7v6ANOSZmRCZbbDFei+f0bYxtgxzaZhuyh5DWKCz7dPHV+OFRj1Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484q86d59n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 01 Aug 2025 18:00:17 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-31f74a64da9so2270518a91.2
 for <freedreno@lists.freedesktop.org>; Fri, 01 Aug 2025 11:00:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754071216; x=1754676016;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0qBkf9JDSmfFwdkCS8a187SNR+0cTRqqV9Ya3fpJH68=;
 b=ECJRELOXE+KBDOmAqKvt8T+qOHkW67PMrA2umOjwQp4tTj+NBARF3l6RtiAKNCoZWp
 ThRus3jvZjksBCW3xoL4lrW18xwDAt0ioy4sSQGG1nM8L+aH3KBwTYcsnBM+YYlTC4zn
 MJXsNkUrcV7hDPHwCivvnu/8yJ+yvoXiQY5nM8YfZErVkWa08cBFaiuCBT3CKyvsURbv
 KUc7/2UDSQ+2C6yeGNhgwGO8fDfTVw6Do6EMsnlplHEa2srSO9pp+pVMLSEjsqblZC+k
 DB5bBNbbC5BUiAUcbsGp1YRncApgULV0uRhglNaKWU+wLp+wRJLQY3lo3SeWbI4nXI7K
 awpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX170sO5RQbEx2ghl3Yu/2c7WRKZOxpxGrQ7+xwPa2sjI82daYXaYdOuNJGRFt9GYg15N5o9MGAFyk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzqeDWNl9X4/Y7g6dG2Tu/G6tiOlbvbYurmJff2x5lqKSgyM0q3
 l1vG/yqKx5WfT2m8ylbQLEsIo2Wm3F7+mzIZUdb9oQV36odmKakDoe9T5Vd6xZqHPzx1hSSntok
 405gvXz0c7AUyffWxuEI5I1ZxvnhfwEjZPvC6WKPADxOJI6+G0NN5kTvaqPIUj678xKGS+aM=
X-Gm-Gg: ASbGnct9rKenS/rAI7QLn4u11vhN5dKeL8uG9BRVWt+xQE+YOMVro4dnfjbtGsZD4Wm
 oNCexuoQxrCEpuikUikuHR3FcLV5hocKdFqp9tETiOB3LhMDBVRRsAWBJhaxHXD21RF5FVcPRmm
 y82zyC8nBiPPjnUKaOQVbQehyC4Ii0OfLuaCa0BwejYkIi90/JJfLHODC2DW2NTmqKdKhj0PlDl
 DOrySNzuK3UapuR/fhW6lNgavbiW93yz8A4QRSKUR76fOzoJ8GU5UdG8t05DluAI+zRbwIOn6LJ
 GTKQjH4C1qu1RujKYUkmvAJEzrjS15FdKcn4sKN6J9OQ0og6lck=
X-Received: by 2002:a17:90b:3cc7:b0:311:ad7f:3281 with SMTP id
 98e67ed59e1d1-321161f1e4amr1051157a91.12.1754071216089; 
 Fri, 01 Aug 2025 11:00:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCufiAuEtwIrk4MYNpS/nkKxgS/INszns4WCKtfrhQYzpgeLZK2wqU3sVv0g6l8Ck4AhkzDQ==
X-Received: by 2002:a17:90b:3cc7:b0:311:ad7f:3281 with SMTP id
 98e67ed59e1d1-321161f1e4amr1051082a91.12.1754071215565; 
 Fri, 01 Aug 2025 11:00:15 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31f63dc1bb7sm7971555a91.10.2025.08.01.11.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 11:00:15 -0700 (PDT)
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
Subject: [PATCH v3 1/7] drm/msm: Add missing "location"s to devcoredump
Date: Fri,  1 Aug 2025 10:59:58 -0700
Message-ID: <20250801180009.345662-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250801180009.345662-1-robin.clark@oss.qualcomm.com>
References: <20250801180009.345662-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDE0MSBTYWx0ZWRfXxozB8pqdSTwG
 FcFlPtCuuT4ZqRFkvS347Z0aIhq04uTpmJ5V1R5ldURIaZw+gWV3bflS7Prvx7K0CWJmVrF+8G7
 TIw8vy2mUsJOcCPimC4KnLoi0mp+Ui/luH/ahAuCplTYi4/AaSDM0HgD42DlPbPfodp5VcTp1lL
 W5LkVQqXJ/jHg5fG3NeMGkFAXQ2/ixVJB57R6i/Dk2IEk+XtOSYjipCMbpWtqQnQkuhUbjG6ehi
 AwoMGWrCxDdJtoFiY+SGDoSfWzr2YpjrxxWp8InBaSbTL8j3tqNNtYzSpzZAczCJEU8dqWl2f3L
 Qn35utM4kwA6Rbx8OzSQNnzkqMs6N3YFEWI4uC6ocLSMC8Q2TArFeQ3uxtGYO/9XuCiX5QmBeuX
 m1iNNXcisL6sxwYHJ9xjKMxDqRM0mSRR3UnSuuVn+eh+uaESZ4iJ+Vi9jf68Hu3VPyWRW4+Y
X-Authority-Analysis: v=2.4 cv=TqLmhCXh c=1 sm=1 tr=0 ts=688d00b1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=EUspDBNiAAAA:8 a=YFM8xwheDJGXjHaRWHsA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: QGAUILAVWhqAhYwruoW5wRHCe0VU0u9l
X-Proofpoint-GUID: QGAUILAVWhqAhYwruoW5wRHCe0VU0u9l
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

