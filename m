Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1C3B1B698
	for <lists+freedreno@lfdr.de>; Tue,  5 Aug 2025 16:33:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 067C910E478;
	Tue,  5 Aug 2025 14:33:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kwAWZaWk";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D971B10E47B
 for <freedreno@lists.freedesktop.org>; Tue,  5 Aug 2025 14:32:58 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 575DWHjW020898
 for <freedreno@lists.freedesktop.org>; Tue, 5 Aug 2025 14:32:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=dcfbSdm9Ee7XiCvbdE06SqCLz4R1Y5fBAtNbrpESQsg=; b=kw
 AWZaWkierTuS1AXQ2oj4nv289QBcA0GQMngyrYHc81/b77giiMnAX+R/KpPBHdqK
 JWsAu89I3haARHRFsV3uE1oN2sihg2B14r6uNeVwNczAQ86FCWUjKRpR+iWa33Qq
 IUNoJfrzTSFUHPZEQyF1r4c9HwMAn6JopfniGNwqHu2l5d7SqGQ71tHqwNTy/IJ6
 vvmD9mkKT1fbfFv2QYgTybkdOysUfSIWlodEyoYOitz0MXmrqqTYId7EfXqcDLPT
 Fl6+Lva69KtnX9znbjEAyEK+GkxEFjUSvN0T00mViWL1bkSW41U7DMsj0jULJlGQ
 NvraCNVkSvRKh0X2Vw2Q==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48981rry5p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 05 Aug 2025 14:32:57 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id
 006d021491bc7-61994f6be55so378152eaf.2
 for <freedreno@lists.freedesktop.org>; Tue, 05 Aug 2025 07:32:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754404377; x=1755009177;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dcfbSdm9Ee7XiCvbdE06SqCLz4R1Y5fBAtNbrpESQsg=;
 b=gNuVO4o/YF2yCjyTvoCIGveZS7mzrvmL9UF2DSpe0inLOILaPCoa+WqQrwDjXkFFnE
 7jFXKzIFiVL3SexpIHPLjqChwPKY+uqnH/yb0atvXA7VtwtpjTTUrGHx9ajKk/LCGBrW
 qqUf0UI69pW8939RwhhrpE7xUeTeebvUyjSp9ZdwuIuf1mWxMkA5QgnXeAVYlFFjJiKT
 +TeUfAws1J4GJaRgnwWAI4FoNCRI0Rt1I1OcGf/sggCLlAeftgDsuQfpXOCKS1DVe4b4
 OVnLATF6MvocY2MRG0JJnTIiBsr/7nRpWwFwU1/fRnGw1jaxgp9BDf+U1rl1FER3WhgL
 VY2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVekwyxMzNbtLrlw77Dnkh/XY0v881bVEVmQ3tSW2/IdL6FSz7jUPd5P/Sc3vUweda/8PWDQp/xqBA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YygZkOMqB96uJV3THBRI2mqSUWCH9Tzk4AoX0LRq7osyMbIUhjj
 Ra97Th42S5T4gZu/5pi8RsSfWAjdtIHCxq85kDb/M6UqmW4wRF4rbNuMBSpJgZ1FUgTwmsj4npy
 UO8QT5OUaJhMd2flKfePFgM8vDu+dJ980jPSf8TkqAD7v76nUatiqwcTnVeZMdQO+7D5dnxuunH
 ohSqNiMjIn4SrUnuIPf2MPlLK5IeIyNFvQOh8DptqyFYu72w==
X-Gm-Gg: ASbGncvbcSJlTP+oAgBmFDPb/P5eUG2uDKZJsw7aPXwvExoLfeiRoWy87Cqk5F/QWFP
 M5LzhZgnpHv5PyaTw1DtBpFYS2Iv6mEIXCsHsBvoknUR6Jyaon5d6skXJcu8zWs8PVb4PJhK+JU
 IXR0FPSrDoFS6/k2vCPefyjF3rD+YBZaeFP307bTzXSrQz6kzAy6Kk
X-Received: by 2002:a05:6820:1785:b0:615:9c11:a072 with SMTP id
 006d021491bc7-6198f2b7469mr6807606eaf.8.1754404376719; 
 Tue, 05 Aug 2025 07:32:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgTHzGv7bbHmoZCYxU0MwfB7R6TpKmYB3jhbd70O5XW2GBJ9V6PQaJ1C7650u9P3ThXFLr3niaQ6AHhJ7ErjM=
X-Received: by 2002:a05:6820:1785:b0:615:9c11:a072 with SMTP id
 006d021491bc7-6198f2b7469mr6807569eaf.8.1754404376188; Tue, 05 Aug 2025
 07:32:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250804214317.658704-1-robin.clark@oss.qualcomm.com>
 <20250804214317.658704-2-robin.clark@oss.qualcomm.com>
 <DBUE2QU2CH9N.3C32KHT9LHMMB@kernel.org>
In-Reply-To: <DBUE2QU2CH9N.3C32KHT9LHMMB@kernel.org>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 5 Aug 2025 07:32:45 -0700
X-Gm-Features: Ac12FXypilQQiU00lSypaqGZbf1ZEMtpPC_1-gRbyH_0q2bmoCLhUbqnnH9WbwE
Message-ID: <CACSVV0270Zk4ApR_pGZ+sKgoi14kvfOo_NvzVq3-QALE0mpFsQ@mail.gmail.com>
Subject: Re: [PATCH RESEND 1/2] drm/gpuvm: Send in-place re-maps to the driver
 as remap
