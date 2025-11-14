Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F6AC5B2F1
	for <lists+freedreno@lfdr.de>; Fri, 14 Nov 2025 04:44:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C98989950;
	Fri, 14 Nov 2025 03:43:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IwMh9cbb";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f/adqW17";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A37389C7F
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 03:43:39 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ADMaj9D1703670
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 03:43:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=mtv+8EhagHKvGGr8Q7UOic
 IGOvkdKrYSjC6CU8FsMI4=; b=IwMh9cbbtfAbVgc8f7TVeHElqknQclxr1GlFLZ
 QLRdYU1xV1HIH8HFUbK5Cd32OI8/CUiIh9NbqP9gxMnP09o7/Lwl2zeBPCWW0V6J
 BtsX4a049fLK8zeXRqcOmVH4hDPwX5jLpG43kDAo/gqOVxs1aWga6KVH1MqetkGF
 yq7fEcSINzDOkZW6bkbyJBMx/F604ScCkqkyKyT6bQHR+UaY/cyP+qieGaJUlqpQ
 54FyXILfTeqvc3McOMnMMKTXGnqq/rYjGsX5wmrf5KWQTPl0Elu4J+2qF0g8cmUP
 /xByGBYMJH5uAqxwz4PSFO9597v6Bqo7wCgE2sUisN3d11Nw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9e8qec-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 03:43:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8b23a64f334so497073185a.2
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 19:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763091818; x=1763696618;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mtv+8EhagHKvGGr8Q7UOicIGOvkdKrYSjC6CU8FsMI4=;
 b=f/adqW17wvztjRz+GQ1R8UM4eYQHVvFgTEknKROl9lRutVj1rOJ3pFl7lEsQaOUApz
 USON2Ai+EkfYllB6OZRUtBuGGcd4ra9+jLFDIYOijAB+2VqkIds97u4mfmhBNBga7rtM
 WLgQpqaJ2eOQzKzyT/olX1R2U/an+erhhHbXb19/UKYS5M7tcVaFXHjKofV+DRELFgCO
 raEkauIZbT1JzNevMiAkdYIv+ZJPo2Zzykh2nwsCLjWKtKtClung2N7af0BUgeIaaJvL
 m8Mq5QklUiXJViJswOhhK4IgV9Qdy5wd9kL5QHVFnz8sVkRPJChvTM3pgRRRCW1pOB9t
 5u4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763091818; x=1763696618;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mtv+8EhagHKvGGr8Q7UOicIGOvkdKrYSjC6CU8FsMI4=;
 b=kQQCCQygxJIe1iMIqE9iDKz3LfofRGIvWc0o45HAEFzFfewaqpQ+sfk0U1k3pcDl1I
 69cQxwHbs4CgBB8GXYgoPL1oixfShE2gZkdsTMLTytj+OniOnuo4o47nQEejSvLd4Ox8
 ubuj19Ad8T2wpI2gXp/J/x2FZr7s3rQ1wSoDtsCrNQaUqzhl3ZmfLls1Jls4Sd+WJEjF
 WlZyUPxd3xyUX5Tz5XdHo5r0/3WquTrj58p7OU+xf2NVa0jRtnRSuW9qtmOnHwQDp1EA
 sp0p9NvtpyOdwwAmsiNcgT4r71QnPhROrMIJhlQ9Uz0YDhLh/hedw3YXAzZfaMkEOen+
 hdTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5tOucJFFCe7RphXfwkRvZblX+1/ZBB99j3bkuZ5Jl2MxJosMF1BnJSJMHcwsgnIVd0DKKRYnJKX0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9klRkJNPKDtHi4PIqU+8U4BjMV3QOge5MFPDfM2b80gVKy4BX
 HLhA0PenPh8TkQ1w1t3dp8FUy2eGrPl0UqzOuDVSOvpeNcuc3P55IrZl/pfD7NvLHNs16OK3Lrx
 IC+lrTt4Evn1dmGZqFZ4Fjtwj4co29SwqH6D8vRMSFNYkBK+LORlJtE/1d1z31slAIsApPSE=
