Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB56DAE8D4E
	for <lists+freedreno@lfdr.de>; Wed, 25 Jun 2025 20:58:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C47710E7D4;
	Wed, 25 Jun 2025 18:58:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YxcAs3V3";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47C2010E7C8
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:39 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PDEmrj015564
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=vb+Q3ccg7Qa
 sQsi7gj8/5KoBXUBkdYd/cEtWLqH67ms=; b=YxcAs3V37MUahOJdP9dLUX55cMg
 cqYGsTQjIXFnqtQlXpSrZ6ie0xBmdMx775N8mW4MSO/1RYljObLQ7j4eZ5S3tthJ
 AXfbezOb3OhLaPNzAFbWXlsnL1EV7l96LmfxJnSGyeRHmr3W2Vyuo3OTFPGfC3A3
 KDpMfS9zJhlAxVg5lPvJfLRua0GxYpoeoeZa2dkI+nF6pYs5N7Q2+Oha3qJ3gSDO
 LGVA5u4VfvWxwCpmJwiCcYRDFasUxbRc/p7bv08Sv73+PTHT0N+dynyhLVbgCV7w
 ofNYL1Pf5Ezxc/b+oZWgbdVV4tNi8fn0+4CxsQ7mIqYiGdBnKn+G/7GuyEQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqqder-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 18:58:38 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-74890390d17so167614b3a.2
 for <freedreno@lists.freedesktop.org>; Wed, 25 Jun 2025 11:58:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750877917; x=1751482717;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vb+Q3ccg7QasQsi7gj8/5KoBXUBkdYd/cEtWLqH67ms=;
 b=c+sMkADpAVTBt37b/jTpQQRJk4kMe4xak8UZrzkEe3tK4xi/NgZDPaYLuVJGHOeRB2
 K81RBJmJvxltaK6zt/ejLE8qbDRZeFrjW4Y8Zb0RxBDHMddOEP1BGPWsInB8H9EoPeqC
 nXxdDYODTPXB7Bk66spDF7RnqruzIgF02Gs2127/Yh109RH4PlpDPypTPN1RrxF99JkQ
 ZyHQvyu2Z76YkjKPdeZUxvs02oeFkI2fHb7fWCHnEdcNCn4FUFVJiv1b8Zd0eCL9jFt8
 gTqH04Ry7Iq/eNOnBxu2EHMAdTF3Uj9zXhf/rW6t+ocOxUNEA4n6UL969B1ns+PYsjug
 kmrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7zS3S/9CXFOJ8+K+qMtM+aBKkiKNl1Ew4YUprxmpRK2jJr1OzX1Wa50aXOeVjaRK/9cr+ap/yYCI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9WvLtLohtcjuPsIcsiSLDH0car28t65FFV83a9XUi5Ry85XpG
 dDGTLPeiumN32dknl7Nqd78ILEDObCkG0yztNvExWzTvbT/KXnnbbUCtTiw/Jgo/ZCfI2u4gfnX
 r5lIz7eV5m0FhN6EYHU9pYiD41p5R9JoCFk2B7Zb6HmsucW0UDae3bdES0kjl2hyTVw8d4xIhAC
 3fUkA=
X-Gm-Gg: ASbGncvU+snvDK7wzTbH0GQaK/OjIcqpf1cZNzN26lZnDScgIRVTupsytdEmJnLkOYp
 5u+y6d/W8JrJ8CEtCQMtCOJx3+1zF6iCMAd6P1F0UjkL16dzE4aMfgVMdd6dQtAJpCPm92hJoQu
 8RmUPpa8h9o6gXtV1UeZxxn/pN2OvZKK0VfnfCmkk3XjYfGtaZ1JuegWetVFPXoC1XOs/iwNo4f
 jX6X23P+X2SHpOdkSC5dB5FoMdJtLSMa1XUCxouUo7tDl0WSoIZPKauowDynexcN7wXVIQcAWOg
 u8A27ONDu2H6wZ3xdw+xCY92xKGRndWk
