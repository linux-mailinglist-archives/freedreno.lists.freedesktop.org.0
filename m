Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92984AFB9A9
	for <lists+freedreno@lfdr.de>; Mon,  7 Jul 2025 19:09:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A1DB10E165;
	Mon,  7 Jul 2025 17:09:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CosisA/n";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4635510E15A
 for <freedreno@lists.freedesktop.org>; Mon,  7 Jul 2025 17:09:24 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5679Ucj3032560
 for <freedreno@lists.freedesktop.org>; Mon, 7 Jul 2025 17:09:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=oT1DtUsRaA/zcFPtBS//4Isnss8E6kQPFTLhfURqEU4=; b=Co
 sisA/nNcWtS2/DV2jolq9HasCQctsMa5kfPmFIqLDrVOD1SDgP0JSJgyJ1+PFaS1
 zjXJ1V7DJ1yyptbgELitJYpBKHrxrieEgYp5KbfPTqfnPWHCIkO+CxmK/CMNu6H+
 1O/QSGgTmGJOo63j14IBH7EBOM97D6IUYWh61F7qbeX4l9LLcvIHZKP63SaDU8+V
 y2ewIpWM/aj8VE13eJtZv1qU+7/RTiNKWHayoFuWlhvsV9dDPmsqeXo8rqkMPy3W
 q6X6h0xSyp2wAs2whPMcFR7/wRHbjR6qJPAPx7yPqK8ICRqILPop9LqpjpX0QRj7
 BPn03wJP/Zj0p6K3qCHQ==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu2ay8jb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 07 Jul 2025 17:09:23 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id
 5614622812f47-4033c872b60so2665057b6e.2
 for <freedreno@lists.freedesktop.org>; Mon, 07 Jul 2025 10:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751908162; x=1752512962;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oT1DtUsRaA/zcFPtBS//4Isnss8E6kQPFTLhfURqEU4=;
 b=Jdblwz2zKd1iS/XmiRhRPrMf5hap26n4OvLy07n398HjaqqQHM0X+qYB2PhuCQnIw9
 ccP4zykXKHcHfPwylarVWTXCYDRBXNZPjy5KFoUXuJxcpG7ULZH55GLyP5KUCOa6mqbF
 10ec8c0M3oSxxdXi1aZkXoCcNIPf2gZK//vnFSWJUSOVSpcU+f3YNJXNyHF9jpB1Mv/v
 tMFqqXymOp5TClku2qAyIFyZsTKpKVPmT5iS20HO2pyIJdJ6gBqvBHZHyKOLQSuoUw4r
 4VM5SgHYcZsCz2+UObJ0g7mbS665cIKxQhOmp/qwuLjM2WUdx7ArlfxGssD5G8irSryI
 e/cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIP4FU71LOCxLmOLrQDOoi0WQdbijvPnxZrTzEKrShFN2+b8+yuuJkabcSQsw6hY1MpVFpevUtZTY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCV2tnyn5SdgVq1I7W/zKOoNk9+ZSopFuAM3eZgUdgZvsCxflK
 XwRB/qkZz2wmlYmWK2RR21NyrwhBiZa1p+OzZZ7f5SrfJ2ej1NZ0ix7am1IEvTdGElMCtpg6EZJ
 8HvNWISPkoE6XzaDAlw5t1kerrLI7lF8daGSKDG+UXZawG4fmh1Pv8ZQZa0ybJd1PoLHw2rl5DG
 ppLw+g6ytBygjSJFAJH4faJtJx6yyuXZfuBn3NDVvC+FkBTw==
X-Gm-Gg: ASbGncusmTYTMteU036pekHzZPd7trqb8YF5RQTyrFZy9Nw1ihrYUQkuih8HMAqzFWk
 ePQouKNn8DiBYXIQHezJSGtUN+UfI363stLbc6SEI0whMUIQC4fPflsRIAPvg6w/roDgS/siAgu
 7IIWT/ojtPpx33se8EkCi5JCTPxXqEkA6KOgk=
