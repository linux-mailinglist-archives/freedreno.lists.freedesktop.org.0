Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EC6D1A71F
	for <lists+freedreno@lfdr.de>; Tue, 13 Jan 2026 17:57:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68B7010E51C;
	Tue, 13 Jan 2026 16:57:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bl70m0mn";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j2m8001R";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D541110E518
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 16:57:29 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60DBDagD4164875
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 16:57:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JK9AxhgYIbJM0+cWK43XTstWc5qQZ8PXw5+cHXsulL0=; b=Bl70m0mnIlE3PPiH
 xlZWgYuYfe3yQGbXCaJHGFprZEdXuDhiWbfEADlSsQSfeMKD0bwzFiXFnHgx/Cc4
 AVJ6nXpTaXAoK+VwLUPpEWR9pJ/RlOWqpXxqSfphEOpORj73NaZ5P/mT5hu1qDYD
 mam1bKmJPDSKGlI8gKF0jErs6HWIirJsPdpNdSPfkmo07yuX02mBXNce+aXOkWAd
 M68CXgvpH5KW73UyI5Ctm3M70MAK/msQmO+Om14m3X6rqcqs9a+CEw/cDfzLnR6p
 Y4JzZHp8dhOUBxyDxQDlCLY+9TdtANtbgkTBDzBAFQOGDNgPKwripZBC7qoIyL7i
 83mR9A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnn06s4j3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 16:57:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c52f07fbd0so31987385a.2
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 08:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768323448; x=1768928248;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JK9AxhgYIbJM0+cWK43XTstWc5qQZ8PXw5+cHXsulL0=;
 b=j2m8001RO2ZsLeIy7TA4+IrODoVlhMSkDJmuhFWpel8uyqwEMUd9I3+64H+CSqActI
 kUiH3Heg1CuPfbxzebxl8sg3xwRRBeZgIYGNX3nvDv7IK37vABojSGY6z6XQ8ka1j9BP
 Z98coAediR3Uz6x0DCTEllA9GW+kwzs8EzYHXGPVvIp5aNDkDispG3KSOoWPiU+Uem2S
 qQJNrWTnDvfo6V/R2mu39G+s+mF0w3IAb3W56dHEqyKtp2rGFKA8HNPWwKHhvmDrVfkU
 brdoBCP6GueF4KrpI5foHYOdNjan5yjygo2d28qUoRkZwqDqRgXz1iIY4ElbqSeEHEik
 O7eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768323448; x=1768928248;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=JK9AxhgYIbJM0+cWK43XTstWc5qQZ8PXw5+cHXsulL0=;
 b=jyCAF/YK8MlhkiAayJ5zOPDEgIGHS0U1+wQs/PaIjpPqkrXetpgD+1yqY73sVWET2D
 jLJGG0QLC2nycWXTsX0FD3PcYDDS0EsooJtXT8TWDHtQHTmTDlJoUHIbAQVgP8lxSvta
 oPpk2jWN3TEtD9O5Yi3as97cw9GYetcin8zJx/KaKP+TC7qh9VgCGtmXbWOwhYp/rkwu
 CNvKXWvjd8uebOQ8U/vHCQv6g7hEW64HqKEuy/6Ai5S30Avrk64jG4D625glFbu8L9Oh
 Cr7LSytzDVqGm0m5DrPmg81jlOuxjTEY6HQ1BT2/lTvWi7p8sd4rgB9aZXYlQUO5SkH4
 919g==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5hatY9MaStSAcXpxrGJ9LdynnWo9RsDpx0YrmeHcviYEjPjFZP9pWigef91B6q7ZKaI2NcwSA/vQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxpKlsvIf9N7epmPKxzZLJeYGJD0aqInfGZE/T1g+52XfJaAIkS
 R6mJdVJoKMzv0XhYYvgvkpN7CRwKaDveP07QHQjKneItKRskHPvSB4HcSN8XP8QME40RmK/X0cm
 FNIoOzBRTxygWwTfvdNm4Jobz4JFrjb/uTlu5cqDqxLzP/cnbaPPW+r+GBz4Piw0lvbjWzwU=
X-Gm-Gg: AY/fxX4yuT4nImNZj90iR0n48AU8orQ5dw6veiRdD2i+doCz9iu+ZN/WStR9GlMuTi0
 iLmCcQdXgyvipmtiMgPDYy1tCBSTY306X4iJXJ0RnMU+D1h5VE0NaS996icLcow6ydoepWauOyp
 DlbT/yumuUwO5D3nI6i8cnu397zLKwd5gAGvwDcjVO6Wp078jMJkjZg5CxjNfWkBOUqTcLmjwbR
 6Wy0QZWgjmSzDCPMFs+OXms/j0wABrFCi6DCGWTmq88z/JPaC/yUMUj5iDc1otzeAzfpb02CoDj
 oZDoZ2WemxoFSeqlSnEv8001umbbj4m9lxG7ekVraPdJj3nHS8311/JNI+g6rQ/GYoBOdqhhE7I
 KFtCjwqeaYv8r+w/wWwFL2MriI37SNAHpdTkj26dbWVWN1X8++BOc2yac+i75K3+fkvI3K3iuVp
 TbfHp6DAAOlC83wSbSd9J/sR4=
