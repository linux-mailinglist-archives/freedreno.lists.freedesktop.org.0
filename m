Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBDAB1B6F6
	for <lists+freedreno@lfdr.de>; Tue,  5 Aug 2025 16:59:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56FD910E27D;
	Tue,  5 Aug 2025 14:59:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="I8hVdAa9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2028310E6AA
 for <freedreno@lists.freedesktop.org>; Tue,  5 Aug 2025 14:59:41 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5758H8OG018951
 for <freedreno@lists.freedesktop.org>; Tue, 5 Aug 2025 14:59:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=5VP7v53va29cpzA7nUn1M5nUaw4K/K2gvLeC0gIRIqI=; b=I8
 hVdAa9vHymGy1m3iqE1rs/uXu0OxpGYo0/rAmvtRC4Q/PiSAZwvxA/qCJisjakNh
 e2DEkDS1CHYTABLl0zmGtlUxrpHB7v/ghPhYbiMGGXngaMUaw06Mo8SmOZ9rkrQf
 gFKl9fjcURWaeAcDWUyl5L0qS1IfxKZrmiEqDOmpZqeHw29W+DSqlFtjrLMJJWfS
 MoVALtRJcU55xSvftDaGkMbH3/vArzFMwvUiS9OcT9pzkW1I+lWW0FPh4qTPF3YA
 O8AScuGwREufjFmwMp4xLNnyXM8neUrewBTadujJJS5br7Ag5OeSzmeFosh0ksZe
 Owsr3HGl8OC29rOEmY6g==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ak5a5kbm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 05 Aug 2025 14:59:39 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id
 5614622812f47-4033c872b60so4548626b6e.2
 for <freedreno@lists.freedesktop.org>; Tue, 05 Aug 2025 07:59:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754405979; x=1755010779;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5VP7v53va29cpzA7nUn1M5nUaw4K/K2gvLeC0gIRIqI=;
 b=VbdoZK9RVKq8rTXf2ZPT70U9VnMMHwWf1AlAgc3jH8IERMMw/BTpfINlRAZ3vBMeze
 mn1CGb5juchOLLV236ONMYs8v/NHe72S+0ijELdVJK40ZC4dRZnbDIUwDUxPtftNfVz9
 e4hIzbI5bKHy7KTeUxbh7g424wRUqwLzGNBzlSD9Xpq4InbKI4nabmd0U4u5qrq69NpX
 VSftlWC37aq4TrrXh4UT50AzT4AjfJNa+FEXolX+UMGNQWRR2EwtvuV4tlN/+Dr4jor9
 FeHO/mbc4tIt4V2L/S+8xtXX9WxzWxDiHr2hEioLd5liO0EsPx6/3vrgF2VfTHtsLSSt
 Jtww==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzQUdTTbJ82ufOeziQGu7td0lVkAISiQjXRrKr+6KxjiWvmI7iYTIwPwUkuHJWYifpqHdERPHEtUc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBrREqSHcnKc3bn4GeVT7C/XEku/r5QrWqvhUsMEiFzrvXNN7M
 zaX+SUkklB5/+tzdYuBlRxqxxxYC7ZfHaQ7ieIFcd9lkEFrgaTtuU6kvxzxL141r7kFu3qu4el5
 x0bxD3H4Ga3NjZqOhbu9RFIy4gAn//Pz0C34SKRPB1npvgeoFTA0NmAbFeoQETyaqSwWtwqWciG
 m7qbwaH6Chlxw8+5yiay6LMNu7IWE6y/2aYrR2nJqWyZ5ZsA==
X-Gm-Gg: ASbGncs90lZWgiL7TWEINTrH+WHd4db4RU2F9V1pPO+fF5PeTMsdf6PQmvrN384gN6B
 yRHAO0HM0Lr4Xo9r/Y2OfbiK3jRYPgN5jJ7LTl04JNtNGJ/gUSqdZdmPgPg0+op9x6xwF7E7WTe
 7Lt3f2J774UtSWj1e5vZU1OetguvxABLNnixYYBfi5+QKoDqRfzt0p
