Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0285978E3B7
	for <lists+freedreno@lfdr.de>; Thu, 31 Aug 2023 02:06:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9941B10E16D;
	Thu, 31 Aug 2023 00:06:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00E0F10E632
 for <freedreno@lists.freedesktop.org>; Thu, 31 Aug 2023 00:06:50 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-6bca3311b4fso308661a34.0
 for <freedreno@lists.freedesktop.org>; Wed, 30 Aug 2023 17:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693440410; x=1694045210; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9DxU0ht48yqHP10Qw8l/djALIpoGzHmCLS1fvFvSy7A=;
 b=yxEB/8HVAHh2x14ADEtl+P5XmP5/QVOuohh4HFsU5Ljuoma/SMV6TYWBIMNo6octvA
 qeWM2f3hP+aa5rUboYuncRWDqsIae/Nh8fVLeEM7ZoJLBcASUbNcS/4ZBb608emY7c5X
 6P+InVjlB1dIyEaNN++oa7UKmqK/pXqS7GSvnoKyplhIunxBLL9DKtHtWgBPJkXrLEzi
 2RF0zSvu7FeDSPvKmBZMc7qQJrtcLG8J3mNlozWiR7qUyhsXbBAwEa30CbizwEXK/30y
 jylG3zznLIZKSoxvdUhW/i2/cnAbZG2ZHH2S1EKiHNXcF695JkRZhLsZm1lbtjJWequt
 rcTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693440410; x=1694045210;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9DxU0ht48yqHP10Qw8l/djALIpoGzHmCLS1fvFvSy7A=;
 b=TTEBLOLn8PXGigIbQ8BDRZK4bx5fiqv4cy+pO9v9QIS9zfQvUhPSz5GENpbY+0puvZ
 p2RgiauKy4fLCew0HeHr9lG6okT9iZQqVCQBFB4esSzN+oH4Jg66mImne/bPgBUxzWD9
 N0DFLrYNaa/0SkLnPeINCjX297mIxNf0uItDvMq+L68XU4ZZWL0SUMrAInxr3uPhAKhy
 yn+rBYIJjKjRp8ccfXgilj0wdW+vcVbZFbJ0QZt7mkG7Hjon377NIymqwfSK6OFhOYGW
 7RU8yHe07HOC2CzSJgnq9tmDOITN7lG0exrDesOZtexxDjf7SQlS2u5PQskEXXYSHmDX
 yT6Q==
X-Gm-Message-State: AOJu0Yy8dheAIDwu4hdgbvzLW8yKPAeJDpbRHNGVF6QYkx2C/3PJU3lS
 nfvcMsq/SxE3PxcMrg5vPKIbCzMRcTssKlxY5E1yxw==
X-Google-Smtp-Source: AGHT+IGvlB2nE9Ks9HzVwilx3FixuPm+1K5NBqlv0K9dMaVCk1T3KdaSLfWY+Vx2/EpUDdNGAHP3MppXz0S8hhIBvw4=
X-Received: by 2002:a05:6358:7e0f:b0:134:cd32:3565 with SMTP id
 o15-20020a0563587e0f00b00134cd323565mr3238453rwm.31.1693440409878; Wed, 30
 Aug 2023 17:06:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230830224910.8091-1-quic_abhinavk@quicinc.com>
 <20230830224910.8091-9-quic_abhinavk@quicinc.com>
In-Reply-To: <20230830224910.8091-9-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 31 Aug 2023 03:06:38 +0300
Message-ID: <CAA8EJporcrBikTob9xJe8_96AJSP1vDJNYPkt1za73PAcg1+Bw@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 08/16] drm/msm/dpu: add support to allocate
 CDM from RM
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 quic_khsieh@quicinc.com, Rob Clark <robdclark@gmail.com>,
 quic_parellan@quicinc.com, Daniel Vetter <daniel@ffwll.ch>,
 quic_jesszhan@quicinc.com, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 31 Aug 2023 at 01:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Even though there is usually only one CDM block, it can be
> used by either HDMI, DisplayPort OR Writeback interfaces.
>
> Hence its allocation needs to be tracked properly by the
> resource manager to ensure appropriate availability of the
> block.

It almost feels like an overkill, as up to now there is at most one CDM block.

