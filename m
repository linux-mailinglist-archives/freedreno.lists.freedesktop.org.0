Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA64D2D291
	for <lists+freedreno@lfdr.de>; Fri, 16 Jan 2026 08:27:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8468010E809;
	Fri, 16 Jan 2026 07:27:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mfJSSDoD";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MoSA07Cp";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98F1810E0EE
 for <freedreno@lists.freedesktop.org>; Fri, 16 Jan 2026 07:27:42 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60FMbZZ93596324
 for <freedreno@lists.freedesktop.org>; Fri, 16 Jan 2026 07:27:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wgF62A0Vusbbe68co/vJ8MiSnUGF6/3kIJAgIkf9pl4=; b=mfJSSDoDKd+l0yyp
 nPbIotzAReyT4WSca4wXc2GjvafC4liDhf+VlJGNE1ZvWHiSH+oXxLPVNyYkVRix
 5T6/UZdyBbesDwEVfCanCcpXR3S3/zjlMreLMd4JVrSDo1Lxq9h4RzD5BSrhF64C
 16gNioOhE5B9G8+Slu1JidtG7zzhFttMbLihz4BKALZzSMbzL4l8Z4W4tpCcN/Cj
 YRGnaTdv6ODjgkKqteavI5z7qMjZB9T5U8HKlZlzIXExlsw90tJX3XJ6IDcaje6P
 tXKmgqQVvuZUA0IaZ8pd9w4DSq618aEQNbzZRjT9LA/qgovz4X4BFda+dfnKimCb
 mEs1Sw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq96rs794-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 16 Jan 2026 07:27:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c52dcf85b2so678633085a.0
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 23:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768548461; x=1769153261;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wgF62A0Vusbbe68co/vJ8MiSnUGF6/3kIJAgIkf9pl4=;
 b=MoSA07CpdcWT0BSAP3skE6j/jWYFJ7TIZX0wkiqh2PD9MuvR7byuEHwij6AfBdbasg
 q23P+4kazQ1K533g9IccF9he2oJr3I5oWRAxnx8NY/AfXrdd97bko9BDQyJ5aSILkGzB
 vt7E1nwUbAqARlCU2wjmqZWCIpTILuT+F8jSbJL/gHEOFeFU5zAVhRmibFNL/aDSl4ei
 vKwnXOpxTjw04FQwHFSlVj5Cu4wYQ+mTJjOPYzGXc8MIkROvFk3CscZZxynIW0uxKX2T
 92cn/RA6Hx087AgNRMrOdvFRoY11UwE3h5MDax98Je1aP0F6IXASvwve/yiPNQ1W+ksK
 QgFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768548461; x=1769153261;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=wgF62A0Vusbbe68co/vJ8MiSnUGF6/3kIJAgIkf9pl4=;
 b=IdYuMUlKoAVtoL8ervLai0Ye9uCpEYMg9O1XEvy5XC5SKfR7j6G58KH9F+2gb7SCMG
 vYImc/UNyOHRIr08m5WMIvLRG7IOJWmS9761lEpemZ/UOUsZaUzlAJqPSt3gX7xXvuB6
 nu1nrPmdhrmJmi08gkTqSyrbVPQgoQpPN5LxqTrmoAn7yna7+CxRfWj8Wv3U1ZDYT6F+
 cVTFe0NQUvfiTQ8RNxaD7O3JZKBm2OjcDlAEsAQm1PKnEFs+JbiwFLe6IiLeGPNTQAt1
 GL0MddRc14FjEEAEdISpplujDXhHXXR/thcCDBkdrKrTvvETL/S7rbh3RSUHc7l7xjQV
 j+0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjvVcooKu+9pKSR9GOtid2LeGg4K2ro0qcIU4fOUSKS0h2hQrkDWiqYhYVqttxf1I7Jj3odBBvtIo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyI9ykCJB1mJyVjybfuCybYvmCIcHz4NDHeHzS82b1b13ieAy1x
 sfMbkgWOsw+/RzoW4mzRHqK5lQR+tWLooKeUcElQ3JYprpEtVtYW2uKvjyOFF6s/dvjW8xX/g+A
 Zrc4mHvQKfHozkCgk4HujmHebfTHI9sQzyw3Wo3oCpIR8m1HgaTqGcifXi7gFfh0ICAbnb4g=
