Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A46B25D06
	for <lists+freedreno@lfdr.de>; Thu, 14 Aug 2025 09:22:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72E5A10E0D7;
	Thu, 14 Aug 2025 07:22:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="AWiPrWap";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6322B10E0D7
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 07:22:26 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DMbKqg028898
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 07:22:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=MnT1zdkBq5Ly/+u/Ng12sc
 +/8iUYbKTBTdeRJ7Coetw=; b=AWiPrWaps+f0CqdkqCfWGramuh7shykOv78hV5
 sOlZaMgbPOVJBysPN9DZUXguz1vWwJiVIlSnbGVNj0BybQK9hbYjL/YReqZFgHPO
 r/v7OP8UPPRA5YkjIEBu4JHUg6wfpVUglaFeQFfrWCVYIBfwqgKgmPzIW16QSDdj
 58FnmHZ8nROJtDEloOFpu+mh+lllmuTZKuO6IHY7WsOL89I4xsJ9Z2764g0EKD+m
 Fr40r/lukj+pC6cODGNXYCuT7pN4+BKouZI3Vv17jqlKLEJ4tdsn0UgyseCSUUvS
 gzr9cZgCqB3v5oTd2zLQoJ9BWndytKRZfu3ya7fXCWl32w2g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g9q9wtkd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 07:22:25 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b109912a9cso30152631cf.0
 for <freedreno@lists.freedesktop.org>; Thu, 14 Aug 2025 00:22:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755156144; x=1755760944;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MnT1zdkBq5Ly/+u/Ng12sc+/8iUYbKTBTdeRJ7Coetw=;
 b=BvV2mHC8egoAJNwoiczcQAoUuPZyyfWvc1nvFxa1h53mNMSqAqoi7UhX/Idh5DmnVR
 D7W/RVrrx0ueD0H/xgEX7gKp5aUD0JqGwxDv4zlgvPmyOdtHtdzPTdLTxPWVZOOHE6CN
 X/p+2jMWfOzWsaYKWSWVFjUOX6xYQnZjI2q03vwPymn5IwSY9tSe4s57dgs+VCuJO8p0
 6eG7r+ZfxBPLXyvvTxYEuFWAkEDRjmUwbwwR/SvGAGaU0NP5cMVt1LDC5OkOjt72ZnuW
 tDTOqM3/KD88yxz+IvMBlG25lnRAoFConUfLk0h+olgNEEjPP+zDwb4V0Mfuw2iCUJHq
 UNCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUB1afG1rS4LnuJPmBt0mQ4YRwh7oLHPpZKqemLFpgyqIhMpEgkrqAWqoDpOF08ZCiRgeIsWHDocTU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwSe3ZynSuH7xTkIl+3CISuas8e/Unk9+UpyqLkKhnMxgSIurtR
 ZCGh2zG8ARCaCMGR1kAg/aMEKECNuBWOkw4OvJ8uZrAsvBtpZl01UmAJvPOhaIx0JdFTHF5Ux10
 MEfIOGaFVMIwuo1o3f4id5nILXY8VwC/1nAv9qaD2GFVtey10cnY9ZgdLrJEEJ1YEDN+q4F4=
X-Gm-Gg: ASbGncuesd5CkBRiF5ziO8Fznmw7B5jNuaVFULtDrtVkmokj19USlvYtmXeCCcourC6
 hyEt//7l7IUO6T4+adBZTOfcnS4Q/eJoe10qRgZsuVyQMJg63OraMNa/o04e0vZd3hhKOJzkkxT
 SsjWIirkQBWR3SaLxll0cC7kTErXAw5P8iu1YbEUbae9k7vGmZvclUWG0p1ZJlnwfb1moQ+Af8P
 b+wZjEqm9Svq3QsoHr8lVEwHBHlNGO2sneJ5tZ3NnzRZaVjvDinOsyijmS69F01E6Z8TcTAVC5w
 U0q/lgHm+6yrfB+WOoIK5rKwTiwWAXagRXLbI27q0oUJa3zx+ooabejmwPUrYHaCBar5G09tceN
 2GSFF6Qnu/oyuPd30K6tUQMdMyQGSzex3A1RXFwAWY6kETEan1Slz
