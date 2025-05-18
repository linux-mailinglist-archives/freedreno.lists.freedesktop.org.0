Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 485B8ABAF2E
	for <lists+freedreno@lfdr.de>; Sun, 18 May 2025 11:58:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0C3310E1E5;
	Sun, 18 May 2025 09:58:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GG+SyGfc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87E3E10E1E5
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 09:58:45 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I6t2j5025537
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 09:58:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ozyvimowPYeoJg2Gil0i1JAK
 q8UocZ/UUw/4kBdCVY0=; b=GG+SyGfcboPhTCPi7LA88aMspIO9T5QMS5DN85Sx
 EWB6WLs3EsETIgZ0FsfarrfPc6NZ2oq0XVVWUAv0jvxS/w1WE+hdxwQGjv3RhkrX
 IFbn6TKPL9HNeZ7Rs4uGf939/lM+POXUZW2ibYTZ098yLLLRCrxVkMP9gDqtI29l
 +Wo5DYzsem91sdvUcVAKGrid4PE6DcOQV8BpkxYn5DcehRdWrvwGJXZH2Bi1XNab
 FdF8+0WjWRTfg91RHeoHAbtklQ/yg1vnLEevk5snRpRKwpXPM4WD1pDWEMQSIVBl
 giSRRIWhkkkTLtFhp0YkAWuWGz07w7yGcVA6xOVtoydbgQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjp31tf1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 09:58:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c5cd0f8961so781225585a.1
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 02:58:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747562309; x=1748167109;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ozyvimowPYeoJg2Gil0i1JAKq8UocZ/UUw/4kBdCVY0=;
 b=BS4FoI6yNgV3aonsLTop1l8tPf6BPvbSXd991Do1FtJLFVCRY2bu0sZI+CazKU/pon
 bxvAjEMAC6OqEmsPA4mc0oJmYCY9dHNVdqvGz7nnEBY8uNI1noU9E3DK5BSQeyF2ORxK
 cWd/hmDrlyEZ58YV+oFTMy0lwKe1ktwauMs4E2ORGqx8VwbmXHZBn7pAV1zpLbvL/rtC
 HvhhEikeA1TVjD8EcY9UTSc8H+1LzO7ScNJu3rcya21dMseOdo1OJpP2sEaeHK2R6oKh
 uLFS6YxyLC1dJQpxe2RfPsepbAbs382wbQMweIAYGpCfJEA2fJd4p4riGA4T40O8oLYj
 1AjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpu4fAD7vKdAiowEvwjsuxXSkgy3953eHoeiS9nytDiFWVWj2UVv60rXWeOQIL3DoW8TCgnQ78eOc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6/12dE6/JcckjToiYx9iOTkySCuyX8gamftG2SKzL8P6eCvN0
 hsuYxLZsBnS6ZFxFJT/BNOCl8FdfRZ+92si7f0S+sLgobHbK2sV4GQbhc4S/Y4YztBP3HfbYLfo
 HevGtgrnOAsWy1f7FCWzaW54irVMVNdouWAV4lYp8L4n8gLKr1XLQYPDPAs1udU/qDTuoHGA=
X-Gm-Gg: ASbGncvA9MPL7D+UZmrqJlsEPxteWCge+nhhkjhMYWS1m31rwUhsF0QPI8aJLKnM7hp
 LhFpbp4tqklUl4Wg7qHhq8kOdahqhHTr5TPSPYospB1j06ZQ8k10EU4f0qZ/YKqG+xq83F8Cbwq
 FkMmYf4+EHlLW6+KfzxOJaTHSmLixKDY7sG6GK1neTuB68UJ7gVRpBmCsAWa6nFhgTL3vFrFm9c
 oKESu+59Wa/fxE6K3KLUsz++A93hgnz7way0rb6gztOlwLsIoocPyKeOS0F/B08zNu4ZlSIQThI
 cfWLnwmwy3L6+fZk8eKIhyIKlFK4uudoEYVtJmjgzf+tWwZ9Nx3QJxOf8Zaobnh/dH4ZwYtPcH4
 =
X-Received: by 2002:a05:620a:8017:b0:7ca:f454:8dff with SMTP id
 af79cd13be357-7cd4672da8amr1575055285a.18.1747562308994; 
 Sun, 18 May 2025 02:58:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzojClQz/Wnouf9iM34C8OJswOvQ1S2U6sryF3oPNsosWvXicZvKebvhLPbHpURtKz6Vy4eg==
X-Received: by 2002:a05:620a:8017:b0:7ca:f454:8dff with SMTP id
 af79cd13be357-7cd4672da8amr1575053585a.18.1747562308697; 
 Sun, 18 May 2025 02:58:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e6f2fc56sm1364685e87.64.2025.05.18.02.58.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 02:58:27 -0700 (PDT)
Date: Sun, 18 May 2025 12:58:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFT v3 12/14] soc: qcom: ubwc: Add #defines for UBWC
 swizzle bits
Message-ID: <jgf7izei3ry4wutplvgxkfqphxhrzx5ed7zh4u74mnfczahaq2@gnloying4et2>
References: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
 <20250517-topic-ubwc_central-v3-12-3c8465565f86@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-ubwc_central-v3-12-3c8465565f86@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=B8u50PtM c=1 sm=1 tr=0 ts=6829af54 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=jAo0UdJAClyBKZLzlD0A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: JyBBEpXx_SxLeZk-lVnfwqjN6tbHbi2X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDA5NCBTYWx0ZWRfXyzGWxNYepPpa
 fvVHCpyAHZJyM89H2GI49Qv4/BJbgzIN9Fu28TYXx75m8OfTrMU3ZcE3BdMD3/8ZUr9Sy47/9aj
 wiQlb0efpz1u/i7XF42E5G0Qcon6evi8f+yfnuKHuCCGl5lQqQluYqINt9uOeCkaHxlcJ/e0ln2
 Qjjx69p2L0huiUJPVC8SNQxvlrUlFDpgViUQC5VVVG1lmbmb8TvSKQGiMsotWbOb2uyk45/dTG9
 v3RwnrVXHv//DhQvjpxcL3GLRFveEzFMpVFqAP+kcerex1Z90XlvJOUt1T0LcZha/krb/h4p/wk
 lx8z0+9BzNkZ1OyVE4YB5Ft7HmFd8i1FLi9dAuDwgY0jXQwUzrvekrEJHPk2yChfM3OSNpW1eHn
 gUmbHvGD9XwlnJvpDOmC6rzHaL3VN7NvIj4WnaONJBqD0RGU7YMtIVNPGJj1EaAqogk7BblC
X-Proofpoint-GUID: JyBBEpXx_SxLeZk-lVnfwqjN6tbHbi2X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 mlxlogscore=956 lowpriorityscore=0
 mlxscore=0 suspectscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180094
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

On Sat, May 17, 2025 at 07:32:46PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Make the values a bit more meaningful.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/ubwc_config.c | 37 +++++++++++++++++++++++++------------
>  include/linux/soc/qcom/ubwc.h  |  8 ++++----
>  2 files changed, 29 insertions(+), 16 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
