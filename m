Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4037D0DBB1
	for <lists+freedreno@lfdr.de>; Sat, 10 Jan 2026 20:38:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA4110E209;
	Sat, 10 Jan 2026 19:38:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="c1V10UK/";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SiB2k25c";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D86E910E209
 for <freedreno@lists.freedesktop.org>; Sat, 10 Jan 2026 19:38:13 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60AGpg7I210503
 for <freedreno@lists.freedesktop.org>; Sat, 10 Jan 2026 19:38:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WX+tpGOx/XtA3egSToWa4xfPKV46G8xjtDhhWctRh90=; b=c1V10UK/4Z7EOUEL
 VubWdwbGMKEsMipAXSUStR+oQKY7IVA5K9MHTFKF8s/1oZ9ZEoTpGrebj7LiAdqZ
 gDkbpBDZcfjFKnBFuRgXkuE7uzQ2/maSo/pFN+hI1onRY9wNjyk1fxvTWQG/iD3Q
 RNX0wCtUMJPaMZF4kqdB+DDROPlCPQnxALABJrZg5DpvxBmEIgQe4cIz+fe45K/H
 wsbxGo82Phzgo0vb1VnYW84uVP9650YV2R0dC53O0iDTOQL2LyXwYPXPJtKqoNUt
 LTj+9VCS3qLTVLPR5C6Maafl8hlM8fXK9XSK7HYfpwkTYYbpQkr1vrzBdfL7kAiq
 8Niplw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bks258bjp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 10 Jan 2026 19:38:13 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-890586c53e0so128844046d6.2
 for <freedreno@lists.freedesktop.org>; Sat, 10 Jan 2026 11:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768073892; x=1768678692;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=WX+tpGOx/XtA3egSToWa4xfPKV46G8xjtDhhWctRh90=;
 b=SiB2k25cO6QdWkXgMWZOam7z3F8dfmpMIVrxI3xPS0NFcFvIsIjAzON7eKgE5fcVJ6
 p8MWfo7rD5hNVDCEQ1yzCEeovCMDufzjKQnL1U3wct3ACpD2OqzvgjHn1DNRcN2Sk27i
 uALD6GNOdjmsTQ44Ts2wqVek3vVVDiLB5uNy4Xf4YXY2PZi82Mns5wXPy30LE6sK+DGu
 KE68V/imq9W8HGiNrqaVUXIAhD0KFaOBYZR8QwKL5pCki0O0wlXDSxhUOpZNkm7Ybcwf
 y/bpmgX3RGRM2Sfdl4QsbPdx7ICnku5NTTQkBDi2niOpoLjC+Twt/+xvXLsqwFPRRkPS
 rFFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768073892; x=1768678692;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=WX+tpGOx/XtA3egSToWa4xfPKV46G8xjtDhhWctRh90=;
 b=s/7oLmI5enBARxoywsoagQxnZ6XqZtdTzvhV+7fFKeVPr2R7ZCN6TlvLrt5bHrY/tj
 ZLZcfyf/cIppsG35oB3iKGuIo++7/6n/Hw+i7fYCD35S9TQPwOBlg6omHEOyW5U2gNzw
 8EPKcB5SMQQOMH1xMiwQYYne15up5Ldds5s2YSG6hUw2d/BKE9pjuDrye/6jatSLBkz+
 g3r2LBeV0BWG2mScwqqb4k/oDUZ/giQ7LGpDLqsZDW/iY4aAIO4FPPFhR6SWuXz2QpQJ
 f6e9yV8rfDu+fCS67Y9Q+O7//AvmSRh6rIb8gimvKvZZZzw2i4noybL5kG7/Y0OhhYHz
 eO9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXk+qNMztH3pZSVb3aG0XG/jeJQ+XRUYTkJWDSTjtKCHVT9Lfl8cfjzfoTIavn1hLyiaktTVYYLVs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3AjY2UpUyha1PvHii9YTjgCaGJRSCliYq7vc85LX4Xx9uDJwh
 nIvBnY/+y5YV+0vnbYp7vI4OiNqkop+oQN/lGfxLlum3dgCGOcEXzx0xGCnzv6/sSiHKS/3uxtf
 hQw5zLC0ILsV5dox7px7RCvsqK8SECXY3+ljDNRI1Kl1+QOtplHHot2Rf0ZH+jw9rAl7RRsk=
X-Gm-Gg: AY/fxX6AhM1M3Y7ojse/QZy8kk30YxhL4WqSxwsgmWGNCfcqoJwy9Z4J7yxxAEYWWRS
 TL/3RPwI58XXV/s7wKwcN6j2JjVE3RX/BZpWKI6r9hI3GuzckRz9vhu8GqR+Ja7cdSVuZkAWrgQ
 B7lfeIvBxvN7vnXBljd0pUssP1aEayh+9ps33jznebdxZIxJlwsQzfxLE1m75kaqPp58sMPupsE
 XPoKlTbKR3CdbLNn5UxuMSz5grPQJyGpwlyvOYdpcREUiGFQuRer/DqgGVcJA0VgKFnhmtpCZVF
 6CSdZgqBkictXwG6mstPDZSgkDjX1BYDJhktkMQ7lFz2yODXUJlGzjxssIOHlOIxEgLNdmfIMlt
 UVaNm0zU/zYy8DRZHAQVK/fkpAt3bkvM5Bt4F3WI5QHLRiykw0hnFr2sdqHuLkmx5Z5NDzeAo+p
 rTfPe371jIlB3Quk3uDz5Ve94=
