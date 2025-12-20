Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DA1CD2463
	for <lists+freedreno@lfdr.de>; Sat, 20 Dec 2025 01:42:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8603010E1DC;
	Sat, 20 Dec 2025 00:42:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JrCFVGtP";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eqsFm8BI";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 301D310E1DC
 for <freedreno@lists.freedesktop.org>; Sat, 20 Dec 2025 00:42:47 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BJNN2xR3002203
 for <freedreno@lists.freedesktop.org>; Sat, 20 Dec 2025 00:42:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=JOGt5/7g49gJezpOEHrF48C/QV2MS3EEhUzdFDmEb1Y=; b=Jr
 CFVGtPYigp2xekdP7NSsVHZw4ZM8O+6A+55929D2nwL9taxUVeadc98/08DQ6atw
 K0iFclY6I8x39qVt/1irZlJFKWef0alBG5nU9LeYq07HMVSHGQ/EAuk2FBTlk6z5
 ONT/Xk8buEtv4aRA/0E/n/3YwlDTvcX5AdxKKEDXy8Wls3jbmkNF5xTlQ5qsEgRJ
 0+l/uc0EjO18aRxE3iWL6cIMLzufyFDBs69Z7pjHzUGurogB5D0cw5wS4g8A7pEE
 IYzjaiURIUep4lwPZMKi25mSedKmd1KuyBSB6I+hFjePHeR7lNXahrF+N6l4szEs
 ujPBJmaARXDXOZMOlbzQ==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2ecdcd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 20 Dec 2025 00:42:45 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id
 006d021491bc7-656b7cf5c66so3258109eaf.2
 for <freedreno@lists.freedesktop.org>; Fri, 19 Dec 2025 16:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766191365; x=1766796165;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=JOGt5/7g49gJezpOEHrF48C/QV2MS3EEhUzdFDmEb1Y=;
 b=eqsFm8BITOF7NCE4dOMXI73bMzkZUt77b+LGLhYSB4mdSK6w27VxkKaKwAJrlwNJwi
 qANSQ3hEmX9N85VUEKHXlZAsrrrgq8zuaEKj1jsPgeWqS3Me5+tgFq5CQfTPhNxSLUyY
 LmBOucjWlvRXeugi+7NSqd2VeQoARyR2qyAvu0dyk7R7Wq3IFtejFdmRAg/Vw57zsvsN
 G0xtAlgKP1ga0N3Mk5J7SOvzl9FSokgUe5gWndFXC/AJbOha0hgr/YgEDeXP+UI1v7+G
 Hj6c2ktQuFtxnqn2pBMf1Krnlb315NiTStUMlISrHxTKNk+H62OKLEfA+0G9NzqwX2mM
 rXsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766191365; x=1766796165;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JOGt5/7g49gJezpOEHrF48C/QV2MS3EEhUzdFDmEb1Y=;
 b=T5ADaUXlFwQGSyRe9vjem+wKfGHPoVCyVRIPpUH/pqFKoN93FsDCYTyi40TCq2b9nT
 AjCifdXIm6gM/hWclpVcZXSNukqOpPMZhFFQo5XCxndUU+kuhlPhw1V8shwh06GWVbZH
 afIOdvrVCWnFAhnASD+59hOzbcSUYHC9DLFNfyDXrYY0cXlxzwyWVJVr+58a3b7eG+zX
 c1Ar2nWSfW4/dgvotCcMitiajcJcFBgezlPMfrwrsyQaAvjaS8FJjW1UFMCTGaeo6SxX
 WB/6Z/ZwL15Q2rdq/lhyJL/fNisuvHWGpqL+jqZ431PAN45cj9xKufzOu8fuLSeAvWE9
 69Lw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMrHKZ7yxgSXWu2OGEZ0cTnUjZuXf2+k7YACnSeXUc9GPbXmptpKcs643C9Fvka4vaCbUk/f1P31U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4x5JhBWWZ8fwarrlaG50ScFWBM9cacHKWn4gNaEbo1+v+1biz
 m1GFIp6GEd5TusVrRAI9O9GNG1AE2psqSxAucDq7jbUB4DR5zTHrAcn0VIYAgSn/5SlGEUMvwmj
 +FB15FTnLLyaw+AZgHnZmEinHRIPEETBLVjMbl4PNn7UZR0mt43xW5lUmSNjnihPH7uPcPv9WM6
 yubwu8ln5bAR/jEmW/dAocCxVyTxTbeV1WCRlVeAuzcIJhmw==
X-Gm-Gg: AY/fxX4elDGT8cC20lOUny5kpb4oVCTYopE1ViDpnjPS2lmctgy7yhJ9yK9kwgpxw8D
 /s1VfxyCHutP0GwmmnVFjb/4kdk11QHF/a6CjzjJqaXZ7tEaZyROOsr1pSH3GsIxs2V4yin1Ufj
 r8qkihGWVhIionWdZieXfzaIxhXda10DdGj6JdqwwSyQ9W02xzS0CeJjuL1pTnZnGOCA==
