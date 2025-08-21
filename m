Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99860B2E920
	for <lists+freedreno@lfdr.de>; Thu, 21 Aug 2025 02:03:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54B8110E297;
	Thu, 21 Aug 2025 00:03:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pKtAf7/Z";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA4C310E297
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 00:03:42 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KKkslW031528
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 00:03:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=FFz/Isl0YBTZIELVPhKyp63nqpT4wVZoqPWNikeSJv4=; b=pK
 tAf7/Z7r89jxx5f8WPZpxZUIuWILu3MqK7VYJGNs7G0NNCgXqQkrU3C0fEGyA4Ea
 Ll62dCScbyL1/PWnkA/Cpyv5jLTuE/lLROhKKWmZhuoJADuFFFEwwCNUuYS90eT2
 lQD1QotCR7fUme9aTqFMTmj5R8fcuwR+4NyeDWO+3CrcK4TMvlmodJWZkm7XZHAv
 RiwUmMNiqtQFvI4m+vuneghAjHVpN3muEyPjcUMzquNUWa7LJAuKzvrsmVrFzmdE
 xnFllTQuvhupx/M8Tizabzbjo7ruD1Z2KcYIFRnyoK/DOO7JE/CjieQOYj61F5lq
 5Whi5ZJuyPWb9c4vz+9A==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52dkb0c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 00:03:41 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id
 586e51a60fabf-310cdd5eb73so4996305fac.0
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 17:03:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755734621; x=1756339421;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FFz/Isl0YBTZIELVPhKyp63nqpT4wVZoqPWNikeSJv4=;
 b=kNMmn5NvdAxGq4VAsLIGopskaOVVY2XXCXzf10oHMcPuqifP3fS75922KxkuQEd9p9
 FSagKt45PCvyJfGo1+x/ZQRpxsrHcatvC3EZQQjSn0wc4ScXMYPCWInOOq7MRckXOUHf
 rZY8cga/Gy1CtyxQuQHya5H5W0TWxdzMa7OuoqwgZylKjsNY3tMHwswWF2SzGBGPajOE
 gwJpvG5mbj16JVZgDzqDs9lLlXAjw8ZkkeqfusGA8g9uvVSGyUnRfJF9mgrmHHaSpUaB
 cC3UMYE6gCCPJixWHnJdj0+0ztu5oNxLWsPPfkzKbDfVtrV3ZVmwTvKRThlcV/8cEl59
 vbhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7Xv+jsvaX0X+fnaCzucj+zXLxS/I2byGhmtXQb1mjGgtEfgFzMi7zVn86YYHzKqldkeXtMhteIyI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1JwCAh7eZJlecOXDLM8ZjLtfgWVg5wvmJ7EaTLeMlC1D/m3mo
 +ObSuyPxKEH3IMSDqVWWuk2dffRG6gq8QPgpb3ghyGsFmVvq2atG+5okUk1itMg/4bEVtbDOQ02
 Ppus9vnpTqOO6dHheZzpPJDtS7W3nGrX+wETgjgdtA9rZvXp5VBTOC74NhIb2J2O8izWCLKlPXR
 caCLLxDvQszVUetB9HYI2+8AzqhG8o1bub9LiM8ii2cFqTIA==
X-Gm-Gg: ASbGnctj5+r8Re9K1r5JpsjhC0EfwR+4wW5CqiatHH1goL9GMDUNcF7g+8eQVZ+WXNB
 qQe//qx4OSxPltj0MlSVZh/P4XwowBAQr8g/WqgixB611Mz7CiDbqg/KvWB1kam/REqZoaYK7JN
 CHO/jSrL/r7vIfn9kXSIDIPr6JkN5R2kOPiaEz9TM7HZoCUdiShskT
X-Received: by 2002:a05:6808:678a:b0:434:3f2:4ced with SMTP id
 5614622812f47-4377da2fe43mr216602b6e.4.1755734620670; 
 Wed, 20 Aug 2025 17:03:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFSJ01JmB5nH7s2jC28lHanXTkjXIv0AL06dlkx8JNDu+IEAdBFlvrkibRFWkr3533uzVKs9eT4fg3FrChlLM=
