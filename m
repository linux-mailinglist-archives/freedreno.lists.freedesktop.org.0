Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D3FAFA616
	for <lists+freedreno@lfdr.de>; Sun,  6 Jul 2025 17:11:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A07510E29C;
	Sun,  6 Jul 2025 15:11:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KleaMkK9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C891510E2B1
 for <freedreno@lists.freedesktop.org>; Sun,  6 Jul 2025 15:11:18 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566CLJiV004748
 for <freedreno@lists.freedesktop.org>; Sun, 6 Jul 2025 15:11:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=deOGb66htBHQke4mAZ1lh4AWcMp6dCPlP5Iwn3G7D+E=; b=Kl
 eaMkK9gP9gNKG5XeBj9jBgcBp7vENfmcsh0/TCHTmmdbaXEeDcTbiUI6qblYfgwT
 NeXqP5alMjTm2/J6W5GC+1UQP+rLsza5wO+4w5vOR4icdopGWfT9cxgUkwE2Ag7j
 dWWk1qfaS9yJ644gqYQ6ua8L6xy9ByARWBS8P8nrJAdNq2tlbJNwzQd90ieDnY/U
 8EdJ9BZUx6IsGZyUf987cN/v6z1ON4/iNrfpR3j5BqZLo15mC7HA/5cLAqcoYnX4
 JVVacZWyKtuy20VWSGESwN1mXY7CrT28lSVYFVSzIubUGxVwdNlv9ZddNR8bl5KV
 BK3fPxj2AWM+488DZB8g==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pv4xd1xc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 06 Jul 2025 15:11:17 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id
 5614622812f47-40abfc09f67so565707b6e.3
 for <freedreno@lists.freedesktop.org>; Sun, 06 Jul 2025 08:11:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751814677; x=1752419477;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=deOGb66htBHQke4mAZ1lh4AWcMp6dCPlP5Iwn3G7D+E=;
 b=NO7jilaBsD9gA7hMa59hdUD7Y5d4J3VsfLvv7/Xj8jXLgD/F37qMqE97lr+nvlhSF/
 F+mYxCjFqcSaWKsnFKX5kcmxwvIhZ7r3rjvMnJBjEWdJ/IUUtL6blsgLX58Qq10CVdK6
 GkmHI2YUTVwYYIt8Qdh7lkoq+kORLKLgmfLLR5pN7eyqw72M2c1jSRESkZBu2y9qzqRn
 gxLewpqqqlfTs/P1Yj1QOzjMetHkfMRbkgP4MuW+8bh+n1LbHTFY6e4xoqN+sey5k33/
 +y1ii99r7vHNR5dvKaPxyegj1uruA856+fl6Sl88gvwF+4XTyvsScH7bvPDoJKeQJeQw
 z1FQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOoxoTY93q1xWzNKyJUldt8OdoO+hjpKamYaEepewKhEz+V7HYVTIldG9B2URIzn7kLgrGwqgaSUM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJ/Cyqpc0EHlrJYemurSBC/vSCKWWCZl4HSb1YKIEcabNVN8hi
 9flFxttXCvQwls+eQ4xq3XTrPKhff/3sDO9OkEQvv6TxHZeGWXs8+m0EIpZEBaH6He3mVAoijM4
 LMYKY7xcLW+SgopJJMIhLywWvkC9Z9482nsfEbHEvkKb107VzcSOOI+oajxN57cDQtyt+ygLxj0
 IWmdBnXrRv3s0jOBlcdlRy76Irhsh5xoj5TTnTtv8udM5/vg==
X-Gm-Gg: ASbGnctGf3aIHsCUXwEr/Bijsja8+B0b/R+/IkEQTFuEmHcU9TTAkoVrNbKvlKO0q+/
 bZvF6QCFJF2xWGc9GbzCBtebYPmH23J7u5GaXCHhkAS5Z46kAll2TPdxB5D/ihpklu4mokIby1s
 T4VnxIXMSWQZKuuXhcvOQb6fxT0NG3jWFRnNU=
X-Received: by 2002:a05:6808:4fde:b0:3f4:1c2:874a with SMTP id
 5614622812f47-40d2cf2d360mr3898516b6e.24.1751814676756; 
 Sun, 06 Jul 2025 08:11:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCvcckgznjdGp/NHPpmur+SYkh7MSUDwzMDpYV3OdsMstVz6vnUJ6ymJyEyW6a8CETCNZtwOf5LWMCyVbpVT0=
X-Received: by 2002:a05:6808:4fde:b0:3f4:1c2:874a with SMTP id
 5614622812f47-40d2cf2d360mr3898492b6e.24.1751814676366; Sun, 06 Jul 2025
 08:11:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250706-msm-no-iommu-v1-0-9e8274b30c33@oss.qualcomm.com>
 <20250706-msm-no-iommu-v1-3-9e8274b30c33@oss.qualcomm.com>
 <CACSVV00Cdwjhta+ozoQAy0QQ81LM8Skf8RcnFGKscbc03xBA=w@mail.gmail.com>
 <CAO9ioeV47NAo=j=QHdZPSZT_f31jTT=cFSN=EjihboTr4Pmzkw@mail.gmail.com>
