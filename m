Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AABDA85A6C
	for <lists+freedreno@lfdr.de>; Fri, 11 Apr 2025 12:50:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E1B10EB6B;
	Fri, 11 Apr 2025 10:50:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bImzi9je";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6935E10EB6B
 for <freedreno@lists.freedesktop.org>; Fri, 11 Apr 2025 10:50:13 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B1BNYf006840
 for <freedreno@lists.freedesktop.org>; Fri, 11 Apr 2025 10:50:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=C97yfs8Wv2cDcw2jhs5lGZau
 Urf5iXgcz88ISp/clXI=; b=bImzi9jeqU4XRcJUar4+UAKMea3Bcl+eE/FvD+KV
 r7qDUPKpU8A86zZjmCGdb6Xq721PoHlqB3zss95FQmOKxfGBhYvZ1XpJJ0klzNpR
 vKMVi/rmR0YLx1DZpd5YxQ74el+itp8MprAZlQYRptAXXRK78U/bPVRNr78CIcWi
 mUjGnunaZ8FSVgcMzPZzDMmBZ0p2qSyCz4yAspIktlx76ub7mDKeIbprc9EPlh5F
 nYPqM3R0a+zeaRGp0ZdXfo5jqDQEN/vZSJX1RRkFVvpUA36R5ylEM+7saCdlk5sT
 Fqagh7eVBcVXky8k0ZRij7Gq2f3RvJj3S8+PbGezaJTOAA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45xeh3k4jh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 11 Apr 2025 10:50:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c579d37eeeso293926285a.0
 for <freedreno@lists.freedesktop.org>; Fri, 11 Apr 2025 03:50:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744368611; x=1744973411;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C97yfs8Wv2cDcw2jhs5lGZauUrf5iXgcz88ISp/clXI=;
 b=AGuZMBlP/8RDraoTv3Gt3PoW7HYmlfjhSpmETUheB0XMMZ3+wQTufb5VupxPqtfUnI
 eXqeqxzN8KDZ1lENlD455wQDVaiv2aYA3PXUqZPkFxlNLVUGFWhR2eoEYO/K32VSrZid
 6WcWN1Kw1aB0dsFUOasbJYS0CcPovtd6rtsH3XaL8VrTSrjGWmyAMNuVwYRgjeVli4Dz
 3zZoDWObLQRlwQzEqCUhhfSmMsUl9Ykm8ScwenyCBKpaWeYlYPQuB+pNv2BiHazUYjUJ
 jM8t47+xMvPKD6n1mFWyrrNDZiFs4ohkwddWlwmJZR5FNXeyQc2ffJXEv+dwvTxEoagB
 Impw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGSKFjnofNSBnvt7CfIxQWqKGYmm7MX9Yzc8rpu17h0aEuNYRqGOy71rGod00qbAdef3zF+kTSnGw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyDANZCKYbqRtwQuURoZZxqV1COFwRtS3jsGq4lgccf4jzWtAbI
 HxxMQejFuRtza1hfrkYmrZ4LS2juLyXsusxjmAU/DqZ2n9f+J5zUdOW+VFa8OW8k5+QFHDAVdkp
 5+t4fxs7EqslPTynPOV20JEm/noZDvh5bEJqLa2/axsDN5nnkRcXAcgX/KVtdtn4W/5c=
X-Gm-Gg: ASbGncuM+U7ztgof2X0j9HKJlRcJjkGHLMmd8SL8ndC82bnVnQghIj7rst++3/4oFY4
 Vl7PXDjQDEM35MA6tvviZEjpyTNq0j9rvl/py0QbxVZp4MnvzuYumZ8PAEgR8qBPFeRiyVkeDit
 Hw3FmBmZq9pxJ7FyEXCq/hbGMsuQMdHSYcWnjkW+mrvMy232VXfspc3bD0+MPPPNa57qd1oamGI
 u8dWb2UvKhC2K+58+t7LDtrDfVVGi1FZNpvhBhNgn34TpHDi6xPfVBADE+kCpl7jY2PapAlHRGb
 k7wAIuNl4NtvqsRdcCsuYJj+ZJ41+1fpSQVfBZDU1J8TwhWxBeWH0IvQQDQJ6nM5MLaY9Orzyno
 =
X-Received: by 2002:a05:620a:3944:b0:7c0:b523:e1b6 with SMTP id
 af79cd13be357-7c7af118d54mr322641985a.11.1744368611158; 
 Fri, 11 Apr 2025 03:50:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwuTv7stLnK+XR3ItFXzEehhs3MrRks/jgeNMsXwGYVinCOPI7c7U5rRfwv5bn3sWzVW7hog==
