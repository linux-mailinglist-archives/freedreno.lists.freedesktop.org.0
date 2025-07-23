Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0499EB0FC50
	for <lists+freedreno@lfdr.de>; Wed, 23 Jul 2025 23:53:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBE5810E077;
	Wed, 23 Jul 2025 21:53:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nqs/YFDx";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88BBF10E194
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 21:53:06 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NHVG0W012834
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 21:53:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=v72jQE2tLfM4yFjj0GK92SGI
 mdakpqBvLjrNZl77Tu0=; b=nqs/YFDxNBje1ApXmMFgBluOnK0kQE83xMukvMLQ
 i5CRsGZKizemqdixV0lmFlKl5b3w3B5l1SrJYLFW/jVqCt9o1VU7M4mUiAeyfEC7
 K8QM5hZKN9kyddwv86Q6wbuCfxsseiACZ0Ile1h2Os9Y7Vd8OgJz0ygz7jD5iolA
 bx5IHN/LLYJDycrCSLY5nNgMuaBzPkSrfIqBsTWNUHl463L5KUrP9+IEhsYaDmem
 ZyZBBBrvk/ObQ0ad9UUVWNpimk/dEtrWEiUO8sB8nQH5FySp+VsV7JlM/yoGy37p
 ddLZtQn+iiwkhpvXXgi135LL4/gD4rqobc4psxEF8MQzDA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048vd01y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 21:53:05 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-70707aed1eeso5598666d6.3
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 14:53:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753307584; x=1753912384;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v72jQE2tLfM4yFjj0GK92SGImdakpqBvLjrNZl77Tu0=;
 b=bGbNgIO+VHiEOZkF/quz9LRamH3J/j6z8g9JeyU2XMWo/Avo24LMXk2bOeKRuFNhtp
 6PpRGogyZ7c6tomgANYHQGlNZaagWHHJ5AFafTzDzfowChUmsG2qz1Cp6TPOFbxDCuLx
 fsPEM5fRXC3fgei/LGDDnck9YW03MkS5ukBXhs3RNbvsw7b7a1sMaQU0ZjkIBgKU+KPL
 7OVzvYvv5YQUOpXpawZKeGeghf52imiDOBJ3Egp4Fe91nSh1Frs+0byBHbScYqIa8BIj
 8EyUEOkmlFOG47CowgCj4dPI+adZLVWpI0p5K+1AlRD90G7541CVqQpsgudviRQxd0t/
 lQyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVN/5ieJQH80E0UWBFB8jNnybd0YyBw32SOSip0HfuwtZW7+taDs/a4DBeSypQGxMaWk25uypYCZMI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3WRq+lJ3mE+fYEyYE0sRRUUjRYtsyiVaynvz1DcVxvMJBI9A7
 pXIBcYXU5TDXT+PGDDkLrTg+R8v0HhVtSM7iqxxD/Tjq+7Stq0hqjhrp4zcZsSkUbm3nfmF3ddK
 eukqOFzjR0Jey+2C5GB7NiyMNAOmjSMgaaAqP36s1G9/zG7R0GxHVrujpTIK08VcShDShVVk=
X-Gm-Gg: ASbGncsF/IH32SKzmaQK2Bx/J7yg3O58sOimT0Ufhe8ayt3j9mMs2zpSkO1HwDRpnPR
 lSfGOCNHqWtegdzI4cqzje5pwv4WlL2N+UHrCN80d0ytrQ69I5jFli1I7xfdd4FPmcdq2wz0Y+p
 XoYKY+H4N5zA3YKtschvwdxOxAm97DgPfH+jVh7lh8DVvdfAkyfDyhP2YHTI/mUrQKJJ216IaB+
 AnYrhAxp+EM1Q0rSy4PMJ7P5gHrK9yBgCKgHmMVe6/C6SfqU7lTS2OtdK0/Pm6tDqAA/bvB0aP6
 vbFMAvglN5e0ZVQKrkZ5DceX13YBlylMic7TXWsvsgWThUNK7nLg3ru9yCCgV9vztU8CjFeMKys
 7ZpnzAZikLRlnpv14QCuR+rGElgegrEp8ZM8TrBVcjMHluLKuuvYs
X-Received: by 2002:a05:6214:c65:b0:704:f953:eb60 with SMTP id
 6a1803df08f44-707007987c9mr54947966d6.47.1753307584360; 
 Wed, 23 Jul 2025 14:53:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLtHVDKzBN5wiY19PRElCtVoKBtRxEOU+M0J8TZMQP/DquUGxds3clV1zM02s/3MTy6pOoIQ==
