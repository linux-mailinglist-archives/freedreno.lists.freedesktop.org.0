Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BA4B1443D
	for <lists+freedreno@lfdr.de>; Tue, 29 Jul 2025 00:15:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9369E10E04B;
	Mon, 28 Jul 2025 22:15:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EOOZcutJ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2249D10E04B
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jul 2025 22:15:22 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SKxB52024736
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jul 2025 22:15:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=Lll6iG9jjiafodgAXUYVjtDfwGIt1eByg5KgSum8/2o=; b=EO
 OZcutJvKonX2omZ+NL3a/EO4wrH3sBDazzrQasl0tJGJfX3rM5H/MfDm6wuLZED8
 IHpt8lRWYwOg8B0032HGRNnWtJtk0aawEsSW8+62FzH52gaYRgIUruNCbDHdrFOc
 8ZtJhGkU8lL1qAxQtV69KZpJj8HoKBEWJf6ZaalGWEifUrtRX9hdirpKeWg1iLdP
 Qrx5RIwEMFRimF6enBlXmp17SYatnZuQtBERhJ+Z1i8b+AGAvMLJSioAiVuj6QvO
 k+wpN74hwyunZ6Jts6uat0/Klco639TMKUn9x7DzqAiz4ST1GL713384m337aTwX
 ZAXgd5KkpO7uV3U8KEsg==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484mcr677n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jul 2025 22:15:21 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id
 5614622812f47-41c66de9ac8so2128420b6e.0
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jul 2025 15:15:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753740920; x=1754345720;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Lll6iG9jjiafodgAXUYVjtDfwGIt1eByg5KgSum8/2o=;
 b=bAkpbmDEY6pfMlcgwRw15/RIGNJj0wlppHV5HMfBCHEiCb7cTZ1ZByT6nxOHEFdi+9
 +z4U76OdjeM63Dra69HTCqWSUrwbhkj2DEU3r7maZIRYQp9/6aqUWDsDZy2+U0iCxD3W
 ySWd56cVKBiDhFGr1Wu/+hDFBPVfQEFOwbTb6AKvQ/oyBFHxPEFNwMppfPrTwfj7qEob
 wQEvhkgIJGenFO5IXwHZxP+Bb6Bkd4adCSRNyLs2DXml5gq8mSh4RH4e7T2VqiUyG+fT
 nWZL6N2EQJFSqQcWMvHWqNacPvGGHv82J6vyl6hHGgxbDXWXs/RdPhAxbhyt4QOqNodv
 IXtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUzfE+xcNJwfedRZHf4msGLwSXCm0TOM/oPzVF9W6segzHfI+A6+9AY/DFfo8W51vOpGv2GvJCcA4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxpCGrKcMJ1d52JJp/Az7SdzZVRc8YFVOWMpsiFvgH6+kINU8J0
 tGgjF26gtmaNFqUCKO4PFFkWgXz4IvavbbvmGWlG70j/3Tg6guthCSXoq1vsx5wpXpWNNAXo54B
 Ugj7GyoYzSVVekofCk8OYLCKKGAE55zOLq7ZWf2vTZyEzQa0E8BqBwGuPwMvGrkvcss6Z8Tg7Fa
 vBIbWRf0F06zDJK68jzxUJa+xt4GzxXQgGoJ61tbtSjqzXXA==
X-Gm-Gg: ASbGncuilw6czjTxwGpBn/OEtyi8vE3p7YmuiKvIpLVVAKES4o8TyBSGDZ/R6djNu8K
 9lw+FGrNqpWfxSj/uh1Co6wOrAvX6dVBsLmriGFbjgGs5xMT3k3JKhovE5b2EwSEO4VEc7yRzbg
 Jp+4sm6aU8Md48xbM/SE/5SgSxInXmtkJyNNurmMw+s/JkWgBuSdJq
X-Received: by 2002:a05:6808:14cc:b0:40b:3816:6637 with SMTP id
 5614622812f47-42bb92437famr7502082b6e.24.1753740920072; 
 Mon, 28 Jul 2025 15:15:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUWxjH77ANgUCz1gxut5vOzlfOsvuZGqBiRxeSnrpoSOaKr0Axu+0/yp56ejEjtW4vvXW/jn7lkoZRFSnkaJw=
X-Received: by 2002:a05:6808:14cc:b0:40b:3816:6637 with SMTP id
 5614622812f47-42bb92437famr7502059b6e.24.1753740919614; Mon, 28 Jul 2025
 15:15:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250728203412.22573-1-robin.clark@oss.qualcomm.com>
 <20250728203412.22573-2-robin.clark@oss.qualcomm.com>
 <CACu1E7F=Y2oKfiWtD0VYfmLkL24e7JrZYMt8dmoGW7zrq7bd2g@mail.gmail.com>
