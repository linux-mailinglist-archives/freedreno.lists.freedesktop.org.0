Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC422AB7A84
	for <lists+freedreno@lfdr.de>; Thu, 15 May 2025 02:21:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C581410E05C;
	Thu, 15 May 2025 00:21:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kLulVig3";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEDCE10E05C
 for <freedreno@lists.freedesktop.org>; Thu, 15 May 2025 00:21:39 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EK86oW014273
 for <freedreno@lists.freedesktop.org>; Thu, 15 May 2025 00:21:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=u3T4zfjmzH1nVAi6lbmvTDJy
 /YQD5ld+KCby8V6tPYA=; b=kLulVig3aJALtC/8rTwm3evvJXj75+9Wr3w/d3d8
 yvl4wCstpHvGIEko0hndxmmeIsduyCUaOSFzl6FSZhyYPcco2xp3tGr34VUggFU2
 FFjTJOERazcfZ6pWqe5ZaC2BkKuBQePD49aE89xbVK6F3hRIarvGlReZ9dF0pf1l
 5+joO9xHjgqZ5cyi51kNzvA96cs0YNrABgqzj7Dz3ffxIGl3nCKFFG/G5TSmNNvJ
 oZiZ8JwOlZOPWdOTzDthUxhzLx+rPiaEXk5G6xYGA1f3R7+D9/SJHP3refOz6GUv
 RnQQfMHRoQwYcGyFUGlcuqFe/mt7GKSC8+j8WTyghmayRQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcmmfuy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 15 May 2025 00:21:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7caef20a527so106666885a.3
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 17:21:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747268484; x=1747873284;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u3T4zfjmzH1nVAi6lbmvTDJy/YQD5ld+KCby8V6tPYA=;
 b=eSgGB4KR2+ZA2C8KJsBBAaQp+o4WGeEhByZ/JXqMGM12Unq2oqhgEYDUc9RojO0jaE
 lhbAhZBRLnDv8Ft+qt9gAaqsSwG4evS2ZOis2Fxv9mRsUSu/97r+KPJl9mryFvZoPpbf
 TWwYAkjU7NVQ87LXPFkUqt6O4/r7O/jCOF8P7nGgUGGfXiflkqSAl5WlpVNh1AbETW2J
 cOoEe5BoiQ+Ce/rr+JUtlx0mwfzK8HJqWMCi/ltfzFPezuelNiAZsSOSQ9YHGdPs8QB3
 pRX+9uDUfKPpZQeilG0P7fn6385arw2Rby+5d+BPQrvxco03wF49cJtSuTAEW0f5FRvS
 oogA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUndgoCkkCgY0Q4X387rItWsbxz8At8ST+znvM2z8Qd4WUK3fHnkVxVxF57P2hgpikGppt08skd+64=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+N4FqHK2y6c34K3ekFWVCUw0GReCjnoUtT+TTwTyIjNNZZ1ph
 iKAxR2G+IX2CiSIQbbWOMVn0DhlSBVAYBQbXXDUpYTZEUGHZvZs2jOJOWPJNHvv6IeXOnIcrLL4
 R5W2I9g8l2oIODOBZyifAiIUR2U9zDXKC/4jEeE1hgOqhSfvR/WKhNX5UCdXHjVqmhsI=
X-Gm-Gg: ASbGncvRK6Kg32+r5ZPSVHX6j0djh9BH27LZH5nznpZ5gVEAXLjS/qyUr2vEaWZEgvG
 vwfW9G/RLKnOhpU4OyEfpwFj+5bgWIFQzraHtL0gHoCBACFJHsDr8VYTrIccGsjZ6MEJU6WZ8pO
 wVfu59ULX4p0SRv1ZuwyXkfrWD0lQAUvKSdc5nIg/5e0639TrbSvx0H3r74osQfD0RCnOFtk6VY
 nqkTLmZ62dj6IBZ8iFnRFZsKj+9VquMQuVdGWpeCH8c/MNtDM+/wTSKfH6TLWZpkzwXHcaIyqvy
 u05m3BSVL+Dble23alPmo/JqvIlOwzjLlJc3B/lrMEYR1POTS13/bXKxf/+UfgXB4YkubzdIWr0
 =
