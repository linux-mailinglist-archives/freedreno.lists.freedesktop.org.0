Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2987BAFA5A9
	for <lists+freedreno@lfdr.de>; Sun,  6 Jul 2025 16:02:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1E6F10E029;
	Sun,  6 Jul 2025 14:02:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qnqpt6A+";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAE9210E292
 for <freedreno@lists.freedesktop.org>; Sun,  6 Jul 2025 14:02:37 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566Cba7I012511
 for <freedreno@lists.freedesktop.org>; Sun, 6 Jul 2025 14:02:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Wxj7HqGGrZODqPROvMBKCjS0gz/MMI/Glo0w6GOHDno=; b=Qnqpt6A+0IMlzv5p
 sY5qHSU3K/Nj/C67SrSQ68qU63NIqgZhpXl5RC4gIM+T2p7ymfz7zXSIqx8JAfy9
 703ZFaioXNeei1MqTXja6/yCEk66cR5Y8yZs4G9U7D91MPAp6MYMwueqzTW5xDEZ
 VembucwALeGx822r46pPDOKISkP9GSK/6LQkKMQjkm/VF3/C3AAJ1DrSLEjdC/aL
 Sga+Ur+JJHCqoibTmuTqg1Idw3usA8oUjIbesPRtozwM8anZmB7itlwS5vNjeJE2
 qAOvWJcpRG8i8ZkTwtYq9U+lmkRcuzJKOB5JbQNfcHZcPt0WmUtrZB1ncIGTNmDT
 ulw11A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pv974e36-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 06 Jul 2025 14:02:37 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-311a6b43ed7so1847300a91.1
 for <freedreno@lists.freedesktop.org>; Sun, 06 Jul 2025 07:02:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751810556; x=1752415356;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wxj7HqGGrZODqPROvMBKCjS0gz/MMI/Glo0w6GOHDno=;
 b=LuB0oo7vt2pLnBOYNBdoLzloqGrydEUbcBwEk8wrjSQtTHUSOIJdho6rCjY8ORpk+r
 PQKg5DnN6frY5f1LUdT54p2gnzU9SFoTGv3OdzzcR/gdGwp41Hy7CeNBBcLybhg5BoDq
 xtxD1auOnEMpj6AvMnCmjwpa0iSo4NN0Na8M7NDCMRH+vBGKFUjMmJ6lUiKSCnDktDHr
 QOgmBpyXgySdEGNjmHzFRwG/oaBRLSznodntsdRZPAOAKXsVsYw0c3g5+dqZVSkHHbqu
 iZXNrhFdm90Pv7/vajBHu2/b6vHNqhqGf5049BQpDzTHECAj5NzV3sHiVPqM1JMI5mKV
 NCWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEKDkexS5XXoUqMek06wyOt5VvuJn1nuHQP71x44tKVlwlF+s3vF77bKZ9deobRhk5PKDcZdf6EGo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxba8huGP6f4xaCTBu5FcN2dM8ByfToJ9OUhpXrsQKEPeg+7bYZ
 9ODfnWC2aa+AP+vPOiya5U4N9t6vekEPJBSOW/sfoFpBpoHB7gyw7cKLq8vjw7lOwPgnNT0s3P0
 jMAMqq54sO2UOITmd4LZ5QZSCSotZ3JFABtRQ8kx2ajLkQnYBfYf+FiTBXIknvPiHIcL7pt3wUA
 GYEJmsu89UcieEo1bJWnb4tDOymWBPqc+9/iwOVfUTZXD6zA==
X-Gm-Gg: ASbGncu/uEy/GgFW+xNBZ8hYnXX22IzfxvCwGsp/ulOyb8tu9H9Xbn9CKi6GAPE+BkN
 395dBy0RcyFcn6MfyS+2hhIP1Th4V5hc6YhrMyf2KY39DBcJ1+fqJtGiHp4RYzBlqXddvD64wYN
 8Ju5WdNau/H3bbUEQP2g==
X-Received: by 2002:a17:90b:28c3:b0:311:f05b:869b with SMTP id
 98e67ed59e1d1-31aaddc53famr12497031a91.30.1751810556268; 
 Sun, 06 Jul 2025 07:02:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfcxb3whsTrEP9JFBXZUEILpaINN46Ri6Rk09CCIfQf9eys+yq5fHc4CQx3OZduLcJw1kfjr5yhBJgxFZDRtI=
X-Received: by 2002:a17:90b:28c3:b0:311:f05b:869b with SMTP id
 98e67ed59e1d1-31aaddc53famr12496960a91.30.1751810555650; Sun, 06 Jul 2025
 07:02:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250706-msm-no-iommu-v1-0-9e8274b30c33@oss.qualcomm.com>
 <20250706-msm-no-iommu-v1-3-9e8274b30c33@oss.qualcomm.com>
 <CACSVV00Cdwjhta+ozoQAy0QQ81LM8Skf8RcnFGKscbc03xBA=w@mail.gmail.com>
In-Reply-To: <CACSVV00Cdwjhta+ozoQAy0QQ81LM8Skf8RcnFGKscbc03xBA=w@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 6 Jul 2025 17:02:24 +0300
X-Gm-Features: Ac12FXyooe1pNll4vWeSnZkXQveBQYBb4dYUg2ydMWu4a9IUk0GIhGseVDKlY6A
Message-ID: <CAO9ioeV47NAo=j=QHdZPSZT_f31jTT=cFSN=EjihboTr4Pmzkw@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/msm/mdp4: use msm_kms_init_vm() instead of
 duplicating it
