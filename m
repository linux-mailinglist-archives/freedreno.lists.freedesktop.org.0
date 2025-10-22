Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADFBBFD79D
	for <lists+freedreno@lfdr.de>; Wed, 22 Oct 2025 19:09:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D566D10E817;
	Wed, 22 Oct 2025 17:09:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kxIdmDez";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77DCD10E80C
 for <freedreno@lists.freedesktop.org>; Wed, 22 Oct 2025 17:09:44 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MAIuD0004443
 for <freedreno@lists.freedesktop.org>; Wed, 22 Oct 2025 17:09:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 DzkNgsms+I6TVQ+SQgJ1gRxGxqOmUsCmMiXjDyfl1q4=; b=kxIdmDezDNa5INVo
 j+mZbb5VZCN0UKvJBgcY+goSYKjAAz5lh9593YTsgwAGhsjfkEwbTuvL2UmOGhSv
 8myPuqr4Aqk8ITDAXJc7A/EX8gKAnHEZ8TSEF53kZlSagfdpx6Wf51PktRdNuVtn
 /57EN/ydY4tNsHu5ajMNzayLnLOuYXQ1Y8d8xU9uqDzpGOtmz+Pv4CWll27J5Eg8
 7w+AWPKYLjZg81bLJrrVtPaZszcxg9NPFFb2R2XuwN1IDZZSypycypOwh7+iC8Wo
 VfMSt82Bb1AcuuUjg6JzBlq+v9VEsoHFnz0t1y4Op0P7Hx5G6Wcg/xBozhuUrdhb
 eVSBBw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3nfnex9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 22 Oct 2025 17:09:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4dee3f74920so3393461cf.3
 for <freedreno@lists.freedesktop.org>; Wed, 22 Oct 2025 10:09:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761152983; x=1761757783;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DzkNgsms+I6TVQ+SQgJ1gRxGxqOmUsCmMiXjDyfl1q4=;
 b=MvHQr44KLiJ5Q2NJ69VCZwiYb8dB5tOZmwL9vR92NysfQp6ogiqsvDPBsY3cYY0lCs
 5/gG5rygyAdjI53ytA2SO7L6oBSZzJy6PmxBsvQPeboB1VgSNAnCdMRQ/svzhYF/llAS
 tsXuaNUzbPCiOk998vrQNKyHNSPT2MDNt15CHTjhbAPMMD9mnQulMpJWKFMDnkc2rtxZ
 kTPFDwqR20syWo+6h2YkLXhQ/aoc1m5HVFE8B1SKT4Oe1eDyAwAyL9wwAanFVAXyxWtg
 1GiiH+qt+9Y0zEe0ZwFObqwJBlbGu+4ShPNyHzH+Ac4uSmZty9Sh+RyHXTWOd+KCwIy+
 uN0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDvIzx/V68+z5n14VG9483Dan0Qn+x3Sp8OguMKSeBX6cp2MyAwy2MV9X+yMNOJzbelL3nhBRWIsw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLKYL1hFx9JKNdg8+KTAJAaEz+2GFMYyDpDOid4OpupIfAKZDH
 Rqnd+rqWbda0IPhlCU4BfE5nroZqJFdmiW+lUwwfc5xv9CrWKJL9F7/a9WzaqDLAZZuNtz122jy
 FojBmVIMx5tDMmSZXUjXe8KmrWxsCciUoaaClF+lkMOawF7/98nySOWbyrRsX+bUQCVwiiHk=
X-Gm-Gg: ASbGncs7WcITNjGFaRdMn4yPm3dW0Wb0yB8oL1DWxAgVx1gaX80xJWJvJv2e3qS4hII
 /hatbZudGb212N4jZZAuPkyDJAyTPhXv8wXNB02DdXcgz1XhJ01HReve5YayWPAmD1GGNhm01XI
 jCkRCpjGPn73Zk9o5JgIFvQBeh9BuBRYF4KiDKvRz36t29o4a0LZHv8lVR1Lrw9T3t6QQGCblf9
 UXZPpnSzYV6+GhjW0BPoa3MerWTO/luEv9XG442hj1N2aBShPD1Z0O0MBVGldmU/rgUJMjrIAhu
 bXCiHA2lbr/oKb4MAYPpgW0VV/UyA5/QdsaF/Rtkvt1agsAdAqNKXd4ks6XSuVnboAAr4PxrrHw
 U/6dv1dteuQYQCNdcwIB1bAF4w6CAozqn469QZMRqYd9064ibum6o+fAc
