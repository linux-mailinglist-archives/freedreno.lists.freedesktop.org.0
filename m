Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E886CB4998A
	for <lists+freedreno@lfdr.de>; Mon,  8 Sep 2025 21:14:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 301C210E1F4;
	Mon,  8 Sep 2025 19:14:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FS3rFM4T";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0F7910E1B2
 for <freedreno@lists.freedesktop.org>; Mon,  8 Sep 2025 19:14:11 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588GrNmo030846
 for <freedreno@lists.freedesktop.org>; Mon, 8 Sep 2025 19:14:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=vJousEWyIWj0ub4ZHn6o3Sl6CyGPUwpGa21aRKVc7Yk=; b=FS
 3rFM4TMjv6TCTt1jOjiOlisYyipDiwXSs3XP3nY+uIy+Wv0IScJlR79HTz07MCoX
 Vhi3UqI9HWugk11YV4T6BRdEqYprXSpnLeNVETFcq+NDAEj/6tekTanodfxZBdUx
 UjnFxc3CrYknR3fhLOI30aWVxh2hz7E8tBORhfQLFr5dMsNNC5xxu03kAIbX7uq5
 auogqTpTIYAoECF2qqwLaSHI5yBfx4X5+mHT6rxPXaeYjnXvqCMjbsXEQcrOdx5B
 yAjwite7w03kt/qEymz1bZnPAKU/nV3K4ATSuJSL8iBWertH/A6ufUkCpbhjlEAi
 qsse2VIsiz2tdp2slpZw==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aapdyh4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 19:14:10 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id
 586e51a60fabf-3253fdac880so5941424fac.0
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 12:14:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757358850; x=1757963650;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vJousEWyIWj0ub4ZHn6o3Sl6CyGPUwpGa21aRKVc7Yk=;
 b=ULn0/31lHj+wOdokt2E2FxkzDt0kAM1COeJ5mBeqz9Wa/Xh5k3d1LPSUoBj1FAFa4W
 c1Wx3CWJQBYKFlQVhp2Cn/BvEGc7hiPbAJya0zu1PFeYIPnrWCFOLUd2/4Vb9efSmCZB
 uR6pj/TCXI7SyfdhdiM55iqW9AOAkib5THuNA6G5UE7SQ+WJ+ZEXSmie51B+bbDLOvpv
 6LwwC2A+2WTfgIT28Mw3aaXBGKflvAYRGJqofULAIHsS5As/F8rVkaepUjV5Fz7ys2Ts
 xLkAVk8tkZdde+h6tfo5QlFAac3qB2kqMu5/+3igc4UoT7IkyZm72DzAiru5eyP8skF0
 75sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGwlgpDzxhFTiLdLqKh5vUmDUpv0RZgaOGo6e/gvzU4aYd4uEMj8NRDiPAh9E9JcCBfdCa3rLONOs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8sKFDHwkH6x18gwQGvm1O38cd2vYl47hP1EEkCK0o7LRAagAb
 dwyVmurB+0PAaV1xh9rSA26eQS7jgqjVBMY+UmSfzYX5aXUAJ737I4YTgsK6r+poe6g1rVage0h
 9d0MsSnQVa/4j2O61imwv3k1mbxQCtWi4VSrrKVjhX6KfPIxycbr8GhlAUGuk1WizQzpXZ7qrTk
 Voe27yIIn4BqDg89NC2/SEIQUvTSqHMqIYrDPR2x3ta1p/Dg==
X-Gm-Gg: ASbGncsCqcmZDxxUM9D81fiSaIEt9BiM65cVz98CF21ButlReVgw2OsZWwCjTm6oiM4
 jIoMt6QDJpKM33lawTYG4OxdumvDi2wQ/Vkzrm8CjhwTXI7AEafsb9jxJNldPM5x4Poi/3xSxda
 +DGlYOrHCgaWKxnuTGKOI55e6bHImb3inWfCpJPM5/4w2wAGjq6Sgs
