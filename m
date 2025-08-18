Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB197B2A43D
	for <lists+freedreno@lfdr.de>; Mon, 18 Aug 2025 15:18:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC35010E009;
	Mon, 18 Aug 2025 13:18:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="OgkubE49";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF24B10E043
 for <freedreno@lists.freedesktop.org>; Mon, 18 Aug 2025 13:18:30 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I8oO84004363
 for <freedreno@lists.freedesktop.org>; Mon, 18 Aug 2025 13:18:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=uAqSYAJyc6fudwrnw7aEgAWXtSLsyi9zS9YKc9k28UI=; b=Og
 kubE49ddQr+RVjC0zLPjcLMSYsoaZ4ngHP5tExkWKwoWTgi+jaeHJu0JOqNMU0Fk
 ytIztsUG9m8+ufTEfE51/0IXZmoyML88+Yp1m1dWeVjuof/g0qcCtRmY3zJAaOUs
 c/AoHmqycXNWNag0FKtLqwAMbRghcaHvm9lGBiz6zziGYCreqyblA8yDuLTAvXBN
 1tIzIjOG2EsXrFfuJqHnaBJ9RxvPYdL2dlois1UNOxqREom615QtZl7x4IG2N0ul
 PNZrayfj2lg+pNoGVQxZ9P+KYiNOIv+Y0cNaWZf9poL6B0k0H3dxAiS9/3vRadwI
 TNveSsdgxbrvz66pjqrA==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jjrfvryu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 18 Aug 2025 13:18:30 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id
 46e09a7af769-74381fe3a8fso7179791a34.2
 for <freedreno@lists.freedesktop.org>; Mon, 18 Aug 2025 06:18:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755523109; x=1756127909;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uAqSYAJyc6fudwrnw7aEgAWXtSLsyi9zS9YKc9k28UI=;
 b=fbCdUefnpHkHCJi+3R+M4jyENtOAB8rG+57FAKG+mSgpb3i4npllvNmPUy/YKLPH/t
 ty4tO+JikT7MJYL6LLAf/xs53PAcmSymlYrMjI84CEqlE5SMLvT+A9VblfBCd/3NbT6y
 inrIsxlnPtU2mE78gAG5FGc94AUAGlxRoFNYezQNjQApedWVvtIbc9aE4hNpEedW1//y
 P7Q2lXY89yswxJAVH7ZCPMwQCANEShz0P+nvDL/iLb347QxD2R9MaIuvt5xbkrKImBFd
 a5r3y7xPlRGBWucx3TX9v5GEHgtUBP9itoRe6LL51LsceLeeR8+Zm38bqYhHyBjnq/bn
 eukQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIjyGfF+f2GZvCykUFr1Rw//+B4pduqcT7E7tJqy12dP/UNNzpxjuSmv59ooRqY2vuqVUtnB5ZjTs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMD//X0Tmev8msSymjBhW9spqViBFw6glvihUWOmD5DPXRQl7o
 ZRDnbTQXdvHiqAIRw/gQMh4zVK/zUzce5Pqd8rvyzIgbiL791vRmzi0sGyaCHPEt0B4qKykhRIx
 IA4tjglfuqFDVrtpkxOs6EZR+JneQJWuA/QpMp/ftXvQUOc62uCqQ7HxvZPe2q8xUADidpP6PCV
 9TvQ+E3Gzo3oRQ5SlijUDs+JTniBdw4nYVAS5Q9kaSS1E/fQ==
X-Gm-Gg: ASbGncuMee7hbk4ZOTRcENY71xlWvqbPjcWzfwpkR/XMiQCay0yrAZw8ra/Zz4j9V7d
 Km/yO0iiIbF0rhq5ji0GqcodO3/m2854/+R8YQNB+n+xhIx4lb0D5RuRwsqiyFbAQHZjhrc7ki5
 m8jqqQogM1kmcsbkhCli00AKLolarTg5xSXemuxoNa59o7F1fFP2i8
X-Received: by 2002:a05:6830:2aa7:b0:73b:1efa:5f40 with SMTP id
 46e09a7af769-743923c5666mr8065602a34.10.1755523109211; 
 Mon, 18 Aug 2025 06:18:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrs0mWeBrCCfWhxt3WgLSgIDxLQ6Kc1gX26Zji/sZVYHQF86VSLnVDmuBOOzeWaaZ7/d1hEb9Nw7+/Ihh/Pb4=