X-Received: by 2002:a05:6808:678a:b0:434:3f2:4ced with SMTP id
 5614622812f47-4377da2fe43mr216585b6e.4.1755734620267; Wed, 20 Aug 2025
 17:03:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250819232905.207547-1-robin.clark@oss.qualcomm.com>
 <20250819232905.207547-4-robin.clark@oss.qualcomm.com>
 <CACu1E7GgGZc7zF5YQxppMj=dG_emNhh1Ld7PbNT_oM_S436xQQ@mail.gmail.com>
In-Reply-To: <CACu1E7GgGZc7zF5YQxppMj=dG_emNhh1Ld7PbNT_oM_S436xQQ@mail.gmail.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 17:03:29 -0700
X-Gm-Features: Ac12FXyIFq6wuiY3CuetpoQBkAY935h4F0qDT-3ZIVa9CNYwhouE8aElbGjqKFc
Message-ID: <CACSVV00-v=eyo8=-YwC6c-Yh2S__-sQ1LacLJaa7phP-6c9UXg@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/msm: Fix 32b size truncation
To: Connor Abbott <cwabbott0@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXzrWKVGVuZC+D
 32FD3NEDlUIeMbIw1esKjYMj56iZ9JmiLDQAw3y1Ohevu8vnaaxBf6oSsItr0pPDbu2TqE8ISWi
 NSNTO/l2J5YMGLo1+WAH/1CgfqFTedR4fotUV/od/mfpkqadYHzK01xuAc+S4c2q2yCK8Pkw76p
 OsVIizYNEPZDF9xiL8Ylg4+wMD7tfU7Frji6qUTyH8jWazkp3IRBThjo5SbIn6XjQRmqN8N58YO
 q5rxoxHPTajZ6e29uGU4bCJM3DJ2bOOrY2jRHi038uRQwg4H5tAucOUGCkK4z9me9DbpkT5AYhl
 feisQeFdGrFwj/7JwPFh7kTrzc8uVC3StTNtsA0Qir5rlwzPEmCin9JpYxpThTiGUGXVMO/H17P
 x5eJqRMV3BqkD7sPPMxGJGJCIEy05Q==
X-Proofpoint-ORIG-GUID: bMsP7ASYdZWjAUGDJHik39t2cPIjRu9B
X-Proofpoint-GUID: bMsP7ASYdZWjAUGDJHik39t2cPIjRu9B
X-Authority-Analysis: v=2.4 cv=SoXJKPO0 c=1 sm=1 tr=0 ts=68a6625d cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=pT8ohEelVIQVr6aGgwYA:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
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

On Wed, Aug 20, 2025 at 6:51=E2=80=AFAM Connor Abbott <cwabbott0@gmail.com>=
 wrote:
