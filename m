Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7789B23DF2
	for <lists+freedreno@lfdr.de>; Wed, 13 Aug 2025 03:52:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65D0810E4AD;
	Wed, 13 Aug 2025 01:52:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="B6K/66g3";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3D2910E192
 for <freedreno@lists.freedesktop.org>; Wed, 13 Aug 2025 01:52:13 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CMIl3p019115
 for <freedreno@lists.freedesktop.org>; Wed, 13 Aug 2025 01:52:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=azzIjnnFrhGZepf8cF63On31tVI6l+R0n7SE8DktVtY=; b=B6
 K/66g3ltbZTioLlekcBRWaDkXKx5FaDf29+mwd6bhANi2CiCGfU/pSSR0t1FwC+p
 /iEKACkRvSPcaiJVxDDu/SPP+qLBEp5+AMSbbXX4sldx6dqBLx/lgwIpVEcunWOQ
 4Tti/eM8A9U/rqgDs9cBWNgzx4qvIVFYPlxWvZeOK6Ck1qfR/2Z/C72SPPNDJIl7
 m5BVknnQhhKkwz+82zvQ3Bwmht0Yq3ci2NIIMJ/8RGgI6jgUJ4KtLUfGU2te+jha
 YQ2161nV9Z1wFmmaSQpvez/7MQ6k3qgPbM+cdUedVBrdTtr1PNEqasPezSRk2hfr
 f7UQIuTY4HYiHLgx/bMw==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fem4e1kb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 13 Aug 2025 01:52:12 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id
 46e09a7af769-743034c4c2aso1422543a34.0
 for <freedreno@lists.freedesktop.org>; Tue, 12 Aug 2025 18:52:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755049932; x=1755654732;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=azzIjnnFrhGZepf8cF63On31tVI6l+R0n7SE8DktVtY=;
 b=FPKiBDXnpOTZEqhkHHKFvdSmkG4tBW9V+Bt/QrLrxhha/Mfk7cRr2+V8qfs4swWPt2
 nuzXOskaFlIaXc1UKeVACd2NiV1a+cAha1pL2dHXv2hODydCTbEMoW/t4Cj7UamvVbwk
 giqKevvmBR+lyWviRknsAxNBgBPay4ABASjq0OwqNXlufO3NR+B8GVnEgUIeKG5zxiqi
 KeL2/5a5IrwI1THx+NFttudlgB39y3zJTdO6Ay9a9HeaAIzF2B2rxim07c+Smv/q1maH
 Ge82qhXhKjv9s4BgDm3gFPKxqpoY0/xbhYt2H+PuylhvNjnqqFy3q/VQ13BU3nV41DYo
 c+uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnB1dKVy+EWwy3Dq10+iYfA1J/ZWbXU4HfVhi+eWxYUD3yOhgQU3Y+whTPJ+K740x2HhzAu02LPRI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy3gEr9MRYClW6EoSV+rLTeD1EZ8JG4Z/QBbM3kKgJ0SQocK53V
 f5ks0JFw6eku/8O20a32w81nVLugY2PkmkxjbXfK/WCvzd2zsly+W3yHMxoLQmgsoCrhtXrSVQi
 1msZZWys8UVEMDTWSaWBjH5kBv/TTmJ4vdTcB161xveeVZX7hKokGHr+n/HBRRrHltJAOSoe8C/
 WzDb8Vo5vFlcBcCx/X/cXwM9Jui8vQiA5L2FXylN8qvV/aLg==
X-Gm-Gg: ASbGncs7/M9Y9ycS+dlXm4pf+dEYAr1MNi5SWZy8LAZkKHnx9vQC4x8i6k9rI1Tbh2c
 9ZhZQo9F2UJsP+eUO8mZfUXKHTcBXlOxkS37xAwq24x+eiCqUesvihg54rHIfpLVZuXSkFvyYQ6
 ewIM2z29Qs6AuFghIQZPg=
X-Received: by 2002:a05:6808:22a9:b0:435:7090:b652 with SMTP id
 5614622812f47-435d42a2575mr1191307b6e.34.1755049931471; 
 Tue, 12 Aug 2025 18:52:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+oxwqW5ocHWrqoj/uh9nhQTzkltL6bf5O3y495PvLUQY65I8XhC+SpjSkN+0X4azk5mUzEknXbe5Iorw4nT8=