To: rob.clark@oss.qualcomm.com
Cc: Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=FrUF/3rq c=1 sm=1 tr=0 ts=686a81fd cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=r4SaECpLYQUvehMX0aYA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDA4OSBTYWx0ZWRfXyL4P9AZvQJZV
 RzT65Jk9JU0c+dH6JR0ycIcihd5wB68LwhR5wtfsuvVVQkErFHgrQmt1Q1i7MPBZSf3Ji625zG3
 Bx/JNm8L21qFCD7XbhsmjOsj6Lka/hJ4tZWdufQOwGpxsCxf+TmEyKiG7mCrCWO3oSd/AgTSTh4
 UnJHTpZMeHY3sVHzRaOZ3O6Jv36DAjAElWI7qaA6HBYGpY3VY7iHdtM2dF64awpxIhc84HeedR2
 3YlGdxJABXKUijb9g7606IKpMVsHD/L3m6jTExGojuLiBH7NCx2GjFNKODHuRSVYXtCFM0OdW7j
 BSc/iNC9D8C/QUW1cXJwbs55Rnrr4sHCRCwgbBv2p+jrF0kDkDka/DocAFAFjc69ueDiU7qQMYm
 q9DOre0GHwh+ffOwPDQElU7Py9YVxnz6Krtd9K8/17Lm9IdTu0+0kGvplFTsPqZWvWmUr7Ux
X-Proofpoint-GUID: FcEJIPIco52D2BaePZP_B9On_XpLkMZi
X-Proofpoint-ORIG-GUID: FcEJIPIco52D2BaePZP_B9On_XpLkMZi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 mlxscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 mlxlogscore=926 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507060089
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

On Sun, 6 Jul 2025 at 16:11, Rob Clark <rob.clark@oss.qualcomm.com> wrote:
>
> On Sun, Jul 6, 2025 at 3:50=E2=80=AFAM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > Use the msm_kms_init_vm() function to allocate memory manager instead o=
f
> > hand-coding a copy of it. Although MDP4 platforms don't have MDSS
> > device, it's still safe to use the function as all MDP4 devices have
> > IOMMU and the parent of the MDP4 is the root SoC device.
>
> So, originally the distinction was that mdp4 didn't have the mdss
> wrapper.  Maybe it works out because device_iommu_mapped(mdp_dev)
> returns true?

Yes, as expressed in the cover letter.

>
> BR,
> -R
>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 27 +++++-------------------=
---
> >  1 file changed, 5 insertions(+), 22 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm=
/msm/disp/mdp4/mdp4_kms.c
> > index 88296c41d1a5eb0e16cb6ec4d0475000b6318c4e..41d236d30e71ebb6ac8a590=
52529f36fadf15cd7 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> > +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> > @@ -391,11 +391,9 @@ static void read_mdp_hw_revision(struct mdp4_kms *=
mdp4_kms,
> >
> >  static int mdp4_kms_init(struct drm_device *dev)
> >  {
> > -       struct platform_device *pdev =3D to_platform_device(dev->dev);
> >         struct msm_drm_private *priv =3D dev->dev_private;
> >         struct mdp4_kms *mdp4_kms =3D to_mdp4_kms(to_mdp_kms(priv->kms)=
);
> >         struct msm_kms *kms =3D NULL;
> > -       struct msm_mmu *mmu;
> >         struct drm_gpuvm *vm;
> >         int ret;
> >         u32 major, minor;
> > @@ -458,29 +456,14 @@ static int mdp4_kms_init(struct drm_device *dev)
> >         mdp4_disable(mdp4_kms);
> >         mdelay(16);
> >
> > -       mmu =3D msm_iommu_new(&pdev->dev, 0);
> > -       if (IS_ERR(mmu)) {
> > -               ret =3D PTR_ERR(mmu);
> > +       vm =3D msm_kms_init_vm(mdp4_kms->dev);
> > +       if (IS_ERR(vm)) {
> > +               ret =3D PTR_ERR(vm);
> >                 goto fail;
> > -       } else if (!mmu) {
> > -               DRM_DEV_INFO(dev->dev, "no IOMMU configuration is no lo=
nger supported\n");
> > -               ret =3D -ENODEV;
> > -               goto fail;
> > -       } else {
> > -               vm  =3D msm_gem_vm_create(dev, mmu, "mdp4",
> > -                                       0x1000, 0x100000000 - 0x1000,
> > -                                       true);
> > -
> > -               if (IS_ERR(vm)) {
> > -                       if (!IS_ERR(mmu))
> > -                               mmu->funcs->destroy(mmu);
> > -                       ret =3D PTR_ERR(vm);
> > -                       goto fail;
> > -               }
> > -
> > -               kms->vm =3D vm;
> >         }
> >
> > +       kms->vm =3D vm;
> > +
> >         ret =3D modeset_init(mdp4_kms);
> >         if (ret) {
> >                 DRM_DEV_ERROR(dev->dev, "modeset_init failed: %d\n", re=
t);
> >
> > --
> > 2.39.5
> >



--=20
With best wishes
Dmitry