X-Received: by 2002:a05:6830:2aa7:b0:73b:1efa:5f40 with SMTP id
 46e09a7af769-743923c5666mr8065579a34.10.1755523108735; Mon, 18 Aug 2025
 06:18:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250813-unusable_fix_b4-v1-1-3218d166b8a8@gmail.com>
 <272d2a39-19ce-4ac5-b3c6-3e3d6d9985c5@oss.qualcomm.com>
In-Reply-To: <272d2a39-19ce-4ac5-b3c6-3e3d6d9985c5@oss.qualcomm.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 18 Aug 2025 06:18:17 -0700
X-Gm-Features: Ac12FXxrj6x20sKrGWwLUDNi8HYqMcVUNVM5TGMtv8mw9iPJlUONr9yAcK4nzW8
Message-ID: <CACSVV00Yo=cZxUztB5Jf7153bsnnuATrh3L1utw4SrOQmYERug@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: skip re-emitting IBs for unusable VMs
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Antonino Maniscalco <antomani103@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: Hnqyj2WwWNwcZhqQDOZiB1xLbvNNFYmN
X-Authority-Analysis: v=2.4 cv=YrsPR5YX c=1 sm=1 tr=0 ts=68a32826 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=3oEuPgIEOckFOmJ0i24A:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzOSBTYWx0ZWRfX76Jes9X9LuJS
 dacV6LuVQdbP9hsaoE2uLxIX2LxTb5yoxOjLmkFq/ju6Nz33WTc+5jXM6GooOkGU5yuWGPnZHOa
 pzPPK00SENim0SAOas6eThiiN1k6O4oisVAbU2//oyw6BkYs+MIBvHk7FOcLsv8msrqV1jQnrLe
 UYrJmELth6ecYFlwtLTDkl6R+rsX8fsV+J3wjQP+t4onfukb8kWUkZC7gxJs88VCs3VGknXuRUo
 3aeHY/yc0zTI3edPXLOcD+reoRku4IUSNXISR1wngHcWBR06EsYYpGSvl0/1bwn3zNPR/AisdPh
 pUqX6A6BxDCD8n81hyUUwcUGShpmdFZYdUqRRPiLcL5hZNTk03HOJuURjnqpFwjLHbe21YMwnMc
 ZBlHTADf
X-Proofpoint-ORIG-GUID: Hnqyj2WwWNwcZhqQDOZiB1xLbvNNFYmN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 phishscore=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160039
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

On Mon, Aug 18, 2025 at 5:10=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qualcom=
m.com> wrote:
>
> On 8/13/2025 6:34 PM, Antonino Maniscalco wrote:
> > When a VM is marked as an usuable we disallow new submissions from it,
> > however submissions that where already scheduled on the ring would stil=
l
> > be re-sent.
> >
> > Since this can lead to further hangs, avoid emitting the actual IBs.
> >
> > Fixes: 6a4d287a1ae6 ("drm/msm: Mark VM as unusable on GPU hangs")
> > Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> > ---
> >  drivers/gpu/drm/msm/msm_gpu.c | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gp=
u.c
> > index c317b25a8162edba0d594f61427eac4440871b73..e6cd85c810bd2314c8bba53=
644a622464713b7f2 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu.c
> > +++ b/drivers/gpu/drm/msm/msm_gpu.c
> > @@ -553,8 +553,15 @@ static void recover_worker(struct kthread_work *wo=
rk)
> >                       unsigned long flags;
> >
> >                       spin_lock_irqsave(&ring->submit_lock, flags);
> > -                     list_for_each_entry(submit, &ring->submits, node)
> > +                     list_for_each_entry(submit, &ring->submits, node)=
 {
> > +                             /*
> > +                              * If the submit uses an unusable vm make=
 sure
> > +                              * we don't actually run it
> > +                              */
> > +                             if (to_msm_vm(submit->vm)->unusable)
> > +                                     submit->nr_cmds =3D 0;
>
> Just curious, why not just retire this submit here?

Because then you'd end up with submits retiring out of order (ie.
fences on the same timeline signaling out of order)

BR,
-R

> -Akhil
>
> >                               gpu->funcs->submit(gpu, submit);
> > +                     }
> >                       spin_unlock_irqrestore(&ring->submit_lock, flags)=
;
> >               }
> >       }
> >
> > ---
> > base-commit: 8290d37ad2b087bbcfe65fa5bcaf260e184b250a
> > change-id: 20250813-unusable_fix_b4-10bde6f3b756
> >
> > Best regards,
>
