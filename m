Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F41D5B4911B
	for <lists+freedreno@lfdr.de>; Mon,  8 Sep 2025 16:19:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC44310E531;
	Mon,  8 Sep 2025 14:19:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VhMGD9bD";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B22E10E53D
 for <freedreno@lists.freedesktop.org>; Mon,  8 Sep 2025 14:19:56 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5889Gtvd022886
 for <freedreno@lists.freedesktop.org>; Mon, 8 Sep 2025 14:19:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=btuLMB/CAC/ZycWyoLU8mXnMfT5xBCHTrrEXhmbeoBY=; b=Vh
 MGD9bDs/crOhZ2Qdox/JMNz8I5TEkqFW2c7xDqQFrGvUbgTxS5RDdREZ83FVIzX0
 /aFccM4m+C48YYFOVTMoW7exDsXz8elP/Psrm7T4HV3q0aGAe06B8IDEz0uRY+Ks
 L5JGeWu0Czt7lgbttgpoOghbF5mZMmhGC+n1GW6aA8UMh/3bG4PWOildgRCNDXrm
 QLwMuzsqnRxUqwecyvz2fDas2a2fj9QTn8goyNbU0mpuY7FYsyPEL1MVeAkVW7sW
 9lVZW0cGF551cfHGsgAmTe1XQQFzEVBc9VzNqimxWvUvYJ7raOb6n0p4ntpYM1aC
 9lb25ryPoPE5NajVJ10A==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491vc20tat-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 14:19:55 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id
 006d021491bc7-6218ba3ed9fso1374528eaf.0
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 07:19:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757341194; x=1757945994;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=btuLMB/CAC/ZycWyoLU8mXnMfT5xBCHTrrEXhmbeoBY=;
 b=b66GuGW1sWf3il2K1R7IM5sLRlvEVNoL0saAT8QBeejRNdfMb38DbA7DxZS1vnicho
 nCwEYpP7JFVu5NVRIx9uTyrmsIsKdu8KsAmkGT3Z8VJ+aI3uYqfbr1aoMVNt+n8hklg7
 2slT5jyu+WXzTqYz61B2dDdjTElrjyRTw8xT0sDyseeHoNcce4f3OuryZm82e5FyIVna
 Io9rMpVJZ1M6w1v0H+pC99HGwFR2L+cyMGhcdJVyyCQ+5iP168awKp1Y2bjSGUt9uoXA
 EZuL28ZotNydMcs9AgbqKp93oDZ2CfF9E/qM8PoRXA8K50NN0kmBekPlQz4tcx3MzduA
 rmDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRtiinsTc866DaK0FfCaThmjnEnG2UdSxIAgkpQAhiECG2fc/sbuWoMxbsKefAj35zQVEGzi8HWA0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7TZZgtztypYtQlabzlw/RTHsex2cb1YWk/Fd9xfX2MsDD7KIb
 rsppobdKOGXpAx6ovqmiSSksxHJvamF9YirwfENOVMtTlUqdlDJ4xwdgrV5fv5jfYOL3/LEZzxx
 vwANcZgYiww1vnixRxLw5+i21ygfFH4col0caTAIb1NeOYxG6PFIPvjHKZYhKdYJitGvJQu6u8T
 hY0kBoJFxH3nJ6fegEyrGsV4WIs7wRwOpAazPe1UOhUfOvMA==
X-Gm-Gg: ASbGncuLMUi9kENacTDfJci7Lvxx0oojN9nvzkzMMQSbqmMr5V+Uv3qnvsEY4ADt1TZ
 +psf4C+RZpsrZowtsjuQ16pIkAxaHrRm3nKJpqcN+c+UO3rOiWp79eI13cslOPCCxlQHBknRBun
 SRrQyS0YPRpijHF7gweC948BBwOA4ibr7E2VeZijoVSbgh19iz6jE0
X-Received: by 2002:a05:6870:1e89:b0:31d:6467:3ddd with SMTP id
 586e51a60fabf-322626446aemr3778326fac.3.1757341194255; 
 Mon, 08 Sep 2025 07:19:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTNvBd4kHJ2BnKznwqM+jmbGwcy/k3UWsvd2ldCKNZNQmupE4lvVSNxcIQw2N6Yuv5svQqGxpPyiy7oLfCu5k=
X-Received: by 2002:a05:6870:1e89:b0:31d:6467:3ddd with SMTP id
 586e51a60fabf-322626446aemr3778298fac.3.1757341193225; Mon, 08 Sep 2025
 07:19:53 -0700 (PDT)
MIME-Version: 1.0
References: <20250524-binrep-v2-1-09040177218e@oss.qualcomm.com>
 <6mgmrqmixjdftpjz2hvwjnsyh3wwylxuaih7yez2mdgjpcp3l2@zjr4ai6kkjxn>
 <CAF6AEGvJnSiyUJvBPusBZ+mriiP_vRiAgZnTyLSseu8Sdf9PXA@mail.gmail.com>
 <51cdf832-95a2-47bf-bc27-d43097883701@ti.com>
In-Reply-To: <51cdf832-95a2-47bf-bc27-d43097883701@ti.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 07:19:41 -0700
X-Gm-Features: Ac12FXxslNmNXRsbTxmU1Iy_jtvuzXP9Loe6WDYzQOeLeHFE1_OVc4JUJB4dkzA
Message-ID: <CACSVV02YrpYrvbFxKc808a=GjdxVjO=FjRG9gs_6qe5W-v=a9g@mail.gmail.com>
Subject: Re: [PATCH v2] drivers: gpu: drm: msm: registers: improve
 reproducibility
