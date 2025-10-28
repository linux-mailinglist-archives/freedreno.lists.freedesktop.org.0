Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F96C16FA3
	for <lists+freedreno@lfdr.de>; Tue, 28 Oct 2025 22:27:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E58510E1DD;
	Tue, 28 Oct 2025 21:27:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="d76T49Lb";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dRhm7Q5k";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 226DC10E1E8
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 21:27:10 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59SJlRiI2552965
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 21:27:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=DdP5TbkC149GA0FALd9E/e3/
 ojBpNA/aYkFJbl++16A=; b=d76T49LbrMTmJhm9EVksq+X3aJ8sP19kIwpRgBbk
 BB0EtVFUF1z0BGTOsp5l0S4eMyBwJ/IHUxuqAMrxyyzuy5eKrIT6FAgLuf6PGaDm
 uL82HuKSZnhWArjRbvU9OSaBUpAFs/5hn1smQ4tVEbdXeeo3/cu4tFjkOC1AlfpC
 coIehlmHJ45V/xeR8upzSgKrn3nrvDUx29oYfDLRxJCrBtq+8uZdqiC5JD1RSrcX
 XiPttyFU/hIQurwPgePCEXZcHbDOIpNW0iri56JwHAyj+dx58ZdyDI+Q0IC5K4qZ
 zrrgT6GQihp4y51FBoBtE4SwfSFnOuaNcEJHEm4QiNu45A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a2g7b9-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 21:27:09 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4e8984d8833so296045831cf.0
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 14:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761686828; x=1762291628;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=DdP5TbkC149GA0FALd9E/e3/ojBpNA/aYkFJbl++16A=;
 b=dRhm7Q5knbj0FpLJHFeUo5JNna1TGHxHUz9htU94ydVfkuXNaVM8fd3tUMMGey3l+t
 zeaLUzO9pXxDJSs1VHI24NjFdj1xFtLrH7iIjuMBnh/5EhauWQDOgUyXCv9fWrOL+sYf
 uPlYcCG3XoOFa3ceY4Lqa65JhXHo5aSxtqVV4dSQNl8/qnxRlE3MSeMJAXaEqS/z/2wS
 PiQ8KpWLLrSi+jmUEWneSXiFMk5uQiOp3oGPBZmgYl6lCH3g+zSpFylH2e9XVoSjbUzI
 5R6vqjuBHKpI4leTovjf7hYsVJPJFR0LwixuX7aGRiC9ZOw45sh0b6/HXO4/i3vKguWB
 BBqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761686828; x=1762291628;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DdP5TbkC149GA0FALd9E/e3/ojBpNA/aYkFJbl++16A=;
 b=GTGVrZ15e9sbUox0li7yjTSsryUkJMfsU6uxwqkuFiAHosZaRKtLUWrdgzz0Q1A5S1
 er7V12UiFgFC6VDUb01NSJ6ClLlyEVDQQMP/oJ/YCemrG3pcABXBDyvm4CwFSvgSwB6n
 onVCdc/1SCikYbVVBkV+6pyoEpSeG7pmU/EH4ZgIVChuScqvFAbYrXa6ym0Qz6Fm5E50
 3/3otiR9VJT0KB5kPbeQVlQVeshcMGYeu88K3pYlMCcrPrG1etRnDahS3/Z/jKNh9hci
 hIWASumgCVoziWISXz5jpu1mQ7bHygmPPhGiEHHh1h2Gz2Ur+qbzWG7SCsZGa87n24Gg
 YvpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFun8HeOhveyQrtuKAeIKHFWH9ANKHp0/SBGkWuWMfDf61i4BQ0gtYISbrpHYeQbDy05+zrAHVi0c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOozR03BvdZpqSSkKKyCr3T9rQqsJBhO77e8jMsWz86zl4J1FU
 nQ/d2Qf2rKW8e+YrSQoY4wjnpWSicImkDkO0nhlaBS1dzi+/fFFrO36wxs76+tbXTGDcpUL+v1R
 nvkuCBH6/EFOMgVKUl4HitMgxvKVrQ4h8buMqeoCzqCfLocPa0qGzQTy5oiI6jlTRNwRlfMk=