X-Gm-Gg: ASbGncvfNZBheycR6X9SuP/Ok1I9BWFtyjttX0ZWJpCzBXFwVuA1K+rsZcKxC+tf7JL
 o78KXkRDBjLxTF43as86USdySiB5/NlTu/o5s+R3ypPGrkd3PpuKN1rRAQItSEreR4EhnX3Plb1
 KOufRGWmgkNyyFaHEvotw2nJv3MniuQMjB4Umitk+7cumRjpEyu8x1xFnmp+fVgbQt0FCW2+DC0
 Abw1zMhB58dpzF8no5xQ1DC/3gesptybb/jIBcLLL18ha3fKU37MXiz2kky4ZKOdZlyXsfhFAqA
 J0Ii7+EIgDW5mJHl1iMGRdJXUV7+9ak3fBelXfPiX24Gevrw1hdcGHHIVZZK5/FbM6KtNMuzta6
 zrHQrbFLa+LoScPFTfEtWSRWOnu7dCV4oU0avrpecqfG7zQYDZ1dMTzan1p3aWt6uk7rzWH1L2Y
 I+BxWilrP3klOB
X-Received: by 2002:ac8:7e86:0:b0:4ed:aeaa:ec4d with SMTP id
 d75a77b69052e-4edf215e3f7mr30317971cf.77.1763091817473; 
 Thu, 13 Nov 2025 19:43:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGkCf90PNJaJisIe8fXiiAkfLJ0FuBztAmHnHj5XsWFwPvVi9xjN+CMEzkU6HeCl+PoDf2CKA==
X-Received: by 2002:ac8:7e86:0:b0:4ed:aeaa:ec4d with SMTP id
 d75a77b69052e-4edf215e3f7mr30317771cf.77.1763091817016; 
 Thu, 13 Nov 2025 19:43:37 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5958040575fsm800713e87.84.2025.11.13.19.43.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 19:43:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 00/12] drm/msm/dpu: rework format handling code
Date: Fri, 14 Nov 2025 05:43:27 +0200
Message-Id: <20251114-dpu-formats-v3-0-cae312379d49@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF+lFmkC/23MTQqDMBCG4avIrBuZxFi1q96jdJE/a6Aam2hoE
 e/e6KZQ3Ay8A9+zQDDemgCXbAFvog3WDSmKUwaqE8PDEKtTA0NWYoUl0eNMWud7MQWCuhSGayq
 obCAtRm9a+9612z11Z8Pk/GfHI92+x06kBAnHFqUsqKxVfXUh5K9ZPJXr+zwd2LjIfkTzT7BEV
 OJccWS1Qn5ErOv6BXm/KmPwAAAA
