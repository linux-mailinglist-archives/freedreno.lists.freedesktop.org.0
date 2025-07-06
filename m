Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86840AFA521
	for <lists+freedreno@lfdr.de>; Sun,  6 Jul 2025 15:11:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C15D10E2AA;
	Sun,  6 Jul 2025 13:11:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bVjZpZuQ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9768010E2AA
 for <freedreno@lists.freedesktop.org>; Sun,  6 Jul 2025 13:11:16 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566AKoix032014
 for <freedreno@lists.freedesktop.org>; Sun, 6 Jul 2025 13:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=ZGc9wQI6xJh0r5CdmnW1ANLHqlkeoIZrV2AuPt1aH0U=; b=bV
 jZpZuQ3RIYyAoKLa6Lh8OUzNMeAPpsKgTXDJ2SQH8f3UpKNlOBT7LO2cGYK8V7Rl
 oUiDPISlePREROz+zb8TjNx0t3W2yKLYtOU78N0gfe7ysJMVhg5AquiLgARB2niY
 8MZlFZIqPlOcSs8MRclKGZBaGQU6lucSNGW+jNJ9B3EmVMABQs19jaDhR2XnHVTw
 cSO02QdgdXaxZxcOc4ZmMYi0QIZvZjpYvzQSEwjc4DyGzG280FkfLWluSspioybs
 s5b0Jw8prtwSNRWsySIQKiPJC1lIbre86lKj7oc7UzrGvqGwehOOQEHXNJKTIbNt
 PQkdGf1k6Nl+83G2/xhQ==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pun24gum-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 06 Jul 2025 13:11:15 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id
 46e09a7af769-73cb634810fso1503072a34.2
 for <freedreno@lists.freedesktop.org>; Sun, 06 Jul 2025 06:11:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751807474; x=1752412274;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZGc9wQI6xJh0r5CdmnW1ANLHqlkeoIZrV2AuPt1aH0U=;
 b=YnyK93fGz87BaSifg7Lt43vv7eBLFV841j4BzGqrkeoPz30MVIp6mY1YTEBioFf1bM
 djY5VQcPScCUAGEE4vPBMIvr7UJm8gwYv8FYMgyMtQQ+H6xKdmsPUsJRVi/hmuBq5dSI
 l24KTrFkPB3eUB0E6UTCgCGaRI1O5G8FdYzRwhnokTWYPW1mFmG9kT7n5de7KwoHW6JZ
 SkOMKrsjixh4ePgkFpSRbVLVfHgRQw9jJehBi7OzWBDcpy5cQsnkENyoUC/KPI/QIkGk
 EDmUYCtnpfcLq5rI7ABERkHG3Nl09h7uy1oUUAIjeoqY4Z55WiIYO9IshDvFWjTssodF
 S1sA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNenyQjigzKFKaavUZyVttclblunCpKQgMyTciSUApxTj5QaSrcnQ1bdAHBMo4EVh3FL3uI4q5z+k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxytSHVUugpRJgm5xeYPpPYu1mHxmGVxRg5WhkAJQ5X/wvDViLH
 JlSBYRMCYEielYkaM6IAUThI4lvFqhbdwA9q6G0FFMPiSeKtfwPLV8rHcfRJbH8o7vaZ38wshKf
 /P/oV5a5TLRcadkXzxHFy1o8mLFpG1zoOYXLVTNLmgkNycZsA3b3/KKJ/Xmqpm41JUOHDmSCvRD
 MtjGPBTD/oaPp3+CYHYjnGAwAiNCuJTXPbgVCfrsm+xS33Fw==
X-Gm-Gg: ASbGnctZN+W/AQKL8uH0HZbRIJqPOFW8OmrgfLgGdUrGRhJDp5TXcc+D974ORJvD7dp
 qPL0TYRC6IIrPCBuYSQn4nVoeCVqr6zTkuzzrBYArZvOz6OpZaso4U8oFTPhtOIRUGP9biWnz8X
 N9vGIgwXicvIySDLZTugPAkdWBKp0oSsemWNw=
X-Received: by 2002:a05:6808:1b21:b0:40a:a971:3918 with SMTP id
 5614622812f47-40d073f722cmr6309747b6e.38.1751807474435; 
 Sun, 06 Jul 2025 06:11:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXqTIxYOpfrcpl+16hlqYgFIybIHth3/Nw1AkuewmfHyr5AuL3eQcE0fbOtAaXCzTUxvDDs3JmQ1pGw8qClxo=
X-Received: by 2002:a05:6808:1b21:b0:40a:a971:3918 with SMTP id
 5614622812f47-40d073f722cmr6309716b6e.38.1751807474001; Sun, 06 Jul 2025
 06:11:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250706-msm-no-iommu-v1-0-9e8274b30c33@oss.qualcomm.com>
 <20250706-msm-no-iommu-v1-3-9e8274b30c33@oss.qualcomm.com>
