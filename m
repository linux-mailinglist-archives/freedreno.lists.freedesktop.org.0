Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DDA73A857
	for <lists+freedreno@lfdr.de>; Thu, 22 Jun 2023 20:37:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D389010E5AC;
	Thu, 22 Jun 2023 18:36:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9879689226
 for <freedreno@lists.freedesktop.org>; Thu, 22 Jun 2023 18:36:53 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-bd61dd9a346so7219152276.2
 for <freedreno@lists.freedesktop.org>; Thu, 22 Jun 2023 11:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687459012; x=1690051012;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=//iH0bqfYBmUnbXo+bhKFynz91+0tnyWOGAyZ/SuDLM=;
 b=XxEQ8HCzJO+mzri75WwxEKPiNY5kG2RtruboMfgtewbqveU3SAFFShS6SHTkAdQ1xW
 3xtKe8pQOFCn4CQwLCbiP2kB+frF/fTQH3wKFo+uKJAGTfXdnOrQR95gVd5SyPl9Iu3s
 9o5w6rLAdqOjqvmnGu1PgtA9PCGntvp5TVw0F66JeXWu+UYS957UY1cAaRhxV5svnUNO
 HVt8eilZCZAexRjPolvmh9YvD2Em1lJvJxtBAqx5Ro550DhMUPxzkMa77uby89WPyCh/
 xFMNtwmD4HcfPWImPdxh9+94FrZADDBWaH21odtHYeQujJt42sePDHjPg7QPBvCtlc4L
 MO8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687459012; x=1690051012;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=//iH0bqfYBmUnbXo+bhKFynz91+0tnyWOGAyZ/SuDLM=;
 b=Bu4kixb9PYAobs9sHDcEOwRH3n7SybEIYWO4itnh1OPwlNEfOvn0fW3CR1pQ7VELAq
 SdvIvvV3cB5470GM0jqkcG6ZTDO9XWC+9lKE8g4UdgFmyPDek+Zv1vKXAc1QWrfDi18x
 fCn4s2G72N8/mYchhlZtuTaxkZUnn1srJ32AZ2ICSXUrvE07+QIEQiYdYuagAFXViZUI
 GrKDOPKEL5sRFEvFNl8uDSCEI0//CIGEoqaTp/2NZ/jJcupID9di3WFb4Fdejz1JqHhY
 zHtTpqt7yd6uBx7ZQDzrKrDab/CYJXaJ4iM4iCsUeS1sVnfEDps56fiim91nhsqmV+wo
 p5Sg==
X-Gm-Message-State: AC+VfDxyPruXh7MIUyfhddIdeOYzgbXo+y+5Ma2txzFKDlka3Wp5XJwW
 BbxY5/vApz0PLXqsYRiH1JoZutb25I3T8q1GG5nt+w==
X-Google-Smtp-Source: ACHHUZ5HNiMJ1Au5OefxiYLzEEMpQCofd1JWFFf+nN3NSuiVIJTfvj/ZBGvWRBMTkqryEHgFWcKy+KeXN9K8zkMQUZY=
X-Received: by 2002:a25:7dc1:0:b0:c01:2f64:27ec with SMTP id
 y184-20020a257dc1000000b00c012f6427ecmr2910620ybc.21.1687459012553; Thu, 22
 Jun 2023 11:36:52 -0700 (PDT)
MIME-Version: 1.0
References: <1687454686-10340-1-git-send-email-quic_khsieh@quicinc.com>
 <1687454686-10340-2-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1687454686-10340-2-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 22 Jun 2023 21:36:41 +0300
Message-ID: <CAA8EJpoc+4Hx221Zf0i8yhRxFQ9BhgZ5H5QQ5EvwpAarXFu8Gg@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v5 1/2] drm/msm/dpu: retrieve DSI DSC struct
 through priv->dsi[0]
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, airlied@gmail.com,
 andersson@kernel.org, robdclark@gmail.com, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, vkoul@kernel.org, agross@kernel.org, daniel@ffwll.ch,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com, swboyd@chromium.org,
 sean@poorly.run, linux-arm-msm@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 22 Jun 2023 at 20:25, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> Currently struct drm_dsc_config for DSI is populated at display
> setup during system boot up. This mechanism works fine with
> embedded display but not for pluggable displays as the
> struct drm_dsc_config will become stale once external display
> is unplugged.
>

Nit: "In preparation of adding support for DP DSC..."

If you don't mind, I'll append this phrase while applying the patch.

