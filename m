Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2104D0DB72
	for <lists+freedreno@lfdr.de>; Sat, 10 Jan 2026 20:38:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C6DC10E186;
	Sat, 10 Jan 2026 19:38:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LX9KQVa/";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RN7vjhGx";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EAA710E030
 for <freedreno@lists.freedesktop.org>; Sat, 10 Jan 2026 19:38:01 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60A82IGS3264669
 for <freedreno@lists.freedesktop.org>; Sat, 10 Jan 2026 19:38:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jf2DMqzpH2JNy8Ab3F/hxDhzYlf86bFDL8kNrSEC6cU=; b=LX9KQVa/Z4wfQlyb
 Gnk652sr1zmAP0AftssihFWn38yvYultqDsukCSI36Pia3/M0AD8DJRd9QDpijIv
 TU+uGP6j9l0eEa3JvXrwMWiK/cMwsbsVRKwhMksW0FDgFqX9wBc25gRC0A8YL4zV
 4Pj0u5R5UYneTAO99aiUPwp82KYAQLz9MCqWkOZBXFymkim/f7HjhJHxi3Llz0J/
 w7uzdXLIxaWHjT5r/3To6nCoeYGFafXuj8DKMtsP/WJi+5W3dtSsVvZNQuFjLTij
 Nh0QORW8Gg63s0AHiW+vSCiTzoZXFYQwOA/SBsGoNbwNJvOVq/1dzsc97zB441Ub
 rWxXBQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkjvxruac-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 10 Jan 2026 19:38:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8ba026720eeso1406847185a.1
 for <freedreno@lists.freedesktop.org>; Sat, 10 Jan 2026 11:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768073880; x=1768678680;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=jf2DMqzpH2JNy8Ab3F/hxDhzYlf86bFDL8kNrSEC6cU=;
 b=RN7vjhGxUjHxk3B4hvIiQswvvdOZCusSMvXCxJaX8dvNPYhPydRLkvBbAKst2tg2fE
 Oek6ItopQ9Ky35ftoz30UCL1Ja3siQI4BGGGjiGutpGRZYu6XXo7pn2ZvONxRytRnGc8
 J0ZFEhnnv9GweLPWRN+7agNOrFi+z/zGt0e9uAi5MLye4hgRWD4rmmcSKpaVzWx5O6Fj
 Ybvn/Fl/PcPmAeX742YB1j2QUfnNAqQTDZNYOgNDVOBW0ABRRF8URv6bX1Q3MLFU8Ark
 2afQCBYwBCwqu3Xw9lOhWpCQgr39lhLOGh2tMsTFjsIvSH+TYn9zPpGju5+W+AC0yaJv
 fbsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768073880; x=1768678680;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=jf2DMqzpH2JNy8Ab3F/hxDhzYlf86bFDL8kNrSEC6cU=;
 b=OI9qd8746CImavDQefRUY/aH9oMu914N2cWo76jKszPzYqIKkzWsOazAg/bFKSq2P+
 LbzmwrdVo53I3qjNJwhd1SOGcoE7XRN1Rp9BTD5427bMpiJziGZi0Q3rEpvFv7RyDN7U
 gSWj91Z4f2RNBTZC9XEMFJ9uvo8Zdzh1pnde2rn+WsJjzBH8LyzgHwT1xj/CRLksfBdW
 okmTAY3wDzvVC3eVUCvt35QfzztiVQvznKvk4KWAmLy/aqs7KzjJMhR/zxKsZ2M2hbKJ
 vxWR1COiRxO7nI5NBMdaeAQ2+/7n4ih3jCe+UvtRe9FC/sN2SsH+ijbXCmN8RET/0Rdx
 vgfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWA63ILYP2Tj3/5Eh72Lojky1Hr6Ayff1dN5lt+HEho6KGN4gZjg55k8a2ATP14j6Mo3vG4mNdCKDA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKJHpgGoBaIbwmcgcLB2t18yQqD6qs+N6pk+5G7q2HpcKp79AL
 yKfAjw/t038sNbsJqpWbUoLmqNkMRjlhVgyz4UkaUYU//wKLGQtWX7EonYu8ZR+amg3x7i1Mg0P
 WxjGsMjnTm7sixKpEJg4Ni1TlPE5rr/mnIJD7H+apx5jJrrllA7SRUh2OgzJCHrtPGrxXBsA=
