Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBB8B0D8DB
	for <lists+freedreno@lfdr.de>; Tue, 22 Jul 2025 14:04:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 143D810E669;
	Tue, 22 Jul 2025 12:04:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iHpK7gm0";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2F3C10E669
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 12:04:23 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M9gtGb025804
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 12:04:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +XG90C/um6yxXD5+3AqDRLT4qWkqNRjAHgyLRjePWmw=; b=iHpK7gm01yqL68ho
 w6aYJlpsBxQGMZxx07WGAIQDw6Pi1yVgXo2GVTyHu+NIzq2acs18/7n1qPRZaXmt
 EPOBGNJ/rey0N22VULsXpgGZGucedm6UabuVM4SN9EEm7B80jBpQKOU0nA1mUfwE
 lTKkLsGqehH1c8jqLamXg2h3Uy/X5LoauF1mRy9IQC3iKLXaJGGxfBRpdDtyu7/+
 GwQ2NPAuhTTGpp2oJ7pM5N+80YPNfmRv75DCSlTEugFwWdm79R7jfVHn06Tb0g0R
 u4tMjMVmeFV7gQaTXPjMzigGSuPBs3OKtpEY92SkuRzwN2YvqDTdJL+OVM/sjxpZ
 2XQvqQ==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048v7mx8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 12:04:23 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id
 5614622812f47-41b2182bc54so5194176b6e.2
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 05:04:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753185862; x=1753790662;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+XG90C/um6yxXD5+3AqDRLT4qWkqNRjAHgyLRjePWmw=;
 b=Zina87YikOKKr6BgZzx3Jkjcinh/Zh3Nr8V/6+xSHAj7t0pBGShiZ+CRCMdPOiXM3m
 EJaygGL1LHWaq1mF6ybTDxO6/VX2I9phWwGu2iemnubOuI4ZlYI3ZgytvVPGESKGm/xF
 s55VBPFWUDGnRIAxljn5LU6cOYzXkjEsk8UxnS8N2PN+f9BVZlWblaBQ4BLRNv3adSgu
 NDm/YW8OYgW4y4TUV+/nNI97VmZBwQTemWiqjtraD0BF9+YY/y1LdsHFNt3xWdTOgsUe
 Mg7HbRxJNFTvuxYE1d5xbFh9gpp31ZKf2SbY1kPjoAIzyjsITzJ88mbPNA9ho53vt6HM
 X9aA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7CYgWJVe5oz+vj5HFWZPcU9+8wIBcDnglsz9zdh/Y39Ljrn5ho/RPeoKhgGVVSrpAy3h7auRL4Mw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3Y7OyY+jJqq5V9mqPc37u3JfQ/wVGVG8aKsgtoxgsoRDt5iDI
 NnAOSHZI6sgrGJhw3ShpAf+UHrX5EmRiXq+jo0IBaOcOU8rI4DLU282EZ8GM0BasIca99wJh03G
 GEB1GXglCJpA+vDxyqeKM9W4rzndEv3Nlk5AchynXVG6rZOWJfMn9xHf63ano/j8IUALwy8I=
X-Gm-Gg: ASbGncsnonGHQdPiO2SevyK3ONX+er97myyI9M6KVoQkYI1hEr/CfiSMSMjitUGk0SA
 dj+WXRQa5jrSkpYG3egcnaWYj5QLGMFryPKnANgnGnN9S4+I8NgnhC8VCsnpmIPb253wG7abht4
 rSwPS/3PIsZSgDCImXMdjOKzG/1fQS422LQ4iAIR+9fnq6RYlzBqcjrvtlZLmAeGBMn/ssP1sFK
 z+McH2BLRHsbgojk9sFn81C7ome08NANj63JzrahdN50jg8EOnKHah3UZapnSaBM6usmj9PbBMP
 Pi1rzdKbjLMT+11g5JG5i0YcXehSj7A5mt9h60zJOw2Kjky3frcrqNwwaJbozuPyJP1klFzvlBh
 1RlU59YVRhOpfXpRC5HPh+21VCcbth7sP9TbCw/ur4gxCUgsFA9FW
X-Received: by 2002:a05:6808:2384:b0:407:59ac:d73f with SMTP id
 5614622812f47-41cefe09d5cmr17438873b6e.21.1753185860634; 
 Tue, 22 Jul 2025 05:04:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtOpeAIrEejTxoISQ16qIfCCckK6NW452J8VXPtxZ/pM+GeGglMjw99eFXvizXAXL3yitDqg==