> Move storing of DSI DSC struct to atomic_enable() so that same
> mechanism will work for both embedded display and pluggable
> displays.
>
> Changes in v4:
> -- fix checkpatch.pl warning
>
> Changes in v5:
> -- delete dpu_encoder_get_dsc_config() from atomic_mode_set

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 42 ++++++++++++++++++++---------
>  1 file changed, 30 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 2e1873d..edc559d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -543,11 +543,24 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder *drm_enc)
>         return (num_dsc > 0) && (num_dsc > intf_count);
>  }
>
> +static struct drm_dsc_config *dpu_encoder_get_dsc_config(struct drm_encoder *drm_enc)
> +{
> +       struct msm_drm_private *priv = drm_enc->dev->dev_private;
> +       struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> +       int index = dpu_enc->disp_info.h_tile_instance[0];
> +
> +       if (dpu_enc->disp_info.intf_type == INTF_DSI)
> +               return msm_dsi_get_dsc_config(priv->dsi[index]);
> +
> +       return NULL;
> +}
> +
>  static struct msm_display_topology dpu_encoder_get_topology(
>                         struct dpu_encoder_virt *dpu_enc,
>                         struct dpu_kms *dpu_kms,
>                         struct drm_display_mode *mode,
> -                       struct drm_crtc_state *crtc_state)
> +                       struct drm_crtc_state *crtc_state,
> +                       struct drm_dsc_config *dsc)
>  {
>         struct msm_display_topology topology = {0};
>         int i, intf_count = 0;
> @@ -579,7 +592,7 @@ static struct msm_display_topology dpu_encoder_get_topology(
>
>         topology.num_intf = intf_count;
>
> -       if (dpu_enc->dsc) {
> +       if (dsc) {
>                 /*
>                  * In case of Display Stream Compression (DSC), we would use
>                  * 2 DSC encoders, 2 layer mixers and 1 interface
> @@ -605,6 +618,7 @@ static int dpu_encoder_virt_atomic_check(
>         struct drm_display_mode *adj_mode;
>         struct msm_display_topology topology;
>         struct dpu_global_state *global_state;
> +       struct drm_dsc_config *dsc;
>         int i = 0;
>         int ret = 0;
>
> @@ -640,7 +654,9 @@ static int dpu_encoder_virt_atomic_check(
>                 }
>         }
>
> -       topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state);
> +       dsc = dpu_encoder_get_dsc_config(drm_enc);
> +
> +       topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state, dsc);
>
>         /*
>          * Release and Allocate resources on every modeset
> @@ -1072,14 +1088,12 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>                 dpu_enc->hw_pp[i] = i < num_pp ? to_dpu_hw_pingpong(hw_pp[i])
>                                                 : NULL;
>
> -       if (dpu_enc->dsc) {
> -               num_dsc = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> -                                                       drm_enc->base.id, DPU_HW_BLK_DSC,
> -                                                       hw_dsc, ARRAY_SIZE(hw_dsc));
> -               for (i = 0; i < num_dsc; i++) {
> -                       dpu_enc->hw_dsc[i] = to_dpu_hw_dsc(hw_dsc[i]);
> -                       dsc_mask |= BIT(dpu_enc->hw_dsc[i]->idx - DSC_0);
> -               }
> +       num_dsc = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> +                                               drm_enc->base.id, DPU_HW_BLK_DSC,
> +                                               hw_dsc, ARRAY_SIZE(hw_dsc));
> +       for (i = 0; i < num_dsc; i++) {
> +               dpu_enc->hw_dsc[i] = to_dpu_hw_dsc(hw_dsc[i]);
> +               dsc_mask |= BIT(dpu_enc->hw_dsc[i]->idx - DSC_0);
>         }
>
>         dpu_enc->dsc_mask = dsc_mask;
> @@ -1187,6 +1201,8 @@ static void dpu_encoder_virt_atomic_enable(struct drm_encoder *drm_enc,
>
>         dpu_enc = to_dpu_encoder_virt(drm_enc);
>
> +       dpu_enc->dsc = dpu_encoder_get_dsc_config(drm_enc);
> +
>         mutex_lock(&dpu_enc->enc_lock);
>         cur_mode = &dpu_enc->base.crtc->state->adjusted_mode;
>
> @@ -2109,8 +2125,10 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
>                                         phys_enc->hw_pp->merge_3d->idx);
>         }
>
> -       if (dpu_enc->dsc)
> +       if (dpu_enc->dsc) {
>                 dpu_encoder_unprep_dsc(dpu_enc);
> +               dpu_enc->dsc = NULL;
> +       }
>
>         intf_cfg.stream_sel = 0; /* Don't care value for video mode */
>         intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
