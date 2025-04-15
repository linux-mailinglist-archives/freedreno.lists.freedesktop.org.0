Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E66B8A89833
	for <lists+freedreno@lfdr.de>; Tue, 15 Apr 2025 11:39:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90E0010E6C2;
	Tue, 15 Apr 2025 09:39:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dNigE9nw";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15A5610E6C0
 for <freedreno@lists.freedesktop.org>; Tue, 15 Apr 2025 09:39:54 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tITd031756
 for <freedreno@lists.freedesktop.org>; Tue, 15 Apr 2025 09:39:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 XZFldRXNlH8KDu+WC2sgkeRrWTmxXWr9px7jq0yAmCk=; b=dNigE9nwGZFwViS2
 a5PF8fqzQQ01yz2+aaC5LlQQpKSOlliG7r7MX3ioTC6X8Utc0SslzkhCGGU9PuX1
 r6T635CkS/R8FTSdmLTDQYi3tGQDOH6KRj7U7oxX6GbR49pj6qVL7XQYvhppJWTQ
 TBy8KDDHG/Q3VZPeBHHjpyfxoZFrCiY+eufX2BW4ZMALcmsoqOMquMJzgF4tlfW7
 wY48ipUZ3dQyIfRd4NCCZ+e0tRefArFxtanEIoQLXhHoN+xs7wUDl3jSVbz7VWUt
 IyyC3QHFBh9zTmHxTuv/rE6YizrE8zsmyZZsbCpqupkuLexE1Aeks/oCcy2qKVJk
 9R9tOA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfs17j1h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 15 Apr 2025 09:39:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c5c9abdbd3so498448485a.1
 for <freedreno@lists.freedesktop.org>; Tue, 15 Apr 2025 02:39:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744709992; x=1745314792;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XZFldRXNlH8KDu+WC2sgkeRrWTmxXWr9px7jq0yAmCk=;
 b=jcctLzAuUOIHUtjoo7yfF4xUmpYxG/DMrngSVQ+IUL2I2Sw7sb5h2F6i3+wO2MGUH0
 9cpoEQv1y/2IWhCYuhAlRgUA2wOXMpFulV9pG2Y5DBJyKrJcT/YOdvW/2lBn9WC06HDb
 ugkHmSrvXNztlq1+5xPx6YoE2SpJl6cHxBoeYlcdKAl/2+Ks1BfPfKlkp9aJRwGnFtyu
 3QybzLgih8f/aaB903x+FLDNPEaIejHpJC0+6Lq7d/1oEyAbyWgvesmRbQxo+v+oJJRA
 /igDmQVoNiQbc4P9jdv+VHDFfwli2kIMWzMGhBSs0/lcceXro0HBWGREaEdHJkiJwTM/
 FMLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPkmUIgnfIP1cK3zdahSnJqkaq90wPD63Wo8eNA3RBBrqSkqLf1IzY5LbxNDSl9UdQ5P5vCddPpYo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzs7ShORsJe0gwtB5beYo9fx86av7CLMqE2UsVg95zyhHrPGpWg
 AH/c/opaD6idEjqLdIYvRsMMFXQp4kPEbyUJmVNfyad7Hv7QbqunnQ6Jka5ufKtUidvp9PFLz3G
 DLGUDRLGtNeoBGb7fTIBC85IOhfvRNIGnh7+an6EUXZgdihuQ2eUMrI6k4KypEga9A30=
X-Gm-Gg: ASbGnctpERTdhN2UB37mGdtptEfj1K2fKCamIwZrXNImCDEWFfQQzW1YjGEWb4iLX+v
 TAVhFdRxCZ+LW9LOd/Ws9rH3oVxaNWK2WRKijnH5EW2OgE6Fk+cu+CsOKV5g4rl64NldFXjDz8E
 4JflM/pXJ4RoFl3vN6phG1E829kgIBDe9jYcm/H9Ji7vLjkKE11qPkER/t6Kp3fh4l18lEVCGUS
 TEN6Ptdj7HfGENPwVtEod+LEjcsJvCI1cg971WxpAYn2v7uW/HORracuJ8rR8xRslEJe+gIBxZC
 AA6skozYrC0SmWe/d3Pk1YycJULeuzCfyMhbh+QXJQfy79apudnxzWm4RkeDveqX282w26V2KiY
 7PwE3/Karb40cwPHyswgZif5O