X-Received: by 2002:a05:6808:2384:b0:407:59ac:d73f with SMTP id
 5614622812f47-41cefe09d5cmr17438811b6e.21.1753185860015; 
 Tue, 22 Jul 2025 05:04:20 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55a31d7c6dcsm1937261e87.101.2025.07.22.05.04.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 05:04:19 -0700 (PDT)
Date: Tue, 22 Jul 2025 15:04:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 10/12] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
Message-ID: <bxual3dbzffgbe6vziwumaqpyxrnjbvnljy2pg2o5mtgixufbm@mjvg5em2xklf>
References: <20250707-v6-16-rc2-quad-pipe-upstream-v12-0-67e3721e7d83@linaro.org>
 <20250707-v6-16-rc2-quad-pipe-upstream-v12-10-67e3721e7d83@linaro.org>
 <khu6gwzn7gulubwoshdutl4d2nu3c6exnkv4cimjljc5wbxf7l@ho4gxsolq3hn>
 <CABymUCPhjugvyQ2KQabjTn3XNEDRSnQgRX5te-tHKT8hBLPdMQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCPhjugvyQ2KQabjTn3XNEDRSnQgRX5te-tHKT8hBLPdMQ@mail.gmail.com>
X-Proofpoint-GUID: H4mNCJzl6lvDv4QbKP9XXZp02WR-UnTb
X-Authority-Analysis: v=2.4 cv=SYL3duRu c=1 sm=1 tr=0 ts=687f7e47 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=sWKEhP36mHoA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=S6PJxlnTzXtoPlSZMcIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA5OCBTYWx0ZWRfXxS1mIi4eX4N1
 GyHzJCYud/AUuhHMkTrCaOlM96UOBFIhe1nEIJL0tmedfzek0FMLIrJLAA9WYIr0MiBbFtT3cNA
 5q7lK9Ub8Az31sSkZRX55JAdTUPS0ShhG2mMM6oWQXQTHt0sClpnMqw2IKpzCk6zM4rRyk+w+5W
 lTvqyt1/fb6j8FRlVwO/esj85h2EuBgJa8spgk3f9NY++aS395SIDBFrql2D2m8caS+TghhxIbx
 GSn0K5T9hfdD/cg6uPMlIkb+9Zfeb7lna0KsWUmGjQ0Sjawg5/lby5WWCg910XW9xS+IwKDwR4l
 o9w04MnUqUFLY2LmU98VejRLyKZHZqbAVAnl6/v1I+QQodUzDU3KMxVXuZEs7YdTd/pxU3JpQlg
 Scp8nKhR8aiae4N7LbyDNIgxSg9gk8YIYafdDmmzY6mB6lvCVqdinZqUqLg7V68Clghc3Gws
X-Proofpoint-ORIG-GUID: H4mNCJzl6lvDv4QbKP9XXZp02WR-UnTb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220098
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