>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 45 +++++++++++++++++++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |  4 +-
>  5 files changed, 48 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 6cf6597148fd..582680804016 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -663,7 +663,7 @@ static int dpu_encoder_virt_atomic_check(
>
>                 if (!crtc_state->active_changed || crtc_state->enable)
>                         ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
> -                                       drm_enc, crtc_state, topology);
> +                                       drm_enc, crtc_state, topology, false);
>         }
>
>         trace_dpu_enc_atomic_check_flags(DRMID(drm_enc), adj_mode->flags);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> index 34f943102499..07f75f295844 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> @@ -98,6 +98,7 @@ enum dpu_hw_blk_type {
>         DPU_HW_BLK_DSPP,
>         DPU_HW_BLK_MERGE_3D,
>         DPU_HW_BLK_DSC,
> +       DPU_HW_BLK_CDM,
>         DPU_HW_BLK_MAX,
>  };
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> index b6f53ca6e962..61aa58643fda 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -136,6 +136,7 @@ struct dpu_global_state {
>         uint32_t ctl_to_enc_id[CTL_MAX - CTL_0];
>         uint32_t dspp_to_enc_id[DSPP_MAX - DSPP_0];
>         uint32_t dsc_to_enc_id[DSC_MAX - DSC_0];
> +       uint32_t cdm_to_enc_id;
>  };
>
>  struct dpu_global_state
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 7b6444a3fcb1..e7d4beb4661e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -29,10 +29,12 @@ static inline bool reserved_by_other(uint32_t *res_map, int idx,
>  /**
>   * struct dpu_rm_requirements - Reservation requirements parameter bundle
>   * @topology:  selected topology for the display
> + * @needs_cdm: whether the display needs a CDM block for the current mode
>   * @hw_res:       Hardware resources required as reported by the encoders
>   */
>  struct dpu_rm_requirements {
>         struct msm_display_topology topology;
> +       bool needs_cdm;
>  };
>
>  int dpu_rm_destroy(struct dpu_rm *rm)
> @@ -505,6 +507,26 @@ static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
>         return 0;
>  }
>
> +static int _dpu_rm_reserve_cdm(struct dpu_rm *rm,
> +                              struct dpu_global_state *global_state,
> +                              struct drm_encoder *enc)
> +{
> +       /* try allocating only one CDM block */
> +       if (!rm->cdm_blk) {
> +               DPU_ERROR("CDM block does not exist\n");
> +               return -EIO;
> +       }
> +
> +       if (global_state->cdm_to_enc_id) {
> +               DPU_ERROR("CDM_0 is already allocated\n");
> +               return -EIO;
> +       }
> +
> +       global_state->cdm_to_enc_id = enc->base.id;
> +
> +       return 0;
> +}
> +
>  static int _dpu_rm_make_reservation(
>                 struct dpu_rm *rm,
>                 struct dpu_global_state *global_state,
> @@ -530,15 +552,25 @@ static int _dpu_rm_make_reservation(
>         if (ret)
>                 return ret;
>
> +       if (reqs->needs_cdm) {
> +               ret = _dpu_rm_reserve_cdm(rm, global_state, enc);
> +               if (ret) {
> +                       DPU_ERROR("unable to find CDM blk\n");
> +                       return ret;
> +               }
> +       }
> +
>         return ret;
>  }
>
>  static int _dpu_rm_populate_requirements(
>                 struct drm_encoder *enc,
>                 struct dpu_rm_requirements *reqs,
> -               struct msm_display_topology req_topology)
> +               struct msm_display_topology req_topology,
> +               bool needs_cdm)

Push it to the topology, please. It is a part of the topology at some
point of view.

>  {
>         reqs->topology = req_topology;
> +       reqs->needs_cdm = needs_cdm;
>
>         DRM_DEBUG_KMS("num_lm: %d num_dsc: %d num_intf: %d\n",
>                       reqs->topology.num_lm, reqs->topology.num_dsc,
> @@ -571,6 +603,7 @@ void dpu_rm_release(struct dpu_global_state *global_state,
>                 ARRAY_SIZE(global_state->dsc_to_enc_id), enc->base.id);
>         _dpu_rm_clear_mapping(global_state->dspp_to_enc_id,
>                 ARRAY_SIZE(global_state->dspp_to_enc_id), enc->base.id);
> +       _dpu_rm_clear_mapping(&global_state->cdm_to_enc_id, 1, enc->base.id);
>  }
>
>  int dpu_rm_reserve(
> @@ -578,7 +611,8 @@ int dpu_rm_reserve(
>                 struct dpu_global_state *global_state,
>                 struct drm_encoder *enc,
>                 struct drm_crtc_state *crtc_state,
> -               struct msm_display_topology topology)
> +               struct msm_display_topology topology,
> +               bool needs_cdm)
>  {
>         struct dpu_rm_requirements reqs;
>         int ret;
> @@ -595,7 +629,7 @@ int dpu_rm_reserve(
>         DRM_DEBUG_KMS("reserving hw for enc %d crtc %d\n",
>                       enc->base.id, crtc_state->crtc->base.id);
>
> -       ret = _dpu_rm_populate_requirements(enc, &reqs, topology);
> +       ret = _dpu_rm_populate_requirements(enc, &reqs, topology, needs_cdm);
>         if (ret) {
>                 DPU_ERROR("failed to populate hw requirements\n");
>                 return ret;
> @@ -644,6 +678,11 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
>                 hw_to_enc_id = global_state->dsc_to_enc_id;
>                 max_blks = ARRAY_SIZE(rm->dsc_blks);
>                 break;
> +       case DPU_HW_BLK_CDM:
> +               hw_blks = &rm->cdm_blk;
> +               hw_to_enc_id = &global_state->cdm_to_enc_id;
> +               max_blks = 1;
> +               break;
>         default:
>                 DPU_ERROR("blk type %d not managed by rm\n", type);
>                 return 0;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> index 29b221491926..74262d3cb6c3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> @@ -69,13 +69,15 @@ int dpu_rm_destroy(struct dpu_rm *rm);
>   * @drm_enc: DRM Encoder handle
>   * @crtc_state: Proposed Atomic DRM CRTC State handle
>   * @topology: Pointer to topology info for the display
> + * @needs_cdm: bool to indicate whether current encoder needs CDM
>   * @Return: 0 on Success otherwise -ERROR
>   */
>  int dpu_rm_reserve(struct dpu_rm *rm,
>                 struct dpu_global_state *global_state,
>                 struct drm_encoder *drm_enc,
>                 struct drm_crtc_state *crtc_state,
> -               struct msm_display_topology topology);
> +               struct msm_display_topology topology,
> +               bool needs_cdm);
>
>  /**
>   * dpu_rm_reserve - Given the encoder for the display chain, release any
> --
> 2.40.1
>


-- 
With best wishes
Dmitry
