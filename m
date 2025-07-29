Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 941E8B14E88
	for <lists+freedreno@lfdr.de>; Tue, 29 Jul 2025 15:40:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68CC810E1FC;
	Tue, 29 Jul 2025 13:40:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="k67GQX+y";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7D7610E1FC
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jul 2025 13:40:14 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T7vwlG001568
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jul 2025 13:40:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=HLQ2yUgG0gFIFURD76i4Mqz/jV+uThgccL9ep7CGuxI=; b=k6
 7GQX+yLg6ftc4AUhslhPJ/bzpJSeGBK4cIhSIKmHQGil9vtARXhgDZPJGxMXmuGC
 sMY4lnFuSjZYQ+aiYIUjngUi9JtW7pYQWU02fvjE6jEoDzl5cg81WjIsX7iNK5Zv
 WLvHBSRBgiEIhzdZk+hVclfIs4vcwqsYwZq95ij0m4/+BnURhjslpGP/ym5ykHNi
 Y35ut2bmqB+JCIZP2lYWPTPCC44T0r9PSrmhDvScS/8IUaLGxhNCjbdnlgNtK7lr
 3CIvauZabbUGs1vauPChnIkCdlOr+FKV5XbuFw6ZuPZWph6pVFTt9B51PkRxXLYO
 WgneYO33PsSnS3ixK1jw==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pm2g65y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jul 2025 13:40:13 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id
 5614622812f47-41b2182bc54so6932055b6e.2
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jul 2025 06:40:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753796413; x=1754401213;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HLQ2yUgG0gFIFURD76i4Mqz/jV+uThgccL9ep7CGuxI=;
 b=k5I/LA1uVyGD6v/lWbDrzp6tjJOe6yXiFBJ/47GTA+qfShKFB9kfvGN8LasR/FIWdO
 u3cAOtnUCILMuql1HkQ52AD3ASZ0fRmFOSM8oUAIdAwxzAf2dUH7F3Jd/kknR2rG2/I/
 ZH4Bwa1IW8ECcfYRWUZ9OShqHpK/GSIhwdDzfXv50TlAEpjR4/nBDT7ww4XCiagtfM0o
 92OYjoyW7WtB2EMFULO0QMAzkmGMPRak3uJeejXSZ5zNrrqis0AsOOqP4aZ1ECSpMnUN
 lDXnV/CIAuTwANdipG0MMkCF59WhXAglBc7t4BeFMCcVIdKZ/xUF+5CqbJMMpy3A2AIQ
 2C3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAsfHZJsGJ8qwa1wb2Im5PtQr2j8TpuJX+ZgiNtiWOHau+hefkPXDy1jaTR6ZUU3mOl0ZYevcipkI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyj2rbmLKMkTc4QpwBXhhn/OY1Coccc2It2F2m5H3qx2J4pC9In
 uZ6TivO2/YrRQv/g5u4Tcyr2ZF2GOU7jYLirrtXITClEL0rhYbgrGKmWc82pNNGAp1EcSeoPwh5
 TV2eFsnzAUvjHPf6JlSkELSVabiBRIs2I2qJsmzXXi2sSDso164WgpHuClA7knULYq94VwfQnVo
 nUAwOIT6f57zjXK3eEH9rtjFnCHtfP3Fh2sXnULKJ1+tJ9mg==
X-Gm-Gg: ASbGncsVgq8xNS7+0xL6xn9qpZUix+sxp9I0cbriHGTRwud+cKSEVjJrrfANWFykx1o
 T/JxWWNzc7bHgVlj2qYG3a/1ZhBQDEkJ0kJMXDymnHW1pKO1470o4s+BT/EgBegmm1bRg8QyiGd
 eXHCmsyjNUm4DobDVjr0RBs5JNgVNw6OgADit6KoXyGBgJXW5gNeL0
X-Received: by 2002:a05:6808:6801:b0:404:dad4:f971 with SMTP id
 5614622812f47-42bb972a2e3mr9290685b6e.33.1753796412961; 
 Tue, 29 Jul 2025 06:40:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqf4clMcdqT5vWJ+nvIVIeCHsaCdP9DQ2Xz98Wpurg/ABYUj+EgAD19sV+SQb892Lv/ifuAOnr9etFXbN2drw=