X-Gm-Gg: AY/fxX7XYpu/iPHqSlmI0EAEs33iwca1MLY/9dJyc8VcwVbQeSnjK3zRtOVOQKuk9Gm
 68GWZNTtn1SjqeSRuJuhFYuKSdyrw2pfGGSofqZQVYmoNICqAodEP7KlbzG9vtTd6po/0y/MKdA
 qAvoone5ciHLByrWm/s2UGGcfa9okhfMMCQAaMvDALqliXnncdh9YNk9or/fsHbv/k8q84SFfve
 CW1YdA7gXD+hBdkF9Z4w967XhoI5FUKTFXgRn3AxpdJz8QAGQD3tLjJl1hzDLDJ8mT9GYiw1+yo
 zqEkd0bcmt1GHBrFM2rcxCUlnfVhQxqNZV8TbgCNGtmgsvjStDsYv0J1g/YaHSdBZCh6AssvHNC
 xl9H8Q+l0s4GLRq5nCQ1Nc7x5on5SSH1L6a8W3UWLF23D3y9hLkgceOF5ZGYPjqUVyb8T1nD1ku
 KcqoXcP16XM218ig8gumILzNM=
X-Received: by 2002:a05:620a:199e:b0:8b2:730f:134b with SMTP id
 af79cd13be357-8c6a6944de0mr277056985a.50.1768548461212; 
 Thu, 15 Jan 2026 23:27:41 -0800 (PST)
X-Received: by 2002:a05:620a:199e:b0:8b2:730f:134b with SMTP id
 af79cd13be357-8c6a6944de0mr277054785a.50.1768548460795; 
 Thu, 15 Jan 2026 23:27:40 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf3976dbsm516941e87.66.2026.01.15.23.27.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 23:27:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 09:27:35 +0200
Subject: [PATCH v3 1/9] soc: qcom: ubwc: add helper to get min_acc length
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-iris-ubwc-v3-1-662ac0e0761f@oss.qualcomm.com>
References: <20260116-iris-ubwc-v3-0-662ac0e0761f@oss.qualcomm.com>
In-Reply-To: <20260116-iris-ubwc-v3-0-662ac0e0761f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1369;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/pPr+dRIKfLnp8Q3woKxExVLtAqBn6gFla+MK36Boq4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpaehpR1T3VBTIQkkyCWtBdhXU5YpA+KxUORAvI
 bellaztkwCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWnoaQAKCRCLPIo+Aiko
 1UwDCACat6lqDOs4O4mFhWUV0YM5NoK2p4O7go9R7f0ZP2lW1boDmpYL47eINtt7v81/t8RFexC
 4JyVdynfkAM43wuBa6wCrWHDm04nxJLr/RX92tSdynVM15uH4aghcMVvVPG4ZLY2labtWx/9Tvi
 om95wvBAbbvZf3vkD/+b6xrtcbefxRkV6qZBd0zUZpBMWwDSshmEfknkyOgxp5WMpAB6VF7muQo
 8LYHaCxcO/ME5Lr+6cQWMQjRHtmP6u9+tD4LYYm8hhN192xaRuwwzh/YZpUaDlXUQkWN+aWiHpB
 S49ef/WFOg5lgsl8P5TSbpTq3Ad4uehuOholTmwFweY7gMfF
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA1NyBTYWx0ZWRfX2u0+mJkqCLHT
 kQ19ZD5FEFT+OWlz3dWdcjf3Hp4uFDXeYt9DlkgswbzOSCP+hiDE6V9IK8xugMy7FvhFaxeW83L
 eqmRXqHnBcgG1wRLRI8GKDLtTgpIbQz1YGwFwVQVtgPK2UOu03+5CppcPEu1PFnEJQznKPat314
 KXWuiw0unH2Gsckuq4saTYDgUr/0RBd7CWR722jT270C4D30KzEOlWM/CJw/i7yIGYYEL/5CC8X
 K0erOnACyhVCZ/KemN2DMSwRJ4P4imz3ttTmWBuZgOl3Cfagqb1fwmjGdAq1QyBN++iQpjcWy5j
 mT4ztBabW8Pr9M1MxyFLcolBrQLe+vq6PjeRO3YzM/mxQmPF0aeIXf8xgyRPPlYufUpzWTzsNWt
 K5ARwPss0lJzUSD5PPg829Q39/Z2Dt9Wgn9XEVk83eLUGbnQgSsb5O2BMdO6YVJUPETEjIMpEs7
 rrKwSy6djbjzZuS6Q4w==
X-Proofpoint-ORIG-GUID: m9-i49MrTL92mhP8PlLpP_5DgXinBC_Y
X-Proofpoint-GUID: m9-i49MrTL92mhP8PlLpP_5DgXinBC_Y
X-Authority-Analysis: v=2.4 cv=TsTrRTXh c=1 sm=1 tr=0 ts=6969e86e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZnE8w8QzOYjIZ_Lrp0IA:9
 a=4tUkUnfIpJ8A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_02,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601160057
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
Acked-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/linux/soc/qcom/ubwc.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index 0a4edfe3d96d..719b31c8fb3c 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -73,4 +73,14 @@ static inline bool qcom_ubwc_get_ubwc_mode(const struct qcom_ubwc_cfg_data *cfg)
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