X-Received: by 2002:a05:6808:211f:b0:40c:5b58:c9f9 with SMTP id
 5614622812f47-40d073ccd23mr8743851b6e.22.1751908162422; 
 Mon, 07 Jul 2025 10:09:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJFgTDJSExh2v7ckh3Wk01zSJ3P5QE5VWongvlxIz7t3sbZ/GbabrbWMQ+rzFK8GgUIeDgxM2pypdJm3Jto6Y=
X-Received: by 2002:a05:6808:211f:b0:40c:5b58:c9f9 with SMTP id
 5614622812f47-40d073ccd23mr8743829b6e.22.1751908162097; Mon, 07 Jul 2025
 10:09:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250705145242.781821-1-robin.clark@oss.qualcomm.com>
 <20250705145242.781821-2-robin.clark@oss.qualcomm.com>
 <6579c65c-877d-44fe-aa81-5b0e602b33f5@oss.qualcomm.com>
In-Reply-To: <6579c65c-877d-44fe-aa81-5b0e602b33f5@oss.qualcomm.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 7 Jul 2025 10:09:10 -0700
X-Gm-Features: Ac12FXxuUa5Yn05AD9M7jkS94r-Rdb6D2yJUjRtTcPRlVGpITucDmRppAplnMyc
Message-ID: <CACSVV03U75=5LYdWkbQ-FOU6L-F50iZ+XgpT=f6+-sRNkEv6sA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm: Clean up split driver features
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDEwOCBTYWx0ZWRfX9VPGtWHcuF6B
 wAX18KhBEIjZQOMwfqJdOM+buw1+adiiQfPwFvPo+YI+tLAd4/TobplFhbD+Qu1CUrfUh1qrHar
 TUEr287LQO9Yy7EpYsTeEXOeV1zLwFj9j+Cus3sD68g3uzlUdo7VoFyBNP8Qs2Ct4rI8u3mlh7s
 z4JIt3ixyrUa6o8dAU4IndbmOjsZ4E3/Kd8KLlwPliIuTcpIWQZ5Hl/ifYPJ8t5skzsAIoGcuFz
 fpbO9TRO3srNINGefsvsYcGoCHaT5/AeXj1gZcQoxEip3+aP26bAN7qTGm97sscGqO9lY9Ln8qh
 +eRmwrn9+/y6Xuuin8DtAVlPCwax6uj9sucNqwUtrPPC34dqI87lts84DsRcp1lSqYgSvAgiZXG
 XgOWVbkOSCjBvqdigtKtMvcq6pXD9fUknjwpl7DjfAJV0jcmrG3BgZRvlCoRm5KXl91taIhu
X-Proofpoint-ORIG-GUID: IRS9fXLEFKFD_ubmI-b1rmlv3z7PV0va
X-Proofpoint-GUID: IRS9fXLEFKFD_ubmI-b1rmlv3z7PV0va
X-Authority-Analysis: v=2.4 cv=erTfzppX c=1 sm=1 tr=0 ts=686bff43 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=mFyTvTkbTY4ge-DhZPYA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_04,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507070108
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

On Mon, Jul 7, 2025 at 4:42=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 7/5/25 4:52 PM, Rob Clark wrote:
> > Avoid the possibility of missing features between the split and unified
> > drm driver cases by defining DRIVER_FEATURES_GPU / KMS and using those
> > in the drm_driver initializations.
> >
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/msm_drv.c | 31 ++++++++++++++++---------------
> >  1 file changed, 16 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_dr=
v.c
> > index b6efc5b9933b..5695de1bbae2 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -816,14 +816,21 @@ static const struct file_operations fops =3D {
> >       .show_fdinfo =3D drm_show_fdinfo,
> >  };
> >
> > +#define DRIVER_FEATURES_GPU ( \
> > +             DRIVER_GEM | \
> > +             DRIVER_GEM_GPUVA | \
> > +             DRIVER_RENDER | \
> > +             DRIVER_SYNCOBJ_TIMELINE | \
> > +             0 )
> > +
> > +#define DRIVER_FEATURES_KMS ( \
> > +             DRIVER_GEM | \
> > +             DRIVER_ATOMIC | \
> > +             DRIVER_MODESET | \
> > +             0 )
>
> Perhaps I'm missing some C lore, but do we need the "| 0"?

It is just to avoid later diffstat noise when new flags are added :-)

BR,
-R
