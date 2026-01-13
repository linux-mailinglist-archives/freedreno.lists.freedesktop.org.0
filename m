Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37649D1A722
	for <lists+freedreno@lfdr.de>; Tue, 13 Jan 2026 17:57:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 762D110E51A;
	Tue, 13 Jan 2026 16:57:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="THaJ2Hv1";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BwSnpRbE";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C26C510E51E
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 16:57:31 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60DDsSvZ2071209
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 16:57:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gwJ/St2+Ayz3u0f8yManVcQBuDHM/IGJ+FC35JXt+Dg=; b=THaJ2Hv14JAK5di5
 8JTVl4OO9A5vNPDfRnovYa2UWCWNEDE8pfBhK8k6PnzI4V4C2dmDQ+q2U5dso8kr
 Ze8d8MCM5aYDh91Otihi4WQKM/MiiADDRPyQuH+rajxTV9bttIhAOcb60BVy2lht
 EJpKU+wp1KKmOezALKZJSdh2zbzOk4tyASujOFlL3jCSi6AX1kiO+nAazp+1ZoaF
 4CMnej8nGDZQRatGPm8fN2hTx98xn88u/olgoQvVxMLA9WoRXzXJ2bzACshVVjjV
 2a6cPN+Hvo5+5fhB+jvL8AwrgD2/UKGWGY+DGZVSOGm2yYYrJg8DTVKCmkTkxvh3
 hS2HYQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnqbm8nce-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 16:57:31 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c277fe676eso2296473085a.0
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 08:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768323450; x=1768928250;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gwJ/St2+Ayz3u0f8yManVcQBuDHM/IGJ+FC35JXt+Dg=;
 b=BwSnpRbEChpneRM/tMzNodpmuxstlJvaZ1yhCBKduAAxiRQCbT9b8Hfrw7vA4csSZb
 0PP2FTcFWnU9Z5NYXgwdZNNMuQfXvsisETK76G4s8lp8psEcvCMlHV06cyNkdxXV43O7
 MoWJMWO2WMq8RKxTk6rfHiuenzmAl24nYsFmzrOGSCigp6e3/DdtWzJ/PW6UXJZ+STbi
 0kyPPSmRmOUo+Bp0vcLRhPCXgRfaoOGCaEudL8a9mLhc9QTTFtRkjynmBdTyQOqrxkA8
 z4cUxLp+w+rwMSoh+LsSQ4bg9xblluRHY7PQ3XiShKvo2ewZ1AnzoKic5Bh8sQUWA8iJ
 C2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768323450; x=1768928250;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=gwJ/St2+Ayz3u0f8yManVcQBuDHM/IGJ+FC35JXt+Dg=;
 b=TNHcd6PunXyzh9sK/4tlZojAzCgLvxK8TkKWxqKjM52oRESBNPvnW+eWdvB1TkoLRU
 LIjMzmu52vck2jKblnEWH0bQFNmKxl9lDbUA36Sc0vOsJb6PcOZWLJKYQXVyE+9a/ERD
 Bc/kPcXjkp0m6lKdStKG+siPDfDhSFOMY8K5DrZVYOxJ524OHKKm3OJGTFSnWDAbtxox
 MBDQwik4nRgBWYta8QS4qdeVZqkbnl0rYaAFr8otP2QOADCC5qwLKUupjKIuojgYR543
 q1ANm7Naqic7IIeF7vWD79nsapPRz67Nrji39YaYOV4vZsskllwZUXmop1YIQOj39DR1
 /6tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVK6x83Y5xfH6+lYHhDFjavhH+PreF8zcE5NAqxXp4fbx/q0ZAKAHiDLK43LX/M1q3WfhKkvPVY0J8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/+Paq5C+dBeM/6D3h3yQgIYsh0sxCLkjKt8GarTQZJ7pjM09N
 C0JaqENH8CL5vLLO28UG+0yCK4S8J8hjGcIk7rj8qcDGEf1ls8LjQL1+C47FJTSH5x/GhMmllgn
 Vn9mv2wN4TL8kBtPrhKDZf+rtHcPWVYKCxtU2dY34nNXWPEG42Uy5jTGEEKjOfPFsmF9t8VQ=
X-Gm-Gg: AY/fxX4RoPBy+aml0hIanwdNe7sLA9H+hJIQ10IoDVqmoJrc155QeBL29e0so/me5Ij
 PtuG8ky42SoVUk9CMCnYGcKzJjsWWx6+BRb3dlTwgdoxwOLE0YbOEbqKDjcoK63/UfnU6509rV+
 6Wd9jiXkLfFPH2030glI+pWn7Vt5LLRWgKVjV8efjFuSW4QMNGuDY9E5UIKqDdL4mhHloWTnftn
 FL0+YoLljLCLeFFgVU6KqgMHqvTzKRtjPRuVosDNjP6+15x+Nq2YDVHFUA9EPyHpUWPjcvb46Qq
 bLVjQoIgZNwf9y07ODSgYAat4lGMuEV6oPeYGObpn9EjnKYLXTMLneFxWqueyGbyUydUjNkiefb
 vNO55g7y7vlOgbABdp71UbCd8ecdHB4KWPIrr/qCgLiA3afxXrMhB/pXcp5xOLvKQXvKHpDh+qC
 98hXiL2rYJ5M6NqBvoMPfhfJU=