X-Received: by 2002:a05:620a:3944:b0:7c0:b523:e1b6 with SMTP id
 af79cd13be357-7c7af118d54mr322638185a.11.1744368610673; 
 Fri, 11 Apr 2025 03:50:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54d3d2369c8sm398622e87.59.2025.04.11.03.50.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Apr 2025 03:50:09 -0700 (PDT)
Date: Fri, 11 Apr 2025 13:50:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH 0/4] Retrieve information about DDR from SMEM
Message-ID: <sgjporlde6bgcp2mhr3r5c6wj3a3u37s5nlrrokbutsyizixod@7shpt55muqki>
References: <20250409-topic-smem_dramc-v1-0-94d505cd5593@oss.qualcomm.com>
 <685e784c-3f36-4cd1-9c34-7f98c64d50f2@oss.qualcomm.com>
 <0bec3e62-0753-4c3d-abe1-1a43356afc80@oss.qualcomm.com>
 <e7bd2840-dd93-40dd-a1bc-4cd606a34b44@oss.qualcomm.com>
 <CAO9ioeUeNeSxz7ADZ-BbJbhEKkszVS+SmbqaZCgTpL=csak=hg@mail.gmail.com>
 <b04464b6-2ad9-4866-88e9-437e96645726@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b04464b6-2ad9-4866-88e9-437e96645726@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=VbH3PEp9 c=1 sm=1 tr=0 ts=67f8f3e4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=pm7WE2fj5uaCs4OQ7f8A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: ghexgR4cNQHMjrcpJ0FfxqEq8EoXGGPu
X-Proofpoint-ORIG-GUID: ghexgR4cNQHMjrcpJ0FfxqEq8EoXGGPu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 mlxscore=0
 mlxlogscore=796 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110068
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

On Fri, Apr 11, 2025 at 12:03:03PM +0200, Konrad Dybcio wrote:
> On 4/11/25 11:57 AM, Dmitry Baryshkov wrote:
> > On Fri, 11 Apr 2025 at 12:49, Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 4/9/25 5:49 PM, Konrad Dybcio wrote:
> >>> On 4/9/25 5:44 PM, Dmitry Baryshkov wrote:
> >>>> On 09/04/2025 17:47, Konrad Dybcio wrote:
> >>>>> SMEM allows the OS to retrieve information about the DDR memory.
> >>>>> Among that information, is a semi-magic value called 'HBB', or Highest
> >>>>> Bank address Bit, which multimedia drivers (for hardware like Adreno
> >>>>> and MDSS) must retrieve in order to program the IP blocks correctly.
> >>>>>
> >>>>> This series introduces an API to retrieve that value, uses it in the
> >>>>> aforementioned programming sequences and exposes available DDR
> >>>>> frequencies in debugfs (to e.g. pass to aoss_qmp debugfs). More
> >>>>> information can be exposed in the future, as needed.
> >>>>
> >>>> I know that for some platforms HBB differs between GPU and DPU (as it's being programmed currently). Is there a way to check, which values are we going to program:
> >>>>
> >>>> - SM6115, SM6350, SM6375 (13 vs 14)
> >>
> >> SM6350 has INFO_V3
> >> SM6375 has INFO_V3_WITH_14_FREQS
> > 
> > I'm not completely sure what you mean here. I pointed out that these
> > platforms disagreed upon the HBB value between the DPU/msm_mdss.c and
> > a6xx_gpu.c.
> > In some cases (a610/SM6115 and a619/SM6350) that was intentional to
> > fix screen corruption issues. I don't remember if it was the case for
> > QCM2290 or not.
> 
> As I said below, I couldn't get a good answer yet, as the magic value
> is not provided explicitly and I'll hopefully be able to derive it from
> the available data

I see...
Is this data even supposed to be poked into? The foo_WITH_bar types
doesn't sound like a very stable API.

> 
> Konrad
> 
> > 
> >>
> >>>> - SC8180X (15 vs 16)
> >>
> >> So I overlooked the fact that DDR info v3 (e.g. on 8180) doesn't provide
> >> the HBB value.. Need to add some more sanity checks there.
> >>
> >> Maybe I can think up some fallback logic based on the DDR type reported.
> >>
> >>>> - QCM2290 (14 vs 15)
> >>
> >> I don't have one on hand, could you please give it a go on your RB1?
> >> I would assume both it and SM6115 also provide v3 though..
> >>
> >> Konrad
> > 
> > 
> > 

-- 
With best wishes
Dmitry
