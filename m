Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE6CB02892
	for <lists+freedreno@lfdr.de>; Sat, 12 Jul 2025 02:58:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F48410EB0F;
	Sat, 12 Jul 2025 00:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dY6KEZ6Y";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 913AA10EB09
 for <freedreno@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:40 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56C00vIj029937
 for <freedreno@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kFsYkMbbCPAVSW7u1O54kFwQDkZ7UfY3rOuddf3un7w=; b=dY6KEZ6Yyok8JzlS
 MXMes3w4hOlFs5R5zvCfENItM9LnmWWI9vCf1v7XTcuhLV9ZqMozI0xMoI+tYWsi
 Qj8n77spMD8wQ9rDmbLIDp3QFg1PInx20KX0JGBh9nV3Z/r8zf54syIMr+RCNLXJ
 DBr/LH3044abTyvCQWhbn4Mlnvqs6QyNmFvLA29mvAPAU59V7g/+UOc7ufnDZzq6
 q0L8Es/4x3mpWDabV4JR6OW89uL1PEwzJ+0GV99FqPTS1/DrTz+tDSLLijR5uCma
 Im8ZECshZRj3J5AV2xh79u7kX3gGFgoQJ4ouesZiaPR2Os254zLiKJElxymJtso5
 yQUyMw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smbet985-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:40 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-313f702d37fso2783321a91.3
 for <freedreno@lists.freedesktop.org>; Fri, 11 Jul 2025 17:58:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752281919; x=1752886719;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kFsYkMbbCPAVSW7u1O54kFwQDkZ7UfY3rOuddf3un7w=;
 b=s7KVg4N5rjYpFlRPrgVRoC1gH7gQhkHlGdI/480x/8FNbvCwUj1KQmIqwCn+5F4R0S
 pVzDaNTl0PxW2tmOIPXarpm1A6MVGO7uYvddNqQBAmohthTyTZc+5MunCEk6mVZvRVRK
 jzcWzXsf8bw5aNjvlYSSNCprntdUylJ7mESnmZ3/xIx/U2o1qb3d50Id3tCDaaDVEcNA
 dZrY+RcAWdexAFm3jVSrXPCE8bWHv4JvBwWZCXGS/GU28hx/8l4hOV+Ujj2Z8P4pDqfU
 t0B2sdk8OT9OLNgygfJt+z4H2TrggG9MoI/vEwttpHJxYwhSMko1KJKmoVpi7sfPPJlT
 0jxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuxtcTLGqxRh7rGqR8ostKidTKfqJCQofgiQvJuXGqGSZuODyKZO3xsOlUMZFsloMcz2G6ANVWvfo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwX7yIioFPrJ9pJuIcdvvKNgJvGcAlIBuP409BH5R9SUrPHuj9f
 ROMG97mycG+HxBK4Suvb1bN0dEieMn/g6MEWu7OWEiAU4U2fVfildVGco4dilcnVMLT4PK6Zmc6
 bTdentfUKeuJ4vfJeBPMJJjjjv2SSbB95pZcF041OqeXNQCfU8K3vB2sTBNpGYWtWcWU+G0s=
X-Gm-Gg: ASbGncul2Bs27f3tfG0fLK4VlzIuIG3v9N/LjMM2jvQUtcdG2Z3WHtEjV1yckqgLAWf
 ZByoB/cMvEMBuPKISe19T+NJDdVJK43oiVexcG9UjlU4jLlAgZHDDRQ6HWvxgj/pOYBNUt2A8c9
 jma+vc2SBgry4Zik7oxLdV1uWc/fFt/VikAndcPCZ9f1fGPyJt0JEaobxLh2rpxDl0jfW7uyOEr
 mWwxvY9V5BOleyfRDrUta7G8bnZeF1jnm+HxokdsdJJ9Mk/Yxq3VW3czq95UTGLeZYDw+OW8Lil
 0zJx83fubQMXgrGBOxvOjbacwDdQFLNt9HL7KwuEwI6G44OInQJLQ5i9kArDq6k49DB/qwNWwFE
 7ErVZ0bntZIBuDQtFB8Ti7zuS
