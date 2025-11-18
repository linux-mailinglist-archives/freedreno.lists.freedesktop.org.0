Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 219E5C6855F
	for <lists+freedreno@lfdr.de>; Tue, 18 Nov 2025 09:54:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0173C10E46E;
	Tue, 18 Nov 2025 08:54:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XSJrKjwo";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I4MR19Rc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58F0E10E46C
 for <freedreno@lists.freedesktop.org>; Tue, 18 Nov 2025 08:54:09 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AI6YLFJ623776
 for <freedreno@lists.freedesktop.org>; Tue, 18 Nov 2025 08:54:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PrV6w/KNsg/+0gK7/2DObzlG/RNC5GFYtRF+8U90aj0=; b=XSJrKjwoVjc3E6RO
 PWDEeilTCueTASJKgSjrC3dJJBhl95aZ2GbxaMRERmW+cCH1EctTbG8YufS0NXS1
 elUEnVsHJfJqhC5O4e42Z3QfZsGtwJln1BhAzfla/PJE1oPmmGonbgBGJnSbG4S7
 uhsahzWLq29xyCVLAbR0KcDYFFgLR9PyT2/jElEqq9NmUl2UuMkvr9rGk13Xkm64
 jH+s/yuVabDyI8WYgBkIoNj+SQKARX4lmFL5hC2p8ZncvDbO7gXJ6XMvkfFdnf+G
 Q3gDpCgL2p23bFgPTwaXy804y7cUFKerC4U7LKdcxk40VWYDK7UWhQN5HiRg1zx5
 Z8Fmag==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agahf9sup-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 18 Nov 2025 08:54:08 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-297f587dc2eso95621035ad.2
 for <freedreno@lists.freedesktop.org>; Tue, 18 Nov 2025 00:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763456048; x=1764060848;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PrV6w/KNsg/+0gK7/2DObzlG/RNC5GFYtRF+8U90aj0=;
 b=I4MR19RcLZGf0DjlhpZiwcJdK34Vq0/FKDFc8BtfyIr9BDkgaS2U/joSv3gaZI3MI7
 nhLNyJQPOC7/+2mGamhT7H6Mrjqrv0lSf1byBnIgx1g3mZuZ1DzGhDPuNTBLfcBhv+uV
 gCkw+y3j2poYB4YN+t/U7lKz9XH5YP++a/HESMkmEoGyhZC5lMgYkZls2ftjnYUZxlKd
 XHi1QFHTwrl+eKC0aqEsopJLSAWNAE4Yo2VbsW+7mAotboMxJlvPi/rpKzd3ZE6BBDWl
 3n12n+ZRYHScLiqfWYv/7wGD15d7C+bFqbvevREEzpn+FY/tzGnQPZxhmDjJRciFuVZi
 FTLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763456048; x=1764060848;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=PrV6w/KNsg/+0gK7/2DObzlG/RNC5GFYtRF+8U90aj0=;
 b=cEg1j0t+8ypKc8pnJeyfXG2nfcDFOqYEhX14I7m4cPMU3QLZ0ORMOg3auuwSQIUBK4
 0flmiuyzXV9wwed2tqOzGaaWTAWAKHHHX1BISD15My1tOSI4InxdLxuiRXkrbHb5dQ22
 W4X7n9B6sbsqjcXlsJL/hRyzuSEi3ZGeJToXyc47gNZMOK9N3UL9jmBFRn6wQ5M80Hhs
 sd5C+ROMnvnLK88D6ByAamWlBhkGQUQ7qD9jsnS5Ox6hFLX+u8/S/zRfkNHlwW7RGkpL
 RYnmrb/QEKzxnaB1x5CciXqrXclmKh3CQsTYahQU9BwYOTPYTeK0UkmwqL6Bkcxl3hmM
 06jg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAYZG9s6HBCxPaBt7kPPyb+7Uld1qOMSDNMsXsJhJ3URyMJEKj//Ioins3Rq98zR7YXMkd7RoIeLI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwcKF8veUZyyf5fAy0f0xm+GL82SP1Fqd7QRAbG4UtCv83HZ5ph
 QtSb5e3K9ELQeg22IoN0IruuelB57Bhui5zoWlxtGTfCi+Q0FbXATX8lEOJXrJ/sHemTmEVPo1R
 hPFzejXe59NRym7yAWx5TcHN+WE69MIM29bf92dzARD0D1h+4tUnl53g9i532SpqqDmzHFFY=