X-Received: by 2002:a05:6870:524d:b0:321:2b89:bbaa with SMTP id
 586e51a60fabf-3226284cc86mr4609085fac.6.1757358849629; 
 Mon, 08 Sep 2025 12:14:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGokMZ7QUqcfHUl38dF+DB2O10fwJWlpb3ZPwwVbBjH/HoiQE2yWgmsLyAzH2eSvGXvnd62ydkMLjA94QKHo7g=
X-Received: by 2002:a05:6870:524d:b0:321:2b89:bbaa with SMTP id
 586e51a60fabf-3226284cc86mr4609070fac.6.1757358849094; Mon, 08 Sep 2025
 12:14:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250524-binrep-v2-1-09040177218e@oss.qualcomm.com>
 <6mgmrqmixjdftpjz2hvwjnsyh3wwylxuaih7yez2mdgjpcp3l2@zjr4ai6kkjxn>
 <CAF6AEGvJnSiyUJvBPusBZ+mriiP_vRiAgZnTyLSseu8Sdf9PXA@mail.gmail.com>
 <51cdf832-95a2-47bf-bc27-d43097883701@ti.com>
 <CACSVV02YrpYrvbFxKc808a=GjdxVjO=FjRG9gs_6qe5W-v=a9g@mail.gmail.com>
 <858dea80-1bd6-4bbc-9b98-9f959c00b304@ti.com>
In-Reply-To: <858dea80-1bd6-4bbc-9b98-9f959c00b304@ti.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 12:13:57 -0700
X-Gm-Features: AS18NWD6PCBVVpU8xqhBnPcHvCAMvQ-KNt6NE47xv7XjxuR77RvPVN2COWfaD_s
Message-ID: <CACSVV027yBWLKaghuBnnGPg84W6RvrO=O+55ROx-SOeqTMbDGA@mail.gmail.com>
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
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68bf2b02 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=iGHA9ds3AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=sozttTNsAAAA:8
 a=pGLkceISAAAA:8 a=E82fJwX0KJD4OIwMoWkA:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: pJG5b6MRZxuUIX5ii-M8lkccw8RatFB1
X-Proofpoint-ORIG-GUID: pJG5b6MRZxuUIX5ii-M8lkccw8RatFB1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfX9Vn/PJdU8WKM
 /vwZcFTqP6Hh2efYgrYS+jS8AKjr8i82tVbmIjWMZBLnP16BI1NIfPXoVQl5aHAGYZp408b8HbM
 E8Mx7qUV7QriiEmv91k9dSGKE/qQpUecOsJtRXmYrqkARtW9RJ3xH4DXms2T0KEk5xowaRE2Nj1
 8ZJ497Cs1IOkaiMTVEHuoZFCkCoznbLw2qnHB030R9JIm+006MJMyy1Z5FbcXHP3amT+t8288Gl
 tBLRaruzDriQG8SzNXhebEApX42TNEhocAvMq9Tr9bgP0neFajWk5vxPMwHobOwR8jnd/L1j0BJ
 xmoZU8DErlGuCk6sfYHI/06RihE+F+jKFB3BSGCDFrRv13Eb2Igc6GRLt+EYjWpQvqQXAOCTk9Y
 trA/lepk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000
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