To: Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, Danilo Krummrich <dakr@redhat.com>,
 Connor Abbott <cwabbott0@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Lyude Paul <lyude@redhat.com>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: e6or4WIioabZR48rvIYydLlRucX9dOj5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDEwNSBTYWx0ZWRfX7JuVyFMoirOq
 PRKAcYatomURoS9DjyxwryEdckD2p29OoaYwPLDfsXFErbFP1xXu/3wS9BRbJhNQEr+fwXUlKHi
 Rxd89rBBriKTvGQ1or+Je964PpDnmoqAAro2DIfLF1hHIEkar98e2hvOZ8Mo9+7LPrS8jreJr7b
 Hv0iyVrQrX6r6+X+vDI4jCByw6cxlEzelhaQ94wut4edshMhdRhrHTb6OrzBG5hU2BlgXLd1+5u
 uKTBCO32+/0HdjNRgx8un6bJqhe7kpOWvZxg2fk3vH5aTf2arWdq167UofttMHTkNJqKyT7rH8z
 ne4aU1oGcGXWpJxO8CX0C6qFc0e94m0BS62uADMgUPizA0/i9GRTq11j6Ut18h9jE9llLNrzGhi
 Aw24Q1D2oo10YIlgk+l3OEE47CdK99z1+ymTWPVlQz6WQA8Lg6MtNRrwrvFFtrvQHvityAy3
X-Proofpoint-GUID: e6or4WIioabZR48rvIYydLlRucX9dOj5
X-Authority-Analysis: v=2.4 cv=a8Mw9VSF c=1 sm=1 tr=0 ts=68921619 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3qJefBXy7TsPhfuKpUwA:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508050105
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

On Tue, Aug 5, 2025 at 2:33=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> (Cc: Thomas, Boris, Matt, Alice)
>
> On Mon Aug 4, 2025 at 11:43 PM CEST, Rob Clark wrote:
> > The 'keep' hint on the unmap is only half useful, without being able to
> > link it to a map cb.  Instead combine the two ops into a remap op to
> > give the driver a chance to figure things out.
> >
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/drm_gpuvm.c            | 21 +++++++++++++++++++++
> >  drivers/gpu/drm/nouveau/nouveau_uvmm.c |  3 ++-
> >  2 files changed, 23 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> > index bbc7fecb6f4a..e21782a97fbe 100644
> > --- a/drivers/gpu/drm/drm_gpuvm.c
> > +++ b/drivers/gpu/drm/drm_gpuvm.c
> > @@ -2125,6 +2125,27 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
> >                                offset =3D=3D req_offset;
> >
> >                       if (end =3D=3D req_end) {
> > +                             if (merge) {
> > +                                     /*
> > +                                      * This is an exact remap of the =
existing
> > +                                      * VA (potentially flags change)?=
  Pass
> > +                                      * this to the driver as a remap =
so it can
> > +                                      * do an in-place update:
> > +                                      */
> > +                                     struct drm_gpuva_op_map n =3D {
> > +                                             .va.addr =3D va->va.addr,
> > +                                             .va.range =3D va->va.rang=
e,
> > +                                             .gem.obj =3D va->gem.obj,
> > +                                             .gem.offset =3D va->gem.o=
ffset,
> > +                                     };
> > +                                     struct drm_gpuva_op_unmap u =3D {
> > +                                             .va =3D va,
> > +                                             .keep =3D true,
> > +                                     };
> > +
> > +                                     return op_remap_cb(ops, priv, NUL=
L, &n, &u);
> > +                             }
>
> I don't see why this is necessary, a struct drm_gpuva_op_unmap carries th=
e
> struct drm_gpuva to unmap. You can easily compare this to the original re=
quest
> you gave to GPUVM, i.e. req_addr, req_range, req_obj, req_offset, etc.
>
> Which is what you have to do for any other unmap operation that has keep =
=3D=3D true
> anyways, e.g. if D is the exact same as A, B and C.
>
>         Cur
>         ---
>         1                       N
>         |---A---|---B---|---C---|
>
>         Req
>         ---
>         1                       N
>         |-----------D-----------|

Ugg, this means carrying around more state between the unmap and map
callbacks, vs. just handing all the data to the driver in a single
callback.  For the keep=3D=3Dtrue case, nouveau just seems to skip the
unmap.. I guess in your case the map operation is tolerant of
overwriting existing mappings so this works out, which isn't the case
with io_pgtable.

I guess I could handle the specific case of an exact in-place remap in
the driver to handle this specific case.  But the example you give
with multiple mappings would be harder to cope with.

I still feel there is some room for improvement in gpuvm to make this
easier for drivers.  Maybe what I proposed isn't the best general
solution, but somehow giving the drivers info about both the unmaps
and maps in the same callback would make things easier (and the remap
callback is _almost_ that).

BR,
-R

>
> In this case you get three unmap ops with keep =3D=3D true, which you can=
 compare to
> your request to figure out that you can keep the corresponding PTEs.
>
> Besides that it changes the semantics that the documentation mentions and=
 that
> drivers are allowed to rely on, i.e. a struct drm_gpuva_op_remap represen=
ts
> an actual change and any call to __drm_gpuvm_sm_map() results in an arbit=
rary
> number of unmap ops, a maximum of two remap ops and exactly one map opera=
tion.
>
> >                               ret =3D op_unmap_cb(ops, priv, va, merge)=
;
> >                               if (ret)
> >                                       return ret;