X-Received: by 2002:ad4:5968:0:b0:7e3:cc6e:3c89 with SMTP id
 6a1803df08f44-89084270b69mr217618706d6.56.1768073892494; 
 Sat, 10 Jan 2026 11:38:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IECeV6PNptdKbFZIIGvq91wxzn+Aus3ciw0GrkSflBtIOmUWwgKzzKf5agxfyj92y7TK4QHFg==
X-Received: by 2002:ad4:5968:0:b0:7e3:cc6e:3c89 with SMTP id
 6a1803df08f44-89084270b69mr217618496d6.56.1768073892115; 
 Sat, 10 Jan 2026 11:38:12 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b65d0f6absm3539700e87.42.2026.01.10.11.38.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jan 2026 11:38:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 10 Jan 2026 21:38:02 +0200
Subject: [PATCH 10/11] drm/msm/mdss: use new helper to set min_acc length
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-iris-ubwc-v1-10-dd70494dcd7b@oss.qualcomm.com>
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
In-Reply-To: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1301;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=JslXq2UN0h55ZGQKK6W5GartLCm1dfjuGB41CNjkyvM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpYqqUNvcF+p8D3B3QRC8FSeYNjnIpYwnquqU/d
 9hcYY8M45eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWKqlAAKCRCLPIo+Aiko
 1SZfB/9ZRCI45bpqc/DRBI659ZGLEIRrafmzdVFMrFYbxdM09ocXLYE6qaempIc6CfhkqVsz63h
 M8N9L0NnAADdAbLKM/cb2NF5wV+ZYT6hO84trAB3IeziCx64FjWpU/xbdTZQZYmCpFD9doXruqV
 akdyqY9fQ2BPYpAdqu3vmDV7EmUcVABo5ki8FLdI4o/eCbpvFrm8MRA9yddaE8weXm1o2Vk98/N
 aDZ4zQHoq+le9fRJ8254bJKU2Pq2yhqBrnXz3OsyPaRr2I54yVXTfSRzCcUw3LzTsDNIJWK7j7y
 UxsDTmxpaOgAXIw7+9kNFJBaW6tgdzayNJ/hF1XZ+63weYoN
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDE3MyBTYWx0ZWRfX+/Zcdclf2I+Y
 R2YYSTPOrhg5bSPyJkPw4mnfSBFxKt/12GtgxLS+o7LupIBL494s4v+BLoHysHomHeT1ZGCoytP
 3HVOvtmfk8Zj1oXlkGmFpm73wsfeAShnF4Txj5lJ5aM4aM4qddK4lzmi7PnxQQC+I73L+3YFOV5
 ZKmiFyh7kLn7tStMigYwJqJpfjoYwjyuFIRnFh6e2FRoVZkWg6TKFq8vDyNnVW2qvJVLO46UlYo
 BXKqFpiuZelwzQSuQRu4R8u/ubuJN6HLVb0kMLXuh4TBEYwPTtXsdEHgF0EaoF7pGDOFdt/Jli9
 wkc+qrCFeRqDjSEiX5rD7M9MFdYfhzF64rr+cgH639RADypd5Hxm7B20opHwVuHyXgPwRu1bNot
 aT5rEgzI3rC1yE9Z+vQbp0QmhyZp5D4pPGaJNsNrOtpjBamkSq9nl34rWCLDLRNcgG/96H/nLQv
 4rCrZpOSkmmnPOtwujg==
X-Proofpoint-GUID: -yhiJqhGNwW-wAR9uvyjqTShDdHQRlSl
X-Proofpoint-ORIG-GUID: -yhiJqhGNwW-wAR9uvyjqTShDdHQRlSl
X-Authority-Analysis: v=2.4 cv=EMELElZC c=1 sm=1 tr=0 ts=6962aaa5 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=F1F9tmq6QbaLjm51Hh4A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601100173
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

Use freshly defined helper instead of hardcoding the checks in the
driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_mdss.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index bf9a33e925ac..da266753df69 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -175,8 +175,7 @@ static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss)
 	if (data->ubwc_bank_spread)
 		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
 
-	if (data->ubwc_enc_version == UBWC_1_0)
-		value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(1);
+	value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(qcom_ubwc_min_acc_length_64b(data));
 
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 }
@@ -193,8 +192,7 @@ static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss)
 	if (data->ubwc_enc_version == UBWC_3_0)
 		value |= MDSS_UBWC_STATIC_UBWC_AMSBC;
 
-	if (data->ubwc_enc_version == UBWC_1_0)
-		value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(1);
+	value |= MDSS_UBWC_STATIC_UBWC_MIN_ACC_LEN(qcom_ubwc_min_acc_length_64b(data));
 
 	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
 }

-- 
2.47.3

