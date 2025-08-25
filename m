Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 187A7B334A7
	for <lists+freedreno@lfdr.de>; Mon, 25 Aug 2025 05:36:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9E5010E2BA;
	Mon, 25 Aug 2025 03:36:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KVJCpEGy";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C905C10E2D6
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 03:36:11 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57ONqMlV008821
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 03:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Nc/Me6JhWACWqZ3Seo6sntz583zORBKIxRCpmiza2Ms=; b=KVJCpEGymbGybPM9
 Rkz9IMMik636mbIVWADF4ygtfKUH6nNdiZa4JvUqfBDOVkx9uqExDoyHAxFCRsHG
 ENuOH+2FYorhI9svghNSW/aV1MgRyhCdfKzsE4tXdNv535s31/u7/PcNy9RiTGl0
 bRI15QM/JGXBLP5KGv9cZcSbv+/uOdsfYIB6irFqeHYxtvey6ja8KNVau2cXY5tT
 3RuOMATqXWOAaZazPCsu0U+FDtKS+odvd0SJCyLtMc/sllQARZS/1KSaZtCWhLUX
 fcZLRO8QY66cGG5YrrGJ/V3QKRwjoVNPL7BsHVMYx2nmvRHVIB61Gp3tLJoTZisL
 SX3X1Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5w2kmqx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 03:36:11 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-32505dbe21cso2628817a91.1
 for <freedreno@lists.freedesktop.org>; Sun, 24 Aug 2025 20:36:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756092970; x=1756697770;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nc/Me6JhWACWqZ3Seo6sntz583zORBKIxRCpmiza2Ms=;
 b=iOOpICR8LkFhNxig42G7NH/9kk2c/IPJLCzX98E1WsG3CjViKb0TyhFJih4ZLEmqQQ
 zmJfluZfMakUxDjRbE6yRkUrZHIUs+8dsQr2j4sGrt3yqmfHetA6zG+LofI67E6NOtZt
 0DF1yam7nhHETo++fKjweZJRutpYeVPz2x1VFvKIji91u8rZ0VsGKmtxU+9uvxbhc0v7
 iiUh0FG066RmM3HtQ/PnAQoz0+DSn9KZVHb601UmNP9nHirHahuHOhqI7Jv7FR8gQ7LE
 XDGiXGqR2ebd67NGYZ3nqR8N8AhSl8vYpfIDeCRbwmy1ZE/e3upAaQUxJYv4lyqO7riu
 1WhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUu67QyrWrtjV31O5NymsLYOHf+atdKmWUal84TQuv461fhzMMCvZ6ewdwHMU/IKNoDF/+r3xe3ROk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLyfJZGItiZGgeD9aRzlEGh1xpNqOYFhtDSrJ3qo8BsQo2IXk7
 rTcgLtXM+nmXKxMz6LnQUzbTFgtNyLhmWPK9K0TiR6prmT41EIyDpT0kYkoJo+9M0dNCSlFFg6P
 CRqHfLBvF+PaGFRvrG8V4z5IsDFtE0s8Zgy26bmrmJp1LG63Ltz+WKUgSTbU96X09RfedNtk=
X-Gm-Gg: ASbGncuxPhZUM93qZSNqsVW5fzksIm9AWk3wCm8a8K7cHvOA5z7U3fknU8MBbvrLSU1
 iG+TRjSzRnsN9iLD29iO430b+EThPGqMefqXyalp11RWLMJUYYUKyDdbx1/KfbkI0Mm81Q9hASR
 1Cw6T8980PmAogLFYs+3Axgn++eEAIjqT69mq1R3sxs7qVIGxgYJzSE1BMQkMBEpsvt1AHvqUBt
 1T8HoV9+SrwMimjOLlzRL6O3gTIBdxGycbxVOcpAdG9KyZBvHPwvNZTl0Y6hMiMcrmxCbFfFPNZ
 BrwOp/3yldncmgQx7lv9Cmz9ZaY0dGSoCrHQ5mtQtFYLoDdkHBaa7GIFhJHoxBoI/FPJ6yY=