X-Gm-Gg: ASbGnct9t9FkuIvjThAgHZbusGoJRQGItEmtlMmG4f3SboQ0VVa1c7y175X4Cm71aG3
 SP+gsxYbVvClz8IVmNDQuiiGI7xIYWZsj6rhs42WpKrDGkAGtkvD7T97Fth7ZhT8jhMuemYuj8I
 d/lnYOw2pU4kJk4amB+M9II4+Ho61UKyMq1GnLaRsI9b9RKsfF/AhjkSln0DMEcnB7JdnTm7IDX
 b5zn34RkzntsxXEWZkwrY4OHjeJ2fP6QJVIrn65d8RlDpxLb3Ttz8qPmVhmicRkjahHfDyK0/rX
 OWagP6r421RxQeQsyQ4kUUcKglF0i5hwvnP/87rWBQPxgyN/lEFsgRaV2pR++wSJW0Si+fnOvDD
 W7XyMq9/ETec4GKbE2LFdmQz8jX6mpf47F1+cHPjtxjAmCx0FR6cIgUez0+aqsgJY2NuHQESQpq
 pjqizzKeCtDFjX
X-Received: by 2002:ac8:5e13:0:b0:4b3:3b2:2b4b with SMTP id
 d75a77b69052e-4ed15a23867mr9720661cf.0.1761686828545; 
 Tue, 28 Oct 2025 14:27:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdxR98KH4P1HlcjcBcumSx72Dky53bKX5MRwlk/e4bOdqpkMOYKmt8VJoGyRxf3ikIXyDRIA==
X-Received: by 2002:ac8:5e13:0:b0:4b3:3b2:2b4b with SMTP id
 d75a77b69052e-4ed15a23867mr9720451cf.0.1761686828124; 
 Tue, 28 Oct 2025 14:27:08 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59301f41c3csm3332734e87.15.2025.10.28.14.27.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 14:27:07 -0700 (PDT)
Date: Tue, 28 Oct 2025 23:27:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Kalyan Thota <quic_kalyant@quicinc.com>,
 Vinod Polimera <quic_vpolimer@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] drm/msm/dpu: Disable broken YUV on QSEED2 hardware
Message-ID: <jbf52sfh7vpefhla3vonerfu7jyvja3erlpf6qgq6pa4htxtrp@7qxlchr2phyc>
References: <20251017-b4-dpu-fixes-v1-0-40ce5993eeb6@gmail.com>
 <20251018-b4-dpu-fixes-v1-6-1852278064d0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018-b4-dpu-fixes-v1-6-1852278064d0@gmail.com>
X-Proofpoint-GUID: 2G3DUskIXEH2j5ABfYQf8d38BmpXnDyt
X-Proofpoint-ORIG-GUID: 2G3DUskIXEH2j5ABfYQf8d38BmpXnDyt
X-Authority-Analysis: v=2.4 cv=PcvyRyhd c=1 sm=1 tr=0 ts=6901352d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=kAP0dVoXV5zkFeC1rmcA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE4MCBTYWx0ZWRfX+Sbk/qYO3kHF
 eE4u48dR4PjCHKYSk42aPZAZC/iK/FK9bvl4MNoTDwkNXNQsdikJs/ibTSChMbIW3vymdxdS0lL
 qCL4gcD6Z3fsPlTAip4+JUhCdtVj+xpLlP70cBLWAcjCb4Y+5oIq+1g8LgioEj5JfIoJgUJySWy
 oz1DXGrVCOxTrSXjylIQB7zqH5cajzPWbJXFKE2ZtnGN1CIYWw5n14xTtYa0TdNrunFbaeZnBnn
 cHloAvClPsSwWvVUlCtl5mEY3aPoBsiulLC3TL4Ln71UupPPM07ZiwuSDXIgPEB5yJbu+pmj/Lf
 3Xlj5Y0k4Y7VH7bBJlSPLfnBdMiFGJefdjQWI61nq3mQjsnEanFY8ln6Cnn4NHhPS4HVEZeYKje
 FXYNrUp2XVjo8HG5YfOFp6IFtmS3PA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510280180
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

On Sat, Oct 18, 2025 at 02:33:43PM +0000, Vladimir Lypak wrote:
> YUV formats on this hardware needs scaling for chroma planes. However it
> is not implemented for QSEED2 which breaks display pipeline if YUV format
> is used (causing partial and corrupted output with PPDONE timeouts).
> This patch temporarily disables YUV by switching affected sub-block to
> RGB only format list.
> 
> Fixes: daf9a92daeb8 ("drm/msm/dpu: Add support for MSM8996")
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Does it apply to all QSEED2 platforms or just some of them?

-- 
With best wishes
Dmitry
