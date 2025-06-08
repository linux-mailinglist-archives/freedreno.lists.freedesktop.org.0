Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11066AD125E
	for <lists+freedreno@lfdr.de>; Sun,  8 Jun 2025 15:01:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9C0510E1A0;
	Sun,  8 Jun 2025 13:01:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hM2APRJy";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 043B610E041
 for <freedreno@lists.freedesktop.org>; Sun,  8 Jun 2025 13:01:33 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5589QJDh018725
 for <freedreno@lists.freedesktop.org>; Sun, 8 Jun 2025 13:01:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 83rMQCVF+5IDe8SlFKw1Sm6kmNfLPYOW0teW2Gpgxag=; b=hM2APRJyBxpJMy0Y
 PqJXpzXxSdzlhpS26nv9g3B0UY/AwolF7gfmLl371fX2IZ5cgo0TCLwT5isxuE4Q
 PLhTFZEFnVeszPzZ+Q1s5AXB0DIY9xTM52Kj2XyrQ7xoIhQjLTzAvkTXZ34IV3Ju
 4m3Y3dVg2ShXE7lGl7BMz4SYmL1dd+h4jOI47sJLNl2mxnQaJ9Vw0lXqnYCelt3R
 5cuixI44UclEKNBRlQ19lX7bD85m31xEh/05cO7Bqy4u1xv0YWyk/WspNE68vuI4
 kWqyJktwB3cQLWXg6LnSuOdDTQWsHV9wP8yaJ2IE+SHJ4Fe8ex9QEJYs9SLFQqUc
 5XJHVw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dt9jvg6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 08 Jun 2025 13:01:33 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id
 a1e0cc1a2514c-87ee00189c5so22783241.1
 for <freedreno@lists.freedesktop.org>; Sun, 08 Jun 2025 06:01:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749387692; x=1749992492;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=83rMQCVF+5IDe8SlFKw1Sm6kmNfLPYOW0teW2Gpgxag=;
 b=Nu72l5kB0U2Nm3SqsGe2n5BlcC7RJ6CDe+SjUmCXpy2H8YOiNMUvLHO67dPgZMUCvu
 YiDjAsiw8el27gpCU0qdPI0825rI7+EvNsPVSkiV+vI17RBSWOEnAeQNDaLWII9anaa4
 WfVZIWhE5YW4onWPH2KOskbxQZUy4qeOuRmv2MNr3+VHx00xBsRwZvGm2A4/TnfiwrgG
 uHOqTEWkf8CH8i+078CG6AcuXfYdN2xY9YbUn6kUZI4qkoScFbVjZpI57OBargrwpK+u
 MLPq9OZw230cG15dql77uoDaLj+DnVb+Zo5uiXV5AIeZjAfzNTlR5KpWsI90PjZJzBrl
 J9sA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsrsPmQ7wqlJXuGD2SsUzzxwypEGuRZcaUA7/F5Thuj5Xtrl7ZLxaZ4A05VzMPcRYU/w46klKRmpY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzeJqiP8GZCyQod5janJoIlWP28Wuu/VE4RfNgYceYxd0OU7iZA
 r32iacE+BFxT8aXefQHBd5c6xBdixkx50S0wEjpncdsNsxa3cIkanzPSFD1LnJzrHauxF2u0fPw
 w7XBxDTLNxiS2qPbbYKVaV2SDACcbTlmF98wYlF3hpf51G2x1wtZCfuqurKuwoLoiA597OcM=
X-Gm-Gg: ASbGncu50FUUdhnaG9FLW6hUHTcWdMh/DY7knIMyRQWClTytXQEdPT0iDuG8//NQ7jS
 9fmyqECwhcdRLjrVHS+MVUoj/NKXnXhI6w99cXYLCqI1FwKFwLojhqq2mgBJaqsfYwho2p57rhz
 FtoQtTD6pjVbXz9QdbutfnRUP4F6/sD+JBjAZ6DKRm21EUUml5YNwbwYePpQZAWo39vR4UukYMI
 vURxo3qGgflMhz/TzuA3XYuWYCYqoiYbuQ8g3CZz/hNma7M7GvUBrQRA/9Y5vaUWHuJnhO5GS9J
 jME52eZLqqkF2Ge8Wr1qHHrbjCen5HjjS4E9Q69MAz2yeP4mSLE5b3kNm9Gr5MOAQ9otKgH6Mz4
 =
X-Received: by 2002:a05:6102:2429:b0:4e5:8cf0:8881 with SMTP id
 ada2fe7eead31-4e7841501d9mr2280629137.9.1749387692197; 
 Sun, 08 Jun 2025 06:01:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAG6HcPqe+MgCFYZJUxIPkKKrruQbJNIh+aB/CzHW4ZawMXDG40gTMBIHM+z8HcVgbbJF5/Q==
X-Received: by 2002:a05:6102:2429:b0:4e5:8cf0:8881 with SMTP id
 ada2fe7eead31-4e7841501d9mr2280546137.9.1749387691820; 
 Sun, 08 Jun 2025 06:01:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553676d00e2sm774355e87.42.2025.06.08.06.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jun 2025 06:01:30 -0700 (PDT)