X-Received: by 2002:a05:620a:22c:b0:8c5:2bc7:ef4b with SMTP id
 af79cd13be357-8c52bc7f196mr145685685a.4.1768323450176; 
 Tue, 13 Jan 2026 08:57:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETb/7ii8sn89Sw8DV+nF7jagzkTsPymak/SBe7T7VsY6OtDNVMWeWjvXq4VG/TaTaK4FoePA==
X-Received: by 2002:a05:620a:22c:b0:8c5:2bc7:ef4b with SMTP id
 af79cd13be357-8c52bc7f196mr145683785a.4.1768323449624; 
 Tue, 13 Jan 2026 08:57:29 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b72af5ed2sm4788677e87.58.2026.01.13.08.57.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 08:57:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 18:57:17 +0200
Subject: [PATCH v2 02/11] soc: qcom: ubwc: add helper to get min_acc length
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-iris-ubwc-v2-2-4346a6ef07a9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1191;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=e0V98OiixpaDzO7JJw0Cyt2lkwpGU1Z/ZtgdjEfcF2Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpZnlyDVz+Wo0glM21ifTIaAQLz5zzbJ4yr5G1m
 +ccpl6RbmeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWZ5cgAKCRCLPIo+Aiko
 1SaPB/94hhSkf8Jfq26zR3Uyp0NXJas6waNJbiN+pOkZBHHRlnQxe7rQ/joj0RgjPdp9LKlQCQt
 HocVjc9oF8l2stPsKZofomcbU0siWNtQvToM4Hexmo1inJkw56+9LvCzkV3DyQxyJ6HsV5b5bas
 /TszfA+YKyCzumsLkXZeIrzRRj6Y6j9KgRoTExU3qbdpetocqYPQvZdxXVfGtrF7g35R7pd3XNV
 LQPDO/pKbScaPa6p2mdcBQyJuwBjBJRGTpui85u/vnUsbP6WmBTjxhkr398LsLkEU/DfUwRw6wI
 51kNIAw8g6l01v3BaUBdNMEF0bDUXxoyazke+ndUHonFfY8o
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: oBXZCNhf95c4BhLnXrfTPFzgoqAkAWmS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE0MCBTYWx0ZWRfXwAmgdC4d0hak
 LLgafjFa01Yt5BnqT99xwCHegeeiOI/7YnrnWQaC7z+kPoY/yLC2oz5uF3vux4bmqdfNpOAyTXi
 lHIrpt4jaoCfGWSW60Zznpr0ooa0sXl8hlY6r02vbTTeS3TO/82Y0HTddqgZp8pabrFlfzEL00p
 H2avh2JJTnzG49ZaafvN0Nfkb0GZMGzyi4RV5Xy4ZrspcPD2wZujyDLQm3IbqTNAh2uRAzK6cDX
 HqbfbIagI177FbMDuafU7edEN1Kv4MJgjrc+VGHKDPiB96Q47TxNMK3n/+Bd0kq7adb5hiOJA2g
 K/PBmPWIIcU03R3HNfyi/wlbf4TSv4XfbPPMJJv7s2Urk/gzZv0/OprCSck7RM0xmmSSBbAkCm3
 M3XAk/BnErD1AfKKzZCNWJuyT23QTseTm2gQuHqtlIDzt2Q73JY23H5g3WX88IQoGHRpbe9ILZk
 KGJoRtKwcbtNbA0HO0Q==
X-Proofpoint-ORIG-GUID: oBXZCNhf95c4BhLnXrfTPFzgoqAkAWmS
X-Authority-Analysis: v=2.4 cv=YdmwJgRf c=1 sm=1 tr=0 ts=6966797b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=iQqaBmfQ5YO45CrMvZcA:9 a=4tUkUnfIpJ8A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
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

MDSS and GPU drivers use different approaches to get min_acc length.
Add helper function that can be used by all the drivers.

The helper reflects our current best guess, it blindly copies the
approach adopted by the MDSS drivers and it matches current values
selected by the GPU driver.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/linux/soc/qcom/ubwc.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index f052e241736c..5bdeca18d54d 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -74,4 +74,14 @@ static inline bool qcom_ubwc_get_ubwc_mode(const struct qcom_ubwc_cfg_data *cfg)
 	return ret;
 }
 
+/*
+ * This is the best guess, based on the MDSS driver, which worked so far.
+ */
+static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data *cfg)
+{
+	return cfg->ubwc_enc_version == UBWC_1_0 &&
+		(cfg->ubwc_dec_version == UBWC_2_0 ||
+		 cfg->ubwc_dec_version == UBWC_3_0);
+}
+
 #endif /* __QCOM_UBWC_H__ */

-- 
2.47.3

