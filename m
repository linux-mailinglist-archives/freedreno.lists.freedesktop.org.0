Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E25EC19346
	for <lists+freedreno@lfdr.de>; Wed, 29 Oct 2025 09:52:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4386610E776;
	Wed, 29 Oct 2025 08:52:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pm4Jitwx";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E3NywDRF";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A179810E776
 for <freedreno@lists.freedesktop.org>; Wed, 29 Oct 2025 08:52:32 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59T4urro3764254
 for <freedreno@lists.freedesktop.org>; Wed, 29 Oct 2025 08:52:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PqVjiwHHM6HMBkqOPTdcX/9mwjZ2lFutTM2OIer6Fqg=; b=pm4Jitwxgmbfq5Yk
 AasOjN7q/v2x+NXM69VAfxotSlzOJ3yPVR3gMAh/qwfwVS4ONfe+XFPkobkocvBL
 wa2sssWwW/XSozkqOKE0n0BYdvQ5FfFEHFddKkG6FX8O1ZNebjghUqNIiyp9VGBC
 FqFoh/U0LPvJH1sVd59EctQ1PlDjjsFXlF6lMbdXadktEDb1l+2JLCe98UYl/k9h
 LV7i4HhlFVuCVE+1vEqBILYqd1olR4sq6JzI9fMPnmypikSMSffrkrQ1HBrig1Cv
 eSh4fPnszeyGdrOG6n0kqKdCUyckTVgnufhniuORGJ4hCtCmWtwLB4L5nPtK9q49
 f3EgSw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a11v7a-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 29 Oct 2025 08:52:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ed18b4c621so6993911cf.0
 for <freedreno@lists.freedesktop.org>; Wed, 29 Oct 2025 01:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761727951; x=1762332751;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=PqVjiwHHM6HMBkqOPTdcX/9mwjZ2lFutTM2OIer6Fqg=;
 b=E3NywDRFrXPfoGVoqnwut3fhdvmXBM/7Bo4wsIW6K8okD6Tt1PatpNY6RgAdrifpb6
 54XSz/VZk/3sWzVLm615pK/DT3j1fBvFPGSaYQ/69xeYxnz2A4VPnkFljF68NsU0ZkHA
 ZQFyxvKSJwfwDVjlFyiHli0w+9V5eHuKOxzYkwzDNQAZ1GPcyoeiBsuQDhMqsGIuQa96
 BGxH7DZZDwKR+KsfTFMNc6dfJAfo5W9T2B5YhONM1zrBJFmUULl0aEOKi949Wi/nJgu5
 xcOxxXB4IbM6J5GveOgAzDyICE9zB+WpnkdBcuQMZNoPY4k18bN46bEbziZfC5cRV5+f
 OQqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761727951; x=1762332751;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PqVjiwHHM6HMBkqOPTdcX/9mwjZ2lFutTM2OIer6Fqg=;
 b=e0Wp7ayk+bIgPGDiCgKONMqAcwjrWGMXlVzJiuzhNzrjHUHRcq2diDbsUt794xKmi2
 MoVHgrFUjE1E8ZSc3hC0Ko9w/jX5uQltB6Y9nkoyQUThkwRQa98N/iWGe4p3jtnz1cWn
 OyoqYw+XgicS5E8Z1aSlEmnBsH2xhfBVDrbKL/V48nXAx5cuDDOyTxU1m7ZuwAMVaVWl
 MmYoJXCLcRQhw0qKbsKIpEU00qTI7BGGmQMyauM20bsn1WcZGfb0td1gM8bfM1yXTHJV
 8OzUlOKp3mTrp1BT4HifGgcBUbEbPG/SCMkxVNvxKX7DiEZ1mdpqwVHJr6F8IEWL3qIT
 YrFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3nKk0e5D4QOv8Y4+xCH3Oqb40U/WkCfBroFdlUltIgHMMeILnrVNhHJkTTQJ+2+oBOHEWJg3ax1Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPGN33fHG4lwhfDHc8Ac5rqhMT5bhrA6k+068Fb5NSUmgQWmRX
 y5JBWWxSy3qWefkp5ZQu7UCM/FKs0Hv9fu7jEstIRecVKJsTO6AwL3y9NA00fWmVoJTGe/Nqot9
 O07unWDSqkPRrRXEvUcwMvt1zXY9VDt6F6oYlzqPsam0YV2TT9jYORy4zTKbEeU+XUtS0Tyk=