Date: Sun, 8 Jun 2025 16:01:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 10/12] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
Message-ID: <eavjcf6vkks2e674xhcyqpdp4yhztcbw2ofrbze3ksxsrazhyh@nvu6ifpaj3hx>
References: <20250603-v6-15-quad-pipe-upstream-v11-0-c3af7190613d@linaro.org>
 <20250603-v6-15-quad-pipe-upstream-v11-10-c3af7190613d@linaro.org>
 <dsgnmzswhpht4bewf5wld774riqxffojboujxdf4smutuzmuye@ugyhzv6m7mve>
 <CABymUCPqypTPh=Ao9PN44eq2_TXODhHd3EtSDeG+J0DcXQN6Eg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCPqypTPh=Ao9PN44eq2_TXODhHd3EtSDeG+J0DcXQN6Eg@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=KpNN2XWN c=1 sm=1 tr=0 ts=684589ad cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=sWKEhP36mHoA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=CD96AAi2pJaqMmpRfg0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 7_8_vB4mlvhnr6HuNH3MwPYixT5_U6wO
X-Proofpoint-ORIG-GUID: 7_8_vB4mlvhnr6HuNH3MwPYixT5_U6wO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDEwMiBTYWx0ZWRfX9NE4aTKeXzgv
 CeFOG0zAeqgvJXrq229jOigRfRcYnZJvPQe6hCSBtG8I61Egrgfi5brSpH//MDoNSJE9Vye0pfk
 shjVbR85QI8u6g6alHIGxphLGRLrLdlVJEeSGLZ5wgAxrOAve6akSpGJQwJdvChh71vmYBYVBe/
 oUAkH/kHmemY7S/eSqjwTxoLdmh7lvVgz6VAVhsfMGz/X4+652t7AOI6suMdQwSJdfvKY1eWKsL
 SKZHn8FC45sLIyLlnRrM3vOzJfrm//WWfwwGKmUXknWDkKcTP8kxLIMw+6DN5hE8FP9tGmyBE8Y
 rHzjFBGWY1ue9yvrwgkUwHV2shgKtMsWLpKdNR7ZWYiT8JfYBj6CNMm2HELFnJsq9/JsM8CuZ4I
 cWB9L2oWDd7rDCGh1qoVGzRIGFyETygkr6yTArFcg1D+JXX1GT41josjTXk7bTdNuYTQgaHR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 spamscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506080102
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, Jun 03, 2025 at 10:37:37PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2025年6月3日周二 18:21写道：
> >
> > On Tue, Jun 03, 2025 at 03:10:09PM +0800, Jun Nie wrote:
> > > Currently, SSPPs are assigned to a maximum of two pipes. However,
> > > quad-pipe usage scenarios require four pipes and involve configuring
> > > two stages. In quad-pipe case, the first two pipes share a set of
> > > mixer configurations and enable multi-rect mode when certain
> > > conditions are met. The same applies to the subsequent two pipes.
> > >
> > > Assign SSPPs to the pipes in each stage using a unified method and
> > > to loop the stages accordingly.
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 148 +++++++++++++++++++-----------
> > >  1 file changed, 94 insertions(+), 54 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > index 0bb153a71353ca9eaca138ebbee4cd699414771d..501b6a1bad4a1fee832f15efa7caec136a669da5 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > @@ -961,6 +961,33 @@ static int dpu_plane_is_multirect_parallel_capable(struct dpu_hw_sspp *sspp,
> > >               dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth);
> > >  }
> > >
> > > +static bool dpu_plane_get_single_pipe(struct dpu_plane_state *pstate,
> > > +                                   struct dpu_sw_pipe **single_pipe,
> > > +                                   struct dpu_sw_pipe_cfg **single_pipe_cfg,
> > > +                                   bool config_pipe)
> >
> > Could you please describe, what does this function do? Why is it
> > returning the pipe or configuring a pipe?
> 
> It search all pipes. If there is only one valid pipe, return it via
> pointer and function returns true.
> If the config_pipe flag is set, multirect_index and multirect_mode are
> also initialized. See below.

This doesn't look like a description of a single action. Please don't
try to mix different actions into a single function.

> >
> > > +{
> > > +     int i, valid_pipe = 0;
> > > +     struct dpu_sw_pipe *pipe;
> > > +
> > > +     for (i = 0; i < PIPES_PER_PLANE; i++) {
> > > +             if (drm_rect_width(&pstate->pipe_cfg[i].src_rect) != 0) {
> > > +                     valid_pipe++;
> > > +                     if (valid_pipe > 1)
> > > +                             return false;
> > > +                     *single_pipe = &pstate->pipe[i];
> > > +                     *single_pipe_cfg = &pstate->pipe_cfg[i];
> > > +             } else {
> > > +                     if (!config_pipe)
> > > +                             continue;
> > > +                     pipe = &pstate->pipe[i];
> > > +                     pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > > +                     pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > > +                     pipe->sspp = NULL;
> > > +             }
> > > +     }
> > > +
> > > +     return true;
> > > +}
> > >
> > >  static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
> > >                                      struct drm_atomic_state *state,

-- 
With best wishes
Dmitry
