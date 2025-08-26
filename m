Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 477FBB3746C
	for <lists+freedreno@lfdr.de>; Tue, 26 Aug 2025 23:28:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F0D510E3B2;
	Tue, 26 Aug 2025 21:28:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VAsrtfik";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0F0C10E3B2
 for <freedreno@lists.freedesktop.org>; Tue, 26 Aug 2025 21:28:30 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QHLVqx028938
 for <freedreno@lists.freedesktop.org>; Tue, 26 Aug 2025 21:28:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=clTRNlMfsTDWnZAZ4jytuHfn
 PZmj1afqUgmhWf7cX/k=; b=VAsrtfik0TLBIkRuI4N3JDmJMS2bvlceUWREYRmh
 /OEntdKy0NOP9cfM4wpFpgHRjOfDyjAXEax7TaYXqo7Zwl53LJHVjsoi/Zg1351V
 2j60JAC8jxgCACiyqinxvR8qgw1pBuMMQAe2OCbVMqzM8p+LyaGHH4xi9s9jnSwb
 013pD8V6GCA9hSJ6ByEIMW24tJG0g6tCJ6b1dfZgHAtizuN+NFteNyrYXxVHQYny
 xy/lMoSUCD30kPDv7FKTGZ1yFVY7MhvOrd8Y+UE041Ch8HN00XqyOd32/0PnbuWJ
 ZmzI75D12MKF3kqE945U7QfgxRcdlfqYNDsF5fT8iKtjAg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48sh8agngh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 26 Aug 2025 21:28:30 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b109919a51so261251361cf.0
 for <freedreno@lists.freedesktop.org>; Tue, 26 Aug 2025 14:28:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756243709; x=1756848509;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=clTRNlMfsTDWnZAZ4jytuHfnPZmj1afqUgmhWf7cX/k=;
 b=u6RyqKKgDjCCeyhDMOwWsszv0hOoiMH7CRpwSqTTsidrPlkFHs55MtQ3k+umWG15mV
 /66H/1CFYdeStcmVRRwpNu27viRd+ood+VJoLG+soBl67YYiCDGxKfcmXrai0BZ83pxO
 R2FY9yBr1EiTu0OYx8M26wIWmYakKBspVI656BRDTqC0BxYRe15/c9MTjgu/m2EvLozF
 tH5aMvKo3X8v1+jtyW7jR7dFmShROPddn/zz8HOs4v+ZIR6ssJKJGTIxRpBuN+NNRVEl
 xIUnSg1YIYKi0BJFSo+vv3GvLzV1tIuctaF5QoDCw4sdvrYFhK8mZaVei+jc9tkh56qf
 +4UQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwa5fwcbfwzk6QtuiDCWgNszjIR7nlzvn6hfBeFNbObLultB3oOG49pejzrigrrg1rko89aol4F1g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGwUWY+o3WUbes3C+4DWBijAqWZXAILYiyvBh17NCfWMW2ZQEO
 AJJfZIxBEh0LrwsI2+L2OHTYgy50mCLsRfTFeg3xZjR2/6eRvbDLkfvmRybQz4IHcd54gyFZGZ4
 l7b5ZdG5ba4sl0sh/A+R68hI6OmbN0zarra+ODYJYWil7Iu96/ljGpIesmAO+qgUu5CNC3qw=
X-Gm-Gg: ASbGncs4p9Y4G3D008Ic/dgm8RluJwRTF0WQRn2rZl0gTto88fn15YzN9husfkEDfk6
 2/DimWracJCmyWG5eV9cEnL5GmC1Lb85x4NDSHViZXFQbGaZ0Q6RtWHoRP+zaA8Ts7cRdAyxaRU
 zY5KYomgWQxKWe+MYJyOXZkxJffKOxTN8O8ZEKZVpkUIz8PdAutXFePGW9U6UquB6ATFRTUmdJX
 GulZ0A7lTlZSiJADpCATZ5cAIb98egc7bafjJS/kq0e2AVIB1FL4E6tIFpOdAGdnXbRHTNmN/bb
 +d0eGgw+Njk+Lpv3N1gWoOsxR8MccPMIQoFxKihBBbKgP3JKsb2DTPZJxAl9YgsHmB3raB/0BTL
 uBwNffRz94YI0taVPPxrdZf39Z1BTdDVHOcER2EfKPV0jctd6KuAd
X-Received: by 2002:a05:622a:118c:b0:4b2:8ac5:27c2 with SMTP id
 d75a77b69052e-4b2c4d99612mr129989711cf.77.1756243708967; 
 Tue, 26 Aug 2025 14:28:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpR67kwi5LVp5pSfPnw+J3VFspElzcvSFuZyuXNRvTjYvd1FyPiBQ8eOYtogA5Vrr61DpMWA==
X-Received: by 2002:a05:622a:118c:b0:4b2:8ac5:27c2 with SMTP id
 d75a77b69052e-4b2c4d99612mr129989341cf.77.1756243708542; 
 Tue, 26 Aug 2025 14:28:28 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3366fdea6eesm16950191fa.44.2025.08.26.14.28.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 14:28:27 -0700 (PDT)
Date: Wed, 27 Aug 2025 00:28:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v3 21/38] drm/msm/dp: Add support for sending VCPF
 packets in DP controller
Message-ID: <irlo6dhfm23b56hojskn5oxwznwmcfpwkbq6zq66o7bhxvq6w5@4qaldcvcwqev>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-21-01faacfcdedd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825-msm-dp-mst-v3-21-01faacfcdedd@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=cLDgskeN c=1 sm=1 tr=0 ts=68ae26fe cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=abZXHuzVrGm33jVRzXcA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDE1MyBTYWx0ZWRfXyp0MjslrUxz8
 wLvFJX7aBfy1IdsxCZXDGVc2gA2qai6XuD6JsMAniQ3DKF3w+AJg983TteeTInNyl0Z+3eAqEF1
 ucFmZQ1iIhDrbAb1iL+5YQ6FZ3xaCM68qpNPQ6uy2AvqLbkKbcHQbA0nox5d9XOu6lvsGN9rPS6
 72gtiQaEuIUs0zC3/4XBe85a0CWys3ZxBnsLBFd6AYZ4h/54sbQczCHhITZAcHeoORi1KzUY+fn
 Tm5ttIyqCo61hkIM5MtCcwQOgmcwdroSeiMcWhsZSvdS9oNL99nXneZndtDQHIGMyqFKH7Bd1BL
 nxE1e7z7v57refJMSEfhboTba4QsHbdkWOsRgfJ+9gBKqHUzggYej2r5A1GgxHmnaj7+CrNAitx
 0X/s5nGU
X-Proofpoint-GUID: 1ojZl-qLTNPL0p76o2_tAldGJJ-AHgNw
X-Proofpoint-ORIG-GUID: 1ojZl-qLTNPL0p76o2_tAldGJJ-AHgNw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508260153
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

On Mon, Aug 25, 2025 at 10:16:07PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> The VC Payload Fill (VCPF) sequence is inserted by the DP controller
> when stream symbols are absent, typically before a stream is disabled.
> This patch adds support for triggering the VCPF sequence in the MSM DP
> controller.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 56 ++++++++++++++++++++++++++++++++++---
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
>  drivers/gpu/drm/msm/dp/dp_display.c |  2 +-
>  drivers/gpu/drm/msm/dp/dp_reg.h     |  6 ++++
>  4 files changed, 60 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