X-Received: by 2002:ac8:7f41:0:b0:4dd:2916:7983 with SMTP id
 d75a77b69052e-4ea116a0a71mr62626681cf.2.1761152982639; 
 Wed, 22 Oct 2025 10:09:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1zbTlPXlUpM5403uofnWKWimc8ISr4xjVjYpjAA4lEcZwdbtZU9LT3YujrWiqGqdomX+4jQ==
X-Received: by 2002:ac8:7f41:0:b0:4dd:2916:7983 with SMTP id
 d75a77b69052e-4ea116a0a71mr62626281cf.2.1761152982190; 
 Wed, 22 Oct 2025 10:09:42 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b65e7da2bc7sm1372236966b.16.2025.10.22.10.09.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 10:09:41 -0700 (PDT)
Message-ID: <5d6e7303-cc57-4a50-a9ad-b45d3c89d045@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 19:09:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC RFT] drm/msm: adreno: attach the GMU device to a driver
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251022-topic-adreno-attach-gmu-to-driver-v1-1-999037f7c83e@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251022-topic-adreno-attach-gmu-to-driver-v1-1-999037f7c83e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: FFSyBMx2sQa5lIN7I0qRIzfp_msMjYFD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyNyBTYWx0ZWRfXxFwuA/2twdrw
 MNEDbNcfLzkN2hCvYbB3H6bYm1H4gtY/YYP75W+5/C8pTlv+O67+LHMlpEwB3Z/p9eaQh7Kuq65
 WxP+eXK3v3Rdsyn4gCXtU/B5Vu3vYTjh8LaTiUyk4HiNPzEf4ctLM8IrbJbXbIfIXiUEgjc3MCm
 38lxqpCJ96/XHqk3D23Dw8xMBxiDtmEhrl14BG/g6EX6Vc1+KpJlPNCWFD/tc2dM2B7CDeFp+uv
 KDvz1olPitiqMdQEHQvkfQYG6JaGVXb1oQN8sNi0UTrc0euzU3k7jRkNFJXe9dn3kHp0tSswRqg
 Yk0GYxz6rrJoFu59uy8+nAaxxMsW6NJh+2g3p3FsCa3VgKWLElPjKyxrI9iF3ykcNbnKx/XhP9h
 nHJ2jBp4vh/hNGWmuKXMNSXIeg7RKg==
X-Proofpoint-GUID: FFSyBMx2sQa5lIN7I0qRIzfp_msMjYFD
X-Authority-Analysis: v=2.4 cv=EYjFgfmC c=1 sm=1 tr=0 ts=68f90fd8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=PIh8tp-2QVCGfq0cSFkA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180027
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

On 10/22/25 2:44 PM, Neil Armstrong wrote:
> Due to the sync_state is enabled by default in pmdomain & CCF since v6.17,
> the GCC and GPUCC sync_state would stay pending, leaving the resources in
> full performance:
> gcc-x1e80100 100000.clock-controller: sync_state() pending due to 3d6a000.gmu
> gpucc-x1e80100 3d90000.clock-controller: sync_state() pending due to 3d6a000.gmu

Does this *actually* cause any harm, by the way?

For example on x1e, GMU refers to 2 GPU_CC GDSCs, GPU_CC refers
to a pair of GCC clocks and GCC refers to VDD_CX

and I see these prints, yet:

/sys/kernel/debug/pm_genpd/gpu_cx_gdsc/current_state:off-0
/sys/kernel/debug/pm_genpd/gpu_gx_gdsc/current_state:off-0

/sys/kernel/debug/pm_genpd/cx/current_state:on
/sys/kernel/debug/pm_genpd/cx/perf_state:256 # because of USB3 votes

I'm not super sure where that sync_state comes from either (maybe
dev_set_drv_sync_state in pmdomain/core?)

Konrad
