Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B800B04815
	for <lists+freedreno@lfdr.de>; Mon, 14 Jul 2025 21:51:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA5F10E346;
	Mon, 14 Jul 2025 19:51:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WGPQ++58";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE96710E346
 for <freedreno@lists.freedesktop.org>; Mon, 14 Jul 2025 19:51:08 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EHNYOo026582
 for <freedreno@lists.freedesktop.org>; Mon, 14 Jul 2025 19:51:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=cHAxU5EnEHUmmvSd/XnW201tIJmHnogoSkLScD389cU=; b=WG
 PQ++58bGoF+QZqX8R59+SGOPQ5PGrMacju4rWcCYnLEkDxTgEJpKP7YkBwD154sq
 9WiG72nCnuXda1yJIvewzAF2zawQFDgKGOrKExlFBKoLj/C5y2wPx78Nha1PiqBX
 Twqo/auhtkq8WhM6evSTi0ZYi8n2erpzgm1acGEMk5bghAeqxykWQAqEBUU4Ed1M
 6px2RztULwEMNBz7M641NHGu5GdxX+hx+qOrB4EdMRESJYB1B3te87vDc7l/x3OX
 87+DDYTkC0cUF5H7GaNoudRFJssKsuEC7qnwnBxO9NyxB58x4yf3P3OyrQRN9MXf
 LIGd1bQId2+prm6eMjow==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ug37wupf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 14 Jul 2025 19:51:07 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id
 006d021491bc7-60f430ab80eso4221021eaf.0
 for <freedreno@lists.freedesktop.org>; Mon, 14 Jul 2025 12:51:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752522667; x=1753127467;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cHAxU5EnEHUmmvSd/XnW201tIJmHnogoSkLScD389cU=;
 b=L0HrQISP80QLmZ/wICT9M96tEwlBAxcwBC3aep4QW6GIDouC+3FBI0lt6GJHujj1FQ
 bOwvY+vplo9z34WYJ37dstIW35Buxxjpt4Y0H8OuBvIJkVaxL4HNUn0FTXEMv1eGtrP5
 hu3aqcs+BYEULh7QEeH8UbhYdxSYTP5JRVN94oj+WURH/3jCtCPu80MYHqxiQx5lsewl
 X5rkbh+d2PGAo6lN9bec2xR3MWjPsgh4LuDmeUJhI6LePZ4DVZLdoTDSQpY7eamu0nsG
 UG5f1Qmn0ubyNEGtBQhrlT830Q33SNJAvGn+p+j+JqveAAczTrxt/LZpqP5GfKAPx7J6
 pzpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGhQDz5qmV+e2Ed1xZpl4Qn1ZoCO2GhjpTFDCtZ5N2KiEbqzC3HFdlCBqzLXjT7sSaHNlaY59Zme0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxEYY6l/QIBM2K/U9QhBM7eihWlPwC+cV5CUBk/IW/+pKB1IMnL
 qMxyb0GtKNzBVMwcDWkg/jxABdMY9fSlFB9wz0ls0yegdoy6K+YG2ghJGuZQw0sM5bmCcyt4W58
 bAK7gf5rXmzKN0pwvAjFvPqMLUFzB1pOkeRAOMJX1W1DSjRUr+5k35Fdb1G5nDeYQwI4pe5fXG0
 v8gA2NPTU+N3thbAsROAm+RCZkcZD+mDaZiuDOYedUtYiS7w==
X-Gm-Gg: ASbGncs1IqhadYHUMI7IKJh0HXnscjtwHHydggmsIfFX5oDLhlDCT5yEYX16/Ixdh5/
 yR860p/140KGzy9PMVahjh4oJoh8pm9fKe3TZKrRSUb7MzQPrvgAaJ0xFFyVQxcEPI8muuNiT45
 AEJRKna/wD3soVqNJWtBJuf0nwsC02oKV4PxTinnrjHq/xr2owd2c6
X-Received: by 2002:a05:6820:2b14:b0:613:90e1:729a with SMTP id
 006d021491bc7-615933298d2mr395647eaf.4.1752522666671; 
 Mon, 14 Jul 2025 12:51:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvNOTRr7nTbzGLFYFpm62n4sXgSE9iNBusqXlHlebIghEEjvoyILcY8+9jbV1NxN9chrsAuYDFxtNto888VVg=
X-Received: by 2002:a05:6820:2b14:b0:613:90e1:729a with SMTP id
 006d021491bc7-615933298d2mr395636eaf.4.1752522666307; Mon, 14 Jul 2025
 12:51:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250714173554.14223-1-daleyo@gmail.com>
 <20250714173554.14223-7-daleyo@gmail.com>