On Mon, Sep 8, 2025 at 10:59=E2=80=AFAM Ryan Eatmon <reatmon@ti.com> wrote:
>
>
>
> On 9/8/2025 9:19 AM, Rob Clark wrote:
> > On Mon, Sep 8, 2025 at 6:39=E2=80=AFAM Ryan Eatmon <reatmon@ti.com> wro=
te:
> >>
> >>
> >>
> >> On 9/6/2025 6:24 PM, Rob Clark wrote:
> >>> On Sat, May 24, 2025 at 10:15=E2=80=AFAM Dmitry Baryshkov
> >>> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >>>>
> >>>> On Sat, May 24, 2025 at 09:25:37PM +0530, Viswanath Kraleti wrote:
> >>>>> From: Ryan Eatmon <reatmon@ti.com>
> >>>>>
> >>>>> The files generated by gen_header.py capture the source path to the
> >>>>> input files and the date.  While that can be informative, it varies
> >>>>> based on where and when the kernel was built as the full path is
> >>>>> captured.
> >>>>>
> >>>>> Since all of the files that this tool is run on is under the driver=
s
> >>>>> directory, this modifies the application to strip all of the path b=
efore
> >>>>> drivers.  Additionally it prints <stripped> instead of the date.
> >>>>>
> >>>>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> >>>>> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> >>>>> Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.co=
m>
> >>>>> ---
> >>>>> The files generated by gen_header.py include the source path to the
> >>>>> input files and the build date. While this information can be usefu=
l,
> >>>>> it inadvertently exposes build system configuration details in the
> >>>>> binaries. This hinders binary reproducibility, as the output will
> >>>>> vary if the build environment changes.
> >>>>>
> >>>>> This change was originally submitted to the linux-yocto-dev kernel =
[1]
> >>>>> to address binary reproducibility QA errors. However, the fix is ge=
neric
> >>>>> enough to be applicable to the mainline kernel and would benefit ot=
her
> >>>>> distributions as well. So proposing it here for broader inclusion.
> >>>>>
> >>>>> [1] https://git.yoctoproject.org/linux-yocto-dev/commit/?id=3Df36fa=
f0f9f8d8f5b4c43a68e5c6bd83a62253140
> >>>>> ---
> >>>>> Changes in v2:
> >>>>> - Corrected author id
> >>>>> - Link to v1: https://lore.kernel.org/r/20250523-binrep-v1-1-c3a446=
518847@oss.qualcomm.com
> >>>>> ---
> >>>>>    drivers/gpu/drm/msm/registers/gen_header.py | 8 +++++---
> >>>>>    1 file changed, 5 insertions(+), 3 deletions(-)
> >>>>>
> >>>>
> >>>> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>>>
> >>>> Rob, WDYT?
> >>>
> >>> I'm revisiting this one, in the context of trying to re-sync
> >>> gen_header.py with mesa.. but it is only changing the contents of
> >>> comments, so it's not quite clear to me how this ends up mattering fo=
r
> >>> binary reproducibility.
> >>
> >> The reason it matters is that for Yocto, the generated header file is
> >> identified as a file that needs to be installed into the sysroot.  All
> >> files going into the sysroot are checked to make sure they do not
> >> contain dates and/or paths to the build directory contained within.
> >> Since this is a generated header file that is included in the sysroot =
we
> >> needed to strip out the path and date.
> >>
> >> The idea for the reproducible builds are that the same files on a
> >> different a machine at a different time should produce 100% identical
> >> files.  Including paths and dates violates that tenet.
> >>
> >> Hope that helps explain why we needed this.  So long as the
> >> gen_header.py is being called to generate header files then we need to
> >> maintain the reproducible aspect.
> >>
> >
> > My plan is (was?) to just replace the entire comment header with simply=
:
> >
> >    /* Autogenerated file, DO NOT EDIT manually! */
> >
> > That said, I'm not entirely sure why these files should get installed
> > into the sysroot?  I'm not super hands-on familiar with Yocto, so
> > maybe there is a good reason.. but if there is, maybe the plan to
> > remove the license/etc from the comment header isn't such a good idea
> > after all?
>
> The generated header files would be part of a linux-headers package that
> would be needed to build other packages as part of the distro.  And so
> the header files are all checked against the rules.  A linux-headers
> type package is common for distros to have available.
>

These headers should only be used to build the kernel, they are not in
include/uapi and as such should not be used for building any other
userspace package (or out of tree kernel module, for that matter).

BR,
-R

>
> > BR,
> > -R
> >
> >>
> >>> That said, since the generated files are no longer checked in to mesa
> >>> or the kernel, we could probably just drop all of this if it mattered=
.
> >>>
> >>> BR,
> >>> -R
> >>
> >> --
> >> Ryan Eatmon                reatmon@ti.com
> >> -----------------------------------------
> >> Texas Instruments, Inc.  -  LCPD  -  MGTS
> >>
> >>
>
> --
> Ryan Eatmon                reatmon@ti.com
> -----------------------------------------
> Texas Instruments, Inc.  -  LCPD  -  MGTS
>