X-Received: by 2002:a05:6808:6801:b0:404:dad4:f971 with SMTP id
 5614622812f47-42bb972a2e3mr9290665b6e.33.1753796412292; Tue, 29 Jul 2025
 06:40:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250728203412.22573-1-robin.clark@oss.qualcomm.com>
 <20250728203412.22573-2-robin.clark@oss.qualcomm.com>
 <CACu1E7F=Y2oKfiWtD0VYfmLkL24e7JrZYMt8dmoGW7zrq7bd2g@mail.gmail.com>
 <CACSVV02W28L0MS32J0n1PTpEsaq_6RxEPgb_6y6G=6TryGEPQw@mail.gmail.com>
In-Reply-To: <CACSVV02W28L0MS32J0n1PTpEsaq_6RxEPgb_6y6G=6TryGEPQw@mail.gmail.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 29 Jul 2025 06:40:01 -0700
X-Gm-Features: Ac12FXx6wa3mBL8aH-OOfMIc4b5Q0MeA9kQw7eyuD2mIfr3Ns8qFmq3Be1tUb5g
Message-ID: <CACSVV02DLSM2dHUj4MiPpogF3pgjk4ex5=9_P2AKdGmtx4bd=g@mail.gmail.com>
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
X-Proofpoint-GUID: av1U3HQATGB-7HnnpWRVGLKLjDgg8ADb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDEwNCBTYWx0ZWRfX2KIEi0OCJPaB
 sFVoebg/ZpOw0EZ9nde31vXayxp2NTfsC13c2GB7ylHjflkHV/4WdFFIOijvquYy7iX1B1UKP+E
 AwD+A3JFHKbBvUIPEaaAJulGUTo3P66DULVgA7EmuqN+vSCgep0jnJunNDfoIuTnrB0xN2H25J3
 wGTNRd+N/Kl0efDX0ZhyVuwiVfC/ZfaL56zRZ3DCGxf1APc9qWdOEtI+7HWSeEU0QrhuJi6IhlQ
 XnAu2OXzqmQfG7dhvwgl9sXCtWRZiNwAWfBk+M+YOpazyVl68Fs6VRbssKGjz2joVB80lRZto+H
 u79fHwnQLgpOuREx8a2Uma2j33AkgyxB3K1CbVaRuDhCuWiUwUPb+yrBOFgjQEpXDf/9MuGXLwb
 6UqiIPC9y4WtMj3etRDFIwcm5XKhiN5AbwEQAYYPG4fn+ckln5/t+S8I0jP83TMnoUFuXsnS
X-Authority-Analysis: v=2.4 cv=HfYUTjE8 c=1 sm=1 tr=0 ts=6888cf3d cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=0I_rIkXGDByXq9DAmH4A:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-ORIG-GUID: av1U3HQATGB-7HnnpWRVGLKLjDgg8ADb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507290104
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

On Mon, Jul 28, 2025 at 3:15=E2=80=AFPM Rob Clark <rob.clark@oss.qualcomm.c=
om> wrote:
>
> On Mon, Jul 28, 2025 at 2:04=E2=80=AFPM Connor Abbott <cwabbott0@gmail.co=
m> wrote:
> >
> > On Mon, Jul 28, 2025 at 4:43=E2=80=AFPM Rob Clark <robin.clark@oss.qual=
comm.com> wrote:
> > >
> > > This is needed to properly interpret some of the sections.
> > >
> > > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > > ---
> > >  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gp=
u/drm/msm/adreno/a6xx_gpu_state.c
> > > index faca2a0243ab..e586577e90de 100644
> > > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> > > @@ -1796,6 +1796,7 @@ static void a7xx_show_shader(struct a6xx_gpu_st=
ate_obj *obj,
> > >
> > >         print_name(p, "  - type: ", a7xx_statetype_names[block->state=
type]);
> > >         print_name(p, "    - pipe: ", a7xx_pipe_names[block->pipeid])=
;
> > > +       drm_printf(p, "    - location: %d", block->location);
> >
> > We should probably at least try to keep it proper YAML by indenting
> > everything after another level...
>
> this made me realize I missed a \n... but otherwise I think the indent
> is correct?  Or should location not have a leading '-'?

beyond that, even without the added location field, some random online
yaml checker is telling me that we were already not proper yaml.. so I
guess, :shrug:?

BR,
-R