X-Gm-Gg: ASbGncv61aMuyTal69fXoUXr2u+Jub8Gsmdqnh8lx+gu7Nc/TttW9sXqbQaBdjO6uHs
 MWC4dNYcw3IbTvJ4+NJAamlZUmOdvcPRI0B4PVrOlZ9HuGGZtJV2cyzgCyL+gfgV36vq0Iwb+QU
 BACBEXS19kvhYA2VzEGygVkj5Fiw3INgyk54M734rVzLznRyUx8446cnsFQ4PprRwK8+NlUUBzG
 yulRt33KvMnDwx6iJ3WNGqS/nzQVqD0lHw9Vpy4r5epJ1hbZj9dicLqv3ndqdzl4R2ilhn86yR0
 o8atOizg3mJGfCQNNMG7B/CuWe9ZjgFVQJZGppOGXffi9PyoFbx3L8yNK2PrTxkq6w7UL82pdj0
 5fS2Xf2MYn/J80z/7ci8wJTI=
X-Received: by 2002:a05:622a:1191:b0:4e7:24df:920f with SMTP id
 d75a77b69052e-4ed15a6ab64mr21703141cf.27.1761727951009; 
 Wed, 29 Oct 2025 01:52:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOvmSdC4HmFMkbpQe3HllOymugFZ7rqxM8+XOIFsKpoDo9fMiPWIgDHanhaRSDOhK6KmtM4g==
X-Received: by 2002:a05:622a:1191:b0:4e7:24df:920f with SMTP id
 d75a77b69052e-4ed15a6ab64mr21702871cf.27.1761727950466; 
 Wed, 29 Oct 2025 01:52:30 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ed0817602dsm36760171cf.18.2025.10.29.01.52.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Oct 2025 01:52:30 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 16:51:38 +0800
Subject: [PATCH v13 5/5] drm/msm: mdss: Add QCS8300 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-qcs8300_mdss-v13-5-e8c8c4f82da2@oss.qualcomm.com>
References: <20251029-qcs8300_mdss-v13-0-e8c8c4f82da2@oss.qualcomm.com>
In-Reply-To: <20251029-qcs8300_mdss-v13-0-e8c8c4f82da2@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
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
 Konrad Dybcio <konradybcio@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761727898; l=988;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=f/HHi/48hqff50ItUhEpqZ+zfupVghiSAFK6cNZOm8A=;
 b=lXTiSppnVE0dqE0qrye4mItP4ncDSpxVMjr9mzUdFBaJRn4RRa6nlFtZAt7flu3pDhV3mLlIC
 GN4wyHDVhcaBZ/+BRwAn+FIKgQypRdAFQgzGBpZhYNA20nxPT5XkuoF
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-GUID: 6sD6ggsyYcaO-ktmbmXkzQQ_WG05F65Y
X-Proofpoint-ORIG-GUID: 6sD6ggsyYcaO-ktmbmXkzQQ_WG05F65Y
X-Authority-Analysis: v=2.4 cv=A5dh/qWG c=1 sm=1 tr=0 ts=6901d5cf cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=w6jnlB3v2fMHmChJ9ZgA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA2NSBTYWx0ZWRfXz32BeOdnzSeV
 iFCOGUCP09A4pFgx3hoIGpjHaKSDRKQgrCOLabiveTltsImC7Gwmbu9U0/4JIGfL5C9Mx4z8kt5
 QIbOG02AyN3wWHs4G2hyPosrzDLIh0XBRLKHzK6cd7FLWLaQo14+Wm+QUZTT7Nrg2z2fpmheKTl
 BYMXzdoll558RZ0P2vWYYgKr7hkZh7n0th7UB1SWbGtztub/+NjLjU9Nks9TOSBP3MX6Nhabkjz
 NXague25wHNABl+NTZWFdlGVZq4NeRxCJ6GPRNVl1XwtUH8HAzxbH3htv8kyIdi+Xx9YWPlHdXo
 hGtPe82u6X0N0YJxwzAUznmE0CuNGvxAhf3TKtp0F2OKi+Y25IJkHWyvZQETnxOWf23LFAQFd9n
 bRK3HETYW4pYQy2A/D0w3ZfKdOSwNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290065
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
index 2d0e3e784c04..db2f0064eb72 100644
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
2.43.0