X-Received: by 2002:a05:6a00:2da4:b0:748:fb2c:6b95 with SMTP id
 d2e1a72fcca58-74ad4599964mr6768250b3a.18.1750877916858; 
 Wed, 25 Jun 2025 11:58:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2R3fCh2w1CdRYNs6SzElJV5q80FOXlY69V8dHuPmzMI0PHAMaTPozp1q9qVR8kIBjZ/CByg==
X-Received: by 2002:a05:6a00:2da4:b0:748:fb2c:6b95 with SMTP id
 d2e1a72fcca58-74ad4599964mr6768216b3a.18.1750877916423; 
 Wed, 25 Jun 2025 11:58:36 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b31f11ac8eesm13442633a12.34.2025.06.25.11.58.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 11:58:36 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 12/42] drm/msm: Refcount framebuffer pins
Date: Wed, 25 Jun 2025 11:47:05 -0700
Message-ID: <20250625184918.124608-13-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: s-A3ceHX3UcxG6XL27TGd6ORw5EugtH-
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685c46de cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=MhmIxDhvR8qEtQvFyXAA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: s-A3ceHX3UcxG6XL27TGd6ORw5EugtH-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfX3WkVzGUh/pyc
 b9A+2J3yGjtHtQUT37oN/wRWQMfhzn6PCLW5XYvFxieWMFapiWhwWTTgyd/HOOAXBJpP30T5O67
 nEVKxwGMNoalecgqEvuYtabM1OALG+teGcLe1pjnvC1FJ2Q7LHpuTeguXu5M9n33cr/REdmd82n
 gWtL0+5clEkE4LxnUbOiISBw9YzNCnlhxFc+bsGYgPjtoAUZSKEfZVtsatSgQauAo+WBCt+2WH3
 GZv8WTByUeIDReZdb6yi1hSqRfVJ0Ast0mPpaHPGS4CDTlkcmVqF7rRtREuXDyL/fziQMYczBfO
 ZdTbWj2YmNWCYo86Ww3DqV+hxfciFpSBpeBr6qAaEtNrM2b1N5zuASYGzO9JNowEU/RUyVWexNE
 qyGbOI0LM3A4VPZYdiESgTcjEPa4RPBmqr6m5Fxa/Dyxqqi+HpmD2Sc15f0tsNGRLgbMNhFl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250143
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

We were already keeping a refcount of # of prepares (pins), to clear the
iova array.  Use that to avoid unpinning the iova until the last cleanup
(unpin).  This way, when msm_gem_unpin_iova() actually tears down the
mapping, we won't have problems if the fb is being scanned out on
another display (for example).

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_fb.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index 8a3b88130f4d..3b17d83f6673 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -85,7 +85,8 @@ int msm_framebuffer_prepare(struct drm_framebuffer *fb, bool needs_dirtyfb)
 	if (needs_dirtyfb)
 		refcount_inc(&msm_fb->dirtyfb);
 
-	atomic_inc(&msm_fb->prepare_count);
+	if (atomic_inc_return(&msm_fb->prepare_count) > 1)
+		return 0;
 
 	for (i = 0; i < n; i++) {
 		ret = msm_gem_get_and_pin_iova(fb->obj[i], vm, &msm_fb->iova[i]);
@@ -108,11 +109,13 @@ void msm_framebuffer_cleanup(struct drm_framebuffer *fb, bool needed_dirtyfb)
 	if (needed_dirtyfb)
 		refcount_dec(&msm_fb->dirtyfb);
 
+	if (atomic_dec_return(&msm_fb->prepare_count))
+		return;
+
+	memset(msm_fb->iova, 0, sizeof(msm_fb->iova));
+
 	for (i = 0; i < n; i++)
 		msm_gem_unpin_iova(fb->obj[i], vm);
-
-	if (!atomic_dec_return(&msm_fb->prepare_count))
-		memset(msm_fb->iova, 0, sizeof(msm_fb->iova));
 }
 
 uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb, int plane)
-- 
2.49.0