X-Received: by 2002:a05:620a:29d2:b0:7c5:d7c4:576e with SMTP id
 af79cd13be357-7cd3c6997d6mr59894385a.31.1747268484546; 
 Wed, 14 May 2025 17:21:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxthZgaaCEtgMWvPOufQHVkJCtJIfpyoMQ85ENiwc8/TTy112uu3WYn6gbXoDll+GJBh5MXA==
X-Received: by 2002:a05:620a:29d2:b0:7c5:d7c4:576e with SMTP id
 af79cd13be357-7cd3c6997d6mr59891585a.31.1747268484206; 
 Wed, 14 May 2025 17:21:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54fc644fcbfsm2419532e87.50.2025.05.14.17.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 17:21:23 -0700 (PDT)
Date: Thu, 15 May 2025 03:21:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] drm/msm/dpu: Add max pingpong and dsc width to HW
 catalog
Message-ID: <txn2anohfbrymaseeo55slmzimstietsrmhx3mhigw4fcx3ow4@b42b3n53et6l>
References: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
 <20250514-max-mixer-width-v1-2-c8ba0d9bb858@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-max-mixer-width-v1-2-c8ba0d9bb858@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDAwMiBTYWx0ZWRfX4q1DV/F9j4i7
 ZOHRnCz+I/RXTJP2ibjceX+4vZBVLU+1k+TVQsLbVCQhRvhz1c8XikBbUhAvGE1boO3IDhvq3sN
 QDg9mfl1wuKi35q5xk2RXKl06mccZDIA6gjnuQOVFtzfGSNX8MjwTZRKh/6Scg6HQ7fgDspcrK3
 Dt2X6ytcNzdlS0bnGy6svdqNVO9gzM/hs1LfEygigSnNcwfICVQdh/UY8q9ko+dAG6sJIJZyJrn
 AuQ218mDHdlnZ0SEPFAR8lyl25YNPvj/xinq7UfjW4K86YphecqoWupi9kqfKH1El0Fuowf41s2
 jzxY7ON28mY2izaUzfAwfuGsvBxXEVLUnAZiv3fopbI1q8OiSkvapyVKakkbv8q/f/pcXTNgB+i
 czonPgZhBmIjKlotbNsoLPjIiK3SklnM0SomO2qC/BBqepmqWtKW0kUUyThGm5pvDRLHaxk2
X-Authority-Analysis: v=2.4 cv=G5scE8k5 c=1 sm=1 tr=0 ts=68253392 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=XNzoCkbmTKmYsmvQHroA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: I4jmnAuM3SyijcC9b8-ghWpTIVpKHp5p
X-Proofpoint-ORIG-GUID: I4jmnAuM3SyijcC9b8-ghWpTIVpKHp5p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_05,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=979 clxscore=1015 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150002
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

On Wed, May 14, 2025 at 04:52:30PM -0700, Jessica Zhang wrote:
> Add max_dsc_encoder_width to dpu_caps struct and max_linewidth to
> dpu_pingpong_cfg for all chipsets within the HW catalog.
> 
> Note: The max supported PINGPONG width was 4096 but increased to 5120
> after DPU 6.x. In addition, DPU 8.x+ increases the max supported width
> of PINGPONG_0 specifically to 8960.
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 11 +++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h |  2 ++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h |  2 ++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  |  4 ++++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  |  4 ++++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h   |  4 ++++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h   |  2 ++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   |  4 ++++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   |  6 ++++++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  |  6 ++++++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   |  4 ++++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h   |  3 +++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   |  2 ++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   |  6 ++++++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   |  2 ++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h   |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   |  2 ++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h  |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h   |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   |  7 +++++++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   |  5 +++++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h |  7 +++++++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   |  9 +++++++++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  |  9 +++++++++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   |  9 +++++++++
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h |  9 +++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           | 10 ++++++++++

This needs to be rebased on top of linux-next, otherwise you've missed
dpu_9_1_sar2130p.h .

-- 
With best wishes
Dmitry
