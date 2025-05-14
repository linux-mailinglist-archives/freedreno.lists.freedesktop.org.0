Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34652AB75A8
	for <lists+freedreno@lfdr.de>; Wed, 14 May 2025 21:19:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FEC610E622;
	Wed, 14 May 2025 19:19:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="O2JzJzOo";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E806910E622
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 19:19:48 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAuvkZ030369
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 19:19:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=NSHyr8CcfGxZ2/FMsoq0HRY8
 55iH+a0Kisr19P6Fk6o=; b=O2JzJzOom8ocJ+7zhyoyrp+ANFuZtweFf1QHwsm9
 s43qAt7RUPh5WzsAYicfRiDv+ScXNLROALmmt1Dky1/hbzKNTavqgljFAaeTepX4
 sicANhLzlDIg4rU2uXDw41AL8ph3feHUOTbuoI3m40yKjeTf39buXBIaEBzJA+QD
 4b82H7fBiGJS2PCswYk5YrjwP6qBsG1jOqSdCxlHI4BKuwbRjfA69jNpSshMkDTf
 sMEAG/mh6lxgS2YbvGUqynmACdz+nyik2Xly9AMpZOhgPMYWDb/zyWh+LZ/9vs+Y
 jcANfVY3pv/ZLdKme+ZxikYazpyTh8S+LSyrPO16Ml06og==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnuun9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 19:19:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c760637fe5so18822385a.0
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 12:19:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747250387; x=1747855187;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NSHyr8CcfGxZ2/FMsoq0HRY855iH+a0Kisr19P6Fk6o=;
 b=BtokSPq4hTIx0eK4IPANUrK2IVwzwoVLNz+jNy+cEPf3TKVo2xYhRVORtVojgLDoAC
 5bUgFTTUQ6kYR4dDBatAEM1+gYdvsfFUxNHq0TGICOzC5DnxPj2kcSqT2QVq0uGXo0vr
 RwwV7I1ljh7ju+mdKl4ZXgMTraIjmDzk9oAsQl4suSc/FMXPi9oPdHOTXJm+8jPmywu3
 6xooyXcoWCdrhBP7x1BVOp2C5dbLFdEut5phUdu1QjjsHBAJTZY7Ne1EOwguf/Xw/rIb
 sZKF3ma1XrTWfrxD02DqV1q0ndbNQ1RuLONKEqhiyem95tx+y73/ZQXsmV4ekRiOg3Sc
 +dPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBn8ow+G1eFaQFkR2lyAi63ajNJ/zBGSvfrO2+JqmyUiPQkgwH7zzr1ZBEEjbR3XWp6PPfYZbEGjI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxEtnN4t/N12qliu/IjhDt571ESjXBacaQKz7ZsOKmqGCWJzSy
 pcLs8w6giE/JXgeUJy5dkUA29F0AuIqeBi725bBEnpQDRb2/o6MfKd8iPC/rvH4fadSOh8mcH4L
 Qhnlb3QcTBdw1XtAUsdAlJhnUKgsT2z/4Z4QgLBNHYKZzP27oUmBJJShbGZMV8Il5Fbs=
X-Gm-Gg: ASbGncvC+lViUgEawXkwe6uRMCAvaOA1gMu+5AfaD6kB4f28al26clHqyuk+w9jwqL1
 fOMgo5l5roVvimCLDkCyGAAd4gGlUGHvu/oGcLvZA9WEQzili/9Hj3PU9yO/0TJ2GREmYdXW9QF
 +u358ZxdlH72/4BTXA6s32q3FYRJ0MA5vwYQRq+0mDV6/YTp0+keCEEqzWszopYZHgdef/0Wg/U
 qpUKLE/yjc53I7+DZ1ZajIEHkJVU8I/tLLV+3/2QcCpkioITgWPZxTW0EchuuGgMQ5b/wBlz1iY
 ra4U47Xqnx7ehq1TO8yH0j1TJ+Jhz7EhaHjBG9BejsVcNgKkMaU5HW2TNacUHCZTl8Oxb35y+p8
 =