X-Received: by 2002:a05:6808:124a:b0:401:e721:8b48 with SMTP id
 5614622812f47-433f020d6f7mr7919655b6e.8.1754405978916; 
 Tue, 05 Aug 2025 07:59:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+6ybutU9RtNNd8gKO1lElM7QyIOMCpne6QzqtryagfoJGG3ah1wcU/O0jC53ssU8ygi7M+t21QA06+nZ7Szo=
X-Received: by 2002:a05:6808:124a:b0:401:e721:8b48 with SMTP id
 5614622812f47-433f020d6f7mr7919636b6e.8.1754405978390; Tue, 05 Aug 2025
 07:59:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250804214317.658704-1-robin.clark@oss.qualcomm.com>
 <20250804214317.658704-2-robin.clark@oss.qualcomm.com>
 <DBUE2QU2CH9N.3C32KHT9LHMMB@kernel.org>
 <CACSVV0270Zk4ApR_pGZ+sKgoi14kvfOo_NvzVq3-QALE0mpFsQ@mail.gmail.com>
 <DBUKRNHY14ZN.95GVIGMY7RAN@kernel.org>
In-Reply-To: <DBUKRNHY14ZN.95GVIGMY7RAN@kernel.org>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 5 Aug 2025 07:59:27 -0700
X-Gm-Features: Ac12FXyia9P5tgbRPxVXrZTiL6VK4xUgl9aLrubrFFRerh-QJyYy5THAuzSUSx8
Message-ID: <CACSVV01zZ=o55YY=GHTKaJY1HorRUu73KA+5Puz2MonqH7JwuQ@mail.gmail.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDEwOCBTYWx0ZWRfX6WRNemxGnCJw
 RijkqI0T1RBkkdEpTKgAVc08kf6GSpGuOWrShuBw4xZpOzuld2a495z1GnIS7kGMDImO+9GyGzY
 HrzNUdeyGMockYFXCIq+YM/SLg3D6MDkMG8AAxSrYC165Y+myJknKRJOQYv80aakroz7aDLkPPF
 iPearhNu3G/HEzWXQelyZtnb2QObuchhFEpL2U+5G3dgT8IvTNIbAWkwa+3FmQsVFkeh0sX76E1
 437cYQni6Sg099WgSSbTPNrVR37VSg97bUhTi7UyCIWMoBlny0dMJ9n+C3x9Rq1HVv9ozGpWoIs
 eBrVjqLnQf5H/eD/nTg4x5vFHWIFHlNpBUWKFVvxFCH75qk8QOqqviWWMZnwvlwubSj+OzOx7cH
 dZIswpSFWjuPMvHjbt4UndEIrYI8za5xv1IR+C8tsHWHXnW3UU3bhYuOFtDIos/eMO3dW8c3
X-Proofpoint-GUID: PD29-iSIP5NfjiaBG2I5ZZfJ_UmsqqFk
X-Authority-Analysis: v=2.4 cv=LP1mQIW9 c=1 sm=1 tr=0 ts=68921c5c cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=VwQbUJbxAAAA:8 a=gugPwdCod9cupdveROQA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-ORIG-GUID: PD29-iSIP5NfjiaBG2I5ZZfJ_UmsqqFk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_04,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 spamscore=0 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508050108
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