>
> On Tue, Aug 19, 2025 at 7:29=E2=80=AFPM Rob Clark <robin.clark@oss.qualco=
mm.com> wrote:
> >
> > Somehow we never noticed this when arm64 became a thing, many years ago=
.
> >
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/msm_gem.c | 17 ++++++++---------
> >  drivers/gpu/drm/msm/msm_gem.h |  6 +++---
> >  2 files changed, 11 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_ge=
m.c
> > index 958bac4e2768..9a935650e5e3 100644
> > --- a/drivers/gpu/drm/msm/msm_gem.c
> > +++ b/drivers/gpu/drm/msm/msm_gem.c
> > @@ -1142,7 +1142,7 @@ static int msm_gem_object_mmap(struct drm_gem_obj=
ect *obj, struct vm_area_struct
> >
> >  /* convenience method to construct a GEM buffer object, and userspace =
handle */
> >  int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
> > -               uint32_t size, uint32_t flags, uint32_t *handle,
> > +               size_t size, uint32_t flags, uint32_t *handle,
> >                 char *name)
> >  {
> >         struct drm_gem_object *obj;
> > @@ -1208,9 +1208,8 @@ static const struct drm_gem_object_funcs msm_gem_=
object_funcs =3D {
> >         .vm_ops =3D &vm_ops,
> >  };
> >
> > -static int msm_gem_new_impl(struct drm_device *dev,
> > -               uint32_t size, uint32_t flags,
> > -               struct drm_gem_object **obj)
> > +static int msm_gem_new_impl(struct drm_device *dev, uint32_t flags,
> > +                           struct drm_gem_object **obj)
> >  {
> >         struct msm_drm_private *priv =3D dev->dev_private;
> >         struct msm_gem_object *msm_obj;
> > @@ -1244,7 +1243,7 @@ static int msm_gem_new_impl(struct drm_device *de=
v,
> >         return 0;
> >  }
> >
> > -struct drm_gem_object *msm_gem_new(struct drm_device *dev, uint32_t si=
ze, uint32_t flags)
> > +struct drm_gem_object *msm_gem_new(struct drm_device *dev, size_t size=
, uint32_t flags)
> >  {
> >         struct msm_drm_private *priv =3D dev->dev_private;
> >         struct msm_gem_object *msm_obj;
> > @@ -1259,7 +1258,7 @@ struct drm_gem_object *msm_gem_new(struct drm_dev=
ice *dev, uint32_t size, uint32
> >         if (size =3D=3D 0)
> >                 return ERR_PTR(-EINVAL);
> >
> > -       ret =3D msm_gem_new_impl(dev, size, flags, &obj);
> > +       ret =3D msm_gem_new_impl(dev, flags, &obj);
> >         if (ret)
> >                 return ERR_PTR(ret);
> >
> > @@ -1299,12 +1298,12 @@ struct drm_gem_object *msm_gem_import(struct dr=
m_device *dev,
> >         struct msm_drm_private *priv =3D dev->dev_private;
> >         struct msm_gem_object *msm_obj;
> >         struct drm_gem_object *obj;
> > -       uint32_t size;
> > +       size_t size;
> >         int ret, npages;
>
> npages should also be size_t.

hmm, true.. a bit more of a theoretical overflow on existing devices,
but v2 will fix that

> >
> >         size =3D PAGE_ALIGN(dmabuf->size);
> >
> > -       ret =3D msm_gem_new_impl(dev, size, MSM_BO_WC, &obj);
> > +       ret =3D msm_gem_new_impl(dev, MSM_BO_WC, &obj);
> >         if (ret)
> >                 return ERR_PTR(ret);
> >
> > @@ -1347,7 +1346,7 @@ struct drm_gem_object *msm_gem_import(struct drm_=
device *dev,
> >         return ERR_PTR(ret);
> >  }
> >
> > -void *msm_gem_kernel_new(struct drm_device *dev, uint32_t size, uint32=
_t flags,
> > +void *msm_gem_kernel_new(struct drm_device *dev, size_t size, uint32_t=
 flags,
> >                          struct drm_gpuvm *vm, struct drm_gem_object **=
bo,
> >                          uint64_t *iova)
> >  {
> > diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_ge=
m.h
> > index 751c3b4965bc..a4cf31853c50 100644
> > --- a/drivers/gpu/drm/msm/msm_gem.h
> > +++ b/drivers/gpu/drm/msm/msm_gem.h
> > @@ -297,10 +297,10 @@ bool msm_gem_active(struct drm_gem_object *obj);
> >  int msm_gem_cpu_prep(struct drm_gem_object *obj, uint32_t op, ktime_t =
*timeout);
> >  int msm_gem_cpu_fini(struct drm_gem_object *obj);
> >  int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
> > -               uint32_t size, uint32_t flags, uint32_t *handle, char *=
name);
> > +               size_t size, uint32_t flags, uint32_t *handle, char *na=
me);
> >  struct drm_gem_object *msm_gem_new(struct drm_device *dev,
> > -               uint32_t size, uint32_t flags);
> > -void *msm_gem_kernel_new(struct drm_device *dev, uint32_t size, uint32=
_t flags,
> > +               size_t size, uint32_t flags);
> > +void *msm_gem_kernel_new(struct drm_device *dev, size_t size, uint32_t=
 flags,
> >                          struct drm_gpuvm *vm, struct drm_gem_object **=
bo,
> >                          uint64_t *iova);
> >  void msm_gem_kernel_put(struct drm_gem_object *bo, struct drm_gpuvm *v=
m);
> > --
> > 2.50.1
> >
