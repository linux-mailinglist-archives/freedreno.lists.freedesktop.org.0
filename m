Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB21AE8B93
	for <lists+freedreno@lfdr.de>; Wed, 25 Jun 2025 19:37:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7103F10E7AF;
	Wed, 25 Jun 2025 17:37:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MgH7mbUO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2638D10E7A4
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 17:37:22 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PD19lN022368
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 17:37:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=YAhoTHSslWHI/eVI5RR5ldeEIDPqTzprLbe
 uErvpeQ4=; b=MgH7mbUOHHW/lCffajxpilJA4qxUyYlkCLaUuiZVb8aCA7+T6Fk
 ApFjTacpyfNDUEkCVTD/RUY17c+GfU+k71KWianbgGvyPooE5tUO88cXmtk6iUwP
 EhMnT9aFRyMss5zu8jaJaIlhKEgnCs/MLtK3Rgxy7R9lCa5HhtSpdfOf1kHkrJXY
 rrhTb879sZiDhCLQ5bOpdHRFBytz0o7HdwNa3/oPQAY4pEcscwtg6oI579IWj+up
 lHLYXhcHezStN9vNbPXXe5rwgCXHgYhNbrfaEaKCRQh2TqW+xpnDGZTC45CUK02x
 rOSInZa4dzgzWZfqmAtAS3p3W5WQ3G6DZVg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b40k4x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 17:37:20 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-3132c8437ffso81078a91.1
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 10:37:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750873040; x=1751477840;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YAhoTHSslWHI/eVI5RR5ldeEIDPqTzprLbeuErvpeQ4=;
 b=PNl4cwg40v2Y4xaAiwcj4od2fpDiWXkc51VJACdRaHbf7CbYStPTIbwBT4hYOyw7ko
 BgXcP38zYa39fS1iVr1KqdmTcl4Rb2gPr338mUzSjAM8RY3ourSPNmLzezP0i9Ira1Au
 oOtZExAJvRjZQ2bFtfGPuQVRKS639JDau757hbw22toMj2ESse3+GDV2g+nCAbdOLaQY
 hLkyzOsc9N3nl2kN5eSRm9EFl7BQLS6q30y0fFgoEmSyo0uw76N4MvyyVv2ilMqOlaY7
 NUjwUN0dsP7GugLuuYBDdYnKnoGyOvTliRDm2DhZYrEXOStGZatD7YYecLToGB4KXIXX
 IdgA==
X-Gm-Message-State: AOJu0Ywc1nizlu9BUZW3DNPuVP9dIYQnvKQgAEQMWJvqrkB5P1NbESru
 qvc5mXSpWLxRw/rgCYk6Vk+9bup9zLLGLDOMutHuZ33BvoSaP5Q7vDBfzJHBgXJqXAHDtAEgi++
 6FqETnCooPxVMEEQf70m+nNSb7ed1sQyjn4/jyqeDZWp1dYF5ddJP/61cQ410OiXH27OLNYY=
X-Gm-Gg: ASbGncvhMQpqrAIm/1hYc2CDepl3Uqemv66NogCTvSXdK6Qn42CFh69pREPVrISdrc4
 jNkiQH9+QUZoMwwm8BR9mHhKLZlFOEess+f2KVJohvS2+3Fip3Tg3Wkik4r5rELA0yYwcQlJ3wa
 oU54hHhhg+BlAY4miOtm28ZqRb/lzXB/ox0xYDJXGO6jxYx7LySSJa/pd+/UCtg7DDk6tPeYq5C
 8X/nqSx4SYx+P8Zcl1IqOZ4f1qcMNrx6e1gy0HJQtX8VBPlnShRm/ZxSzG1CsjdX9q/wd32XDN5
 qz5b4X4qsqzv4z77/ORr41GUR3klts7g
X-Received: by 2002:a17:90b:17c3:b0:311:da03:3437 with SMTP id
 98e67ed59e1d1-315f268d07fmr5817785a91.27.1750873039536; 
 Wed, 25 Jun 2025 10:37:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMKQs3mspG8y9JNMpqoIf2y+cWR9YznGJpkP1ouykLoRzvg0upnUv8nTz+gS2rxDvr0WltPg==
X-Received: by 2002:a17:90b:17c3:b0:311:da03:3437 with SMTP id
 98e67ed59e1d1-315f268d07fmr5817746a91.27.1750873039081; 
 Wed, 25 Jun 2025 10:37:19 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-315f53d9098sm2219224a91.31.2025.06.25.10.37.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 10:37:18 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Simona Vetter <simona@ffwll.ch>, Daniel Stone <daniels@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, David Airlie <airlied@gmail.com>,
 linux-kernel@vger.kernel.org (open list),
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 0/2] drm/fourcc: Add additional float formats
Date: Wed, 25 Jun 2025 10:37:09 -0700
Message-ID: <20250625173712.116446-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDEzMSBTYWx0ZWRfX5IItJYiZKH5H
 465SfJvcbZnGXN3G8kZk4zCBSNI8heh7lNTrh9iU9N8LxO1TUDww19NNzHRceD6axbRP8DFSJYd
 yWfEQcFmKaOLQ7djniDyUtvKYLU6FdX7N/Z1+MEkO+LQ38b9CLr3oA/zHDO/OR5Qc0GW4c3T5vB
 I8yD+BGiwXvyZWk8lTqeRUKLF4gC3Atnru1EBDzPiOqoiNkj/x+1kqlCf4zjv2B2BxjIZ1n2lt8
 tKPLqnDE+kXSTD4M8eifoUrxonjJfPIeJSPupmILE3ka2m4+HBpNrBoIPpup2Bv/O3o1bETfAEd
 ybnlywwmutVOB38t9usapZjmvZbzVQ5tEk23MYotpVMqjyx8Iy+7lkMOJ4R1MVjE3SfTnH3xAJS
 6XdlVw60UZXj/6thMq/RCdblJfoPjFPChECUr7nlD3bpN5McWx1Jf3QuGSm/TP5J+DO2gdC5
X-Proofpoint-ORIG-GUID: t1A33hlbfik38Xs0tg8Qeezh5XBnmhLs
X-Proofpoint-GUID: t1A33hlbfik38Xs0tg8Qeezh5XBnmhLs
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=685c33d0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=wxOPRAE1bK0FDlpJDKYA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_05,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=963 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250131
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

GPUs support 1/2/3/4 component f16 and f32 formats.  Define the missing
fourcc's needed to import/export these formats, and/or create with gbm.

Rob Clark (2):
  drm/fourcc: Add missing half-float formats
  drm/fourcc: Add 32b float formats

 include/uapi/drm/drm_fourcc.h | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

-- 
2.49.0