X-Received: by 2002:a05:622a:a07:b0:4b0:7b0a:2a48 with SMTP id
 d75a77b69052e-4b10ab22239mr29514881cf.56.1755156144433; 
 Thu, 14 Aug 2025 00:22:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHb3VwlSaDZILHus8O8KVQpaUO65K8gcN15rQT2Aok46dv65U3XR+AaISmMxzu0iFe1TWgqcg==
X-Received: by 2002:a05:622a:a07:b0:4b0:7b0a:2a48 with SMTP id
 d75a77b69052e-4b10ab22239mr29514731cf.56.1755156143950; 
 Thu, 14 Aug 2025 00:22:23 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b8898bde5sm5648258e87.3.2025.08.14.00.22.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 00:22:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/4] soc: qcom: ubwc: more fixes and missing platforms
Date: Thu, 14 Aug 2025 10:22:19 +0300
Message-Id: <20250814-more-ubwc-v1-0-d520f298220d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKuOnWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDC0MT3dz8olTd0qTyZN0UU7NUk6Tk5GQj4xQloPqCotS0zAqwWdGxtbU
 A8tNKmVsAAAA=
X-Change-ID: 20250814-more-ubwc-d56e4bccc23d
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=947;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Xb0ChfIllunQ9/noWHgHerT0uL82KmjGEGaefQ+BHJw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBonY6uMeIzm1lyX9BWlQIfQdv5CbDOChdnHncIG
 HQlQH09WHmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaJ2OrgAKCRCLPIo+Aiko
 1bjaB/9DTi3kETUeajlqCnkurREx7K7Qm1orGwfmzZQpdAhKtOPSO0YQ7Y7p/NQHdMzfmBUpKrI
 lAD67KyTJVLeDTJ1TTH+UoW3FnMmc8pHdwFno+6l7V1iZexOeRV1cQKE77+PsQqTEuedcb8JyG8
 D1ph8klHW1ba5c2TblPSxwvgPhhqdqG58gkgfl//JsfG0Z/sMEP14S+0GTv8m6IDkUDdlwsy0H/
 HDrto+zjK87cFKg1Ln2v0XvJACe6CZ8HoD6vAQjuxnZhfyEDyNc/stEIsr98J/LXHeHqyfFXo1r
 h+zuoASLIicwiJVSuZizyxnXGcIwu09hMoNOi5Jk8X4F1nYz
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=CNMqXQrD c=1 sm=1 tr=0 ts=689d8eb1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KpN9Cobk0z5BVES1_GMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: ZR-23ZEwNU3kMywC9058iLkanf7Q2FEv
X-Proofpoint-ORIG-GUID: ZR-23ZEwNU3kMywC9058iLkanf7Q2FEv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDE2NCBTYWx0ZWRfX/6zBLhw6qvr7
 fXbPLnkcQpVqe5b2QDwXyUKtRtr9aKmq95JU+pFISVOfKQLsJ2dl2rVapEWSEHAraa/2+VY/D+n
 Ng/QuuzaPeRYEivBFsjhyVD5756wpcJLI6Sx4DZ3m1FBShQBzEkdzwKHIH3WychSysi7SanxLzh
 emno1BN8J5YZyoW6oE6WEAS2S0dE1iHBGPwMgvWzPhSI83MqlT5iMBmJMpKP5gDpNf43rJhycFq
 ZQoeO9LkAXJG80vzU1g4XPhl8Bm48k5MR8VxKK0QQC2T0awPs8Sgot82Cie2p7M9ESm91CoqGtC
 K09+BsJlyKAt7RQEMYxFWpCYosFBFWZHirfjlVI4DFksZuddmimwhn6ILuaFFvJf1vIFRX9yyuQ
 qT8Ldv6Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120164
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

Add missing configuration for several platforms and correct
configuration for several other platforms.

Note: I'm not sure how to handle MSM8956/76 platforms. MDSS definitely
doesn't have UBWC support. This doesn't provide a threat for now (as
MDP5 driver doesn't provide UBWC support), but if we were to switch
these platforms to the DPU driver, we might need to filter them out.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (4):
      soc: qcom: ubwc: use no-uwbc config for MSM8917
      soc: qcom: ubwc: add more missing platforms
      soc: qcom: add configuration for MSM8929
      soc: qcom: use no-UBWC config for MSM8956/76

 drivers/soc/qcom/ubwc_config.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)
---
base-commit: 0b6974bb4134ca6396752a0b122026b41300592f
change-id: 20250814-more-ubwc-d56e4bccc23d

Best regards,
-- 
With best wishes
Dmitry