X-Gm-Gg: AY/fxX5soAZPNzxXqoZ6AVyiezrt8aBeZ05GcbyOiongTmPNkAenJNWXiSLOdxHPbVq
 h9rj//gwZZGs3eSHihs1rLvaldszcWlryzbzvqhKoC5K7IfkiFvy8jDgJSRjlQIAHKtUwguBEnr
 ouVXZRUGhSmlZMpn3cz9F8nUhJEg19dDMwKCn8R6q1HSzKWDFm+0mHsiunOkJ2rWjOFtTRl+Trf
 6fFLv0IeMgdh1PuEK4sjtpGzA4EMb/nXGgA/4bhDoq+nH/absYgKPE80lvQ3nCeVGw4+XxkuO1+
 06gaUkfJx/W8BvCDhbaKzPJB6UJpV1og8D7scI+IV4GZN7024Id1cZEtjfAh0i/eByL6dBsIrAo
 8THANjtltA3iKUL6oFpwoOMsmdjY4Pib0lobZnZq2cvdxwn9LMqzUU6gyNYkkM6ZusyaetnE4LV
 6nZTAuzCilCB8CGgWjTJtCcGU=
X-Received: by 2002:a05:620a:44ca:b0:8b2:de6a:ca with SMTP id
 af79cd13be357-8c3893f51b3mr1951175385a.52.1768073879582; 
 Sat, 10 Jan 2026 11:37:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFGYu67S8+CPprNVyWfVMgX0OZCAew+jbVfBF0vtbN3BVGruygTn82tAUaHZh9q2joA/HE7yA==
X-Received: by 2002:a05:620a:44ca:b0:8b2:de6a:ca with SMTP id
 af79cd13be357-8c3893f51b3mr1951171285a.52.1768073879121; 
 Sat, 10 Jan 2026 11:37:59 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59b65d0f6absm3539700e87.42.2026.01.10.11.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jan 2026 11:37:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 10 Jan 2026 21:37:53 +0200
Subject: [PATCH 01/11] soc: qcom: ubwc: add missing include
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-iris-ubwc-v1-1-dd70494dcd7b@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=720;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Pev46xI2YfYCEJWpoooLY3aM1pLiw3PESsmECFYvSaI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpYqqSTlADnmSJixHP1i4iUNQp2Ni2QraKzhFRg
 de9h9q5MmyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWKqkgAKCRCLPIo+Aiko
 1ao3B/9bRdX/gIVDx8irfCSbubecqdZX2hosHW8QH6AQ263XimJTNOzZLckyYqiqjEPTywu+00K
 baULI1Geph6PkbOa2tSonjMdaVTdoqpySuYs6gW6lQHkhxSzAh//IYw5ciXiGI3AI/MyoXPifFy
 lJfhXeDiD1o2rjl66XJlvF/RH0QEHiBcgYVYRzN6jrI87MhX9fyzacBCXYR5K/40UpPwxt5kgvN
 zLp+r2GGp2KcSS/bQ5u9H/3BcjUJ4mpi1j9Y0WB5sMlMkvbWxHYHdTzd7hjCXlcTq8F21KvcbE6
 pPbB+FYyohLnIjzqpQXxYvXbmLlD742an+iRMvpo18QOZe60
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=Wrsm8Nfv c=1 sm=1 tr=0 ts=6962aa98 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ALiPkwqszP5KJWpCD6MA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: puR_f9iO4nLouIXCzJBgBwh_wkZNBrlj
X-Proofpoint-ORIG-GUID: puR_f9iO4nLouIXCzJBgBwh_wkZNBrlj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDE3MyBTYWx0ZWRfX1s0InFw30fls
 jy7+xkVkG4CHxD0WXa4TLHD5vYfyyVAfhtkG2uNKqQ2ERrdo4J7YqjW1tDrK749E1SmLgi9IL0V
 l1FLN77leDAjK84BzgXU50jXqr8Z0UgbWxPkVa8SnCzO5+wrlHQy21JAtxibOmLNkJP1u019xQ9
 HXHjm77dzRTwCy3yYSGAkGq8Ey8f3yUUU4dLxexltYqGYahe6WlIFukSuiazR8Qq6FlPVW8DBu2
 dmo5Yz9qAe/Jl4prya4kldDE37cwUbdWJP6yzloJT7XlelkCi+eWxB5wAxik51Bko0e4FWhJiRq
 4MZEfPYpjs6PhFYOVBQUK5exhEKUi0pz/iXDJuwTBC1OQW13jvusrOAecTKkf+bj6XC8rS6DGH9
 mVf9cqFFfJudygPrcOXLmgIQp+KUlnESmPFQBPh14iytPsfI6SbkmLPLXjNPGTLsY8lR+ILMKPe
 WCu+33QPj7AsD/x8wQw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
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

The header has a function which calls pr_err(). Don't require users of
the header to include <linux/printk.h> and include it here.

Fixes: 87cfc79dcd60 ("drm/msm/a6xx: Resolve the meaning of UBWC_MODE")
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

