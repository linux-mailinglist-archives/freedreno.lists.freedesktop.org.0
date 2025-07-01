Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 118C9AF044E
	for <lists+freedreno@lfdr.de>; Tue,  1 Jul 2025 22:08:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5116610E653;
	Tue,  1 Jul 2025 20:08:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="j46g3jw/";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3404010E653
 for <freedreno@lists.freedesktop.org>; Tue,  1 Jul 2025 20:08:35 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561BxKuK029895
 for <freedreno@lists.freedesktop.org>; Tue, 1 Jul 2025 20:08:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=SBwuim71xsjKrmppSOuCTBnyW8diNS3nOYNdmIZw7yQ=; b=j4
 6g3jw/rSNac83Vw5OqjizwBTJSGIxKQuZ7w3pnOTNCo7pLgX2acd//rDyrjkoh5V
 pspMxnT/sGf0AcrdfQIgo+/dv7Fzy0LwYZpdbRrMAmKjsL8d5t7Dee0Y3ER0UT+N
 K1MKYhKu1HeSeH8SwpdT+HImUAh1EHNxeMzhht+6jXk/xo3pJ+X9MirXq35GbTip
 sCWHaCr46ad92JHzbNIkvtOu0iGTQrrKZ1rNqtd1Y6LvztCsVfx4H+SkaiYpLimN
 2Qli46Ngn7QQ4Kb3XAiiRLrAlxoQ5kdXWUygBUHYD++4ROIObq+68LowLDDSJXr+
 xqFLh3KlAIOQc3ELh8ag==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47m02v47b0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 01 Jul 2025 20:08:34 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id
 5614622812f47-40b0a248ce8so3445265b6e.1
 for <freedreno@lists.freedesktop.org>; Tue, 01 Jul 2025 13:08:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751400513; x=1752005313;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SBwuim71xsjKrmppSOuCTBnyW8diNS3nOYNdmIZw7yQ=;
 b=Uy7/rP6+d/GreJXyJ8SJveMoLz+4blIdTl8EROmDMlQQ0ibIgzsMNi6UEM+pm7YQxI
 kmwZxwfn+fnXR/TeTbITMe8EuBLv2khez37ss9ZBLqLu7EjsLNEgoXmpIPttxJnKzkSB
 tPcyqAMJXg5N0Dj1K94ns2dQsk4EVdrbCGgFGKwK0H0m/cs5sDtETQnOjTWu86Y8qBYX
 A8RqVEUaE/PPpvhUgi+ZX4UrHnJqj1tEnKjafTx8JW/0HudxCYTksgs7+YjTTrGcbsrR
 5xssy2fgnwY43HHXk51VQGEpoqguCmUZn1GRk5CKpHYFlbNSvimsiNx3ngaypzLilEdO
 6Mmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnjeDjYVaIQ79tAN2FgGhY5QJLu71mRtqxgll77KZydGhI8yoMEP4H+nmB+4HxgoEV1BL6TfyyDsA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyL9ja7FGJP+3MIiLI/Wg33rlWM9gbyXqi+GdktGBPbQ4eIXY6y
 SELzyCaci4qQaB/rZeSiw0BPML9rIg+ndRzKqnezDQmrojzaqyIxR3VMjxNkZXbb+PdpiEnN46J
 Bch6n2gc00vhwI2kytHlAWVzybhCNwdturGx4XLFUUMm6rmr6XIwFgDvkuIeLAwDPHOiz9PrgPe
 +ADg0GeUfq3hapqPaeBa6/TEI2jGHyulBxoilEMOsrnhe8fQ==
X-Gm-Gg: ASbGncstfw9sB/Wy5E1nUThFTF2BxVe67cPW77p8acR3gqLRd7GnfWyPn5pUlvSQldP
 h/7kUT2x8N5QbXAoZN9E3WHgFWoksqrLiBXOqTyKKJdTI1pNLn6XOjOJ7y3nzTa6ta4hvVWCvEU
 4X0W8FGWsPARv8oSo9gzrHa0sPqxgv7XZs41M=
X-Received: by 2002:a05:6808:1692:b0:406:6825:da34 with SMTP id
 5614622812f47-40b887a1fa4mr41111b6e.16.1751400513049; 
 Tue, 01 Jul 2025 13:08:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTn8ar6KRE7VSflyhqGfSG2T9FoehvwwtG5pZ4XM05mL+wciurGhbrUT94vYFGe4aUoAWlNhJ+C3AxbpY9BTM=
