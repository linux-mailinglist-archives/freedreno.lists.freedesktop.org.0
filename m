Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3C6AD257F
	for <lists+freedreno@lfdr.de>; Mon,  9 Jun 2025 20:24:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0518610E418;
	Mon,  9 Jun 2025 18:24:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="m4EfG6uN";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8DEE10E3E3
 for <freedreno@lists.freedesktop.org>; Mon,  9 Jun 2025 18:24:45 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55996YXo025339
 for <freedreno@lists.freedesktop.org>; Mon, 9 Jun 2025 18:24:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=T6/1awyVf7eqR9AU36g9BD93UGKtinLFAqS
 HdRSlSds=; b=m4EfG6uNLOS3in7c9iB3D9yYaSBHOYE1bNwECfdGZ9rDht/MgGa
 BubiCZDzL3eHEL3wp40+CVWshA+T6MPwauhU1o89c2Aav+SmAb+vV7v2QjGi0kQq
 hbZF2muokddtS+Yt+YBQCymPWgUKnt5Q1YQ+3cvEufdgUSG+xwIBkfbroo7UGZQE
 AsJFQGIqNAaHl7GvgibvzHhnv3hPXPUhd4VZKoDDqDOMyAZWt5MgfiYuSbu7+jyy
 jXB0TUgxxPZoZaA7cAmfUbcMmTYaa5R1IV17OxOgdWADH35bL0glScLXihZP744+
 dS7aNzzfmsxgXSBqjk0L5/AR1geg9r0s/zQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dgxq86x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jun 2025 18:24:44 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-af59547f55bso2512444a12.0
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jun 2025 11:24:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749493483; x=1750098283;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T6/1awyVf7eqR9AU36g9BD93UGKtinLFAqSHdRSlSds=;
 b=XZkSy2/v/lTZD/BbyqMQ9XlJf9earpOOR3hX3lopFJlFQod9Rtb/vPpocMbICyRlbq
 aBbWWbsXPN1zZuDC01kiFBKXykTfE7xo/Bo+zblZuONyj6am3X2TZRrEBG1adsCWLcTI
 Ygqealw7yVIs3CIrwcO04rqJHZ3GMkjQ78KaVRIBAejWKisQIh5OBb/toHVNcfn+aKjM
 oekEtbjV72x+p4jHj5RHxhezGTdJYVb7zMpnEcKkCq0lNWxpREmAK3y66AqbgbT6EEJS
 HlvwB/C7zPlB+uYAKNFHERlHKd4YBnBd9WwoaF2/04u/5NYd7j8l6368Ptp0B9XzrE/X
 Y95w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUx6F44mTSkJSI3kZ+1EToVfrrZIAjK7TWZyQDfb4sLsFV07Edugd4jwJ2F5LhDd6X90mfr354PeLI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywakjw/ssQPxfsKG7SBXigv2h01jI9EB1Ch6/olEwbT0CMxwOs7
 6yNQoq+awr7tT3WTShTfQeElbSID0VCr/vdInOp7q5GBNHm26xKgr6aAUQd+wDPUwQncJwoLawE
 RTVUlv86lU3iNv4rNnp2oegzbToUufIzARkGM4WhSYe5+iCeRls3+MUk3xxgMNzHljnlkhTrG+o
 /gKGw=
X-Gm-Gg: ASbGncumO7gwtDQRiV1O9Yfh3Vi5q6DMcWbBaTs9u8ZK39QwJ50QjvdyXGUvIqeOzfd
 NFV77AS3KWDgyT3bpefGueLdu7dddcsgwvDvcOhAcrRdUc7rgpbHtW6Ixy7YGd4S9nA5LTYGIVd
 sOieJfMpmOwaZB5CfLmmsID+RZzIqQIU5zp8LDr7bh4ab3DacY0wG9JYE1DnMnkMW9h+lsJTKit
 U8xbfzF54QpX6+mNga99Y4p1xWDQKPx4TRGQZhSMqX9AunUf56lefjftJ2lEqUHSB1S+/OmO9VV
 sdiUd8U2b42CEd2kX8tH7ShhU2///mqw
X-Received: by 2002:a17:90a:dfcb:b0:311:a314:c2dc with SMTP id
 98e67ed59e1d1-313472eb25cmr23479192a91.14.1749493482779; 
 Mon, 09 Jun 2025 11:24:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAvo/tjXFuiSwnF2ZVZMq2U5wnwRopkRd0199rUIbodRRW1lfymiGSTQN+R3i5xVj07EsO2g==
X-Received: by 2002:a17:90a:dfcb:b0:311:a314:c2dc with SMTP id
 98e67ed59e1d1-313472eb25cmr23479155a91.14.1749493482379; 
 Mon, 09 Jun 2025 11:24:42 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23603092640sm57210175ad.54.2025.06.09.11.24.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jun 2025 11:24:42 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 linux-kernel@vger.kernel.org (open list),
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v2 0/3] drm/msm: Better unknown GPU handling
Date: Mon,  9 Jun 2025 11:24:34 -0700
Message-ID: <20250609182439.28432-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xxJOdZzaaj6z9QoAW--kEksoGFjxA0k5
X-Authority-Analysis: v=2.4 cv=HMbDFptv c=1 sm=1 tr=0 ts=684726ec cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=JEju956KdHHbcqjs2oUA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: xxJOdZzaaj6z9QoAW--kEksoGFjxA0k5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDE0MCBTYWx0ZWRfX0km3Nc7JHEIM
 PuOVvS08GRI6jxsA0JX/rN383D0NeZHVMsz1qZhADAdpLQjXp4uCkjbeYvVMUQYYYGO+SSlfZKP
 TaOx4LFJDURPN1puXrNb88fmlrHP9bXYQ5V2EMCk6ZoUjO7CCHdmY2ZmSdKwVkFpkZUKVxqJays
 eupXlPU9Yl3DQx54VGivDEYy8s5pnpBZg/bCKLkGU0lvuEjeONw0xuywWQj9rgOSGENYpeQ+KJW
 zWRhZ/Sm0ddhJUJG845j3th1ev+pJU/RWPjKAHeb5bIUk4nZEQRT+5z5RXqWaacBbCqxcE3I8iK
 z2r8qD2E3uNl7c72svGF5+lTWpWGDriTI5ZC4mz5vmS3XnMgyqY2hkSr8rrSAhBGX+7NTQX833L
 BtzIoxsKfbd/0Yw89u6GpT1sg3udImYgPoU7SsResSaqEQq99AMZTJubeSCi9qirdFXEjroR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_07,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=671 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090140
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

Detect earlier if the GPU is supported, and skip binding the GPU
sub-component if not.  This way the rest of the driver can still
probe and get working display if the only thing unsupported is
the GPU.

v2: use %pOF [Dmitry]

Rob Clark (3):
  drm/msm: Rename add_components_mdp()
  drm/msm/adreno: Pass device_node to find_chipid()
  drm/msm/adreno: Check for recognized GPU before bind

 drivers/gpu/drm/msm/adreno/adreno_device.c | 39 ++++++++++++++++------
 drivers/gpu/drm/msm/msm_drv.c              |  6 ++--
 drivers/gpu/drm/msm/msm_gpu.h              |  1 +
 3 files changed, 33 insertions(+), 13 deletions(-)

-- 
2.49.0

