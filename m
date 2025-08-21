Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0A5B2E929
	for <lists+freedreno@lfdr.de>; Thu, 21 Aug 2025 02:04:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA1C710E835;
	Thu, 21 Aug 2025 00:04:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oGm/QCW+";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57F9A10E839
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 00:04:38 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KGmjFU005491
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 00:04:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=7GonE0I4O86
 IMbS9YwA1nRfKE7NxszsWoTIBBuaYOXQ=; b=oGm/QCW+yDsDLwFUlm0BTzAsCYm
 Q3CdZT4IjuaTN2G6iLwc6GW7VGglHZmkUZukV92bpXX4V5kbGIC76Cu9ZyHPWlmH
 DuGjCb+i//M4OxZdUvRD1pL5ypAUeD8M5AjOxq99w7eCKNNsIOsiEVghoMtWOkRO
 UsWIDXmuauwZPcQlh/xrHB6izFBDSdwBu+lAk/C9SkLgvc9/WtnBb7VDLGHORcjI
 XEHLWzbMzTZKuh6Fd8kuddbByOwqHQJVpnobWTOqftGoy1X1qwk9FfbwSZKoinQ4
 O6rEKr672qi1+tVLsEDEZ3NCRbVZMiSvz3A307bdxB0VdjWoB36PWgWuBxQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5293bub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 00:04:37 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-323266d8396so461375a91.0
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 17:04:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755734676; x=1756339476;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7GonE0I4O86IMbS9YwA1nRfKE7NxszsWoTIBBuaYOXQ=;
 b=hkN1nNmo/klheU2tHzFlAN7nnLxB0F7WATVyXg6uk7ETe515fMmT0JsjlfX5pyUtC0
 aO8hb6892vxb5uvFmnvVlZBlfsz3U6EYm5WGk0nCkZvWg03EoCEEiv25/3hlC1pLMi0G
 gS7N6vk9ujFqYU/82fQ9/PkgsJO84rK/6qRDdLAK6B2p+I/hOmhZ74I7KUU1yMlx8fzz
 XaCRIM3+R5DcsR6xlR9PrMuF+IZpwbYZGo6iqP2deIxmSz8JrdTCkIR5J57KhzKQ8878
 6eMI7K17H5DKQY8UAqMI0lvRCjxY+8BRmOPj3VUVfPwU0/zCLYkmyPMul1r5tHNafUFe
 ortw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8UbLHpX0R+StJexYjXG096YVKgSayQXDH/BYZEppFyguhssLePCJbaQLv8jAkUMAQKucreGS/kwU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUrl3GQQjtZZJwa1La8WVmPGsgr4Nq7S3hJUw+kxirTs5J/FdF
 cNAUqzAD0Kc/xAss1nuzWAy3U6Rzqx0mv/g8yTA1SDkrH5vZ6WX4KbEQ+M406unz4RMeZsqNy2Y
 TW1ktHPy/ORvlvuO7iaPJ9X21kXFdsYDfZ7vkuvV6qZPuRg0ILKrHTRQoeWH1SFxuMXmJj8k=
X-Gm-Gg: ASbGncsjWgWa/xf0gXpAFIwcPLPvIIqsB9+z24XLI8nABrgXwfd4CRlDTlGus3faqRd
 ZO6w/+U5Y5cpIS7TQk5ypWzfhfZTqzDmvERpYTnm8cM58RwuOdv4IO7NHMJ9pe4pHXbYHAI/J0/
 XrWdPZOkDMTX5Okb1/vQSJgyT2LQSrKrW9GNvqW0LMDGJMPsVLtrDvrmRjTOQrlzMxU0Wyi032y
 V3ElMMZcy8IcxQbbIPCCT7fWhrqQZzjORRQMYY/184EvkgiWvn09X4yPBZE/q/x4yWI/bK1z29h
 iuokUBfXdqxyc7PLLTdiENXFOfEnrhPHreR74bpdKzRY+DMLUvQ=
X-Received: by 2002:a17:90a:c890:b0:321:c8e1:82e with SMTP id
 98e67ed59e1d1-324ed1bfb25mr758856a91.26.1755734676230; 
 Wed, 20 Aug 2025 17:04:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENGaAHhgimor5pJiOH4MjaweNyjNHnC1m6WbGg+qru+W8Qt7ZVMax/uq24M3YIwwpqMOR0CQ==
X-Received: by 2002:a17:90a:c890:b0:321:c8e1:82e with SMTP id
 98e67ed59e1d1-324ed1bfb25mr758824a91.26.1755734675703; 
 Wed, 20 Aug 2025 17:04:35 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b47640d3e3fsm3201333a12.56.2025.08.20.17.04.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 17:04:35 -0700 (PDT)
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
Subject: [PATCH v2 2/3] drm/msm: Fix missing VM_BIND offset/range validation
Date: Wed, 20 Aug 2025 17:04:26 -0700
Message-ID: <20250821000429.303628-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821000429.303628-1-robin.clark@oss.qualcomm.com>
References: <20250821000429.303628-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Aui3HO9P c=1 sm=1 tr=0 ts=68a66295 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=xd9qGtD1qYZMgD9OdIwA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: S0Cw7R4XHVzOg03hcbW-zIOCK8e5G8Bz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXzh7EeiwCmeUM
 LyhtHWChvTQrXRRYMkNiKZxes9Hp49m8VvfknSZpNhbfEKlySXYOrsWkaXFaQVaj1UjHSUP6p3r
 aFFPBxXBI3oZ0RS25m4YhL2GPyqKxglSI2kj7nTifjxdwk1TSWg77YrbEUA1Fs3QlSzSc7EysaO
 KCZJ7sKdFd7HKEnB18wImtF/YDZEakGYSN/euUTKDS+A3hl7POWjSge9gwIzYfvIz5kkamj8RZu
 iidLId29PxVFevBNR110Elsd1NKwOaFXSWijM8A1PbxUykw1l3TWsnpX+qBlv+0L03myXDZn264
 0aJFNeLACqqLt+O1N0V1c9ByNXYjUSIGaDWsjgMViB3UQujRSq9sfP0ZzshvDxMdHwZAvtM9zXQ
 +m162xJKzJKaOy5c/w9YR+t3jaqq/g==
X-Proofpoint-GUID: S0Cw7R4XHVzOg03hcbW-zIOCK8e5G8Bz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2508110000
 definitions=main-2508200013
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
Tested-by: Connor Abbott <cwabbott0@gmail.com>
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

