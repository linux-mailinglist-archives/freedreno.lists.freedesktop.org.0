Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 845FD4C1207
	for <lists+freedreno@lfdr.de>; Wed, 23 Feb 2022 12:57:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12F9810E849;
	Wed, 23 Feb 2022 11:57:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0BE810E888
 for <freedreno@lists.freedesktop.org>; Wed, 23 Feb 2022 11:57:14 +0000 (UTC)
Received: by mail-qv1-xf2b.google.com with SMTP id d3so7947021qvb.5
 for <freedreno@lists.freedesktop.org>; Wed, 23 Feb 2022 03:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Sz/TsBK4wrm9NAX8eMKN5KJLVIsMXNpGW7xZZ6AIY/U=;
 b=kgDfSg1eFSmoCKyv5tAO9ymORcbkmV8Dw9/lGclBVFg0VRGDQJStPALWtmnxhrP3aP
 ddbDSEbakDsUlrEqAGUpGDur67d3XK9izYYjAQnRoHBgZ9hO83iLbeESWJaxf2GlW7u/
 RPlURiOP8PuLZveENHVY4cF1U+XawaEh1CCpSakj9AA76dVYVdibVirHNDDp1Zqzt+oF
 Udnup+p3E/icOfEBQW1pN72XeqyiKW4WD4FjX0XfgJ1OC+Ouj3CH8JCUPy1P7lLLT/ag
 kBuE0JWFdSOmir86132ruSClPY3McqFKVWIpWGee0yBqrozQnEUtIIXSRRbgF01nzj3r
 Mj8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sz/TsBK4wrm9NAX8eMKN5KJLVIsMXNpGW7xZZ6AIY/U=;
 b=tFzAiMOcv3SUb2FHtWA7A8S2egFMnkqeiWQxOwOLM04QPVGcSWd7tUSRmvw7R2LXvL
 csDqoGUZE/lGMaiTrbTMKGJPQkkdKH/a1o8phzGVmJZxdk/GRmfgv07NyzdO8/sX9FwZ
 MRPwXOe6/Pn4LwgkW/m7/bQNeoxwtOkhAVcZMItgbDAcMe1C754/fMpPbgBRKZlWpCsb
 KzHolpRRndQ1xhrQv1m31oUNvV9ft0KdljRMSuYVn9HkOhJTIkXAYoDCmG4lxW8V+YBA
 VxQpLrn0qF/SILyS6s7TIUju4S365WdcTwl9IOVSuPLZZ53limg7EFvbPCwuCBvRCfa4
 OjBg==
X-Gm-Message-State: AOAM533T8+fVf1Fkix2X0YzuMCYmMsCScFcknnNOVqQAYsxl45Omg+WI
 smGp0y9Txg9Q0aV+CKPUzmjcU5SrKFtv84sJ0whDhA==
X-Google-Smtp-Source: ABdhPJyd9W7Dm6dao+jkvi5TzRKXnAJlelbOAkvifRbROGVcT9HGdc2jR0RXv3zxEVyUcC712KQkjzTdElakKICXvJg=
X-Received: by 2002:a05:622a:1206:b0:2de:6fa4:41fb with SMTP id
 y6-20020a05622a120600b002de6fa441fbmr4366794qtx.295.1645617433629; Wed, 23
 Feb 2022 03:57:13 -0800 (PST)
MIME-Version: 1.0
References: <20220223114011.219044-1-marijn.suijten@somainline.org>
In-Reply-To: <20220223114011.219044-1-marijn.suijten@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 23 Feb 2022 14:57:02 +0300
Message-ID: <CAA8EJppddv_TV_9t2iw4+cBv_L5_c78rx-QLJqpRRuoD+3S=+A@mail.gmail.com>
To: Marijn Suijten <marijn.suijten@somainline.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dpu: Bind pingpong block to intf
 on active ctls in cmd encoder
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
Cc: freedreno@lists.freedesktop.org, Pavel Dubrova <pashadubrova@gmail.com>,
 Jami Kettunen <jami.kettunen@somainline.org>, Bernard <bernard@vivo.com>,
 linux-arm-msm@vger.kernel.org, Zhen Lei <thunder.leizhen@huawei.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Rob Clark <robdclark@gmail.com>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Daniel Vetter <daniel@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 phone-devel@vger.kernel.org, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 23 Feb 2022 at 14:40, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> As per the specification of DPU_CTL_ACTIVE_CFG the configuration of