In-Reply-To: <CAO9ioeV47NAo=j=QHdZPSZT_f31jTT=cFSN=EjihboTr4Pmzkw@mail.gmail.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sun, 6 Jul 2025 08:11:05 -0700
X-Gm-Features: Ac12FXwWOIs0xq3UqgUHa5M8SliZdTa3qi5qoPVNxk89mJts5QGe6lLAnY2HFko
Message-ID: <CACSVV01QLz40_sU4-jD6EHpnZ8ECRgxqQTaRjNdtRtgrDbAMCA@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/msm/mdp4: use msm_kms_init_vm() instead of
 duplicating it
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDA5NyBTYWx0ZWRfX0Lf9w+r/LTLT
 eVKQlHV8u6ujYxWS0UtLr0dV4fHOVdiMLYL/euov30FBUjfzYQ9oW+NXCI/FzhNX81R+Ra1jwFh
 xCrpnykAXnFoRIciU0qjNyVVCJ2jrHJMEvh3XHx0jlFOhGFH0QYgKfboYvIPA6dXPt8eYBu5YQ8
 tR6bLZJvLsp7H2z62l+lBYbM5IFVWDiEBADykbXplII/CIFxuQrFi3fGhNXqIe4nl0RVsjSkag7
 SldL/M3Oi21m2UblOKav6+GRHF8p1jbK/080Dk41vkHaq7iZMHm87H/nxXIsx8TO4Htg748v705
 Ns2cB5o6l29pBADnS0UV1Y/8G6tSOX4Af67PoIA0oP12JkT7SM05O09EShBz/mzCrm5tLl9zjo8
 WYMv3nJb2t2wwQycQ58BBJhLLDi46aiH9swzYID2yc3I2tsExaIe1srYVPtLHX0TP7ypQ6ia
X-Proofpoint-ORIG-GUID: ttBCUQm0tMDYJODTereuugBKZFQAZbxU
X-Authority-Analysis: v=2.4 cv=DNCP4zNb c=1 sm=1 tr=0 ts=686a9215 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=q-jfb1koqDsd5eNGIpgA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-GUID: ttBCUQm0tMDYJODTereuugBKZFQAZbxU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 malwarescore=0 mlxlogscore=966 mlxscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507060097
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

On Sun, Jul 6, 2025 at 7:02=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sun, 6 Jul 2025 at 16:11, Rob Clark <rob.clark@oss.qualcomm.com> wrote=
:
> >
> > On Sun, Jul 6, 2025 at 3:50=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > Use the msm_kms_init_vm() function to allocate memory manager instead=
 of
> > > hand-coding a copy of it. Although MDP4 platforms don't have MDSS
> > > device, it's still safe to use the function as all MDP4 devices have
> > > IOMMU and the parent of the MDP4 is the root SoC device.
> >
> > So, originally the distinction was that mdp4 didn't have the mdss
> > wrapper.  Maybe it works out because device_iommu_mapped(mdp_dev)
> > returns true?
>
> Yes, as expressed in the cover letter.

Right, but with this patch, I think nothing is enforcing that, so we
could end up dereferencing mdp_dev->parent if the device did not have
an iommu.

I guess you could solve that with an extra device_iommu_mapped() in
mdp4_kms_init()

BR,
-R

> >
> > BR,
> > -R
> >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > ---
> > >  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 27 +++++-----------------=
-----
> > >  1 file changed, 5 insertions(+), 22 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/d=
rm/msm/disp/mdp4/mdp4_kms.c
> > > index 88296c41d1a5eb0e16cb6ec4d0475000b6318c4e..41d236d30e71ebb6ac8a5=
9052529f36fadf15cd7 100644
> > > --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> > > +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> > > @@ -391,11 +391,9 @@ static void read_mdp_hw_revision(struct mdp4_kms=
 *mdp4_kms,
> > >
> > >  static int mdp4_kms_init(struct drm_device *dev)
> > >  {
> > > -       struct platform_device *pdev =3D to_platform_device(dev->dev)=
;
> > >         struct msm_drm_private *priv =3D dev->dev_private;
> > >         struct mdp4_kms *mdp4_kms =3D to_mdp4_kms(to_mdp_kms(priv->km=
s));
> > >         struct msm_kms *kms =3D NULL;
> > > -       struct msm_mmu *mmu;
> > >         struct drm_gpuvm *vm;
> > >         int ret;
> > >         u32 major, minor;
> > > @@ -458,29 +456,14 @@ static int mdp4_kms_init(struct drm_device *dev=
)
> > >         mdp4_disable(mdp4_kms);
> > >         mdelay(16);
> > >
> > > -       mmu =3D msm_iommu_new(&pdev->dev, 0);
> > > -       if (IS_ERR(mmu)) {
> > > -               ret =3D PTR_ERR(mmu);
> > > +       vm =3D msm_kms_init_vm(mdp4_kms->dev);
> > > +       if (IS_ERR(vm)) {
> > > +               ret =3D PTR_ERR(vm);
> > >                 goto fail;
> > > -       } else if (!mmu) {
> > > -               DRM_DEV_INFO(dev->dev, "no IOMMU configuration is no =
longer supported\n");
> > > -               ret =3D -ENODEV;
> > > -               goto fail;
> > > -       } else {
> > > -               vm  =3D msm_gem_vm_create(dev, mmu, "mdp4",
> > > -                                       0x1000, 0x100000000 - 0x1000,
> > > -                                       true);
> > > -
> > > -               if (IS_ERR(vm)) {
> > > -                       if (!IS_ERR(mmu))
> > > -                               mmu->funcs->destroy(mmu);
> > > -                       ret =3D PTR_ERR(vm);
> > > -                       goto fail;
> > > -               }
> > > -
> > > -               kms->vm =3D vm;
> > >         }
> > >
> > > +       kms->vm =3D vm;
> > > +
> > >         ret =3D modeset_init(mdp4_kms);
> > >         if (ret) {
> > >                 DRM_DEV_ERROR(dev->dev, "modeset_init failed: %d\n", =
ret);
> > >
> > > --
> > > 2.39.5
> > >
>
>
>
> --
> With best wishes
> Dmitry