X-Received: by 2002:a05:6808:22a9:b0:435:7090:b652 with SMTP id
 5614622812f47-435d42a2575mr1191273b6e.34.1755049931074; Tue, 12 Aug 2025
 18:52:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250629201530.25775-1-robin.clark@oss.qualcomm.com>
 <20250629201530.25775-15-robin.clark@oss.qualcomm.com>
 <b0a36f3d-706a-4622-89a1-f88c6255e4fb@dakr.org>
In-Reply-To: <b0a36f3d-706a-4622-89a1-f88c6255e4fb@dakr.org>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 18:52:00 -0700
X-Gm-Features: Ac12FXxxd6WCPyXXb8MbyAX1gkPmIUnWgdFOtYCj3v3CcVsNgXCk29Md82IFzps
Message-ID: <CACSVV02+hE1j9vN_BU5pwz_4cnJjj==j-L5oPeFWCvEr+1HiFQ@mail.gmail.com>
Subject: Re: [PATCH v9 14/42] drm/msm: Convert vm locking
To: Danilo Krummrich <kernel@dakr.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Connor Abbott <cwabbott0@gmail.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Danilo Krummrich <dakr@redhat.com>, Rob Clark <robdclark@chromium.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linux-media@vger.kernel.org>, 
 "moderated list:DMA BUFFER SHARING FRAMEWORK:Keyword:bdma_(?:buf|fence|resv)b"
 <linaro-mm-sig@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 7YJ0vaLgHzLFknd3M_Bi4a8PcK-hjJAl
X-Proofpoint-ORIG-GUID: 7YJ0vaLgHzLFknd3M_Bi4a8PcK-hjJAl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA2OCBTYWx0ZWRfX/x6v9iVt1tLk
 2kLCilivo4U+VJfeD5+OexSXtsHMlRwpv1jQOhXQupJbPNgaRvV9GT/Q3vl2Q1qkLRsr2yZf/e7
 pd0fekZD+aT+5T3LDw2/AWAJEKvxa+GfTGIygA2VgL0Ps0ZeV1U6lQsQvgnOlMU3utXZbHkZAxI
 g+M+CqL8gYq+aSXW2WHr0CKbSOrNxiLes67mvfxhYV8mGA8asVpwjolvSGDeL/CcRtbF84LK4lz
 OihOyIJwOpBvjESWfwRVSw9TZYe/YO63zKMbdZYA9U2jsP/Vd5RvqCrB5mNKsN+Cky/zrsetz0s
 O/1Zbi6/la5sqP0u0S3sHai7qcjwkFv4ajrO0zIrZcWAFht0lbER89oEqZiTPfv9JGF21bfAKoA
 cY+fbeto
X-Authority-Analysis: v=2.4 cv=YMafyQGx c=1 sm=1 tr=0 ts=689befcc cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=P-IC7800AAAA:8 a=pbUkqq1XAAAA:8 a=Dc8E7AEoan46jiKjpnQA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22 a=d3PnA9EDa4IxuAV0gXij:22 a=F7rrpbw-2xKc1p48v2RB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110068
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
Reply-To: rob.clark@oss.qualcomm.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, Aug 12, 2025 at 1:58=E2=80=AFAM Danilo Krummrich <kernel@dakr.org> =
wrote:
>
> On 6/29/25 10:12 PM, Rob Clark wrote:
> > +     /*
> > +      * We mostly want to use DRM_GPUVM_RESV_PROTECTED, except that
> > +      * makes drm_gpuvm_bo_evict() a no-op for extobjs (ie. we loose
> > +      * tracking that an extobj is evicted) :facepalm:
> > +      */
>
> Yeah, it's a consequence of this locking scheme and I really hate it. How=
ever,
> you don't entirely loose tracking:
>
> The next time you call drm_gpuvm_prepare_objects() it will be added to th=
e list
> [1] and hence picked up by subsequent validation through drm_gpuvm_valida=
te().
>
> [1] https://elixir.bootlin.com/linux/v6.16/source/drivers/gpu/drm/drm_gpu=
vm.c#L1154

Hmm, maybe the issue was with legacy (non-vm_bind) contexts, which use
drm_exec directly for locking?  I guess I can try to revisit that..

BR,
-R