X-Received: by 2002:a05:620a:462a:b0:7c5:5670:bd77 with SMTP id
 af79cd13be357-7c7af1238b2mr2775898085a.55.1744709992252; 
 Tue, 15 Apr 2025 02:39:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH60ouhfu37ZbUCCdaM4Wu6LIXI6BjqbTNDAqrORBs8MMR78mEaAc58RFd2noqZlts0YKJvpQ==
X-Received: by 2002:a05:620a:462a:b0:7c5:5670:bd77 with SMTP id
 af79cd13be357-7c7af1238b2mr2775894585a.55.1744709991825; 
 Tue, 15 Apr 2025 02:39:51 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30f464cbc60sm20141901fa.24.2025.04.15.02.39.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 02:39:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:39:37 +0300
Subject: [PATCH v3 09/10] iommu/arm-smmu-qcom: Add SAR2130P MDSS compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-sar2130p-display-v3-9-62314b1c9023@oss.qualcomm.com>
References: <20250415-sar2130p-display-v3-0-62314b1c9023@oss.qualcomm.com>
In-Reply-To: <20250415-sar2130p-display-v3-0-62314b1c9023@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Bjorn Andersson <andersson@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=944;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=j/LGXpgnuRffqJSRqVOkk/ZdY8s1uzD2F9Jjdwztl/s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn/ilXhJKvBRqpk7CsNPZqkpAehg4pITVdiFpes
 BoRKdFHXJ+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/4pVwAKCRCLPIo+Aiko
 1YP/B/48+nZbO6Et4YDrFWvGyDoqZpKmhOtKcHu0rNlck5OXzpwD7f7PaaYn0iNa4VhranUrM05
 BA9wH1/Bhcadows98Uc/YJBciKXZzDXfGPzPX1NlE4svSULFT6UXGKCnKbJ3k7tzysLk4VokMuD
 pyUm5fuw71OpydRmXg63Rr0cj91Kf5zroL6qfw1mxGCTv+r6R0V/YT6Z1NhK3wT0XKYnBpKEGOO
 IIlTK9qGbb/8lgNiHyyKt39Jk8f7iuhRdI9s/6awWqwdJx45NMB5RoIZX2omEfj6b/kW4MYjAs4
 5Lsn7TNDh9esapdQGOlGifx4ljoLqB/ocUsddivk1Pger+N5
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=P9I6hjAu c=1 sm=1 tr=0 ts=67fe2969 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=VUTEsYOwyNIbN2ghz4EA:9
 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: iqOIhi7xFJbutZ_dscOjbwnqH7Eme_cr
X-Proofpoint-ORIG-GUID: iqOIhi7xFJbutZ_dscOjbwnqH7Eme_cr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150067
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

From: Dmitry Baryshkov <lumag@kernel.org>

Add the SAR2130P compatible to clients compatible list, the device
require identity domain.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 59d02687280e8d37b5e944619fcfe4ebd1bd6926..ecc4a1bc9477b766f317a58ef8b5dbcfe448afa9 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -356,6 +356,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,mdp4" },
 	{ .compatible = "qcom,mdss" },
 	{ .compatible = "qcom,qcm2290-mdss" },
+	{ .compatible = "qcom,sar2130p-mdss" },
 	{ .compatible = "qcom,sc7180-mdss" },
 	{ .compatible = "qcom,sc7180-mss-pil" },
 	{ .compatible = "qcom,sc7280-mdss" },

-- 
2.39.5