> active blocks should be proactively specified, and the pingpong block is
> no different.
>
> The downstream display driver [1] confirms this by also calling
> bind_pingpong_blk on CTL_ACTIVE_CFG.  Note that this else-if is always
> entered, as setup_intf_cfg - unlike this mainline dpu driver that
> combines both behind the same function pointer - is left NULL in favour
> of using setup_intf_cfg_v1 when CTL_ACTIVE_CFG is set.
>
> This solves continuous timeouts on at least the Qualcomm sm6125 SoC:
>
>     [drm:dpu_encoder_frame_done_timeout:2091] [dpu error]enc31 frame done timeout
>     [drm:_dpu_encoder_phys_cmd_handle_ppdone_timeout.isra.0] *ERROR* id:31 pp:0 kickoff timeout 0 cnt 1 koff_cnt 1
>     [drm:dpu_encoder_phys_cmd_prepare_for_kickoff] *ERROR* failed wait_for_idle: id:31 ret:-110 pp:0
>
> In the same way this pingpong block should also be unbound followed by
> an interface flush when the encoder is disabled, according to the
> downstream display driver [2].
>
> [1]: https://source.codeaurora.org/quic/la/platform/vendor/opensource/display-drivers/tree/msm/sde/sde_encoder_phys_cmd.c?h=LA.UM.9.16.r1-08500-MANNAR.0#n167
> [2]: https://source.codeaurora.org/quic/la/platform/vendor/opensource/display-drivers/tree/msm/sde/sde_encoder.c?h=LA.UM.9.16.r1-08500-MANNAR.0#n2986
>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

As we are quite late in the development cycle, I'd delay this into the
next release, if you don't mind.

> ---
>
> Changes since v1:
> - Always unbind the pingpong block in dpu_encoder_phys_cmd_disable,
>   instead of only if this encoder is the master.
>
> v1: https://lore.kernel.org/lkml/20211222105513.44860-1-marijn.suijten@somainline.org/
>
>  .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index 8e433af7aea4..1be01cbd960e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -71,6 +71,13 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
>         intf_cfg.stream_sel = cmd_enc->stream_sel;
>         intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
>         ctl->ops.setup_intf_cfg(ctl, &intf_cfg);
> +
> +       /* setup which pp blk will connect to this intf */
> +       if (test_bit(DPU_CTL_ACTIVE_CFG, &ctl->caps->features) && phys_enc->hw_intf->ops.bind_pingpong_blk)
> +               phys_enc->hw_intf->ops.bind_pingpong_blk(
> +                               phys_enc->hw_intf,
> +                               true,
> +                               phys_enc->hw_pp->idx);
>  }
>
>  static void dpu_encoder_phys_cmd_pp_tx_done_irq(void *arg, int irq_idx)
> @@ -507,6 +514,7 @@ static void dpu_encoder_phys_cmd_disable(struct dpu_encoder_phys *phys_enc)
>  {
>         struct dpu_encoder_phys_cmd *cmd_enc =
>                 to_dpu_encoder_phys_cmd(phys_enc);
> +       struct dpu_hw_ctl *ctl;
>
>         if (!phys_enc->hw_pp) {
>                 DPU_ERROR("invalid encoder\n");
> @@ -523,6 +531,17 @@ static void dpu_encoder_phys_cmd_disable(struct dpu_encoder_phys *phys_enc)
>
>         if (phys_enc->hw_pp->ops.enable_tearcheck)
>                 phys_enc->hw_pp->ops.enable_tearcheck(phys_enc->hw_pp, false);
> +
> +       if (phys_enc->hw_intf->ops.bind_pingpong_blk) {
> +               phys_enc->hw_intf->ops.bind_pingpong_blk(
> +                               phys_enc->hw_intf,
> +                               false,
> +                               phys_enc->hw_pp->idx);
> +
> +               ctl = phys_enc->hw_ctl;
> +               ctl->ops.update_pending_flush_intf(ctl, phys_enc->intf_idx);
> +       }
> +
>         phys_enc->enable_state = DPU_ENC_DISABLED;
>  }
>
>
> base-commit: 3c30cf91b5ecc7272b3d2942ae0505dd8320b81c
> --
> 2.35.1
>


-- 
With best wishes
Dmitry
