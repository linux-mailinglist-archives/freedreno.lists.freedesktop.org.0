Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB06AF9F8D
	for <lists+freedreno@lfdr.de>; Sat,  5 Jul 2025 12:02:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CC9A10E380;
	Sat,  5 Jul 2025 10:02:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="YAB/CoFL";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F85E10E385
 for <freedreno@lists.freedesktop.org>; Sat,  5 Jul 2025 10:02:46 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5658dNrS004583
 for <freedreno@lists.freedesktop.org>; Sat, 5 Jul 2025 10:02:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 37OUWSNqZZ2CvfYEQI9Vqh76rgWD4hpD+HsIhfaGlGE=; b=YAB/CoFLitVr91q9
 t8gW4MzUUZT3k2pRij3Lq9qx5UiYnbIj4UJaw6WIYyHXEDKzx6O3JLqaHMVkWRBU
 +HLzfsfy6dDeZ0nt06PdXXe/imvprwPusD+bFbmxog1fvjn+uizpU8lCOGalNxGV
 FsA0OA2hFZ/OSWSmliq4pYPc/hbx9trlGfcBTeBNySNI6jFmjLqLexVaIUHu8THm
 HyaDcpR11Y93Fm5TlXMW3CZOq+fqf83WvOC9i4DEH5MXfXBn70A7enUGWgt+1cRF
 ISZm5Ye3ICd0KTByhG1zr+OZ05x0w7d6/Id3BSvYNaR3OU1B5c0Im2jiBOUUfFr4
 h76Rrg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pucm8mwe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 05 Jul 2025 10:02:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7d22790afd2so214490185a.2
 for <freedreno@lists.freedesktop.org>; Sat, 05 Jul 2025 03:02:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751709764; x=1752314564;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=37OUWSNqZZ2CvfYEQI9Vqh76rgWD4hpD+HsIhfaGlGE=;
 b=kjhK5bjklqDuQgBJi22Ev3s/BKLcDJlKWip2Zoe27mbL999YWwPZ4tooOo3nXuPQTK
 Y97a49EXI/MtZYuTOGtdTx381GbDudBv2n3kWyUW0oSqhzdC3v+pxCCibb2UMM/e708U
 raYBUhtQ03B43GUF1B2mAKI2lap3xJ6fV78rhLz/cjA/hKzz8jnrvF4npfvTGabkxXze
 +aoDQ5gnCR8R1yuJBiQWJJZqRw2Af0Jsz1KWcZEhRzNm/DQ72LH+tHtMV4NIFtZqievc
 3P0iolzJHkQLCLVPHOmoZkhUPdYWOGsKlO/QRwPjm79QDgz30qeLj7BUoCaoBKyIbyFj
 yMuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQP9AYzfWr4c1LszSXl7yUTM3bBl5X3KM7sK8NTmTsJ7UEK17HenjLw883xg7I5TQMynD0QcrB8xA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1tnQ71y0u17VCml9OdsVfRTl9dSYl1N1sZo2evoHRlWaV0YrP
 qjGcQbAbtpT/cQ+5Uaax9jYqqv8DPQSKYFoTlRP4KDLHNyXPUg5utnL4h3qwPmitdiW5+VPBdxA
 MhFPaThLNi7lakk5pfZy5DOthGmwQlpxJkQF53/aaDd7Q5rg737Ihff9u/F/WfCkstTW20Wg=
X-Gm-Gg: ASbGncu9NQETPt3WbHaobtF7rBQ1CbjLWM+MrmZ2U/M6Y+5vmKhpbg4PD8Il0iC87y3
 C6+EKHqX4wxjCr5P0qhtoNiUj9tXU7VTXfvSCsOCBC9DcEgnpkuV3uPyRxWDuPhrjzJVnfwE7tC
 d6j0oKBF/aL1r2iYb9WC2qgVV3OncvWoNNUxatnNzgEA3+wd9UElZ7EaltJtX3Db3TOqW8mP/cy
 KJSxD5STJcM9wEAd6doszGuL+zXyzaIJNGwoQR9PPULHWgnravN11J6v//EEriit3B1dgWu5ujT
 XbhQFtAOdsoFKi/gjywHRHyKveI+oNZXX6cyNzOlXLIwihHF4BTvlfEDTH66Iwyev8wXl9wrjiY
 LHf6OIBwWEDzHIYfFMfSM7MUAeNxNn8VCKiE=