X-Received: by 2002:a05:6808:1692:b0:406:6825:da34 with SMTP id
 5614622812f47-40b887a1fa4mr41070b6e.16.1751400512656; Tue, 01 Jul 2025
 13:08:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250623184734.22947-1-richard120310@gmail.com>
 <d040e32a-3519-434f-b6ce-1e63345b23c8@linuxfoundation.org>
In-Reply-To: <d040e32a-3519-434f-b6ce-1e63345b23c8@linuxfoundation.org>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 13:08:21 -0700
X-Gm-Features: Ac12FXxRhs58jxTt2spO1M6MN1lYbY9HfEItbXNYaAy8DhgQ6MfSeK4lduOTxIw
Message-ID: <CACSVV00YsGaKQZ-Tznb8maJbMih58ZRZEY_Ay3o=vtDXejOhtQ@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/msm: Remove dead code in msm_ioctl_gem_submit()
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: I Hsin Cheng <richard120310@gmail.com>, lumag@kernel.org,
 abhinav.kumar@linux.dev, jessica.zhang@oss.qualcomm.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, shuah@kernel.org,
 linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDE0MCBTYWx0ZWRfXwp9pqSKL3EwP
 EFY8B8tpazzFOht3+5drSdSDEHVtwfHwOWimZuXC9qZ1rJM1rSda3EcVpuS6W9H9Qvow8K61vQm
 508vAZnEhPYFbgNTpaBq5C9ogXkt0xGsaXK9uEIHEQxo9tx9sV2e9jqCBwTDL7fsnjDfNm25lD6
 TbQKzpueE9k7SCMhhVJhP7HZ5t69cXQ3juG+wtsC3p+aF96scyfl1lbMoik+Rr6pU4NvwbyZDON
 DPUgkf4tiFINVvNy5Z1Ed3wT+tidpsiRZTueP59SAjCFLzKJnuSeaUqlb65iv28w4B2xq/Uj9Dv
 kwFNyV8LSI/7PDVYQF7YEw+iq/W8zUfE32NObchgNouTQ6bRfj63fEb/Vrx/McqhK9PAgfwFMl4
 NO5tVgxgxbhQWYZBt9bxVQ4PLrgCdYbyBBZ/dZq+Hmug/n+bf58u22IKOqSKS+X6yeVq6rKi
X-Authority-Analysis: v=2.4 cv=Y8L4sgeN c=1 sm=1 tr=0 ts=68644042 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=6xGJIMmgAAAA:8 a=ag1SF4gXAAAA:8 a=pGLkceISAAAA:8 a=tHzW2L1M7Y5U8jh0s88A:9
 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22 a=aWz6Jz32kaLdCzdWRG-w:22
 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-GUID: CEXO3MHhp9Fti45c_4h1TF_DAEWW6gc_
X-Proofpoint-ORIG-GUID: CEXO3MHhp9Fti45c_4h1TF_DAEWW6gc_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0
 mlxscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507010140
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

On Tue, Jul 1, 2025 at 12:38=E2=80=AFPM Shuah Khan <skhan@linuxfoundation.o=
rg> wrote:
>
> On 6/23/25 12:47, I Hsin Cheng wrote:
> > According to the report of Coverity Scan [1], "sync_file" is going to b=
e
> > NULL when entering the "if" section after "out_post_unlock", so
> > "fput(sync_file->file)" is never going to be exected in this block.
> >
> > [1]: https://scan5.scan.coverity.com/#/project-view/10074/10063?selecte=
dIssue=3D1655089
> > Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
> > ---
> >   drivers/gpu/drm/msm/msm_gem_submit.c | 2 --
> >   1 file changed, 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm=
/msm_gem_submit.c
> > index d4f71bb54e84..cba1dc6fe6c6 100644
> > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > @@ -904,8 +904,6 @@ int msm_ioctl_gem_submit(struct drm_device *dev, vo=
id *data,
> >   out_post_unlock:
> >       if (ret && (out_fence_fd >=3D 0)) {
> >               put_unused_fd(out_fence_fd);
> > -             if (sync_file)
> > -                     fput(sync_file->file);
>
> Are you sure you want delete these two lines? It might not make
> sense to check sync_file inside if (ret && (out_fence_fd >=3D 0)),
> but it is ncecessary to fput.

fwiw, there is at least about to be a code path where this error
handling is not dead, once the VM_BIND series is merged

BR,
-R

> >       }
> >
> >       if (!IS_ERR_OR_NULL(submit)) {
>
> Check the error paths carefully to see if this is indeed the right fix.
>
> thanks,
> -- Shuah
