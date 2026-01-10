Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE02D0DB75
	for <lists+freedreno@lfdr.de>; Sat, 10 Jan 2026 20:38:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0BCB10E191;
	Sat, 10 Jan 2026 19:38:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="m+6u4JTq";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LaOKQjAo";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DDDA10E191
 for <freedreno@lists.freedesktop.org>; Sat, 10 Jan 2026 19:38:02 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60A6dg713385829
 for <freedreno@lists.freedesktop.org>; Sat, 10 Jan 2026 19:38:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cE1iNK7oSYb2ENHxgn2Nm8Ct5MGHGyoDIREyhbI0Xwk=; b=m+6u4JTq7WcFnqHU
 AZqj43pxtaOmHj6ro0EZ5VzxUTgxCfiv+Mbf1qD04IyVoEvpmt0VwZ6L8PVkgHk3
 JEXs4ZXWXd0rrGLuYoVqdcVJceSmFAo6BsC9CMov7c4rxR4H/5acquqFn4OEo17s
 Ie/JjQXkRsl84zbezJFvPkelYjD8b7M9JsqkDr+HCcUZJaaowSpXaIdFcbXurWTb
 mglSjN/34ZWtYgTeOQ9ZKUodpdfnSGYYotEnDnP+ouWtz6riw/Ojxh4pesZ7OdA7
 xfroPAWDSAXsQkId8ObGxnLfJvpKX5WyauwyJomVztQAzoMWiJcTUbC5bsZPLNrm
 dWeRug==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkdqqs9kd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 10 Jan 2026 19:38:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8b24a25cff5so1647073285a.2
 for <freedreno@lists.freedesktop.org>; Sat, 10 Jan 2026 11:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768073881; x=1768678681;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=cE1iNK7oSYb2ENHxgn2Nm8Ct5MGHGyoDIREyhbI0Xwk=;
 b=LaOKQjAofPtKfABmHRdtdUrlJdVaOPSBbu0ihIftsZ3/tvviGWmoV5PGLvkSiUHLS9
 UP5njhUxnZ/H5o8dlMvPD5P5Mf/bDNHp0d++K9o0NSYzgbGgcLZPfk0UzsxiCaxYK796
 2xnUFyT+hhHkvisjgKVJopqrDbt3hknyjRsNKoJ6kDO0lzDRzfc1gpd2Gs+nzVMkDfLf
 /klpxynJS40C2x4XZmIrvV22Fj0KqNKCRLvAsZFxCyVZYKXBx0bp7+7ed5XVuT0vAoHP
 0TKmeSO8z1Hdv0Me+9KHcWaWVDUMlxCjwQVqLzvWasL3P7Je9DROJ3vzGNStxIts8TgN
 JTUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768073881; x=1768678681;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=cE1iNK7oSYb2ENHxgn2Nm8Ct5MGHGyoDIREyhbI0Xwk=;
 b=B1TJYwaqMc7Ela4Cj95KUz/cwYrlrw/lwFPXWiTKXmc06dQWecqO2Li5Fdzm5EYfwA
 ER5am6MgZsB9mKAg4p5fbWqDrjBuBmf1hsR3mSUQcsTH4J94j3m4f2V8KzCINcOpgKWs
 qY+L3QjwKxj1apY3e4SmIJEyXEkmxgGvgX4HIl0DHND6fI93wL9hEX+SDottHt5GLaJt
 AkU/EVXW+nDwiBpCl9wqh99mWDIIv9WplJrKWd36uB5UZhzRazdAB+0oEQuHs6LPVn8E
 525Dc8iVxg0hQBVCZ+h5tHMOX1zZTCvIMPVkCB7VczV/Sw6cZYZM30pOVFANSQt/5rT4
 /Siw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUi6aBKqGPAe8oxdqI6t9Sgn6mj9Tk84tKWVtU5k4E5Nx4LiemSYBlZFBrSGo+Ycdkgiszpom9cwWI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywg1mejN1mX2oLuN5fIe+SQLwKTufV8WQ4GgDgXr/bVaKzdHIRs
 2E/1hZg43RJTP7H6SHKrsrL+SnhLbttkRd+YRTtfGvRrjGE01jdKwTmgppBb1unnveB6VD91ZKa
 mxOKCRpLVFpSftzZDTl/IrHrM7D44rjPcP7ccYowSTSOz8FWI+gaOrYCZSKyKOzeq0p+eieo=