X-Gm-Gg: ASbGncvuLSEkw6jh+affVBKbQB0nCC3E+XuI/7UAyHPXX/FHsbaGaCG9AeP9mYg3ltN
 eY+ntvkq7rwo6j0muA1ghSLz1n6xiZsw3fUfYzvnIn2Uhpecxi+NMRhElpBQVeEL0WC40RV1cXD
 Lxf+udKsAngy84gUHsHD8D9sel8CsY5Wb/lEfd+85YY7SZ95X+rAsDUfklRw/81q5qdIlI5rmzt
 fjU6qRvEQe8BFVEp6r37jvA+nfaV+2UKLNzW7f6GKF2S9UwWkkq1UIEU48O2pkfJfuW5JrbqBZy
 RGjXN2+7kcHwyTlnicrfQn2EcP3UdTIa3gj1Paw/yV1VJEEmC2wZP3sjIx3cX6fkXq9+p9uxBls
 kar3xy4EzNrI1vOa40lJr3Ls=
X-Received: by 2002:a17:903:2b10:b0:295:915d:1eed with SMTP id
 d9443c01a7336-2986a752d2dmr184977985ad.47.1763456048189; 
 Tue, 18 Nov 2025 00:54:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGVjIlIvPTSiLdTNwr5hmoMfFZEBIQrZl3YPil3Ox+0tEXFjgQlXvbvrH6me3SXOyh31lsTdA==
X-Received: by 2002:a17:903:2b10:b0:295:915d:1eed with SMTP id
 d9443c01a7336-2986a752d2dmr184977645ad.47.1763456047717; 
 Tue, 18 Nov 2025 00:54:07 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2985c2568c1sm162910695ad.47.2025.11.18.00.54.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 00:54:07 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 14:20:49 +0530
Subject: [PATCH v4 22/22] drm/msm/a8xx: Add UBWC v6 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-kaana-gpu-support-v4-22-86eeb8e93fb6@oss.qualcomm.com>
References: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
In-Reply-To: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763455868; l=712;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=wceYkLyUbkNoE/pP8sWa3zSzsulvkqlQyOrCItWxr1g=;
 b=ab9CsH8NF32fs2MhCaQYzdCr2lNXGHBIXRiN2OcE/b/eGPfTzV94cxPkR/EkNz+ftEVQXOWXR
 YhM7yhyZPncD+Uqsl3lAE5hf7Myb66BTpP+CS3Bd1dT6SCaSlLLFKhI
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA2OSBTYWx0ZWRfXySC8dJZe5EHO
 QmH7s8pxpoCTz99vAdkwJwVeU5VA2OmMOTWsH07t1HgjJBUft1cwlOxsLXOAMK/+XEkdnAGkG9R
 wiqb07BfV5U0d1FlrcmBlamLmwGe5s2ORVGRgLJGku63pSJJQyfkep68ms06goQ1ntWJj+3IkHc
 tLOSLknIdE4vTerto1n9hqLufv6ivVD9YDG63pEEW1vuBkjn96dlL4jBd+jhbKHN+gQJQFGi7bg
 rpfPhMJqkgk6xTBZz6LNuhu21u0pRnp8mtSxIn6LrmCOb+QFTMDVEITuJi+U89YBzkOCyduxrU3
 whXOUoNDYLfSkpjMjGaUpOjIAGJnZzsi1yFLfhIjZV+aNsZIn9DFwl8tGI3mQQjvTmmIAaln4f3
 cdW9jILQgIXyYmyF3w8U8D4uHbGKWw==
X-Authority-Analysis: v=2.4 cv=RpTI7SmK c=1 sm=1 tr=0 ts=691c3430 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=LUS0w5LV-g8XRIoliPwA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: LBCeKtYOocQRZcYN7BWpP2e2HEQDJGrY
X-Proofpoint-GUID: LBCeKtYOocQRZcYN7BWpP2e2HEQDJGrY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180069
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

Adreno 840 GPU supports UBWC v6. Add support for this.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 30de078e9dfd..5a320f5bde41 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -276,6 +276,10 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 	u8 uavflagprd_inv = 2;
 
 	switch (ubwc_version) {
+	case UBWC_6_0:
+		yuvnotcomptofc = true;
+		mode = 5;
+		break;
 	case UBWC_5_0:
 		amsbc = true;
 		rgb565_predicator = true;

-- 
2.51.0