X-Received: by 2002:a17:90a:da86:b0:313:f6fa:5bb5 with SMTP id
 98e67ed59e1d1-31c4f512810mr7999176a91.18.1752281919142; 
 Fri, 11 Jul 2025 17:58:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG02TDuoELfDpFVSQMxOzUgTbAOCMzQhtQ1BzktPdQH5UUzku4oC5I1fmsVdQV81JzCvjjFiA==
X-Received: by 2002:a17:90a:da86:b0:313:f6fa:5bb5 with SMTP id
 98e67ed59e1d1-31c4f512810mr7999134a91.18.1752281918722; 
 Fri, 11 Jul 2025 17:58:38 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c23006d72sm5202274a91.1.2025.07.11.17.58.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 17:58:38 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 17:58:13 -0700
Subject: [PATCH 08/19] drm/msm/dp: Don't delay plug-in handling when
 ST_DISCONNECT_PENDING
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-hpd-refactor-v1-8-33cbac823f34@oss.qualcomm.com>
References: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
In-Reply-To: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752281905; l=1204;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=PV2gItPOtD2ro/W717vvW5Rzvp3X4mFntv6qSdc7eTA=;
 b=VML5o3LiZxvvLZFWgUSkZY0+K/ladfTLPXoxspXXguFKL4U2pE48BScPgV8l7YOhWVCer66r0
 /K5AxoiYvXuARwR5PkxRx2hKkxakVMScUQFz5NnmG6IJjQoT3UJZfKl
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDAwNSBTYWx0ZWRfX5Ol1P4BBGUbl
 zOj0L+ndXp62AmqQ6nTLgLoQDHO1BZ6Ht8BZozMlg86xfFiLnx1fQpWMOSj3880vPZwXER71tDc
 jAy7ahQzHDDikhK2Smc8s4NwdoVPC9aoaIDc3FqSyvhm48FRnBakll6HIExAe0+17J3wOe8dGg1
 h63m6Wbm776nPvenJ2DCBvgac3tIV0NgnrO/1IkguDqI1iGL4H/BzHK+vHqu7qQkKRtkvnmPZx3
 PNyn2c+xD4RJr2B6dQov2TGWc4nbM+Hk8oTqI7j+ljPo8BhBjEOL4GNGjXYFJxoEQHa9SpZ8aLe
 nKIz5X54olofGxPu5OkQVfhbd+e5ZprP9D9DYXh6w/trP8iueKKaPCToypplG0+PX7J5RgaV8Qs
 Q2rvxZUnZz5bxlIH/XLNy5Kh/zLmQtmmI5W/pU0JCys5QXTNhjWgpbFJ069npClYHRRyPvoz
X-Proofpoint-GUID: Hg-3VZyr0DsfTx-_3Jj4wUuFXkHDfOFg
X-Proofpoint-ORIG-GUID: Hg-3VZyr0DsfTx-_3Jj4wUuFXkHDfOFg
X-Authority-Analysis: v=2.4 cv=VpQjA/2n c=1 sm=1 tr=0 ts=6871b340 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Yywnbx7U6RLlrUaFA7wA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_07,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 phishscore=0 mlxlogscore=969 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507120005
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

Since there is already a return early for when the DP link is ready and
because link_ready is only set after the DP is connected and link
training has completed, the DP will already be disconnect for plug-in
handling to happen.

Thus, there is no need delay the plug-in handling until ST_DISCONNECTED
and we can drop this ST_DISCONNECT_PENDING handling.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 1ce8051b116a..98f5274f123e 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -602,13 +602,6 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
 
 	dp->msm_dp_display.connected = true;
 
-	if (state == ST_DISCONNECT_PENDING) {
-		/* wait until ST_DISCONNECTED */
-		msm_dp_add_event(dp, EV_HPD_PLUG_INT, 0, 1); /* delay = 1 */
-		mutex_unlock(&dp->event_mutex);
-		return 0;
-	}
-
 	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret) {
 		DRM_ERROR("failed to pm_runtime_resume\n");

-- 
2.50.1