In-Reply-To: <20250706-msm-no-iommu-v1-3-9e8274b30c33@oss.qualcomm.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sun, 6 Jul 2025 06:11:03 -0700
X-Gm-Features: Ac12FXwEujg0mUTYK0P_aqc5R6aQdoKJa1qQ7yp3VRUOl3NV_roo7RTcVDixtuQ
Message-ID: <CACSVV00Cdwjhta+ozoQAy0QQ81LM8Skf8RcnFGKscbc03xBA=w@mail.gmail.com>
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
X-Proofpoint-GUID: 3snMeLXx9O_qhTi7j9Y7dqel1mEhcVxj
X-Authority-Analysis: v=2.4 cv=GdUXnRXL c=1 sm=1 tr=0 ts=686a75f3 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=hIhbsxJwIuVk7VQtvR8A:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-ORIG-GUID: 3snMeLXx9O_qhTi7j9Y7dqel1mEhcVxj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDA4MyBTYWx0ZWRfX2xApS8H+Q36N
 OkpLLZ5jcOFLbB5a3i+y3bJXHOSAo5/nqUHoGthJN4BTklJ58A2JCTWAjPhdSHPB4pFzYJ4gnmI
 uwOQ/HcW8gC+pwHsMdGZWqCrkKqI99To9ntibKkcEwYXRBP2dhGIGQu0t072QYmkd14/aTAOeoa
 coRIKtU5LDo+7mjIn1D+PPEV1Rg1MF7Vni9iMBShOfzEjLYISPu3272jJ1VLh2QL/lJZANgmc8h
 YH79urh2Ynaqlsh0PUIoPtttLebaN+Dl73+OZDh6QjVFVOo6gj4CzkC4kVSDQKimoBRlVtXLZSj
 q0UwLa3Pvpx8W0gOCQTdBDOoY9fES/Rz5N2ePFwTAsF074UTfefKCEIb9R08C3bhilxsPC4UqsT
 JWBfXiNLQ7ZOZR56iLB1mGWa9c3ynzWfs5ubTJwPKWCTPHRa+y9ETgr2Sc7XIf5lx+HHhnpy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 malwarescore=0 mlxscore=0 phishscore=0 impostorscore=0 suspectscore=0
 mlxlogscore=959 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507060083
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

On Sun, Jul 6, 2025 at 3:50=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> Use the msm_kms_init_vm() function to allocate memory manager instead of
> hand-coding a copy of it. Although MDP4 platforms don't have MDSS
> device, it's still safe to use the function as all MDP4 devices have
> IOMMU and the parent of the MDP4 is the root SoC device.

So, originally the distinction was that mdp4 didn't have the mdss
wrapper.  Maybe it works out because device_iommu_mapped(mdp_dev)
returns true?

BR,
-R

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 27 +++++---------------------=
-
>  1 file changed, 5 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/m=
sm/disp/mdp4/mdp4_kms.c
> index 88296c41d1a5eb0e16cb6ec4d0475000b6318c4e..41d236d30e71ebb6ac8a59052=
529f36fadf15cd7 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
> @@ -391,11 +391,9 @@ static void read_mdp_hw_revision(struct mdp4_kms *md=
p4_kms,
>
>  static int mdp4_kms_init(struct drm_device *dev)
>  {
> -       struct platform_device *pdev =3D to_platform_device(dev->dev);
>         struct msm_drm_private *priv =3D dev->dev_private;
>         struct mdp4_kms *mdp4_kms =3D to_mdp4_kms(to_mdp_kms(priv->kms));
>         struct msm_kms *kms =3D NULL;
> -       struct msm_mmu *mmu;
>         struct drm_gpuvm *vm;
>         int ret;
>         u32 major, minor;
> @@ -458,29 +456,14 @@ static int mdp4_kms_init(struct drm_device *dev)
>         mdp4_disable(mdp4_kms);
>         mdelay(16);
>
> -       mmu =3D msm_iommu_new(&pdev->dev, 0);
> -       if (IS_ERR(mmu)) {
> -               ret =3D PTR_ERR(mmu);
> +       vm =3D msm_kms_init_vm(mdp4_kms->dev);
> +       if (IS_ERR(vm)) {
> +               ret =3D PTR_ERR(vm);
>                 goto fail;
> -       } else if (!mmu) {
> -               DRM_DEV_INFO(dev->dev, "no IOMMU configuration is no long=
er supported\n");
> -               ret =3D -ENODEV;
> -               goto fail;
> -       } else {
> -               vm  =3D msm_gem_vm_create(dev, mmu, "mdp4",
> -                                       0x1000, 0x100000000 - 0x1000,
> -                                       true);
> -
> -               if (IS_ERR(vm)) {
> -                       if (!IS_ERR(mmu))
> -                               mmu->funcs->destroy(mmu);
> -                       ret =3D PTR_ERR(vm);
> -                       goto fail;
> -               }
> -
> -               kms->vm =3D vm;
>         }
>
> +       kms->vm =3D vm;
> +
>         ret =3D modeset_init(mdp4_kms);
>         if (ret) {
>                 DRM_DEV_ERROR(dev->dev, "modeset_init failed: %d\n", ret)=
;
>
> --
> 2.39.5
>
