Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0737C1D99A
	for <lists+freedreno@lfdr.de>; Wed, 29 Oct 2025 23:39:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6590210E865;
	Wed, 29 Oct 2025 22:39:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="o5PE654r";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BE0BPtup";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D01410E865
 for <freedreno@lists.freedesktop.org>; Wed, 29 Oct 2025 22:39:18 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59TEhT22816961
 for <freedreno@lists.freedesktop.org>; Wed, 29 Oct 2025 22:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:message-id:mime-version:reply-to
 :subject:to; s=qcppdkim1; bh=GfdCtPw6bPLdCz2NJuxw867HbnVEAsAQfof
 rlLygFHs=; b=o5PE654r6jeWAa6TqxIJIVAdka9eSdSsWJ1niEo8c4aK+oSovCu
 ByF+2PeXEN5rJVUcQ71nP4xmJDoWebM/BfMKTztuiE9aGHWFiv9uXUqv3YbpTEhF
 rEJ4lwNliTZpmt9xXPbHEsNM1vyrDo7XKFPt9Rn2hXQ62lRvwz1zPA+WGBhwnb5K
 X3mUfNG8mOmpciFwcvOBlLllMyQN9TNAKw/eD+JRG9Y9ge12PYylc9ar71E/A3o7
 DBoLEMRe6HQU/6SpFllSLOoIyCtoBwextaZUhYLCQ7K9+aEc/eEZhtJRBZu1TkPa
 G/FvgRcdZ9t5p2lnkcVoOQ/+c74fUZp6yrg==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3mxghf01-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 29 Oct 2025 22:39:18 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id
 46e09a7af769-7c68695805fso115795a34.2
 for <freedreno@lists.freedesktop.org>; Wed, 29 Oct 2025 15:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761777557; x=1762382357;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GfdCtPw6bPLdCz2NJuxw867HbnVEAsAQfofrlLygFHs=;
 b=BE0BPtupNHiWgSysgdAtt/pKITqam6sOH6PCerHjwnmSgRnay8BOJWHIoATkg2aoDE
 LSHz8GLqMNxMxcQ2m+hhXERt7iX7m06yLPF1ZNkybzbmHq2ejQYMvBC/JDEEnhN84+7O
 0gnuqlUPbIsRBUCPd02GF4Viis0eTRGOmIiHZnjTiiGr31ls3gKdRYjltC0OvgNAn4B8
 50T2XhzBMpO55HEyA/T0B/9ZIhv8os6aHaQHwtVOPCFVd9hLzezo04GpxiKFOgiA+2le
 PeoEXmP4GpPEAj+lfVtfOtgCaeHimDBU0vYMeb9UoG91+ccsfqEpw2B9Y2mQX5taq3C5
 abfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761777557; x=1762382357;
 h=cc:to:subject:message-id:date:from:reply-to:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GfdCtPw6bPLdCz2NJuxw867HbnVEAsAQfofrlLygFHs=;
 b=p5MZwgFkKi2bEno5j5OqqnS8CBvZ7b2xNKeDXg2lwgymXAQ++LlgOX7u24s9XQ2hqo
 Nmv1eTKpTlb9ivLP2gRrb/F5zLv69g5kobPDbCqbZ8YTEA1J1BQwrMd5FJ9bHSGtmuHL
 pYMVAjWniDoKWnwRA9UI6gSNnhKcxh4DMgKEgrYcDwKBL6kzCJhn8rIwAuBSG3Y0gOBI
 7z5pXur42YV/EKExB4UlASFCOglHE5o/wVRE0nglSMnPMM6H5kXzXpxQCbocJWCHSXij
 qgMKEwdaf5t1o1igSkQiHbwMUMlsQcqkqNHhnPeIPDwAC9XXmKV/iCnRneMlnIUXmDKk
 FX1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpOvmgXuI5TjFcSsOgkShZlzc7smuWWjhadx2UTrgvBlQB3suS55y6HG1hCtryW4jrTmd4z4JDYvw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZISLzK75hQfg8Ve6S0Jxb+t5ODrf8fG2M+oheHoqhzZ3DS7Bd
 H+t9Pann/DEJeNifHm+cCCqeaMJMBgffaxvS4VpcMfkhV1TQwxbESu2xqOrPr+6cue7Ar7+0zo+
 VhSYnqrMUdpyJcn/5Es+wnMNtb06F7x4aGang0PXMiWi7Y+GOEatVrHb31npssfNrkPdnuMN3Z+
 kBbCEf+Iqdwt7WwlvWTetNisJ0gIVGS7xRV9DReY0W63LIhA==
X-Gm-Gg: ASbGncvZk1H7Oj9qVS33RZJUSzN6Kwz6lkPS2wH+evNXhJyWvgBIXUNiPyzXyHnwPgC
 DO6VsFNPtXlyVSIor1lGzj9pPwho4oASEEbVsRJK1jeuoDHrEhTPt4J74UDXtGMCNItSev2218R
 rmnAK0WDD2tRrzEXoZ2BE0LP29jOqr/NC3s1Sap860LcGSSW/El4uo7YaU8KxiXjsEh1NdIDPkm
 bqlM/tB++D525Y=