X-Received: by 2002:a05:620a:2984:b0:7c9:5ebc:f048 with SMTP id
 af79cd13be357-7cd287eb2ecmr555968185a.20.1747250386789; 
 Wed, 14 May 2025 12:19:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0P5XZzLLpPqaHxvQBlIrU80oFWrGZUfLAHjWlXyT4vEYM7GmFzGqbUiFFJbaA20guyHR/jg==
X-Received: by 2002:a05:620a:2984:b0:7c9:5ebc:f048 with SMTP id
 af79cd13be357-7cd287eb2ecmr555964185a.20.1747250386223; 
 Wed, 14 May 2025 12:19:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-326c5e977fasm19539111fa.34.2025.05.14.12.19.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 12:19:45 -0700 (PDT)
Date: Wed, 14 May 2025 22:19:43 +0300
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
Subject: Re: [PATCH RFT v2 10/15] drm/msm/a6xx: Simplify min_acc_len
 calculation
Message-ID: <h55v7u3tcxyu6v5ltiahdih22fdu2odqv4f4ix4xbepb4msaus@m6n4ftyp5nd4>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
 <20250514-topic-ubwc_central-v2-10-09ecbc0a05ce@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-ubwc_central-v2-10-09ecbc0a05ce@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: wTQ35XiZZknVy3pDxQ5qUgPhYtK56Hql
X-Authority-Analysis: v=2.4 cv=D8dHKuRj c=1 sm=1 tr=0 ts=6824ecd4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=d28x5gvVvHF_Cf3YLGcA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3NiBTYWx0ZWRfXw+K8ha5+EsKd
 ZeEv8jzaZiXixbK4g6KE7Oa+EL1JuMTYzzk1iTW4zeTJIYqnJP92KZKwLykDMZJgagxupN3Qbgr
 3ltsul5Ids29fHG/bhzX3FJTyxF1Z2x/Cn8FBIEdS6IVUUkgVmNiG1vt29w8NrHkfJIiZ1BT3R/
 DpjWWbNE4pNY0BtTdxa1hc4OLcmoIS9qOstxipjMsGP25ncwkvsXB6IMXae7Pnxq+cJXxLdYVtg
 om6R5YF79NDqsDhRxUMo46YD08N9SC+Gjb+L3q2zAIFGF2Mv8mDztk7b42aVVTDwdqZ09ZT04Sz
 V/BfqKhoYU4o/hT7hoTtbuFqCaWPjDcbHT3AW4x+HNj6GI3ti0DrpW1WRsAZrLF1cjJP5dkiCWg
 1sR5jTONdOWVJJLRS5zAC8iEShTWbExmQ4+TD2xDNFewI3aREKpVV1hMSkLphgrhSSYsmN2P
X-Proofpoint-GUID: wTQ35XiZZknVy3pDxQ5qUgPhYtK56Hql
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140176
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

On Wed, May 14, 2025 at 05:10:30PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> It's only necessary for some lower end parts.
> Also rename it to min_acc_len_64b to denote that if set, the minimum
> access length is 64 bits, 32b otherwise.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 5ee5f8dc90fe0d1647ce07b7dbcadc6ca2ecd416..fdc843c47c075a92ec8305217c355e4ccee876dc 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -592,14 +592,12 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>  	if (IS_ERR(gpu->common_ubwc_cfg))
>  		return -EINVAL;
>  
> -	gpu->ubwc_config.min_acc_len = 0;
>  	gpu->ubwc_config.ubwc_swizzle = 0x6;
>  	gpu->ubwc_config.macrotile_mode = 0;
>  	gpu->ubwc_config.highest_bank_bit = 15;

It occurred to me that here (and in some previous patches) you stopped
setting the field, but you didn't drop it from adreno_gpu.ubwc_config.
Would you mind updating the patches in this way?

With that fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


>  
>  	if (adreno_is_a610(gpu)) {
>  		gpu->ubwc_config.highest_bank_bit = 13;
> -		gpu->ubwc_config.min_acc_len = 1;
>  		gpu->ubwc_config.ubwc_swizzle = 0x7;
>  	}
>  

-- 
With best wishes
Dmitry