X-Received: by 2002:a05:6820:a93:b0:65d:4d4:e7c4 with SMTP id
 006d021491bc7-65d0ea9d1a2mr1335954eaf.38.1766191365450; 
 Fri, 19 Dec 2025 16:42:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfWlogR9xBl/XkUR0V/unvcetOQiM2J5qVYXxc3t+LBazokeb/IMmWiP8Yax26tVKm3/hUS8y1D/qy5l0k1bc=
X-Received: by 2002:a05:6820:a93:b0:65d:4d4:e7c4 with SMTP id
 006d021491bc7-65d0ea9d1a2mr1335938eaf.38.1766191365068; Fri, 19 Dec 2025
 16:42:45 -0800 (PST)
MIME-Version: 1.0
References: <20251117132516.18834-1-alok.a.tiwari@oracle.com>
 <c97ee966-5864-4be5-9e6e-afc8a93dab5a@oss.qualcomm.com>
In-Reply-To: <c97ee966-5864-4be5-9e6e-afc8a93dab5a@oss.qualcomm.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 16:42:33 -0800
X-Gm-Features: AQt7F2o5phxtrNBceCPYAwCNEcUUmU_OixULB8ukBXOVsyDFaPSHw7bt6s4cKtU
Message-ID: <CACSVV02h-51_YvtiU0yS5UEpaO7NsjBMOyfMbuF2hk6=8oMfig@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: check state before dereferencing in
 a6xx_show
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Alok Tiwari <alok.a.tiwari@oracle.com>, alok.a.tiwarilinux@gmail.com,
 jordan@cosmicpenguin.net, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 simona@ffwll.ch, airlied@gmail.com, marijn.suijten@somainline.org,
 sean@poorly.run, konradybcio@kernel.org, lumag@kernel.org,
 abhinav.kumar@linux.dev, jessica.zhang@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDAwMyBTYWx0ZWRfXyfJ5vrdyzZta
 V1zN5NnaKSQDfjkQxcQulKFfB65WRHqVdTn0z9jj5APNC6h8dpMWTRkTLDuK30lRYuYSAk1FN3L
 jV9qFBV48hUyHa/ycbFakIc3/mqC/VG5+d79TFoJWMCohVglFhxiFF6RFG/C7eoHd2fdHmNFA3v
 0NwExiguMbkA1YV+JVyhNqOoQ4Z7sUOpVidsEKv5+YfeSPw7l/WAN8YugNZZ4LtD94WU4YHdsE0
 MUGDzZh2Glbkxeeg7Po1ZY6dDTUrUEEFELSzdCnOV8qNCE1mg7TdkTmJOU6eRlnV+31B4573Z39
 FsGGAo44wwGjhaH5R1HDmwQSfHl9HlbDfuOiKHDJJNCvgkDZ+znN1EJRV3e08emf+pQeSW93io8
 iVsYxxTzsrumjvRIPNd7bNZXMtctaQ9C6mWceh2q2kqK73DLmWoSMBWB7pjedKkjNOCQ8BtO9SQ
 /r18aCRnY6XiqUWDQJw==
X-Authority-Analysis: v=2.4 cv=W+c1lBWk c=1 sm=1 tr=0 ts=6945f106 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=yPCof4ZbAAAA:8
 a=dNUZgOZt_aCjTAHcu2AA:9 a=QEXdDO2ut3YA:10 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-ORIG-GUID: ckVMYsdlMGByCjWls2EhL_Iz5cbmPwsd
X-Proofpoint-GUID: ckVMYsdlMGByCjWls2EhL_Iz5cbmPwsd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_08,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512200003
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

On Tue, Nov 18, 2025 at 5:57=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qualcom=
m.com> wrote:
>
> On 11/17/2025 6:55 PM, Alok Tiwari wrote:
> > Currently, a6xx_show() dereferences state before checking whether it is
> > NULL or an error pointer.This can lead to invalid memory access if stat=
e
> > is invalid.
> >
> > Move the IS_ERR_OR_NULL(state) check to the top of the function before
> > any use of state.
> >
> > Fixes: 1707add81551 ("drm/msm/a6xx: Add a6xx gpu state")
> > Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/=
drm/msm/adreno/a6xx_gpu_state.c
> > index 4c7f3c642f6a..e408e1d84ade 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> > @@ -1976,14 +1976,14 @@ static void a6xx_show_debugbus(struct a6xx_gpu_=
state *a6xx_state,
> >  void a6xx_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
> >               struct drm_printer *p)
> >  {
> > +     if (IS_ERR_OR_NULL(state))
> > +             return;
> > +
> >       struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> >       struct a6xx_gpu_state *a6xx_state =3D container_of(state,
> >                       struct a6xx_gpu_state, base);
>
> Are you saying that this container_of does a dereference?
> I don't think so.

it shouldn't..  but also there is no code path that reaches here with
a IS_ERR_OR_NULL(state), AFAICT


BR,
-R

> -Akhil.
>
> >       int i;
> >
> > -     if (IS_ERR_OR_NULL(state))
> > -             return;
> > -
> >       drm_printf(p, "gpu-initialized: %d\n", a6xx_state->gpu_initialize=
d);
> >
> >       adreno_show(gpu, state, p);
>