X-Received: by 2002:a05:620a:7106:b0:8c0:e5ad:adcc with SMTP id
 af79cd13be357-8c38942eb97mr3003664885a.89.1768323448371; 
 Tue, 13 Jan 2026 08:57:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/AmuzhGdeXGb9IMgcYMTT/QFul/YgNecvob9Z4X2y8Ir09IUQq8baUg6jojH31xE/m7+iNQ==
X-Received: by 2002:a05:620a:7106:b0:8c0:e5ad:adcc with SMTP id
 af79cd13be357-8c38942eb97mr3003661285a.89.1768323447925; 
 Tue, 13 Jan 2026 08:57:27 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b72af5ed2sm4788677e87.58.2026.01.13.08.57.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 08:57:26 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 18:57:16 +0200
Subject: [PATCH v2 01/11] soc: qcom: ubwc: add missing include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-iris-ubwc-v2-1-4346a6ef07a9@oss.qualcomm.com>
References: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
In-Reply-To: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
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
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=780;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=htP3Z9truSrb0C/f6zBgHeYgKgcZBATzt8YmI0trXfw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpZnlyX+mRV4ra4qO0k58wxnrmUYqzjwCmx66iL
 BixaHexCTSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWZ5cgAKCRCLPIo+Aiko
 1XTHB/9jF+1UmwmCL8Abj1wTPKQwTjOSMKu6jxaBgqrHCKE6UxKbVVBKzZIVwfVdgEpPK4bJX1V
 Al1LMZOXT1R/4+nvtR89oNI9IjoQHm9V7VN19DULx6VgiTDf+XvDPHpOAMaW4gsZM3K5s4F2Qg8
 703xTjLcG6gJlNgQT6iozLZ4MfV4UIve5RBkxscPBuFTooHSC9klrNJ+LnOZcCQ0LJo9SgRVqz2
 /aydN9DfyYEdDTQ490hOFIoJTzMu8G32KfdTgnZT6nAZH2wdUwPvzfnHDxnGG9AK+HQe0qTIIZL
 ocD1X6Tbmg+JEpK+CG1ZUyg6O8tDRDPKBzSs1aW26UKO1vjQ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: c-rWWxc-R3NxLSnyHlSCjfpkBD9rp1mI
X-Authority-Analysis: v=2.4 cv=ZODaWH7b c=1 sm=1 tr=0 ts=69667979 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ALiPkwqszP5KJWpCD6MA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: c-rWWxc-R3NxLSnyHlSCjfpkBD9rp1mI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0MCBTYWx0ZWRfX/aQw+gs7C/d3
 m9SXCXKMBBeLDuz+IxfAnvEccopXoSBW+pJNyL2jhfLnok+O0++zNkTaje0cMDBGuNmqltWKnD1
 tc7Rc2TUYrJYkMnPfCbixwh4/AET0G2JUVA7UyFcvGcWVl9JP5n4D32yMDIXsImTOPkFXzVdvkJ
 TxvzLxo2/kabm9qdtTPGDm3BmMdRhNCkCSxiLouxXQw/xtYVIYQWWYJjNVcrivLaBDso4ALRvVH
 be4UFn6WrYUXoAE39I9mdcRsL8er12e8R6CLIDDAO5AFkAd3t3kwbxy8jgUi195mGDxOhbGq1ko
 eyWhKyYY5n8Jxc/8fyhJapsqf2y4UGZkA1Ic81dNDCK2TCck9UiTKowEdtMUnC9aND5vRbcAQZb
 SGSuIFziH5vA8cxbEEhfcQGlY9TPllGPp9cs6Pmaxju2f7xSCLp1zVE5LRQGQ8nnegbjGJ0cyoW
 Nv+vBoh8R61/IX7j1Tw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130140
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

The header has a function which calls pr_err(). Don't require users of
the header to include <linux/printk.h> and include it here.

Fixes: 87cfc79dcd60 ("drm/msm/a6xx: Resolve the meaning of UBWC_MODE")
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/linux/soc/qcom/ubwc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index 0a4edfe3d96d..f052e241736c 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -8,6 +8,7 @@
 #define __QCOM_UBWC_H__
 
 #include <linux/bits.h>
+#include <linux/printk.h>
 #include <linux/types.h>
 
 struct qcom_ubwc_cfg_data {

-- 
2.47.3