In-Reply-To: <20250714173554.14223-7-daleyo@gmail.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 12:50:54 -0700
X-Gm-Features: Ac12FXzMmQvS5rnzO5-iDknQYE-6ywvsNV2cxkydI09oPN8GV7Xk6HdI3xrZ3s4
Message-ID: <CACSVV00-DDnQYp-65Pi-XwpEKT1_jYik2=zH_bK_oJiGLxX48A@mail.gmail.com>
Subject: Re: [PATCH 6/9] drm/msm/dp: Work around bogus maximum link rate
To: Dale Whinham <daleyo@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?B?SsOpcsO0bWUgZGUgQnJldGFnbmU=?= <jerome.debretagne@gmail.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDEzMSBTYWx0ZWRfX3KohTB4R+B6+
 DbkVHlium6Ib49B6ZLyQd0b2PF01Bj0Jth/qiczDpj4T2LwwlMh2VN2kIcXV3YbqobgTV5YQN9X
 lFESGOB3KjIiQtK49tdogx2hrdtI4FdQYT5O+N76Nu/LBSd4xhN2lKAuG/WmdS/DVD/NzCz7K7o
 aQbUE+ymbPd8n/YXnrzM9DXMVAbz0NHAHO8u067Iwhit9/jx7QfoDaPSjVJ2yOwcVglv3aJ/ZuW
 Slb9vsFAJPsZaHsyYtoZ7ryxMJqnpvDCgWUNQj6YVlz9adBsAku+r5hKDMJM9c95vsVMJJXlBlh
 IjHfTvtOBgw3uCBiRqhXHigcU3nr4hsS+lWgS4O+TrBxweou/jwWdSFbWYTlOvcPO8iBvp0eDSD
 CCAuH/aObmgBwP8umAqW3lK94xxY7nksBLmE9uDSD8aYs9zRW4mxFoLJnEIew5aqvvOmRK33
X-Proofpoint-GUID: GmQGYZ7XVKwo0FbyXTslsAnsEmooQgSf
X-Authority-Analysis: v=2.4 cv=SZT3duRu c=1 sm=1 tr=0 ts=68755fab cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=pGLkceISAAAA:8 a=B0QqisOVu6ZhBNclzXcA:9 a=QEXdDO2ut3YA:10
 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-ORIG-GUID: GmQGYZ7XVKwo0FbyXTslsAnsEmooQgSf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_02,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140131
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

On Mon, Jul 14, 2025 at 10:36=E2=80=AFAM Dale Whinham <daleyo@gmail.com> wr=
ote:
>
> From: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.com>
>
> The OLED display in the Surface Pro 11 reports a maximum link rate of
> zero in its DPCD, causing it to fail to probe correctly.
>
> The Surface Pro 11's DSDT table contains some XML with an
> "EDPOverrideDPCDCaps" block that defines the max link rate as 0x1E
> (8.1Gbps/HBR3).
>
> Add a quirk to conditionally override the max link rate if its value
> is zero specifically for this model.
>
> Signed-off-by: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.com>
> Signed-off-by: Dale Whinham <daleyo@gmail.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_panel.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/d=
p_panel.c
> index 4e8ab75c771b..b2e65b987c05 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -11,6 +11,8 @@
>  #include <drm/drm_of.h>
>  #include <drm/drm_print.h>
>
> +#include <linux/dmi.h>
> +
>  #define DP_MAX_NUM_DP_LANES    4
>  #define DP_LINK_RATE_HBR2      540000 /* kbytes */
>
> @@ -58,6 +60,17 @@ static int msm_dp_panel_read_dpcd(struct msm_dp_panel =
*msm_dp_panel)
>         if (rc)
>                 return rc;
>
> +       /*
> +        * for some reason the ATNA30DW01-1 OLED panel in the Surface Pro=
 11
> +        * reports a max link rate of 0 in the DPCD. Fix it to match the
> +        * EDPOverrideDPCDCaps string found in the ACPI DSDT
> +        */
> +       if (dpcd[DP_MAX_LINK_RATE] =3D=3D 0 &&
> +           dmi_match(DMI_SYS_VENDOR, "Microsoft Corporation") &&
> +           dmi_match(DMI_PRODUCT_NAME, "Microsoft Surface Pro, 11th Edit=
ion")) {
> +               dpcd[1] =3D DP_LINK_BW_8_1;
> +       }

Not a dp expert myself, but..

In drm_dp_helpers.c there is dpcd_quirk_list[].. which applies quirks
based on the oui ("Organizational Unique ID") of the dp sink.  I think
this would be the correct way to handle this.  Although I guess you'll
need to add a new quirk for this.

Idk if the surface pro 11 has multiple different panel options.  If so
you defn wouldn't want to match on the DMI.

BR,
-R


> +
>         msm_dp_panel->vsc_sdp_supported =3D drm_dp_vsc_sdp_supported(pane=
l->aux, dpcd);
>         link_info =3D &msm_dp_panel->link_info;
>         link_info->revision =3D dpcd[DP_DPCD_REV];
> --
> 2.50.1
>