On Tue, Aug 5, 2025 at 7:48=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Tue Aug 5, 2025 at 4:32 PM CEST, Rob Clark wrote:
> > On Tue, Aug 5, 2025 at 2:33=E2=80=AFAM Danilo Krummrich <dakr@kernel.or=
g> wrote:
> >> On Mon Aug 4, 2025 at 11:43 PM CEST, Rob Clark wrote:
> >> > diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm=
.c
> >> > index bbc7fecb6f4a..e21782a97fbe 100644
> >> > --- a/drivers/gpu/drm/drm_gpuvm.c
> >> > +++ b/drivers/gpu/drm/drm_gpuvm.c
> >> > @@ -2125,6 +2125,27 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
> >> >                                offset =3D=3D req_offset;
> >> >
> >> >                       if (end =3D=3D req_end) {
> >> > +                             if (merge) {
> >> > +                                     /*
> >> > +                                      * This is an exact remap of t=
he existing
> >> > +                                      * VA (potentially flags chang=
e)?  Pass
> >> > +                                      * this to the driver as a rem=
ap so it can
> >> > +                                      * do an in-place update:
> >> > +                                      */
> >> > +                                     struct drm_gpuva_op_map n =3D =
{
> >> > +                                             .va.addr =3D va->va.ad=
dr,
> >> > +                                             .va.range =3D va->va.r=
ange,
> >> > +                                             .gem.obj =3D va->gem.o=
bj,
> >> > +                                             .gem.offset =3D va->ge=
m.offset,
> >> > +                                     };
> >> > +                                     struct drm_gpuva_op_unmap u =
=3D {
> >> > +                                             .va =3D va,
> >> > +                                             .keep =3D true,
> >> > +                                     };
> >> > +
> >> > +                                     return op_remap_cb(ops, priv, =
NULL, &n, &u);
> >> > +                             }
> >>
> >> I don't see why this is necessary, a struct drm_gpuva_op_unmap carries=
 the
> >> struct drm_gpuva to unmap. You can easily compare this to the original=
 request
> >> you gave to GPUVM, i.e. req_addr, req_range, req_obj, req_offset, etc.
> >>
> >> Which is what you have to do for any other unmap operation that has ke=
ep =3D=3D true
> >> anyways, e.g. if D is the exact same as A, B and C.
> >>
> >>         Cur
> >>         ---
> >>         1                       N
> >>         |---A---|---B---|---C---|
> >>
> >>         Req
> >>         ---
> >>         1                       N
> >>         |-----------D-----------|
> >
> > Ugg, this means carrying around more state between the unmap and map
> > callbacks, vs. just handing all the data to the driver in a single
> > callback.  For the keep=3D=3Dtrue case, nouveau just seems to skip the
> > unmap.. I guess in your case the map operation is tolerant of
> > overwriting existing mappings so this works out, which isn't the case
> > with io_pgtable.
>
> There is no "your case" as far as I'm concerned. Please don't think that =
I don't
> care about solving a problem, just because it's not relevant for any of t=
he
> drivers or subsystems I maintain. :)

Sorry, I didn't mean to imply that.. I was just trying to point out a
constraint that you might not be aware of :-)

> > I guess I could handle the specific case of an exact in-place remap in
> > the driver to handle this specific case.  But the example you give
> > with multiple mappings would be harder to cope with.
> >
> > I still feel there is some room for improvement in gpuvm to make this
> > easier for drivers.  Maybe what I proposed isn't the best general
> > solution, but somehow giving the drivers info about both the unmaps
> > and maps in the same callback would make things easier (and the remap
> > callback is _almost_ that).
>
> I generally agree with that, my concern is more about this specific patch=
.
>
> There are patches on the list that replace all the req_* arguments of
> __drm_gpuvm_sm_map() with a new struct drm_gpuvm_map_req.
>
> Maybe the unmap callbacks could simply provide a pointer to this object?

I think that would help.. I'd probably want some additional
information about overlapping 'keep' unmaps in the map callback as
well, or at least the range of the 'keep' unmaps so the map callback
knows that part of the new va is already mapped. But this seems
doable.

BR,
-R

> > BR,
> > -R
> >
> >>
> >> In this case you get three unmap ops with keep =3D=3D true, which you =
can compare to
> >> your request to figure out that you can keep the corresponding PTEs.
> >>
> >> Besides that it changes the semantics that the documentation mentions =
and that
> >> drivers are allowed to rely on, i.e. a struct drm_gpuva_op_remap repre=
sents
> >> an actual change and any call to __drm_gpuvm_sm_map() results in an ar=
bitrary
> >> number of unmap ops, a maximum of two remap ops and exactly one map op=
eration.
> >>
> >> >                               ret =3D op_unmap_cb(ops, priv, va, mer=
ge);
> >> >                               if (ret)
> >> >                                       return ret;
>