In-Reply-To: <CACu1E7F=Y2oKfiWtD0VYfmLkL24e7JrZYMt8dmoGW7zrq7bd2g@mail.gmail.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 28 Jul 2025 15:15:08 -0700
X-Gm-Features: Ac12FXxKcQE-jGXesSBh-SermxAqmB7IQG6RNGuaqlm9uwFHrxNfWtJsGTe3B_k
Message-ID: <CACSVV02W28L0MS32J0n1PTpEsaq_6RxEPgb_6y6G=6TryGEPQw@mail.gmail.com>
Subject: Re: [PATCH 1/7] drm/msm: Add missing "location"s to devcoredump
To: Connor Abbott <cwabbott0@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDE2NCBTYWx0ZWRfX3Zibqk4MhEIE
 qoQhWLCKftGMvhviz0kmFctTY04aKxQbWMV/P/YwXkOcgnQk+KfUIHdR7OC/I/ZXnRsBkUGULsd
 dBWCkDDBr16iRUzghPsHKgUsxYiFX0dPrh8EsXsE3n66WyaiwXr4vBPTj1Ctftm2osRlo7/1lZ/
 RDiNSofmCtBZoPT6F6+/MzjZGxaWfOQsiAxUp2uZ4XAMlFxEvl97lRMPjdI1Qg2VhT2EIwaItxk
 v3NJqEeLQfTim3Ln6FyGnKQ3BCdi01ewClCPTl76AcYSg+f5JB7adF4Sk2Qz59m5nmeEyf1XtJg
 lScgEqb+HYo/V1H7sFTfugKqfOY/VkzPmV/6JwOuYhbMQLxNNVv6G4ANnIKqRYGPQw2/goOyXG1
 f2tSzuhwDilj/sHWpWuU8xLV15m9XzLZvBnHSj3KoqVYoYh51/l99W/MtD1TxWm8/BcK+2L0
X-Authority-Analysis: v=2.4 cv=Hth2G1TS c=1 sm=1 tr=0 ts=6887f679 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=GWzUntYCYND7tZVuv0EA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-GUID: ht5o9AdOZJHe4ag3fehlv8T-OuH88f0T
X-Proofpoint-ORIG-GUID: ht5o9AdOZJHe4ag3fehlv8T-OuH88f0T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_04,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507280164
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

On Mon, Jul 28, 2025 at 2:04=E2=80=AFPM Connor Abbott <cwabbott0@gmail.com>=
 wrote:
>
> On Mon, Jul 28, 2025 at 4:43=E2=80=AFPM Rob Clark <robin.clark@oss.qualco=
mm.com> wrote:
> >
> > This is needed to properly interpret some of the sections.
> >
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/=
drm/msm/adreno/a6xx_gpu_state.c
> > index faca2a0243ab..e586577e90de 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> > @@ -1796,6 +1796,7 @@ static void a7xx_show_shader(struct a6xx_gpu_stat=
e_obj *obj,
> >
> >         print_name(p, "  - type: ", a7xx_statetype_names[block->statety=
pe]);
> >         print_name(p, "    - pipe: ", a7xx_pipe_names[block->pipeid]);
> > +       drm_printf(p, "    - location: %d", block->location);
>
> We should probably at least try to keep it proper YAML by indenting
> everything after another level...

this made me realize I missed a \n... but otherwise I think the indent
is correct?  Or should location not have a leading '-'?

BR,
-R

>
> >
> >         for (i =3D 0; i < block->num_sps; i++) {
> >                 drm_printf(p, "      - sp: %d\n", i);
> > @@ -1873,6 +1874,7 @@ static void a7xx_show_dbgahb_cluster(struct a6xx_=
gpu_state_obj *obj,
> >                 print_name(p, "  - pipe: ", a7xx_pipe_names[dbgahb->pip=
e_id]);
> >                 print_name(p, "    - cluster-name: ", a7xx_cluster_name=
s[dbgahb->cluster_id]);
> >                 drm_printf(p, "      - context: %d\n", dbgahb->context_=
id);
> > +               drm_printf(p, "      - location: %d\n", dbgahb->locatio=
n_id);
> >                 a7xx_show_registers_indented(dbgahb->regs, obj->data, p=
, 4);
> >         }
> >  }
> > --
> > 2.50.1
> >