On Mon, Jul 21, 2025 at 04:06:13PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2025年7月19日周六 18:09写道：
> >
> > On Mon, Jul 07, 2025 at 02:18:05PM +0800, Jun Nie wrote:
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
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 143 +++++++++++++++++++-----------
> > >  1 file changed, 89 insertions(+), 54 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > index 149e7066480b07f9f6d422748d89ffd6f9416f33..ecfebf7a2406d65930075cc2a4b8a8a7d40b3d3c 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > @@ -954,6 +954,30 @@ static int dpu_plane_is_multirect_parallel_capable(struct dpu_hw_sspp *sspp,
> > >               dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth);
> > >  }
> > >
> > > +static bool dpu_plane_get_single_pipe(struct dpu_plane_state *pstate,
> > > +                                   struct dpu_sw_pipe **single_pipe,
> > > +                                   struct dpu_sw_pipe_cfg **single_pipe_cfg,
> > > +                                   int *stage_index)
> > > +{
> > > +     int stage_idx, pipe_idx, i, valid_pipe = 0;
> > > +
> > > +     for (stage_idx = 0; stage_idx < STAGES_PER_PLANE; stage_idx++) {
> > > +             for (i = 0; i < PIPES_PER_STAGE; i++) {
> > > +                     pipe_idx = stage_idx * PIPES_PER_STAGE + i;
> > > +                     if (drm_rect_width(&pstate->pipe_cfg[pipe_idx].src_rect) != 0) {
> > > +                             valid_pipe++;
> > > +                             if (valid_pipe > 1)
> > > +                                     return false;
> > > +
> > > +                             *single_pipe = &pstate->pipe[pipe_idx];
> > > +                             *single_pipe_cfg = &pstate->pipe_cfg[pipe_idx];
> > > +                             *stage_index = stage_idx;
> > > +                     }
> > > +             }
> > > +     }
> > > +
> > > +     return valid_pipe == 1;
> > > +}
> > >
> > >  static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
> > >                                      struct drm_atomic_state *state,
> > > @@ -1021,18 +1045,23 @@ static int dpu_plane_try_multirect_shared(struct dpu_plane_state *pstate,
> > >                                         const struct msm_format *fmt,
> > >                                         uint32_t max_linewidth)
> > >  {
> > > -     struct dpu_sw_pipe *pipe = &pstate->pipe[0];
> > > -     struct dpu_sw_pipe *r_pipe = &pstate->pipe[1];
> > > -     struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[0];
> > > -     struct dpu_sw_pipe *prev_pipe = &prev_adjacent_pstate->pipe[0];
> > > -     struct dpu_sw_pipe_cfg *prev_pipe_cfg = &prev_adjacent_pstate->pipe_cfg[0];
> > > +     struct dpu_sw_pipe *pipe, *prev_pipe;
> > > +     struct dpu_sw_pipe_cfg *pipe_cfg, *prev_pipe_cfg;
> > >       const struct msm_format *prev_fmt = msm_framebuffer_format(prev_adjacent_pstate->base.fb);
> > > +     int stage_index, prev_stage_index;
> > >       u16 max_tile_height = 1;
> > >
> > > -     if (prev_adjacent_pstate->pipe[1].sspp != NULL ||
> > > +     if (!dpu_plane_get_single_pipe(pstate, &pipe, &pipe_cfg, &stage_index))
> > > +             return false;
> > > +
> > > +     if (!dpu_plane_get_single_pipe(prev_adjacent_pstate, &prev_pipe,
> > > +                                    &prev_pipe_cfg, &prev_stage_index) ||
> > >           prev_pipe->multirect_mode != DPU_SSPP_MULTIRECT_NONE)
> > >               return false;
> > >
> > > +     if (stage_index != prev_stage_index)
> > > +             return false;
> >
> > This should be handled other way around: save N pstates and then loop
> > over stage indices. If there is no rect at the corresponding stage for a
> > plane, skip assignment (and use prev_adjacent_pstate for the next plane).
> 
> You mean dpu_plane_virtual_assign_resources() shall notify its caller
> dpu_assign_plane_resources() to skip updating prev_adjacent_plane_state
> if dpu_plane_try_multirect_shared() return false? If so, we can add an
> argument "bool pipe_shared" in dpu_plane_virtual_assign_resources() to
> get the status. But that is an optimization to share pipes across multiple
> planes. Can we add new patches based on current patch set later?
> 
> Or my understanding is not aligned with your thoughts?

Not quite. I think we need to store all NUM_STAGES 'prev_adjancent' states and
update them as the driver loops through the stages for each plane.

> 
> - Jun
> >
> > > +
> > >       if (!dpu_plane_is_multirect_capable(pipe->sspp, pipe_cfg, fmt) ||
> > >           !dpu_plane_is_multirect_capable(prev_pipe->sspp, prev_pipe_cfg, prev_fmt))
> > >               return false;
> > > @@ -1043,11 +1072,6 @@ static int dpu_plane_try_multirect_shared(struct dpu_plane_state *pstate,
> > >       if (MSM_FORMAT_IS_UBWC(prev_fmt))
> > >               max_tile_height = max(max_tile_height, prev_fmt->tile_height);
> > >
> > > -     r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > > -     r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > > -
> > > -     r_pipe->sspp = NULL;
> > > -
> > >       if (dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth) &&
> > >           dpu_plane_is_parallel_capable(prev_pipe_cfg, prev_fmt, max_linewidth) &&
> > >           (pipe_cfg->dst_rect.x1 >= prev_pipe_cfg->dst_rect.x2 ||
> > > @@ -1176,6 +1200,44 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
> > >       return 0;
> > >  }
> > >
> > > +static int dpu_plane_assign_resource_in_stage(struct dpu_sw_pipe *pipe,
> > > +                                           struct dpu_sw_pipe_cfg *pipe_cfg,
> > > +                                           struct drm_plane_state *plane_state,
> > > +                                           struct dpu_global_state *global_state,
> > > +                                           struct drm_crtc *crtc,
> > > +                                           struct dpu_rm_sspp_requirements *reqs)
> > > +{
> > > +     struct drm_plane *plane = plane_state->plane;
> > > +     struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
> > > +     struct dpu_sw_pipe *r_pipe = pipe + 1;
> > > +     struct dpu_sw_pipe_cfg *r_pipe_cfg = pipe_cfg + 1;
> > > +
> > > +     if (drm_rect_width(&pipe_cfg->src_rect) != 0) {
> > > +             pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, reqs);
> > > +             if (!pipe->sspp)
> > > +                     return -ENODEV;
> > > +     }
> > > +
> > > +     if (drm_rect_width(&r_pipe_cfg->src_rect) != 0 &&
> > > +         dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
> > > +                                           pipe->sspp,
> > > +                                           msm_framebuffer_format(plane_state->fb),
> > > +                                           dpu_kms->catalog->caps->max_linewidth)) {
> > > +             goto stage_assinged;
> > > +     }
> > > +
> > > +     if (drm_rect_width(&r_pipe_cfg->src_rect) != 0) {
> > > +             r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, reqs);
> > > +             if (!r_pipe->sspp)
> > > +                     return -ENODEV;
> > > +             r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > > +             r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > > +     }
> > > +
> > > +stage_assinged:
> > > +     return 0;
> > > +}
> > > +
> > >  static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
> > >                                             struct dpu_global_state *global_state,
> > >                                             struct drm_atomic_state *state,
> > > @@ -1188,11 +1250,9 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
> > >       struct dpu_rm_sspp_requirements reqs;
> > >       struct dpu_plane_state *pstate, *prev_adjacent_pstate;
> > >       struct dpu_sw_pipe *pipe;
> > > -     struct dpu_sw_pipe *r_pipe;
> > >       struct dpu_sw_pipe_cfg *pipe_cfg;
> > > -     struct dpu_sw_pipe_cfg *r_pipe_cfg;
> > >       const struct msm_format *fmt;
> > > -     int i;
> > > +     int i, stage_id, ret;
> > >
> > >       if (plane_state->crtc)
> > >               crtc_state = drm_atomic_get_new_crtc_state(state,
> > > @@ -1202,11 +1262,6 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
> > >       prev_adjacent_pstate = prev_adjacent_plane_state ?
> > >               to_dpu_plane_state(prev_adjacent_plane_state) : NULL;
> > >
> > > -     pipe = &pstate->pipe[0];
> > > -     r_pipe = &pstate->pipe[1];
> > > -     pipe_cfg = &pstate->pipe_cfg[0];
> > > -     r_pipe_cfg = &pstate->pipe_cfg[1];
> > > -
> > >       for (i = 0; i < PIPES_PER_PLANE; i++)
> > >               pstate->pipe[i].sspp = NULL;
> > >
> > > @@ -1220,44 +1275,24 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
> > >
> > >       reqs.rot90 = drm_rotation_90_or_270(plane_state->rotation);
> > >
> > > -     if (drm_rect_width(&r_pipe_cfg->src_rect) == 0) {
> > > -             if (!prev_adjacent_pstate ||
> > > -                 !dpu_plane_try_multirect_shared(pstate, prev_adjacent_pstate, fmt,
> > > -                                                 dpu_kms->catalog->caps->max_linewidth)) {
> > > -                     pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> > > -                     if (!pipe->sspp)
> > > -                             return -ENODEV;
> > > -
> > > -                     r_pipe->sspp = NULL;
> > > -
> > > -                     pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > > -                     pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > > -
> > > -                     r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > > -                     r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > > -             }
> > > -     } else {
> > > -             pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> > > -             if (!pipe->sspp)
> > > -                     return -ENODEV;
> > > -
> > > -             if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
> > > -                                                   pipe->sspp,
> > > -                                                   msm_framebuffer_format(plane_state->fb),
> > > -                                                   dpu_kms->catalog->caps->max_linewidth)) {
> > > -                     /* multirect is not possible, use two SSPP blocks */
> > > -                     r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> > > -                     if (!r_pipe->sspp)
> > > -                             return -ENODEV;
> > > -
> > > -                     pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > > -                     pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > > +     if (prev_adjacent_pstate &&
> > > +         dpu_plane_try_multirect_shared(pstate, prev_adjacent_pstate, fmt,
> > > +                                         dpu_kms->catalog->caps->max_linewidth)) {
> > > +             goto assigned;
> > > +     }
> > >
> > > -                     r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > > -                     r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > > -             }
> > > +     for (stage_id = 0; stage_id < STAGES_PER_PLANE; stage_id++) {
> > > +             pipe = &pstate->pipe[stage_id * PIPES_PER_STAGE];
> > > +             pipe_cfg = &pstate->pipe_cfg[stage_id * PIPES_PER_STAGE];
> > > +             ret = dpu_plane_assign_resource_in_stage(pipe, pipe_cfg,
> > > +                                                      plane_state,
> > > +                                                      global_state,
> > > +                                                      crtc, &reqs);
> > > +             if (ret)
> > > +                     return ret;
> > >       }
> > >
> > > +assigned:
> > >       return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
> > >  }
> > >
> > >
> > > --
> > > 2.34.1
> > >
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
