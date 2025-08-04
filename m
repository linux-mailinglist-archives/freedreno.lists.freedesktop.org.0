Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDF3B1AA73
	for <lists+freedreno@lfdr.de>; Mon,  4 Aug 2025 23:43:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0847710E45E;
	Mon,  4 Aug 2025 21:43:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="U1I2kJOX";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59CE810E45D
 for <freedreno@lists.freedesktop.org>; Mon,  4 Aug 2025 21:43:21 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 574H0bo4022700
 for <freedreno@lists.freedesktop.org>; Mon, 4 Aug 2025 21:43:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=Es8yYGkoaL9WsWMGWRUXzp1VH7ftdQ84HcS
 owvwXJBw=; b=U1I2kJOXu5Ur4+sTw5Sjtrk6MaCayoLLEJ7Y3QgF2BJtdTpyCSy
 1ibQv0Xan7sDVGeT5SdNiPJfB9RfP82+zQ/K9kDoHoXQGb8fS9s1DFhAfx/kd7Fe
 KyWn42hhOhM4+kZcA23Ky7/8+f3sYt+Mk0ZdOWAZz6dqS+Oh3PTBDlhoYCuPzyH+
 f49Lgr7QfXcZf8FLh4GrwMeWeknEt6yzoZctsFOi8HsP4nc1D1/N6L2YJ0zc3uId
 gVTOQG4nijVeiO4XrLNcpJhoq523VzB+QZqXEPAYbP1HU+lfhL/hppHEdsuWkC9D
 1dkCL0sQDAUSfSDhwcRjeeuSOt7vy5yLtGg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489byc6a8k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 04 Aug 2025 21:43:20 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2403e4c82ddso36418315ad.1
 for <freedreno@lists.freedesktop.org>; Mon, 04 Aug 2025 14:43:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754343800; x=1754948600;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Es8yYGkoaL9WsWMGWRUXzp1VH7ftdQ84HcSowvwXJBw=;
 b=dCNG2Ez+r6AJO47S+fS56vt74kAqX4B0QmlJWPI1ocpQtn4x6iqevy1pu79mnIfwWe
 WfDeVKg8sm8MGS3A74+D1AVFBs6Uq3ppzdm0R0oejtfK3AKo18gdqqLJTxZSWwGBp42+
 ZCxX/FwRa4tHNTUwUggF2roJoLVzoBTt4VJctltqe6iHBjfqqJtw91t8bbg+m2HK2MJh
 cEaFJ6jDRjvd3fyNbt982K3ipWmapSuJbL70ZJJPDC8wCJMs/wC+U/FNsxVYLlTzTHKT
 Bn/VlC0nih5eZJMMf2NJGZ2HnoSJXXmy2uJcXzp0IPzX+VNVtBd+RL40+laPvYLEWS6g
 WCaw==
X-Gm-Message-State: AOJu0Yy7s0m0u9Orhj7JzMyQt96UV9aw3kTy2Tcm3dM8pE7FzxuokXxr
 nvDmTzcx6xtPLPuv2rua6syQtZ+TSVqhqR/Fry9kZODS/geRG4YvdJFyZ2Nz9bBGIuRXpPIwXzd
 HmbFUqqqBOtsXQ1nVRTk7nQyvw5KcBNRcH6Zo5vcwjQJUG1HN3RNssewQt/fGAaXitd3srSg=
X-Gm-Gg: ASbGncsDU0qcKNI1xHqxT7Mlp0u9PqN/+wSNQRD7DrU6ZJG7lws0qECONou7evdbc/o
 eHp6qeR6u9ZnGdjJbf86Ts6ET6BlgsqX8SFRB+EoPu8g4odGj7NmPh9S56Stf2xfXHcKfzadb/h
 Kcw/E7t80Rbl5mxmemwL3GVbORJSrknRZ6vzPEIx77vxLbxiLyuYB4gon28v0dsKdn2lZDLQJiM
 cfIvvt4L5DuDTQx0c48T2SMggcs7qpzqJvHDbSxSWgrUudCigSMjZSPcjZOzwwnY+U6HD9pxntV
 15LDT+xxhtPhRxG6vYj5Et+/VGbR/+ErH/XECdscxmkUuL4V/G8=
