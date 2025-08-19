Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BD0B2CFEC
	for <lists+freedreno@lfdr.de>; Wed, 20 Aug 2025 01:29:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00C4E10E228;
	Tue, 19 Aug 2025 23:29:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jirj354E";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE2E210E227
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 23:29:14 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JL0xAd026206
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 23:29:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=a+ZaKXx/xL/
 u7Q7T4LDwvQWGaQFWySGiqB6JfEfEJwE=; b=Jirj354E7t9/WYXwpWkvWD4WCn5
 dpa/J7/+4TNVg8H2Lm/r0XJ393CQ8TPYNODaVYKMUxDVyAZjq5CGqRiYjtxBpQnd
 McbHaNFmVX3RVySxqIuihWfl94LBgw41JLqxpGan/r72dTZ4DsB65XSkROp/sEoP
 EKZATlStJRu+O5zmofpSgNBUmmeqVmOXLGkNTy92dtPcIgtay5EuV/FX04GQUZ69
 VdTlijBW+IbtWggczmzhhHJ0d6++C7FsjG6jJDfJXN8I7S4uuDS2qUbN+xowy/gJ
 4ttwVJohJRbttq6r6NTSILxPFJJdON+3uAHauTBZb5R8a0RHZQfDqcAnnzw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n0tf88sj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 23:29:13 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-76e2ead3b51so10783659b3a.2
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 16:29:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755646153; x=1756250953;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a+ZaKXx/xL/u7Q7T4LDwvQWGaQFWySGiqB6JfEfEJwE=;
 b=Cu/uJzydyqvRvMWb6v7zVNy++Q2zOwICwuVZxPDf9EicBCu3B8bl3qiGUNw36uJiCz
 9k340+62RYk9M6OE+0Ysx8ym/OAJmaXdtqdVFMpe+noAFZwbbIMjvtBQ3BJTe226gn+p
 7YOqDeo7aDiQwpqXkvs94oGhFSUfAGpS6VFd9pmvm095lIoIhPJ2aLh6/2+l/5uENfsi
 /fCFPKash/vdvPZ+flj+gTQWZfY05eQm3AjAa5MXvTLqlKaSL4T9NEJ/YCzLZZaqelCe
 VnnR+X84hLmHJ3zUC5qcZEKkIqNIbqSK4N6kBto4V32U69oVckNnCp3LgrFOLIsYvIW/
 ovCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhuJDpj9wJ6mZmUNjofZL+wFlLTSlqYRqzkJN4Kl1Vm1gpg2j4jrFyrK/YIHAVP+NovDAgD3DZ8kA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyh6rT8A3cstklxmXc0KJe4zc7I7WClc0Pq35ixqC2tghVriuH7
 W1nBXPPcLchSJn72GhKPCkYnLLqYA8Xu7ugKNY6c4Ay99TCS9r08gEhiSTPV3WGDjAdtFtKv751
 NsP1XwGk622YUfaWaWiTEbaAIS+ehrugQmeJ9eCbIxgBN+UJRSmZrEft6oBzsSXgfluzLVks=
X-Gm-Gg: ASbGncsL26wRGkX8wBSejksSp1xrxyNcPbCkb/ypOxg8yH2uO5J6Y8KlvvGuK8krvy9
 GpTMAobLVU3MS3OTBJZqzSFQz0FxE+iN5zODhRk6wsUC1oPDxSmGfJI0HCpDwiJBUFQumvUvNgA
 ej2L15MY5lgqyEVZsgcs9UG+RknA8ZDVX+TO7jJvoT9AQiWeXxNH6oSJEP53bos+EAr+mUPBsiR
 xQTrsbk6dq3b1QmN1jaO/HFBVvMtzCSJZUcKBG+mZ62sLZsENwkeUtUtGJwKXCDOmkdm32uyH+k
 lFNzgFucz644aJj+6M8OVHN0Seo/NiZPiwV0V1tZuCkkfHGk7YY=
X-Received: by 2002:a05:6a00:2e92:b0:76b:f0ac:e7b2 with SMTP id
 d2e1a72fcca58-76e8dbac1a1mr1258736b3a.13.1755646152735; 
 Tue, 19 Aug 2025 16:29:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXuuxWQ9CNWJW9SCXTPxi43/HrmCwC3mMsHGIjwm8ubVSa4o5saby5u8uLerY0CGPltJ3xIw==
X-Received: by 2002:a05:6a00:2e92:b0:76b:f0ac:e7b2 with SMTP id
 d2e1a72fcca58-76e8dbac1a1mr1258702b3a.13.1755646152306; 
 Tue, 19 Aug 2025 16:29:12 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76e7f0b4f60sm3423813b3a.86.2025.08.19.16.29.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 16:29:11 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Connor Abbott <cwabbott0@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/3] drm/msm: Fix missing VM_BIND offset/range validation
Date: Tue, 19 Aug 2025 16:29:02 -0700
Message-ID: <20250819232905.207547-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250819232905.207547-1-robin.clark@oss.qualcomm.com>
References: <20250819232905.207547-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 7oKgjjjUCjh98fyw_mUTDqLFG0JBUXED
X-Proofpoint-GUID: 7oKgjjjUCjh98fyw_mUTDqLFG0JBUXED
X-Authority-Analysis: v=2.4 cv=H5mCA+Yi c=1 sm=1 tr=0 ts=68a508c9 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=xd9qGtD1qYZMgD9OdIwA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE5MDE5NiBTYWx0ZWRfX/A828C2brA3W
 JRXCVqA+BAqZl+cRxQCbWEfbz+NwaWo6G6AndRSQYdtBcmgT0hBu0946owrj6L2Cm+8Fc+Zx7zm
 Da06oXqpQMCxiQWmDKxcAAzDs/EhdTvzwwxWBWTOTeTwQebsrvKvmLz+WXRI7pOL0A5uBFOLPoP
 QQcMj9wLAsyaB6Z8sm4RY9wV/3FYDxUDzkF71g7Vg0CnZCZpEGwvCIOVLMmnd71PMLreAPd7pxS
 QiK+Zv8p3gQFvJb5TYXujlKwVyu50GcBuGthHWYgNbbNuaN4ChzzHmL8eERCj4Zrs+jGyKF89Dq
 1gtWXTJfNpZ2j5+8wVy4JnPlnkqwpMo2d5T9XaywjI2hYkmPLZcQ8H3/ra4JIiC/gFHNIej7ZDu
 BTT9J9+g9OIavkYanifhNVxc4tZo0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2508110000
 definitions=main-2508190196
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

We need to reject the MAP op if offset+range is larger than the BO size.

Reported-by: Connor Abbott <cwabbott0@gmail.com>
Fixes: 2e6a8a1fe2b2 ("drm/msm: Add VM_BIND ioctl")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_vma.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 209154be5efc..381a0853c05b 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -1080,6 +1080,12 @@ vm_bind_job_lookup_ops(struct msm_vm_bind_job *job, struct drm_msm_vm_bind *args
 
 		op->obj = obj;
 		cnt++;
+
+		if ((op->range + op->obj_offset) > obj->size) {
+			ret = UERR(EINVAL, dev, "invalid range: %016llx + %016llx > %016zx\n",
+				   op->range, op->obj_offset, obj->size);
+			goto out_unlock;
+		}
 	}
 
 	*nr_bos = cnt;
-- 
2.50.1