X-Received: by 2002:a05:6808:23cd:b0:44f:6d6e:4cbe with SMTP id
 5614622812f47-44f7a8e3956mr2136732b6e.67.1761777557270; 
 Wed, 29 Oct 2025 15:39:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3HlkupTvqJYVRFTeGTmjSeesA7cTPEVXZN+CwCSgAzsEOafg+rPeCALbQcVcumNLTVJLdN28h7dYrU0JDb18=
X-Received: by 2002:a05:6808:23cd:b0:44f:6d6e:4cbe with SMTP id
 5614622812f47-44f7a8e3956mr2136725b6e.67.1761777556887; Wed, 29 Oct 2025
 15:39:16 -0700 (PDT)
MIME-Version: 1.0
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 15:39:06 -0700
X-Gm-Features: AWmQ_bnkiKNoJ6RaDb3we3GgsgfEjFtJn4lSVSRUYFiGDnEd9Np8oOhF_7syvL4
Message-ID: <CACSVV03kUm1ms7FBg0m9U4ZcyickSWbnayAWqYqs0XH4UjWf+A@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2025-10-29 for v6.18-rc4
To: David Airlie <airlied@gmail.com>
Cc: "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <dri-devel@lists.freedesktop.org>, 
 "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <linux-arm-msm@vger.kernel.org>, 
 "open list:DRM DRIVER for Qualcomm Adreno GPUs"
 <freedreno@lists.freedesktop.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Vignesh Raman <vignesh.raman@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=AuHjHe9P c=1 sm=1 tr=0 ts=69029796 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=8ni5ubgBzJBEx_E3fT0A:9
 a=QEXdDO2ut3YA:10 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-GUID: -idifWkKPkZv8-w0rdgtvd89G1WdlIyZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDE4MiBTYWx0ZWRfX9Zibgipuh2c1
 NcS/mgArfuk9MMTJk3eAH9uJgtOH60uy8/rq8bmGMjBFhz5jwkk2ox2nGmKBXxcuGcuHUL63ZON
 OOPl6jPRnZeeIBS6yJHmdy7ji/5IdmLszDOi+iCErjJF0rgL0LGBZx0DBxlHXzxZBQvrTrxWnE+
 8OR3fMlJaCoLhQ5DV5l5uPzxkAsRyvlCBz3wGg1FqCkThxnFYAQ5rwVPI6j9z6NXfirUOF9vaxV
 YaMPT7HMw3z+yEa4ek90HKclKGtNZtYgqI444lS4fyd5bFLz7+sAIakdAefeL+pcL+is9n0Zw/G
 /VnE9KTIAm9FRw0mwQNUbQEoEkRs48G5lO8ZyKdyme5BsfSIy0vG7Z2BPj5WSlZ6qzQQSVRMBNS
 AGK2un6kXnK5e9ESKesRsrxCyYMDIQ==
X-Proofpoint-ORIG-GUID: -idifWkKPkZv8-w0rdgtvd89G1WdlIyZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-29_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290182
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
Reply-To: rob.clark@oss.qualcomm.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi Dave,

Fixes for v6.18-rc4

The following changes since commit b5bad77e1e3c7249e4c0c88f98477e1ee7669b63:

  drm/msm/registers: Sync GPU registers from mesa (2025-09-10 14:48:12 -0700)

are available in the Git repository at:

  drm-msm-fixes-2025-10-29

for you to fetch changes up to f5d079564c44baaeedf5e25f4b943aa042ea0eb1:

  drm/msm/dpu: Fix adjusted mode clock check for 3d merge (2025-10-29
00:20:47 +0200)

----------------------------------------------------------------
Akhil P Oommen (1):
      drm/msm/a6xx: Fix GMU firmware parser

Anna Maniscalco (1):
      drm/msm: make sure last_fence is always updated

Jessica Zhang (1):
      drm/msm/dpu: Fix adjusted mode clock check for 3d merge

Neil Armstrong (1):
      drm/msm: dsi: fix PLL init in bonded mode

Rob Clark (4):
      drm/msm: Fix GEM free for imported dma-bufs
      drm/msm: Fix pgtable prealloc error path
      drm/msm: Reject MAP_NULL op if no PRR
      drm/msm: Ensure vm is created in VM_BIND ioctl

Vignesh Raman (1):
      drm/ci: disable broken MR check in sanity job

Vladimir Lypak (6):
      drm/msm/dpu: Fix allocation of RGB SSPPs without scaling
      drm/msm/dpu: Propagate error from dpu_assign_plane_resources
      drm/msm/dpu: Disable scaling for unsupported scaler types
      drm/msm/dpu: Fix pixel extension sub-sampling
      drm/msm/dpu: Require linear modifier for writeback framebuffers
      drm/msm/dpu: Disable broken YUV on QSEED2 hardware

 drivers/gpu/drm/ci/gitlab-ci.yml               |  2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c          |  5 ++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c        |  7 -------
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c       |  3 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 14 ++++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c         |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c  |  3 +++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h          |  1 -
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c      | 18 ++----------------
 drivers/gpu/drm/msm/msm_gem.c                  | 10 +++++++---
 drivers/gpu/drm/msm/msm_gem_submit.c           |  9 +++++----
 drivers/gpu/drm/msm/msm_gem_vma.c              |  8 +++++++-
 drivers/gpu/drm/msm/msm_gpu.h                  | 11 +++++++++++
 drivers/gpu/drm/msm/msm_iommu.c                |  5 +++++
 15 files changed, 59 insertions(+), 43 deletions(-)