X-Received: by 2002:a05:6214:c65:b0:704:f953:eb60 with SMTP id
 6a1803df08f44-707007987c9mr54947606d6.47.1753307583818; 
 Wed, 23 Jul 2025 14:53:03 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b53c84badsm33283e87.145.2025.07.23.14.53.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 14:53:01 -0700 (PDT)
Date: Thu, 24 Jul 2025 00:53:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/17] drm/msm/a6xx: Set Keep-alive votes to block IFPC
Message-ID: <s7ck5taxbozy3dxtav2huxh5d4ietfmqsv4mliajelu2gy4eqo@6xmp73eamqm7>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-8-9347aa5bcbd6@oss.qualcomm.com>
 <jvn44gmttkidyy4emnz6mytqqjbwltlxibywfr6bfbqjfbq35e@fuvvefesqbzw>
 <0427769f-62a1-4a20-af94-b340413296ab@oss.qualcomm.com>
 <644a81ff-bbce-4cc7-a364-8e0c591898b3@oss.qualcomm.com>
 <9322badb-9f94-4bd1-9e3f-447a9134cd7d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9322badb-9f94-4bd1-9e3f-447a9134cd7d@oss.qualcomm.com>
X-Proofpoint-GUID: RDyy1JcOrHm_m20gzk-HsAW8RdHTnH7p
X-Authority-Analysis: v=2.4 cv=SYL3duRu c=1 sm=1 tr=0 ts=688159c1 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=4BsFJF9TogBGrZafdScA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE4NyBTYWx0ZWRfX8goKyhoQnxke
 N3zPOL7jiL/js5MHUYzBEXEsUO0nyTfKVnNoYTtUOK6WLIVaNR83KfdxrvHFacuJAUvdJkBbr9p
 cGUTQMa1A3rl7qVVmtwDoTPfhnm7eduRkkTrts2BfIokiFwvrAmbLW/Rj6GWlcidwKuwXl94ajY
 KVn3kZXWfgqzMyJBrIsnL38TopN55si4Mtzp6UWK5WjC19CtlyxqhJ5D5txnhpOpIod7KsOgN7w
 vPQXlayq+KecYPKoKj+6Bthd9lQ5yd6R040xER7UtK+snLlSiL/HtkzvENRCULT93BW905sjmG6
 ipgHAnILs1RPcC8J6hXY9fgZH2KSrcG35zbXHbJmKFNY5On5Q7t2GmoKIcziiNLXbr+Hj5gyWZY
 tXWUHJ4BqG9TNYGzhq28Jw5qMo8mjE9vNfyl+oDGBwJHcEpjJSsKPLs32aj+8v2xXMAmrvqJ
X-Proofpoint-ORIG-GUID: RDyy1JcOrHm_m20gzk-HsAW8RdHTnH7p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=868
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230187
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

On Thu, Jul 24, 2025 at 02:52:52AM +0530, Akhil P Oommen wrote:
> On 7/23/2025 3:35 PM, Konrad Dybcio wrote:
> > On 7/22/25 11:24 PM, Akhil P Oommen wrote:
> >> On 7/22/2025 7:14 PM, Dmitry Baryshkov wrote:
> >>> On Sun, Jul 20, 2025 at 05:46:09PM +0530, Akhil P Oommen wrote:
> >>>> Set Keepalive votes at appropriate places to block IFPC power collapse
> >>>> until we access all the required registers. This is required during gpu
> >>>> IRQ handling and also during preemption.
> >>>>
> >>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> >>>> ---
> > 
> > [...]
> > 
> >>>> +static void set_keepalive_vote(struct msm_gpu *gpu, bool on)
> >>>
> >>> a6xx_set_keepalive_vote()
> >>
> >> static fn! Why do we need prefix here?
> > 
> > It's good practice to namespace-prefix your functions, so that you
> > can more easily find them, e.g. in a backtrace.
> 
> It would be obvious from the parent functions in the backtrace, right?

Think about jumping to a tag, etc.

> 
> A bit subjective! I feel that the prefixes are unnecessary for small
> local helper fns. Prefix for *every* single routine in a source file
> makes the code look a little bit bloated.
> 
> -Akhil.
> 
> > 
> > For a prefix, adreno_gmu_ would be even better, as the register doesn't
> > seem to have changed across generations
> > 
> > Konrad
> 

-- 
With best wishes
Dmitry
