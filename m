Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8C3B44AC2
	for <lists+freedreno@lfdr.de>; Fri,  5 Sep 2025 02:38:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BFBD10EAFD;
	Fri,  5 Sep 2025 00:38:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="L8LxnQMk";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82ABE10E352
 for <freedreno@lists.freedesktop.org>; Fri,  5 Sep 2025 00:38:43 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584In6gt003821
 for <freedreno@lists.freedesktop.org>; Fri, 5 Sep 2025 00:38:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 yTzO62qQEXkfh7mQFeF6JWdziRWqLc1w2y3Ayzm1rok=; b=L8LxnQMkdelWd9bW
 Fv8Ct44/t9adiGQQXxAD7FZsreLPJVR0TOPF3ukyWzm55bmTb61dfRKym1W1NrYf
 4qvRZUKkD4/1OZhfagafn1kNEaKOgIV61fkn6z/agyahxT2kWLgyAa2Z+Aww+e4x
 lQbG+WoZ7cryx9tzynrZv1jE9+iPKerlXXdAyQNUdTY1IfJdp937gB6biT9/Pmfb
 Mok0gw6eFoO1UmSyXAuTVVHGKRRoM52YFamNObZyMFH1UMrEeFXO4vwCeI5PdZ41
 a9G3Krd6BEBJE5kq67I6l5EdMyqkrTobyQBtoUTHt1DEPFgXlbhyDtcool0mnuYd
 5Br25A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8s9bq6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 05 Sep 2025 00:38:42 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-720408622e2so29787066d6.0
 for <freedreno@lists.freedesktop.org>; Thu, 04 Sep 2025 17:38:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757032721; x=1757637521;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yTzO62qQEXkfh7mQFeF6JWdziRWqLc1w2y3Ayzm1rok=;
 b=FCKmBSuj827uMio7nHv+ByzlbUvCv8bHfR6O7Tj1IPBzyU3j3vsZdKPNr4vQvQ6YC9
 /HcnBxu2+zNMKcLKYt7fs6Fk0J1iEvhCtn4mHO9uogRrnZoY6rnetDSpcr9J7hAfPWmh
 Z5/Ht9ytR4MLGqgBrXqIU5QuusPXfebC5UaO+7U97Bl5MnRw6ZDXpMMT9MHWwCPWy1G3
 3yynXXEtjx3vQYP5mUiv0CdO0ZMJMKkKB5cY8YHhdD/2r0I6uExcinngnWupSe33+DlO
 Z2dmkaEUXYojQHLbhPLeD80DcQGe1HiuPLWQPQUXXAbWLDKqqZba6f9XP/vmNcc5WoCF
 qYtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIId2AHll04nSEL2E4joZFgX15Dk+ByJ7rZIZut+MSaAV5itEgTObAJA2BriWpd0jB9NNzCL9On78=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7ZmM1j0QUGyurrkovGZ9OcFkoTK1sTv2AJ1ou0usvaDm9Tim1
 fHY3adq3qhsN1gYaa03L67Cgj5L8qPHTcXpJKmxjlBAFMECPZWKsliM6zAHDElaYKB7nwo2LAZf
 A9wCfzp+CGut7eMZCrdBjl2OIqFc1S0qGlW5ZI6gxR9YlhNSN+od/OSeRdJbmbzyDEVvX69M=
X-Gm-Gg: ASbGnct+n2opXaOgxuSYMYVgeqkcu3Vk53yzc6qX9HSJksEnCYZZoH3lI4Emq2gNgsy
 OkG/XnvzsQpjQZFlBIrZjRwlcnRSv9RuMjq/DGLFEjDptlCNPg0t/yrM8LE3GIrWsS4U2Cm3qR0
 rn0jY63VASbjhtZkESUuvjw+smXZjN4f4wjwAj1qglmFIyEzKkc3OgYgcvvIeupKqsY2xZ5xwIS
 V5VAQWyrr+3L8vCv0UJQfJywzUre7JnmtqXA8lVDMzQ79PwH9bFyptJXrTl8WCoVau7cEHzlXTH
 QOkdhnSdbFWhwfmGRgGyujmicGqpdZHsx8s3XlBKOYjcP8A8JbxZZj+xIqrEJ4GwdmJmsbZZQZb
 WLLzcR11nmeO27SGP7RZ86RrFcTTck/TEBeUiK5n/eXZfvHlAkGHI
X-Received: by 2002:a05:6214:3018:b0:711:a23a:281 with SMTP id
 6a1803df08f44-711a23a0c15mr194916366d6.65.1757032721583; 
 Thu, 04 Sep 2025 17:38:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuZohjFcvi9xTjLiW9tme41He1itQHQ2UbVUwvfQWw3Lg8jdFYcIPQk8JEEU87+AyJpRPc9g==
