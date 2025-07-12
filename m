Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE47B02899
	for <lists+freedreno@lfdr.de>; Sat, 12 Jul 2025 02:58:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 690CD10EB0D;
	Sat, 12 Jul 2025 00:58:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="boHp7gWT";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1D7510E16D
 for <freedreno@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:51 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BLgluq021884
 for <freedreno@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7sLJEL4Y5lJZguz3eyBuo3UOb2LWXxlleh1DhGvnHak=; b=boHp7gWTt5GjwyVG
 d6rxAUCcj9DL6VBNPZR+42TaXUrC/Fm+CGZQA/7I+YeuA58sxmCBwy6Ukg60fHMO
 UZ0AQVt1Ixdwh4+Y9ZA1D2l64D2XDnn0MnZIaMGzVPlPKDiLVJAd3AiuOApmILVn
 l1hiQwLcNe4NXApwSl+OZz1Dyb4oF/97+TNVyot7yp2kJeIZ8PSmD8BLnfvLae4N
 l351z2l+Z7N+6Gqiw2Mv2ibYKGbR5kadlmLP0MLRLpShOw5ojIcBpKDOKRnuE143
 ISilALVm7hJEWuhJQ+fahJwgvNoGjGG2UrbVDm79OEw1PTLKk4Z3D6iSx4cFYjXq
 qUF0gA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47r9b1b8t1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:51 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-31366819969so2729765a91.0
 for <freedreno@lists.freedesktop.org>; Fri, 11 Jul 2025 17:58:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752281930; x=1752886730;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7sLJEL4Y5lJZguz3eyBuo3UOb2LWXxlleh1DhGvnHak=;
 b=t3i5lq5cYKyzqSvUnigpvbWZmeCCDoUSN0GS5YexgwjLAGS+QJjQ27IVDGV9Wuu1JA
 NsWm2nXY5P1dgT+mLX6DrN7HxPob2KKAaOWM+EDHnLhmcasDZAnXuyT2ApQyyiIi+BeX
 BhMechhYjYm8Btbp6VSyb/WWr2zPPe2zVjucxvrIQhHcAUy6ynMVSvswAQ8guHazj4Ow
 0pI5mQnGE6o3Hi+GwhhHkmyJ3eOPtyqmOdxgZr8+hvY2NFA8aXqjhNIMCY0OwUDH0BiK
 t7G9X0G2d62QgbLG2znSmpSzUrfqQQqsCG0wmFSBTbFANaupGF4fECUVoDH1lcUhq8WG
 4U8A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuUZ5ZKQviR7ekiRJTqcWdnbVc2XcBN0V8rTKVmSn5OyXRtXhZO6vI8fI7yM3vAxVpcXlbje2R6Uw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzD8Zo0tEPOTjyGAYpXqBkguC1YgW40AHiCtS6dRdS/n6fOm3Rb
 U6EzJhULT16fdrF+Sj2DTo5IeIik7+fVjZgETrwSSjl2VcI7H4V5BpgLTR2o28XG2mIrukhLrZ6
 iyaRbrdkzunMbd0dI1B8hjwGG4VG6QzaP5X3bvelNXtjPWEHDkvttAa438Zx0ttRaf+Mmrys=
X-Gm-Gg: ASbGnctLOFt347sVRiIff7WKB9aGxm+7A3WGF7ddz3+6gNDsZXAurzrZic1DeUbf5we
 +wLzVh8AmxLLRdNh2ylGRWEfqPi/hGGtwzZU8m16rR9oEbfzcAEViDNck3tYEh5exGNjYFTXGHx
 AzYxDGE8BBfRvP7+wIjUSmoZoQERY4EqPcQkGMAP21pjvt05hlsrUX6WdeF7uMEoUab77V7bQ72
 A91eJ6UWR44VrQtKt0IBrNEqsXo0CLnA1Pg/z7cc2kE24Pcsmk6CAtSRb5Jv7FvfnornuC99F0C
 wSHcUtEAZ8OO9UlWk+IsKI9MVV50WE9fT4PT20Hf/QaZtT/k/YwEhNEvyJKQJ4rmbp/ztdwI88l
 mi3QEy8d8Qk0ZxgcHT4vuYmfw