To: Ryan Eatmon <reatmon@ti.com>
Cc: Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Bruce Ashfield <bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=FN4bx/os c=1 sm=1 tr=0 ts=68bee60b cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=iGHA9ds3AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=sozttTNsAAAA:8
 a=pGLkceISAAAA:8 a=UuwjNODqMk2Ng1o2D8wA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: cWlxFaa0wHh9toXWnZi7KGLa7yBKc9DM
X-Proofpoint-GUID: cWlxFaa0wHh9toXWnZi7KGLa7yBKc9DM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA5NCBTYWx0ZWRfX9oB3924kncZL
 Ezo8eyT4BjQr6Iwtl3IUVqZm/XN4m0vQ44FAW4umX+RpySCjRroMtneO8G+wAXG9+oYhb/4ieJB
 MQs7+efqJjbi1dNHQW/y7kmA86YNEG1y+0xepZj2iD/9ND9ZQmZgkdB25vGVOOh6wxmfvc3LLFk
 P0L8aK4ylZ20rHvCeSMkXFCp/+uEyBm0z3uVcizFGstGDibrtJl7I3MKEWjE1m4Nc92qQdjh2Lh
 ZD1BKFSQAdHvtusDdb31BeYGD1iG9TpdOFAzvNiwoAJ7UDVTXMvzrv3SGSRw0rz8kxh/sD5orEx
 xnH7P2uusMHuaO4XPS08/quzwUm5skVnvbpKSq4zrXH7LEipl8oQdvpSbT+NnbX4jKaFVf41xGe
 VMdg7Znz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_05,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080094
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

On Mon, Sep 8, 2025 at 6:39=E2=80=AFAM Ryan Eatmon <reatmon@ti.com> wrote:
>
>
>
> On 9/6/2025 6:24 PM, Rob Clark wrote:
> > On Sat, May 24, 2025 at 10:15=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >>
> >> On Sat, May 24, 2025 at 09:25:37PM +0530, Viswanath Kraleti wrote:
> >>> From: Ryan Eatmon <reatmon@ti.com>
> >>>
> >>> The files generated by gen_header.py capture the source path to the
> >>> input files and the date.  While that can be informative, it varies
> >>> based on where and when the kernel was built as the full path is
> >>> captured.
> >>>
> >>> Since all of the files that this tool is run on is under the drivers
> >>> directory, this modifies the application to strip all of the path bef=
ore
> >>> drivers.  Additionally it prints <stripped> instead of the date.
> >>>
> >>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> >>> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> >>> Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
> >>> ---
> >>> The files generated by gen_header.py include the source path to the
> >>> input files and the build date. While this information can be useful,
> >>> it inadvertently exposes build system configuration details in the
> >>> binaries. This hinders binary reproducibility, as the output will
> >>> vary if the build environment changes.
> >>>
> >>> This change was originally submitted to the linux-yocto-dev kernel [1=
]
> >>> to address binary reproducibility QA errors. However, the fix is gene=
ric
> >>> enough to be applicable to the mainline kernel and would benefit othe=
r
> >>> distributions as well. So proposing it here for broader inclusion.
> >>>
> >>> [1] https://git.yoctoproject.org/linux-yocto-dev/commit/?id=3Df36faf0=
f9f8d8f5b4c43a68e5c6bd83a62253140
> >>> ---
> >>> Changes in v2:
> >>> - Corrected author id
> >>> - Link to v1: https://lore.kernel.org/r/20250523-binrep-v1-1-c3a44651=
8847@oss.qualcomm.com
> >>> ---
> >>>   drivers/gpu/drm/msm/registers/gen_header.py | 8 +++++---
> >>>   1 file changed, 5 insertions(+), 3 deletions(-)
> >>>
> >>
> >> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>
> >> Rob, WDYT?
> >
> > I'm revisiting this one, in the context of trying to re-sync
> > gen_header.py with mesa.. but it is only changing the contents of
> > comments, so it's not quite clear to me how this ends up mattering for
> > binary reproducibility.
>
> The reason it matters is that for Yocto, the generated header file is
> identified as a file that needs to be installed into the sysroot.  All
> files going into the sysroot are checked to make sure they do not
> contain dates and/or paths to the build directory contained within.
> Since this is a generated header file that is included in the sysroot we
> needed to strip out the path and date.
>
> The idea for the reproducible builds are that the same files on a
> different a machine at a different time should produce 100% identical
> files.  Including paths and dates violates that tenet.
>
> Hope that helps explain why we needed this.  So long as the
> gen_header.py is being called to generate header files then we need to
> maintain the reproducible aspect.
>

My plan is (was?) to just replace the entire comment header with simply:

  /* Autogenerated file, DO NOT EDIT manually! */

That said, I'm not entirely sure why these files should get installed
into the sysroot?  I'm not super hands-on familiar with Yocto, so
maybe there is a good reason.. but if there is, maybe the plan to
remove the license/etc from the comment header isn't such a good idea
after all?

BR,
-R

>
> > That said, since the generated files are no longer checked in to mesa
> > or the kernel, we could probably just drop all of this if it mattered.
> >
> > BR,
> > -R
>
> --
> Ryan Eatmon                reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.  -  LCPD  -  MGTS
>
>