X-Received: by 2002:a05:620a:4102:b0:7d0:a309:b1a0 with SMTP id
 af79cd13be357-7d5dcc72969mr801361585a.1.1751709764295; 
 Sat, 05 Jul 2025 03:02:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFv0Eym8D05HjojYNYR4SygLziFGdpiDeTDYA8jw7CJMhriZM1hrprzTkNV+yf0mwfM/I4UwQ==
X-Received: by 2002:a05:620a:4102:b0:7d0:a309:b1a0 with SMTP id
 af79cd13be357-7d5dcc72969mr801356585a.1.1751709763744; 
 Sat, 05 Jul 2025 03:02:43 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-556384c0558sm526274e87.209.2025.07.05.03.02.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Jul 2025 03:02:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 13:02:32 +0300
Subject: [PATCH v4 07/10] drm/msm: bail out late_init_minor() if it is not
 a GPU device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-msm-gpu-split-v4-7-fb470c481131@oss.qualcomm.com>
References: <20250705-msm-gpu-split-v4-0-fb470c481131@oss.qualcomm.com>
In-Reply-To: <20250705-msm-gpu-split-v4-0-fb470c481131@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=978;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=XIiXgEDZnL8PJ3eQttWZTHEBnVzzyPThCHHyJljuuT4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaPg0Q9gDCPMLzb/Xt1wh4VNbgJjfW1DZ11X0y
 N1t0bQ6E1KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGj4NAAKCRCLPIo+Aiko
 1fiyB/9iqfn2GwxswL1i2AFbwA1sytASAH/5JI9r6acY5FRRYHkGqbSjr2YzJKV/mPLm29gv/bl
 uTx93/t33uoXkKnJ52ekpBCJPFrtT/3I64V2ap2TxBjOil9Nz2yqdeBabjfUB0eYnr7dQNBe6Ob
 39/kUJGf/e8FSOMrJkvOZoO6AePWAO/WCvrz7cr4SdD8mik+rUhlIgLS490RWoJ9wgC2E/p0NI+
 aij9FSpws+I1VLJ6LKEF0V86w2oe6fOW35MoV8j1wgt+D+S+zAbLAvntJsG1vnPdD34F70wb2pf
 z3gC34rrLdTTe4cJPsTBC2ex5t6Z80ecF8l1TV+dWrAanc7H
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=GdQXnRXL c=1 sm=1 tr=0 ts=6868f845 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=DPw_qTI9PinaUm3vTuIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: emR2fKtXTaFlGsR0CIcc5QPFKOHy6aLl
X-Proofpoint-ORIG-GUID: emR2fKtXTaFlGsR0CIcc5QPFKOHy6aLl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDA2NCBTYWx0ZWRfXzMe6VeLWBkK/
 L8eaPZbmNzqziILBVxvAOpe3MlpThboJhtpMj1hAgBV253Ya3xG0/uWWe1dh0zn85tiQRD566Hj
 Ti6531QHfnfhV21R5LH42myUfrTu7yeRYR/Dism27zOYJKLG4ey/oCxOG6G5Wd2NnkhPqhbdB/P
 dDVbVVoz6NnFwAFZamTltC8SX9L7b+VdM1mpwBvLTfoXJFflmOxGsryCEkb0dVQiZJL1nvWHrwp
 HHINfwUcwMSuLmgLVHlyMT21jmpp2lCKDXombzFD8bUHguKbJ4+ch7ovDz4rr5yucKsvDuxrKen
 gafS/5u5QuEpMrzCs470/TlWij5OgR675LbBJheII1Rrmy3j9XBFdASbXPrIC2ztrhtwGjbmE4z
 24tHmVq3lhdhXlOVIDEza+QkN8wO3C2IXdTGsQA3rwq2TPKykzBpPa3YX6EcMcWtTVJvZtne
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050064
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

Both perf and hangrd make sense only for GPU devices. Bail out if we are
registering a KMS-only device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index 4680ccf3e72fa5c31afda5665defe71d1f238dac..bbda865addae2e0ef5bb175bec0ed219cd0d9988 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -325,11 +325,16 @@ static struct drm_info_list msm_debugfs_list[] = {
 
 static int late_init_minor(struct drm_minor *minor)
 {
+	struct drm_device *dev = minor->dev;
+	struct msm_drm_private *priv = dev->dev_private;
 	int ret;
 
 	if (!minor)
 		return 0;
 
+	if (!priv->gpu_pdev)
+		return 0;
+
 	ret = msm_rd_debugfs_init(minor);
 	if (ret) {
 		DRM_DEV_ERROR(minor->dev->dev, "could not install rd debugfs\n");

-- 
2.39.5