X-Received: by 2002:a17:902:db03:b0:240:a559:be6a with SMTP id
 d9443c01a7336-24246ffc07fmr168919615ad.34.1754343799933; 
 Mon, 04 Aug 2025 14:43:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMENcFBVOU5CPFNiVaukbmJxZDsOzIZHTpJidiDWnGmFiPem5d1xxZ1nYXWM9QrZ0SYd5T+A==
X-Received: by 2002:a17:902:db03:b0:240:a559:be6a with SMTP id
 d9443c01a7336-24246ffc07fmr168919345ad.34.1754343799505; 
 Mon, 04 Aug 2025 14:43:19 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8976cfdsm116217775ad.101.2025.08.04.14.43.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Aug 2025 14:43:19 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Danilo Krummrich <dakr@redhat.com>, Connor Abbott <cwabbott0@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 linux-kernel@vger.kernel.org (open list), Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maxime Ripard <mripard@kernel.org>,
 nouveau@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO
 GPUS), Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH RESEND 0/2] drm/gpuvm+msm: Handle in-place remaps
Date: Mon,  4 Aug 2025 14:43:14 -0700
Message-ID: <20250804214317.658704-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: AMZbSiYhO9xJxhwklkaNhuETWlmdYcb7
X-Authority-Analysis: v=2.4 cv=Y6D4sgeN c=1 sm=1 tr=0 ts=68912978 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=r9eiMqSCUvIwoLEqkV8A:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: AMZbSiYhO9xJxhwklkaNhuETWlmdYcb7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDEzMCBTYWx0ZWRfXw/b6HSKgCfko
 ybzdA+vka276i1Ns5zJDfQXBXZPYnTZWusZfREDDqcmIECs2rzwmOzx2kAf9OQL+0f219EfVf3h
 vn9YxwDpfQlaxtbXdO23mFr+9b6jJXLWXEf9qCRjClvAwsfZkZchu1hVrUTeZ5XAJvyHgf9GU44
 H8aaP1SFhelK7enZqJ/qTa7hMGt2Tz0NDK9eHB9HCQ1pOEZtBh/VqXmhZV/VWpcvUEVz1Epy+vs
 ApWUvtUuKeO2TAkQZP+wJZvHnJtc+5/9Usz1EpGzTekT4+/FHSOdNdqbdN6Z6qFoucCyJ+C6xzw
 asLPH7g3HmyBhVohpKopGiryfAIkIufCQ0eWI6fG9+2nXB1URqc9qhmdNrfdIcu5r0PE0vJhySj
 l0RUyhw13yNERljNTLpqNAE99KdSE/t3cm8ejWuAET6z/+K8GtiwgoJ0oqth4eCnygMN39zy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_09,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=715 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508040130
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

turnip+msm uses a DUMP flag on the gpuva to indicate VA ranges to dump
(ie. for devcoredump).  In most cases (internal BOs like shader
instructions) this is known at the time the BO is MAPd, and the DUMP
flag can be set at the same time as the BO is initially bound into the
VM.  But for descriptor buffers, this isn't known until VkBuffer is
bound to the already mapped VkDeviceMemory, requiring an atomic remap
to set the flag.

The problem is that drmvm turns this into discreet unmap and remap
steps.  So there is a window where the VA is not mapped, which can
race with cmdstream exec (SUBMIT).

This series attempts to avoid that by turning an exact-remap into a
remap op instead, where the driver can handle the special case since
it can see both the unmap and map steps at the same time.

Rob Clark (2):
  drm/gpuvm: Send in-place re-maps to the driver as remap
  drm/msm: Handle in-place remaps

 drivers/gpu/drm/drm_gpuvm.c            | 21 +++++++++++++++++++++
 drivers/gpu/drm/msm/msm_gem_vma.c      | 17 +++++++++++++++--
 drivers/gpu/drm/nouveau/nouveau_uvmm.c |  3 ++-
 3 files changed, 38 insertions(+), 3 deletions(-)

-- 
2.50.1