X-Received: by 2002:a17:90a:d88f:b0:2fe:e9c6:689e with SMTP id
 98e67ed59e1d1-31c50d7b0e2mr5926411a91.8.1752281930192; 
 Fri, 11 Jul 2025 17:58:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbwePogEFfPtz3jAzJvuYrrBkkmysTcdFzL7yxrfrSVdKodFresGxmdbEN7GKCEIj11A4IDg==
X-Received: by 2002:a17:90a:d88f:b0:2fe:e9c6:689e with SMTP id
 98e67ed59e1d1-31c50d7b0e2mr5926385a91.8.1752281929755; 
 Fri, 11 Jul 2025 17:58:49 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c23006d72sm5202274a91.1.2025.07.11.17.58.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 17:58:49 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 17:58:20 -0700
Subject: [PATCH 15/19] drm/msm/dp: Drop ST_DISCONNECT_PENDING
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-hpd-refactor-v1-15-33cbac823f34@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752281905; l=1224;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=9kVJAzY2UVngycfebqlTXxBWX8Abe2dBrz4IzUnf9Vc=;
 b=CYGPKGabSZ/+TIsiQAZHb2A3eC/F6u/eET7zLcbCthqfB2ue7vTy3EREyb3X+n5CiyHbVY84j
 Y/BXfFJMiXUA/hiWbzM8LmB5YRERO18jZHLTmDJU4AEqP3Ua3kRWLdX
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Authority-Analysis: v=2.4 cv=dYuA3WXe c=1 sm=1 tr=0 ts=6871b34b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=P6Iu8OupbF04u0vqO0EA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDAwNSBTYWx0ZWRfXxPqncvhXQBLO
 Bu6JMzHRAGxYjXO6PKTSnyhv1hrMcNp/DzvX8Vrjgvj/x32zK8suiZsuFco8N7GWTfdCvNdJIS4
 5wiiAt+oIOkPh9B5xHWFFKBDsnDEs6c6HWh/wgE7OANDR8spZ2OlfcszmcUqy2nBYZSSyY1Uiah
 LW5PcwgHN3uJ6hzpkyncYJuFniB5aknxVrty23BL3TGXmOmXi2or2FUv9zSJpLZq9jFLwoINI1p
 y/EDpIMFqsYYqzBooZVS1e5pvWc0GywoKkNYRbkstNt8NPCHWFXGJwF8EWUE5dLiO9mRthhPSRa
 pvYo+dMIOHHhPzvdF9WYiqciVoQKgSARbCVUulFH955lwTxdqkUWheEvUevPwIXPLfKyJNFuGUe
 oJGT2tulA6Q4aEbRk762RyhFsN1DagTF/pNMkltF4si2nLAVx4kIyQ5RfHsiSWRB2ZyoXHJH
X-Proofpoint-GUID: fqDwl6RjWHa3XYY-q5-YX8NcRLA2viAb
X-Proofpoint-ORIG-GUID: fqDwl6RjWHa3XYY-q5-YX8NcRLA2viAb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_07,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507120005
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

Drop the now-unused ST_DISCONNECT_PENDING state. This will completely
remove the hpd state enum.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index c7ad61e96b37..529e30193168 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -43,11 +43,6 @@ enum {
 	ISR_HPD_LO_GLITH_COUNT,
 };
 
-/* event thread connection state */
-enum {
-	ST_DISCONNECT_PENDING,
-};
-
 enum {
 	EV_NO_EVENT,
 	/* hpd events */
@@ -517,10 +512,8 @@ static int msm_dp_display_handle_port_status_changed(struct msm_dp_display_priva
 
 	if (drm_dp_is_branch(dp->panel->dpcd) && dp->link->sink_count == 0) {
 		drm_dbg_dp(dp->drm_dev, "sink count is zero, nothing to do\n");
-		if (dp->msm_dp_display.connected) {
-			dp->hpd_state = ST_DISCONNECT_PENDING;
+		if (dp->msm_dp_display.connected)
 			msm_dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
-		}
 	} else {
 		if (!dp->msm_dp_display.connected) {
 			rc = msm_dp_display_process_hpd_high(dp);

-- 
2.50.1