X-Received: by 2002:a05:6214:3018:b0:711:a23a:281 with SMTP id
 6a1803df08f44-711a23a0c15mr194916216d6.65.1757032721142; 
 Thu, 04 Sep 2025 17:38:41 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608acfd938sm1510059e87.109.2025.09.04.17.38.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 17:38:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 05 Sep 2025 03:38:30 +0300
Subject: [PATCH v2 01/12] drm/msm/disp: set num_planes to 1 for interleaved
 YUV formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-dpu-formats-v2-1-7a674028c048@oss.qualcomm.com>
References: <20250905-dpu-formats-v2-0-7a674028c048@oss.qualcomm.com>
In-Reply-To: <20250905-dpu-formats-v2-0-7a674028c048@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1685;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pjUEPhdOzoPN8Hx0y8aVOu6btqr80/b31OiPFcm79wI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoujEJ3w9H0sgiKbSsYOCwI2yiJJaK8fGHDXl/7
 ZOVoYJbKxKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLoxCQAKCRCLPIo+Aiko
 1SnZB/90j2/8ZftKy0xyZheaergMQBEpsiEvBVvhfXlEtu+HzAJBjAEOUlwblXQ+Ygjd0HsxV9e
 xBaJ1l/OxtauN6WlE5NwuFZk5Nf89YVMZ+v03D5CbAlsVMn+FLhzizhHrw0VoZPsQx1Z27k5tEi
 6jRSUhqbN6fN+94jYERIOjUTbHtxjzdJ7spcVxcGzk6QkcFMX9UBqllWURLIDEwzK6WYS/Ybpb6
 +/ruy7WsFUdV5Jb546wmudvXtVGw7j55jtU5jfvKRPmLGPystk9ePmsqmTHi0qDeTNkypzZIH0M
 oRvWreNT1kqRFaAe1JkR6k+O8QgL6B1jqKHxgcUVuW6CeGQ/
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfX6Kyjdey2X7Gc
 kZ/zSlI1tPWify7FsTlh8i+EwoUEWADq5dnWBROF5bbWEqCvxo31KZ8yMpJPt/3LDQA0Ci2/DwG
 pfnVQr+f9GStPG2N9CXBNAfrvyJLOuMPluPrESmCET1ek5t9oXj0SWfIOwiS2EeeLBNlaRS6U95
 xfTjxkKdtDeU/jc0QlXGG+ZS32Zywjjwh8xqiZTohgA0tbMDKXFaN1mzvZMvAUoY1hLO9KlxbES
 LIyAN7RKnFjwIgiZl+oSGHm75Le+gxbk2ESjTkReEtSDZGuHYmreuC/uSmGUNd4i//dpTxlHe52
 wuU6gSQdCMUVxRisc3L46dh5YKmwBzASD6R+Uw7/Rcj2swFz/3DIz/1T5wX3sG2s6HEIeYIuzY0
 pVb1eTMs
X-Proofpoint-GUID: zP6CNGIZVF36yVueytSZGffe7nSA93JP
X-Proofpoint-ORIG-GUID: zP6CNGIZVF36yVueytSZGffe7nSA93JP
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68ba3113 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=DB8TyEHaRv6uusbT9jkA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_08,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019
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

Interleaved YUV formats use only one plane for all pixel data. Specify
num_planes = 1 for those formats. This was left unnoticed since
_dpu_format_populate_plane_sizes_linear() overrides layout->num_planes.

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp_format.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index 426782d50cb49d57a0db0cff3a4bb50c5a0b3d1a..eebedb1a2636e76996cf82847b7d391cb67b0941 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -479,25 +479,25 @@ static const struct msm_format mdp_formats[] = {
 		0, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C0_G_Y,
 		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 2),
+		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_YUV_FMT(UYVY,
 		0, BPC8, BPC8, BPC8,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C0_G_Y,
 		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 2),
+		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_YUV_FMT(YUYV,
 		0, BPC8, BPC8, BPC8,
 		C0_G_Y, C1_B_Cb, C0_G_Y, C2_R_Cr,
 		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 2),
+		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_YUV_FMT(YVYU,
 		0, BPC8, BPC8, BPC8,
 		C0_G_Y, C2_R_Cr, C0_G_Y, C1_B_Cb,
 		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 2),
+		MDP_FETCH_LINEAR, 1),
 
 	/* 3 plane YUV */
 	PLANAR_YUV_FMT(YUV420,

-- 
2.47.2