X-Change-ID: 20250705-dpu-formats-0d5ae4d1a1b9
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2111;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=FAspQ5te7jCD3MII2t3C1Xb9BvYL+gFWwTvuI21RIkQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpFqVkJq/WsTptHImH1+zzrsWvVHNdYK/d/6Mak
 yMR/RIihOeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaRalZAAKCRCLPIo+Aiko
 1dJ/B/9LsQjUuvstnTJ3Gu53nRpReK+fnzJdt/LeyMCZFxXwwQQNoXXc01qYAwLIY+Xoev/vROx
 A/P6NxL0Xk3LWTf8KvlATvOMMUmkfs8SHbg7AonsMvhRCeQys5f9CQoY1RZR8/m4hjjJlF/GqzE
 3r1aX9gVjvK49QkTojGaL1iPUVld2sUUovOKisCpEQTcq8BpWLZ4anX0rxCBDySUytKR/V0NPPW
 fcI/ZIJP2w0bfaA9zr0VUiOjd9zz0uQ/lGD7LnhQOCh+LDqPJsnzziWyR0pFmJo4EciIyshxXsb
 h6tb0ZIZHkRzymcmv5+cQpv/+TURyim5lRPkNynsKdLeGjrd
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=ccPfb3DM c=1 sm=1 tr=0 ts=6916a56a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fDhhjkJkotr-cB4PFRIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: OBnVkpWe1RKYFNJ-CR6HgLXIsm4YBMMB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAyNyBTYWx0ZWRfX2aC6/otY1uUs
 Je6DoThqBqRqGyuiXXP78KJhpwIlXf7ri4oNuZ7o/cOfQnhBwfeV6pOpQ0l0gBIv6SN5FXWHclJ
 fFtEESRueb+H+W1Ptf6SPSYzjA6aEel2wtAWaEeAVzVjj6pYs5cuCtx6uDT1t3DBnm44hQbcDA7
 jyGWueEomvrLivC4jO5dcrPDgd+gH3SBdPn3nbH+ht3umc3hsGB7KZr/pMHfHMZ4BaYUdHMdyHn
 stXWeJO4f1WiFdtebXRrgsShW7AxDLgUiwV4GkVJnACjOQ5pD8/KsIemdU+Q2A0Z0olrM5H32hM
 oVJmplCW2Oik+sf112W86yI6ArbQsq1cUJnU7ilE372rsyINJ1PDLUnkNTUkEhMlRrYDEQHYDJF
 z7ql4AgTBGzBkhkD1HQ90eBjQd8xxQ==
X-Proofpoint-ORIG-GUID: OBnVkpWe1RKYFNJ-CR6HgLXIsm4YBMMB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140027
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

- Rework mdp_format.c in order to make format table manageable
- Rework layout population for UBWC formats in DPU driver

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v3:
- Readded disappeared YUV flag to PSEUDO_YUV_FMT_TILED
- Link to v2: https://lore.kernel.org/r/20250905-dpu-formats-v2-0-7a674028c048@oss.qualcomm.com

Changes in v2:
- Dropped DX flag from the tiled NV12 format structure (Jessica)
- Changed round_up(foo, 192) to the roundup() as the former one is
  supposed to be used with power of 2 argument (Jessica)
- Fixed undefined varuables warning in
  _dpu_format_populate_plane_sizes_ubwc() by dropping the always-true
  condition (LKP)
- Link to v1: https://lore.kernel.org/r/20250705-dpu-formats-v1-0-40f0bb31b8c8@oss.qualcomm.com

---
Dmitry Baryshkov (12):
      drm/msm/disp: set num_planes to 1 for interleaved YUV formats
      drm/msm/disp: set num_planes and fetch_mode in INTERLEAVED_RGB_FMT
      drm/msm/disp: set num_planes, fetch_mode and tile_height in INTERLEAVED_RGB_FMT_TILED
      drm/msm/disp: simplify RGB{,A,X} formats definitions
      drm/msm/disp: simplify tiled RGB{,A,X} formats definitions
      drm/msm/disp: pull in common YUV format parameters
      drm/msm/disp: pull in common tiled YUV format parameters
      drm/msm/disp: drop PSEUDO_YUV_FMT_LOOSE_TILED
      drm/msm/dpu: simplify _dpu_format_populate_plane_sizes_*
      drm/msm/dpu: drop redundant num_planes assignment in _dpu_format_populate_plane_sizes*()
      drm/msm/dpu: rewrite _dpu_format_populate_plane_sizes_ubwc()
      drm/msm/dpu: use standard functions in _dpu_format_populate_plane_sizes_ubwc()

 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c    |  174 ++--
 drivers/gpu/drm/msm/disp/dpu1/msm_media_info.h | 1155 ------------------------
 drivers/gpu/drm/msm/disp/mdp_format.c          |  614 +++++++------
 3 files changed, 391 insertions(+), 1552 deletions(-)
---
base-commit: b179ce312bafcb8c68dc718e015aee79b7939ff0
change-id: 20250705-dpu-formats-0d5ae4d1a1b9

Best regards,
-- 
With best wishes
Dmitry