X-Received: by 2002:a17:902:ce90:b0:246:5214:e166 with SMTP id
 d9443c01a7336-2465214e452mr98782715ad.60.1756092970414; 
 Sun, 24 Aug 2025 20:36:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzTqSR67U+tpNmDgf/how6hjhQZdfWFRotg9qOkMwQOBCL1NTrcmhM6hc2DsV3b0TbsOsshA==
X-Received: by 2002:a17:902:ce90:b0:246:5214:e166 with SMTP id
 d9443c01a7336-2465214e452mr98782415ad.60.1756092969812; 
 Sun, 24 Aug 2025 20:36:09 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2466877c707sm54859565ad.22.2025.08.24.20.36.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Aug 2025 20:36:09 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 11:34:24 +0800
Subject: [PATCH v9 5/6] drm/msm: mdss: Add QCS8300 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-qcs8300_mdss-v9-5-ebda1de80ca0@oss.qualcomm.com>
References: <20250825-qcs8300_mdss-v9-0-ebda1de80ca0@oss.qualcomm.com>
In-Reply-To: <20250825-qcs8300_mdss-v9-0-ebda1de80ca0@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756092926; l=1044;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=xP+KCWOk9SNxzFjMtHR6U06UR7/RbmmfOmVurK6QZow=;
 b=FDyvGFXblAvBxHfRLhBNE2iuwsCHg20XL9cYb6uaNzOfq+jOhcjID6Tdrjb1NsPhIGdVdhyxf
 M4kmoCsJlbOCNbuFyrTSCeFqfFRefX4qhhz0HoHJUoA3h8CbL447X5M
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Authority-Analysis: v=2.4 cv=Z/vsHGRA c=1 sm=1 tr=0 ts=68abda2b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=VHyea80QRMuD3TjLfpgA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX5lBR3QIc/EyU
 cdsZbOJ6Ft5rApDIM7T437HpaaGjz1/NcNOlk02rpL2zxHOqPIHWx7n7eh6GmMrbhgofhFqAn80
 8Jl1NFQcRlZy1h9UJaCSGhJ2nS3ssFcMi0D6Yb2YRLSbvcwmZx68iIoKQua2KCZr892eJIMuL1c
 zBhBheXyEHSjyMx0Z8HellKuuazM5tsRLfmAMJj0jmCTagxbY0E2yMij47IikJb6DHBtjbUP+3t
 sreTtK/tjC6eQxAsNJPyBIj+wA79T2hfOY8+xWuEfYelMKGg1zAuPmOySGjUK2oNnLqzXZzEn+u
 a7CflUfyzKnczhjeEn7EGUOsD3cY4ugIaKHXU22HXmM/CnueGwDo6Y3u0Ph27inFvQGhE1TXpkF
 suOCNy+J
X-Proofpoint-GUID: IOQfPfaBso7Mif1015n6SKa9pQfP_yOO
X-Proofpoint-ORIG-GUID: IOQfPfaBso7Mif1015n6SKa9pQfP_yOO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
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

Add Mobile Display Subsystem (MDSS) support for the QCS8300 platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 2d0e3e784c044db8ac0c478446d211a982cf0350..db2f0064eb72e8a990ff4806f60be74d3ff8dfa9 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -555,6 +555,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss", .data = &data_153k6 },
 	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
 	{ .compatible = "qcom,qcm2290-mdss", .data = &data_76k8 },
+	{ .compatible = "qcom,qcs8300-mdss", .data = &data_74k },
 	{ .compatible = "qcom,sa8775p-mdss", .data = &data_74k },
 	{ .compatible = "qcom,sar2130p-mdss", .data = &data_74k },
 	{ .compatible = "qcom,sdm670-mdss", .data = &data_76k8 },

-- 
2.34.1