X-Gm-Gg: AY/fxX6kAcEcoru1+gKoN19xddqpvvo3O4r8ZyFQB5pfqfLfW7lypdOu5NCKKlwbnD9
 3TjBnGmkf/J74432cOQaBPOPI/c+IdMu/cwAFZC0XI2+vQGG20yF2OTU8x79QchgNWIfx5h+uSx
 vqD6kBWO4p4+53FLaikAW8Rm/T991UtxJhBTr999wMjp6nB9mrxw26Td7AeenWUhwsf0oB782VJ
 DAQkNipaDCn85si8FuHhC1rHT635bAOzr3Xurt66nxEkXEGy7X/KEFEgOUKuJ9QdceEQDNl3cjk
 MpJ/xc9liSCNsAznUfUs5SY4TeV/mB1LDTRzMcanCpfsoosz1x9ooy6BBMWAxJjY5fYYRhSq49c
 Z2eNqYJejo92piVPg2fBN4ccBD+UVa1wv07aS7D9ShxjnyKfCX4FDdWb5qqUcmiyqPYnWykEyU1
 x2Ho2xlm6nAJDJ7hImlBm1BCc=
X-Received: by 2002:a05:620a:4613:b0:8b2:e8c8:671d with SMTP id
 af79cd13be357-8c3893ffedbmr1740246985a.60.1768073880869; 
 Sat, 10 Jan 2026 11:38:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/f2rvS0VmS+7ayW3OO3OHA0x8A7hZk0tNL9pAd+oYNFUThZJ515f7N2X2V1J2Ht+V25Vy5Q==
X-Received: by 2002:a05:620a:4613:b0:8b2:e8c8:671d with SMTP id
 af79cd13be357-8c3893ffedbmr1740242985a.60.1768073880324; 
 Sat, 10 Jan 2026 11:38:00 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b65d0f6absm3539700e87.42.2026.01.10.11.37.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jan 2026 11:37:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 10 Jan 2026 21:37:54 +0200
Subject: [PATCH 02/11] soc: qcom: ubwc: add helper to get min_acc length
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-iris-ubwc-v1-2-dd70494dcd7b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=873;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=zKJ+c8HSILFFBvnz1YjV0aR6Aoj/wvUlPAFO+6q13BQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpYqqS2+miKKkIMNsyVf/kiv0DOSE2UY6Wq5hSj
 kyX2UCIbleJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWKqkgAKCRCLPIo+Aiko
 1YDeCACAIpwx2qMLl0UJtMK6ivOoRA+N9ufTPpXO0ue1uvr1rIKYFwDC6s4Up5Lsd9O/6KKrsF+
 +GJ/xpjfpATisd/7FhAIqJGMES+O83Hb1UpFxKzHZBinekFpWpzs1LUFMeRHONj6v/GR6Ex40sM
 GX8hbcj0PhSPvJOEvOvh6QIMjHA6GfCLqsjhXztUij0QnWlX7BSbRw3ChUGBphTLRo4lAlheP32
 qnqALsCxc6lsZnmmqHLDJTWfcigghWgEQp50E/vOneTnGtg2j08PoK50KuAiE2XQ0Vl78HcSp54
 4fvV812T3g8WS15Wd3ulfz7auQSa9IQZvZFa6LjMb0K8PbLh
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Y9VqLq2xAgOGyceWJphUrY07qC5h3qjC
X-Proofpoint-GUID: Y9VqLq2xAgOGyceWJphUrY07qC5h3qjC
X-Authority-Analysis: v=2.4 cv=a9M9NESF c=1 sm=1 tr=0 ts=6962aa99 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=IHcyGVePH8s1r17UYT8A:9 a=4tUkUnfIpJ8A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDE3MyBTYWx0ZWRfX1AmnysdKzmJD
 0Cw1IuBTP1t2xfwfIOocb15QWRyfKUJsxn1D6vc3bTlNBkpaO4Kz9EublAUGZrXgiwjwb5WFGv+
 l1frb0/Uwev3h3DtZft3x18QVnO+BJnVfrD+N5mzxDK/gYB6DkVG3TrvhOPiF6gtw19qNRkCkKW
 1Ww3MjlBujKAFpW0fXN0KXXcX0aoulOQ7oAeX1o56c72DaSUYiL35buhMYsEI2DmmUVBFdOP4t+
 RwFQ7nlyde8rxY+LfLGUUbw9hzPtb+nVKx0prIkO9KGESkLJQyJi+2Ha0V1CNcgmdVPzhTGkJlN
 NWo7/GWlTTJBoP0p0TlpOlW3lI1FL3rkAahTFzuSpoeUNkFZ4ObdT+rLFY91hiv6EyY6fEaMJ3R
 VGXxTmpqh8FzuTErmB4jquYvdA0n5PbzEPmOk8D1YjijwWAtF39hRAJ0pNrXsP0AF3HpS/3lQ37
 9QU1Nn8ea1Eyj0hsT9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0
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

MDSS and GPU drivers use different approaches to get min_acc length.
Add helper function that can be used by all the drivers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/linux/soc/qcom/ubwc.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index f052e241736c..50d891493ac8 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -74,4 +74,11 @@ static inline bool qcom_ubwc_get_ubwc_mode(const struct qcom_ubwc_cfg_data *cfg)
 	return ret;
 }
 
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

